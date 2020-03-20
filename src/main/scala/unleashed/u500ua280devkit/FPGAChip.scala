// See LICENSE for license details.
package sifive.freedom.unleashed.u500ua280devkit

import Chisel._
import chisel3.experimental.{withClockAndReset}

import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy._

import sifive.blocks.devices.gpio._
import sifive.blocks.devices.pinctrl.{BasePin}

import sifive.fpgashells.shell.xilinx.ua280shell._
import sifive.fpgashells.ip.xilinx.{IOBUF}



//-------------------------------------------------------------------------
// PinGen
//-------------------------------------------------------------------------

object PinGen {
  def apply(): BasePin = {
    new BasePin()
  }
}

//-------------------------------------------------------------------------
// U500VC707DevKitFPGAChip
//-------------------------------------------------------------------------

class U500UA280DevKitFPGAChip(implicit override val p: Parameters)
    extends UA280Shell
    with HasDDR3{
    
  //-----------------------------------------------------------------------
  // DUT
  //-----------------------------------------------------------------------
  // Connect the clock to the 50 Mhz output from the PLL
      dut_clock := clk50
      withClockAndReset(dut_clock, dut_reset) {
        
        val dut = Module(LazyModule(new U500UA280DevKitSystem).module)
    //---------------------------------------------------------------------
    // Connect peripherals
    //---------------------------------------------------------------------
        //connectDebugJTAG(dut)
        connectSPI      (dut)
        connectUART     (dut)
        connectMIG      (dut)
    
  }

}

