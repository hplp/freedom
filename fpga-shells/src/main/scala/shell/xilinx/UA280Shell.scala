// See LICENSE for license details.
package sifive.fpgashells.shell.xilinx.ua280shell

import Chisel._
import chisel3.core.{Input, Output, attach}
import chisel3.experimental.{RawModule, Analog, withClockAndReset}

import freechips.rocketchip.config._
import freechips.rocketchip.devices.debug._
import freechips.rocketchip.util.{SyncResetSynchronizerShiftReg, ElaborationArtefacts, HeterogeneousBag}

import sifive.blocks.devices.gpio._
import sifive.blocks.devices.spi._
import sifive.blocks.devices.uart._

import sifive.fpgashells.devices.xilinx.xilinxua280mig._

import sifive.fpgashells.ip.xilinx.{IBUFDS, PowerOnResetFPGAOnly, sdio_spi_bridge, ua280_sys_clock_mmcm0,ua280_sys_clock_mmcm1, ua280reset}

//-------------------------------------------------------------------------
// UA280Shell
//-------------------------------------------------------------------------

trait HasDDR3 { this: UA280Shell =>

  require(!p.lift(MemoryXilinxDDRKey).isEmpty)
  val ddr = IO(new XilinxUA280MIGPads(p(MemoryXilinxDDRKey)))

  def connectMIG(dut: HasMemoryXilinxUA280MIGModuleImp): Unit = {
    // Clock & Reset
    dut.xilinxua280mig.c0_sys_clk_i := sys_clock.asUInt
    mig_clock                    := dut.xilinxua280mig.c0_ddr4_ui_clk
    mig_sys_reset                := dut.xilinxua280mig.c0_ddr4_ui_clk_sync_rst

    dut.xilinxua280mig.c0_ddr4_aresetn   := mig_resetn
    dut.xilinxua280mig.sys_rst   := sys_reset

    ddr <> dut.xilinxua280mig
  }
}


abstract class UA280Shell(implicit val p: Parameters) extends RawModule {

  //-----------------------------------------------------------------------
  // Interface
  //-----------------------------------------------------------------------

  // 300Mhz differential sysclk
  val sys_diff_clock_clk_n = IO(Input(Clock()))
  val sys_diff_clock_clk_p = IO(Input(Clock()))

  // active high reset
  val reset                = IO(Input(Bool()))

  // UART
  val uart_tx              = IO(Output(Bool()))
  val uart_rx              = IO(Input(Bool()))
  //val uart_rtsn            = IO(Output(Bool()))
  //val uart_ctsn            = IO(Input(Bool()))

  //JTAG
  //val jtag_TCK             = IO(Input(Clock()))
  //val jtag_TMS             = IO(Input(Bool()))
  //val jtag_TDI             = IO(Input(Bool()))
  //val jtag_TDO             = IO(Output(Bool()))

  // SDIO
  //val sdio_clk             = IO(Output(Bool()))
  //val sdio_cmd             = IO(Analog(1.W))
  //val sdio_dat             = IO(Analog(4.W))
 
  //-----------------------------------------------------------------------
  // Wire declrations
  //-----------------------------------------------------------------------

  val sys_clock       = Wire(Clock())
  val sys_reset       = Wire(Bool())

  val dut_clock       = Wire(Clock())
  val dut_reset       = Wire(Bool())
  val dut_resetn      = Wire(Bool())

  val dut_ndreset     = Wire(Bool())

  val sd_spi_sck      = Wire(Bool())
  val sd_spi_cs       = Wire(Bool())
  val sd_spi_dq_i     = Wire(Vec(4, Bool()))
  val sd_spi_dq_o     = Wire(Vec(4, Bool()))

  val do_reset        = Wire(Bool())

  val mig_mmcm_locked = Wire(Bool())
  val mig_sys_reset   = Wire(Bool())

  val mig_clock       = Wire(Clock())
  val mig_reset       = Wire(Bool())
  val mig_resetn      = Wire(Bool())

