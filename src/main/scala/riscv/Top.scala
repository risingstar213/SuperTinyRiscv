package riscv

import chisel3._

class Top extends Module {
    val io = IO(new Bundle {
        val led = Output(Vec(8, UInt(8.W)))
        val vmem = new VmemPortIoWrapper()
        val kbd = new KeyboardPortIo()
    })

    val core = Module(new Core())
    val rom = Module(new Rom())
    val mmio = Module(new Mmio())
    val seg = Module(new Seg())

    core.io.imem <> rom.io
    core.io.dmem <> mmio.io.dmem
    core.io.data <> seg.io.data
    io.led := seg.io.led
    io.vmem <> mmio.io.vmem
    io.kbd <> mmio.io.kbd
}