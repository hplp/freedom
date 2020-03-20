// See LICENSE for license details.
package sifive.fpgashells.devices.xilinx.xilinxua280mig

import Chisel._
import freechips.rocketchip.config._
import freechips.rocketchip.subsystem.BaseSubsystem
import freechips.rocketchip.diplomacy.{LazyModule, LazyModuleImp, AddressRange}

case object MemoryXilinxDDRKey extends Field[XilinxUA280MIGParams]

trait HasMemoryXilinxUA280MIG { this: BaseSubsystem =>
  val module: HasMemoryXilinxUA280MIGModuleImp

  val xilinxua280mig = LazyModule(new XilinxUA280MIG(p(MemoryXilinxDDRKey)))

  require(nMemoryChannels == 1, "Core complex must have 1 master memory port")
  xilinxua280mig.node := memBuses.head.toDRAMController(Some("xilinxua280mig"))()
}

trait HasMemoryXilinxUA280MIGBundle {
  val xilinxua280mig: XilinxUA280MIGIO
  def connectXilinxUA280MIGToPads(pads: XilinxUA280MIGPads) {
    pads <> xilinxua280mig
  }
}

trait HasMemoryXilinxUA280MIGModuleImp extends LazyModuleImp
    with HasMemoryXilinxUA280MIGBundle {
  val outer: HasMemoryXilinxUA280MIG
  val ranges = AddressRange.fromSets(p(MemoryXilinxDDRKey).address)
  require (ranges.size == 1, "DDR4 range must be contiguous")
  val depth = ranges.head.size
  val xilinxua280mig = IO(new XilinxUA280MIGIO(depth))

  xilinxua280mig <> outer.xilinxua280mig.module.io.port
}
