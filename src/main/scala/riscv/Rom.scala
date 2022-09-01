package riscv

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile
import firrtl.annotations.MemoryLoadFileType
import common.Consts._

class ImemPortIo extends Bundle {
    val addr = Input(UInt(WORD_LEN .W))
    val inst = Output(UInt(WORD_LEN.W))
}

class Rom extends Module {
    val io = IO(new ImemPortIo)

    val mem = Mem(4096, UInt(32.W))
    loadMemoryFromFile(mem, "/home/star/Desktop/chisel_project/chisel-template/src/main/resources/risc-v-benchmark_ccab.hex")
    io.inst := mem(io.addr(31, 2))
}