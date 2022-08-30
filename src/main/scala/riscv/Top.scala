package riscv

import chisel3._

class Top extends Module {
    val io = IO(new Bundle {
        val led = Output(Vec(8, UInt(8.W)))
    })

    val core = Module(new Core())
    val rom = Module(new Rom())
    val ram = Module(new Ram())
    val seg = Module(new Seg())

    core.io.imem <> rom.io
    core.io.dmem <> ram.io
    core.io.data <> seg.io.data
    io.led := seg.io.led
}