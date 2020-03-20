// See LICENSE for license details.
package sifive.fpgashells.ip.xilinx.ua280mig

import Chisel._
import chisel3.experimental.{Analog,attach}
import freechips.rocketchip.util.{ElaborationArtefacts}
import freechips.rocketchip.util.GenericParameterizedBundle
import freechips.rocketchip.config._

// IP VLNV: xilinx.com:customize_ip:vcu110mig:1.0
// Black Box

class UA280MIGIODDR(depth : BigInt) extends GenericParameterizedBundle(depth) {
  require((depth<=0x80000000L),"UA280MIGIODDR supports upto 2GB depth configuraton")
  val c0_ddr4_adr           = Bits(OUTPUT,17)
  val c0_ddr4_bg            = Bits(OUTPUT,2)
  val c0_ddr4_ba            = Bits(OUTPUT,2)
  val c0_ddr4_reset_n       = Bool(OUTPUT)
  val c0_ddr4_act_n         = Bool(OUTPUT)
  val c0_ddr4_ck_c          = Bits(OUTPUT,1)
  val c0_ddr4_ck_t          = Bits(OUTPUT,1)
  val c0_ddr4_cke           = Bits(OUTPUT,1)
  val c0_ddr4_cs_n          = Bits(OUTPUT,1)
  val c0_ddr4_odt           = Bits(OUTPUT,1)
  val c0_ddr4_parity        = Bits(OUTPUT,1)

  val c0_ddr4_dq            = Analog(72.W)
  val c0_ddr4_dqs_c         = Analog(18.W)
  val c0_ddr4_dqs_t         = Analog(18.W)
}

/*class UA280MIGIODDR(depth : BigInt) extends GenericParameterizedBundle(depth) {
  require((depth<=0x100000000L),"UA280MIGIODDR supports upto 2GB depth configuraton")
  val c0_ddr4_adr           = Bits(OUTPUT,17)
  val c0_ddr4_bg            = Bits(OUTPUT,2)
  val c0_ddr4_ba            = Bits(OUTPUT,2)
  val c0_ddr4_reset_n       = Bool(OUTPUT)
  val c0_ddr4_act_n         = Bool(OUTPUT)
  val c0_ddr4_ck_c          = Bits(OUTPUT,1)
  val c0_ddr4_ck_t          = Bits(OUTPUT,1)
  val c0_ddr4_cke           = Bits(OUTPUT,1)
  val c0_ddr4_cs_n          = Bits(OUTPUT,1)
  val c0_ddr4_odt           = Bits(OUTPUT,1)
  val c0_ddr4_parity        = Bits(OUTPUT,1)

  val c0_ddr4_dq            = Analog(72.W)
  val c0_ddr4_dqs_c         = Analog(18.W)
  val c0_ddr4_dqs_t         = Analog(18.W)
}*/




//reused directly in io bundle for sifive.blocks.devices.xilinxvcu110mig
trait UA280MIGIOClocksReset extends Bundle {
  //inputs
  //"NO_BUFFER" clock source (must be connected to IBUF outside of IP)
  val c0_sys_clk_i              = Bool(INPUT)
  //user interface signals
  val c0_ddr4_ui_clk            = Clock(OUTPUT)
  val c0_ddr4_ui_clk_sync_rst   = Bool(OUTPUT)
  val c0_ddr4_aresetn           = Bool(INPUT)
  //misc
  val c0_init_calib_complete    = Bool(OUTPUT)
  val sys_rst                   = Bool(INPUT)
}

//scalastyle:off
//turn off linter: blackbox name must match verilog module
class ua280mig(depth : BigInt)(implicit val p:Parameters) extends BlackBox
{
  require((depth<=0x80000000L),"ua280mig supports upto 2GB depth configuraton")

