package riscv

import chisel3._
import chisel3.util._
import chisel3.experimental._
import common.Consts._

class Seg extends Module {
    val io = IO(new Bundle {
        val data = Input(UInt(WORD_LEN.W))
        val led = Output(Vec(8, UInt(8.W)))
    })

    for (i <- 0 until 8) {
        io.led(i) := MuxCase("b10001110".U(8.W), Seq(
            (io.data(4 * i + 3, 4 * i) === 0.U(4.W)) -> "b11000000".U(8.W),
            (io.data(4 * i + 3, 4 * i) === 1.U(4.W)) -> "b11111001".U(8.W),
            (io.data(4 * i + 3, 4 * i) === 2.U(4.W)) -> "b10100100".U(8.W),
            (io.data(4 * i + 3, 4 * i) === 3.U(4.W)) -> "b10110000".U(8.W),
            (io.data(4 * i + 3, 4 * i) === 4.U(4.W)) -> "b10011001".U(8.W),
            (io.data(4 * i + 3, 4 * i) === 5.U(4.W)) -> "b10010010".U(8.W),
            (io.data(4 * i + 3, 4 * i) === 6.U(4.W)) -> "b10000010".U(8.W),
            (io.data(4 * i + 3, 4 * i) === 7.U(4.W)) -> "b11111000".U(8.W),
            (io.data(4 * i + 3, 4 * i) === 8.U(4.W)) -> "b10000000".U(8.W),
            (io.data(4 * i + 3, 4 * i) === 9.U(4.W)) -> "b10011000".U(8.W),
            (io.data(4 * i + 3, 4 * i) === 10.U(4.W)) -> "b10001000".U(8.W),
            (io.data(4 * i + 3, 4 * i) === 11.U(4.W)) -> "b10000011".U(8.W),
            (io.data(4 * i + 3, 4 * i) === 12.U(4.W)) -> "b11000110".U(8.W),
            (io.data(4 * i + 3, 4 * i) === 13.U(4.W)) -> "b10100001".U(8.W),
            (io.data(4 * i + 3, 4 * i) === 14.U(4.W)) -> "b10000110".U(8.W)
        ))
    }
}

