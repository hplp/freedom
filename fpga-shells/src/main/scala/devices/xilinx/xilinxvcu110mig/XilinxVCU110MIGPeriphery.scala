// See LICENSE for license details.
package sifive.fpgashells.devices.xilinx.xilinxvcu110mig

import Chisel._
import freechips.rocketchip.config._
import freechips.rocketchip.subsystem.BaseSubsystem
import freechips.rocketchip.diplomacy.{LazyModule, LazyModuleImp, AddressRange}

case object MemoryXilinxDDRKey extends Field[XilinxVCU110MIGParams]

trait HasMemoryXilinxVCU110MIG { this: BaseSubsystem =>
  val module: HasMemoryXilinxVCU110MIGModuleImp

  val xilinxvcu110mig = LazyModule(new XilinxVCU110MIG(p(MemoryXilinxDDRKey)))

  require(nMemoryChannels == 1, "Core complex must have 1 master memory port")
  xilinxvcu110mig.node := memBuses.head.toDRAMController(Some("xilinxvcu110mig"))()
}

trait HasMemoryXilinxVCU110MIGBundle {
  val xilinxvcu110mig: XilinxVCU110MIGIO
  def connectXilinxVCU110MIGToPads(pads: XilinxVCU110MIGPads) {
    pads <> xilinxvcu110mig
  }
}

trait HasMemoryXilinxVCU110MIGModuleImp extends LazyModuleImp
    with HasMemoryXilinxVCU110MIGBundle {
  val outer: HasMemoryXilinxVCU110MIG
  val ranges = AddressRange.fromSets(p(MemoryXilinxDDRKey).address)
  require (ranges.size == 1, "HMC range must be contiguous")
  val depth = ranges.head.size
  val xilinxvcu110mig = IO(new XilinxVCU110MIGIO(depth))

  xilinxvcu110mig <> outer.xilinxvcu110mig.module.io.port
}