  val io = new UA280MIGIODDR(depth) with UA280MIGIOClocksReset {
    //slave interface write address ports
    
    val c0_ddr4_s_axi_ctrl_awvalid = Bool(INPUT)
    val c0_ddr4_s_axi_ctrl_awready = Bool(OUTPUT)
    val c0_ddr4_s_axi_ctrl_awaddr = Bits(INPUT,32)

    val c0_ddr4_s_axi_ctrl_wvalid = Bool(INPUT)
    val c0_ddr4_s_axi_ctrl_wready = Bool(OUTPUT)
    val c0_ddr4_s_axi_ctrl_wdata = Bits(INPUT,32)

    val c0_ddr4_s_axi_ctrl_bvalid = Bool(OUTPUT)
    val c0_ddr4_s_axi_ctrl_bready = Bool(INPUT)
    val c0_ddr4_s_axi_ctrl_bresp = Bits(OUTPUT,2)

    val c0_ddr4_s_axi_ctrl_arvalid = Bool(INPUT)
    val c0_ddr4_s_axi_ctrl_arready = Bool(OUTPUT)
    val c0_ddr4_s_axi_ctrl_araddr = Bits(INPUT,32)

    val c0_ddr4_s_axi_ctrl_rvalid = Bool(OUTPUT)
    val c0_ddr4_s_axi_ctrl_rready = Bool(INPUT)
    val c0_ddr4_s_axi_ctrl_rdata = Bits(OUTPUT,32)
    val c0_ddr4_s_axi_ctrl_rresp = Bits(OUTPUT,2)
    
    val c0_ddr4_s_axi_awid            = Bits(INPUT,4)
    val c0_ddr4_s_axi_awaddr          = Bits(INPUT,31)
    val c0_ddr4_s_axi_awlen           = Bits(INPUT,8)
    val c0_ddr4_s_axi_awsize          = Bits(INPUT,3)
    val c0_ddr4_s_axi_awburst         = Bits(INPUT,2)
    val c0_ddr4_s_axi_awlock          = Bits(INPUT,1)
    val c0_ddr4_s_axi_awcache         = Bits(INPUT,4)
    val c0_ddr4_s_axi_awprot          = Bits(INPUT,3)
    val c0_ddr4_s_axi_awqos           = Bits(INPUT,4)
    val c0_ddr4_s_axi_awvalid         = Bool(INPUT)
    val c0_ddr4_s_axi_awready         = Bool(OUTPUT)
    //slave interface write data ports
    val c0_ddr4_s_axi_wdata           = Bits(INPUT,64)
    val c0_ddr4_s_axi_wstrb           = Bits(INPUT,8)
    val c0_ddr4_s_axi_wlast           = Bool(INPUT)
    val c0_ddr4_s_axi_wvalid          = Bool(INPUT)
    val c0_ddr4_s_axi_wready          = Bool(OUTPUT)
    //slave interface write response ports
    val c0_ddr4_s_axi_bready          = Bool(INPUT)
    val c0_ddr4_s_axi_bid             = Bits(OUTPUT,4)
    val c0_ddr4_s_axi_bresp           = Bits(OUTPUT,2)
    val c0_ddr4_s_axi_bvalid          = Bool(OUTPUT)
    //slave interface read address ports
    val c0_ddr4_s_axi_arid            = Bits(INPUT,4)
    val c0_ddr4_s_axi_araddr          = Bits(INPUT,31)
    val c0_ddr4_s_axi_arlen           = Bits(INPUT,8)
    val c0_ddr4_s_axi_arsize          = Bits(INPUT,3)
    val c0_ddr4_s_axi_arburst         = Bits(INPUT,2)
    val c0_ddr4_s_axi_arlock          = Bits(INPUT,1)
    val c0_ddr4_s_axi_arcache         = Bits(INPUT,4)
    val c0_ddr4_s_axi_arprot          = Bits(INPUT,3)
    val c0_ddr4_s_axi_arqos           = Bits(INPUT,4)
    val c0_ddr4_s_axi_arvalid         = Bool(INPUT)
    val c0_ddr4_s_axi_arready         = Bool(OUTPUT)
    //slave interface read data ports
    val c0_ddr4_s_axi_rready          = Bool(INPUT)
    val c0_ddr4_s_axi_rid             = Bits(OUTPUT,4)
    val c0_ddr4_s_axi_rdata           = Bits(OUTPUT,64)
    val c0_ddr4_s_axi_rresp           = Bits(OUTPUT,2)
    val c0_ddr4_s_axi_rlast           = Bool(OUTPUT)
    val c0_ddr4_s_axi_rvalid          = Bool(OUTPUT)
  }

  ElaborationArtefacts.add(
    "ua280mig.vivado.tcl",
    """ 
      create_ip -vlnv xilinx.com:ip:ddr4:2.2 -module_name ua280mig -dir $ipdir -force
      set_property -dict [list \
      CONFIG.C0.DDR4_TimePeriod {1000}\
      CONFIG.C0.DDR4_InputClockPeriod {10000}\
      CONFIG.C0.DDR4_CLKFBOUT_MULT {15}\
      CONFIG.C0.DDR4_DIVCLK_DIVIDE {1}\
      CONFIG.C0.DDR4_CLKOUT0_DIVIDE {6}\
      CONFIG.C0.DDR4_AxiDataWidth {64}\
      CONFIG.C0.DDR4_CasLatency {15}\
      CONFIG.C0.DDR4_CasWriteLatency {11}\
      CONFIG.C0.DDR4_Specify_MandD {true}\
      CONFIG.C0.DDR4_AxiIDWidth                   {4} \
      CONFIG.C0.DDR4_Ecc                          {false} \
      CONFIG.C0_CLOCK_BOARD_INTERFACE             {Custom} \
      CONFIG.C0_DDR4_BOARD_INTERFACE              {Custom} \
      CONFIG.C0.DDR4_AxiSelection                 {true}\
      CONFIG.RESET_BOARD_INTERFACE                {Custom}\
      CONFIG.C0.DDR4_MemoryType {RDIMMs}\
      CONFIG.C0.DDR4_MemoryPart {MTA18ASF2G72PZ-2G3}\
      CONFIG.System_Clock                         {No_Buffer}
      ] [get_ips ua280mig]"""
  )
   
}



