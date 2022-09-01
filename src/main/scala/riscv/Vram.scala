package riscv

import chisel3._
import chisel3.util._
import common.Consts._

class VmemPortIo extends Bundle {
    val addr = Input(UInt(WORD_LEN.W))
    val wen = Input(UInt(MEN_LEN.W))
    val wdata = Input(UInt(32.W))
    val commit = Input(Bool()) // sync for vga
    val raddr_x = Input(UInt(10.W))
    val raddr_y = Input(UInt(10.W))
    val rdata = Output(UInt(12.W))
}

class Vram extends Module {
    val io = IO(new VmemPortIo())
    val mem0 = Mem(4800, UInt(32.W))
    val mem1 = Mem(4800, UInt(32.W))

    val raddr = io.raddr_x * 80.U(10.W) + io.raddr_y
    val sel = RegInit(0.U(1.W))

    io.rdata := Mux(sel === 0.U(1.W), mem0.read(raddr)(11, 0), mem1.read(raddr)(11, 0))

    when (io.wen === MEN_S) {
        when (sel === 0.U(1.W)) {
            mem1.write(raddr(13, 2), io.wdata)
        } .otherwise {
            mem0.write(raddr(13, 2), io.wdata)
        }
    }

    when (io.commit === 1.B) {
        sel := ~sel
    }
}