  //-----------------------------------------------------------------------
  // Differential clock
  //-----------------------------------------------------------------------

  val sys_clk_ibufds = Module(new IBUFDS)
  sys_clk_ibufds.io.I  := sys_diff_clock_clk_p
  sys_clk_ibufds.io.IB := sys_diff_clock_clk_n

  //-----------------------------------------------------------------------
  // System clock and reset
  //-----------------------------------------------------------------------

  // Clock that drives the clock generator and the MIG
  sys_clock := sys_clk_ibufds.io.O

  // Allow the debug module to reset everything. Resets the MIG
  dut_ndreset    := PowerOnResetFPGAOnly(dut_clock)
  sys_reset := (!reset) | dut_ndreset

  //-----------------------------------------------------------------------
  // Clock Generator
  //-----------------------------------------------------------------------

  //25MHz and multiples
  val ua280_sys_clock_mmcm0 = Module(new ua280_sys_clock_mmcm0)

  ua280_sys_clock_mmcm0.io.clk_in1 := sys_clock.asUInt
  ua280_sys_clock_mmcm0.io.reset   := !reset

  val clk50 = ua280_sys_clock_mmcm0.io.clk_out1

  val ua280_sys_clock_mmcm0_locked = ua280_sys_clock_mmcm0.io.locked

  // DUT clock
  dut_clock := clk50

  //-----------------------------------------------------------------------
  // System reset
  //-----------------------------------------------------------------------

  do_reset             := !mig_mmcm_locked || mig_sys_reset || !ua280_sys_clock_mmcm0_locked
  mig_resetn           := !mig_reset
  dut_resetn           := !dut_reset

  val safe_reset = Module(new ua280reset)

  safe_reset.io.areset := do_reset
  safe_reset.io.clock1 := mig_clock
  mig_reset            := safe_reset.io.reset1
  safe_reset.io.clock2 := dut_clock
  dut_reset            := safe_reset.io.reset2
  
  
  //overrided in connectMIG
  mig_clock            := dut_clock

  mig_mmcm_locked      := UInt("b1")

  //-----------------------------------------------------------------------
  // UART
  //-----------------------------------------------------------------------
  //uart_rtsn := false.B

  def connectUART(dut: HasPeripheryUARTModuleImp): Unit = {
    val uartParams = p(PeripheryUARTKey)
    if (!uartParams.isEmpty) {
      // uart connections
      dut.uart(0).rxd := SyncResetSynchronizerShiftReg(uart_rx, 2, init = Bool(true), name=Some("uart_rxd_sync"))
      uart_tx         := dut.uart(0).txd
    }
  }

  //-----------------------------------------------------------------------
  // SPI
  //-----------------------------------------------------------------------

  def connectSPI(dut: HasPeripherySPIModuleImp): Unit = {
    // SPI
    sd_spi_sck := dut.spi(0).sck
    sd_spi_cs  := dut.spi(0).cs(0)

    dut.spi(0).dq.zipWithIndex.foreach {
      case(pin, idx) =>
        sd_spi_dq_o(idx) := pin.o
        pin.i            := sd_spi_dq_i(idx)
    }

    //-------------------------------------------------------------------
    // SDIO <> SPI Bridge
    //-------------------------------------------------------------------

    //val ip_sdio_spi = Module(new sdio_spi_bridge())

    //ip_sdio_spi.io.clk   := dut_clock
    //ip_sdio_spi.io.reset := dut_reset

    // SDIO
    //attach(sdio_dat, ip_sdio_spi.io.sd_dat)
    //attach(sdio_cmd, ip_sdio_spi.io.sd_cmd)
    //sdio_clk := ip_sdio_spi.io.spi_sck

    // SPI
    //ip_sdio_spi.io.spi_sck  := sd_spi_sck
    //ip_sdio_spi.io.spi_cs   := sd_spi_cs
    //sd_spi_dq_i             := ip_sdio_spi.io.spi_dq_i.toBools
    //ip_sdio_spi.io.spi_dq_o := sd_spi_dq_o.asUInt
  }


}