/*class ua280mig(depth : BigInt)(implicit val p:Parameters) extends BlackBox
{
  require((depth<=0x20000000L),"ua280mig supports upto 2GB depth configuraton")

  val io = new UA280MIGIODDR(depth){
    //slave interface write address ports

    val c0_ddr4_s_axi_awid            = Bits(INPUT,4)
    val c0_ddr4_s_axi_awaddr          = Bits(INPUT,34)
    val c0_ddr4_s_axi_awlen           = Bits(INPUT,8)
    val c0_ddr4_s_axi_awsize          = Bits(INPUT,3)
    val c0_ddr4_s_axi_awburst         = Bits(INPUT,2)
    val c0_ddr4_s_axi_awlock          = Bits(INPUT,1)
    val c0_ddr4_s_axi_awcache         = Bits(INPUT,4)
    val c0_ddr4_s_axi_awprot          = Bits(INPUT,3)
    val c0_ddr4_s_axi_awqos           = Bits(INPUT,4)
    val c0_ddr4_s_axi_awvalid         = Bool(INPUT)
    val c0_ddr4_s_axi_awready         = Bool(OUTPUT)
    //slave interface write data ports
    val c0_ddr4_s_axi_wdata           = Bits(INPUT,512)
    val c0_ddr4_s_axi_wstrb           = Bits(INPUT,64)
    val c0_ddr4_s_axi_wlast           = Bool(INPUT)
    val c0_ddr4_s_axi_wvalid          = Bool(INPUT)
    val c0_ddr4_s_axi_wready          = Bool(OUTPUT)
    //slave interface write response ports
    val c0_ddr4_s_axi_bready          = Bool(INPUT)
    val c0_ddr4_s_axi_bid             = Bits(OUTPUT,4)
    val c0_ddr4_s_axi_bresp           = Bits(OUTPUT,2)
    val c0_ddr4_s_axi_bvalid          = Bool(OUTPUT)
    //slave interface read address ports
    val c0_ddr4_s_axi_arid            = Bits(INPUT,4)
    val c0_ddr4_s_axi_araddr          = Bits(INPUT,34)
    val c0_ddr4_s_axi_arlen           = Bits(INPUT,8)
    val c0_ddr4_s_axi_arsize          = Bits(INPUT,3)
    val c0_ddr4_s_axi_arburst         = Bits(INPUT,2)
    val c0_ddr4_s_axi_arlock          = Bits(INPUT,1)
    val c0_ddr4_s_axi_arcache         = Bits(INPUT,4)
    val c0_ddr4_s_axi_arprot          = Bits(INPUT,3)
    val c0_ddr4_s_axi_arqos           = Bits(INPUT,4)
    val c0_ddr4_s_axi_arvalid         = Bool(INPUT)
    val c0_ddr4_s_axi_arready         = Bool(OUTPUT)
    //slave interface read data ports
    val c0_ddr4_s_axi_rready          = Bool(INPUT)
    val c0_ddr4_s_axi_rid             = Bits(OUTPUT,4)
    val c0_ddr4_s_axi_rdata           = Bits(OUTPUT,512)
    val c0_ddr4_s_axi_rresp           = Bits(OUTPUT,2)
    val c0_ddr4_s_axi_rlast           = Bool(OUTPUT)
    val c0_ddr4_s_axi_rvalid          = Bool(OUTPUT)
  }

  ElaborationArtefacts.add(
    "ua280mig.vivado.tcl",
    """
      create_ip -vlnv xilinx.com:ip:hbm:1.0 -module_name ua280mig -dir $ipdir -force
      set_property -dict [list \
      CONFIG.USER_MEMORY_DISPLAY {512}\
      CONFIG.USER_APB_EN {false}\
      CONFIG.USER_SWITCH_ENABLE_00 {FALSE}\
      CONFIG.USER_CLK_SEL_LIST0 {AXI_00_ACLK}\
      CONFIG.USER_MC_ENABLE_01 {FALSE}\
      CONFIG.USER_MC_ENABLE_02 {FALSE}\
      CONFIG.USER_MC_ENABLE_03 {FALSE}\
      CONFIG.USER_MC_ENABLE_04 {FALSE}\
      CONFIG.USER_MC_ENABLE_05 {FALSE}\
      CONFIG.USER_MC_ENABLE_06 {FALSE}\
      CONFIG.USER_MC_ENABLE_07 {FALSE}\
      CONFIG.USER_SAXI_01 {false}\
      CONFIG.USER_SAXI_02 {false}\
      CONFIG.USER_SAXI_03 {false}\
      CONFIG.USER_SAXI_04 {false}\
      CONFIG.USER_SAXI_05 {false}\
      CONFIG.USER_SAXI_06 {false}\
      CONFIG.USER_SAXI_07 {false}\
      CONFIG.USER_SAXI_08 {false}\
      CONFIG.USER_SAXI_09 {false}\
      CONFIG.USER_SAXI_10 {false}\
      CONFIG.USER_SAXI_11 {false}\
      CONFIG.USER_SAXI_12 {false}\
      CONFIG.USER_SAXI_13 {false}\
      CONFIG.USER_SAXI_14 {false}\
      CONFIG.USER_SAXI_15 {false}\
      ] [get_ips ua280mig]"""
  )

}*/

//scalastyle:on
