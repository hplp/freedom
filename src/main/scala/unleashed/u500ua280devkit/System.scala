

// See LICENSE for license details.

package sifive.freedom.unleashed.u500ua280devkit

import Chisel._

import freechips.rocketchip.config._
import freechips.rocketchip.subsystem._
import freechips.rocketchip.devices.debug._
import freechips.rocketchip.devices.tilelink._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.system._

import sifive.blocks.devices.gpio._
import sifive.blocks.devices.spi._
import sifive.blocks.devices.uart._

import sifive.fpgashells.devices.xilinx.xilinxua280mig._
//import sifive.fpgashells.devices.xilinx.xilinxvc707pciex1._

//-------------------------------------------------------------------------
// U500VC707DevKitSystem
//-------------------------------------------------------------------------

class U500UA280DevKitSystem(implicit p: Parameters) extends RocketSubsystem
    with HasPeripheryMaskROMSlave
    //with HasPeripheryDebug
    with HasSystemErrorSlave
    with HasPeripheryUART
    with HasPeripherySPI
    //with HasPeripheryGPIO
    with HasMemoryXilinxUA280MIG{

  val clock = new FixedClockResource("tlclk", 50)
  uarts.foreach { x => clock.bind(x.device) }
  spis.foreach  { x => clock.bind(x.device) }

  // Work-around for a kernel bug (command-line ignored if /chosen missing)
  val chosen = new DeviceSnippet {
    def describe() = Description("chosen", Map())
  }

  override lazy val module = new U500UA280DevKitSystemModule(this)
}

class U500UA280DevKitSystemModule[+L <: U500UA280DevKitSystem](_outer: L)
  extends RocketSubsystemModuleImp(_outer)
    with HasRTCModuleImp
    //with HasPeripheryDebugModuleImp
    with HasPeripheryUARTModuleImp
    with HasPeripherySPIModuleImp
    //with HasPeripheryGPIOModuleImp
    with HasMemoryXilinxUA280MIGModuleImp
{
  // Reset vector is set to the location of the mask rom
  val maskROMParams = p(PeripheryMaskROMKey)
  global_reset_vector := maskROMParams(0).address.U
}

