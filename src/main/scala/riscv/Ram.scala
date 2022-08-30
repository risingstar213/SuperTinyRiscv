package riscv

import chisel3._
import chisel3.util._
import common.Consts._

class DmemPortIo extends Bundle {
    val addr  = Input(UInt(WORD_LEN.W))
    val rdata = Output(UInt(WORD_LEN.W))
    val wen   = Input(Bool())
    val wdata = Input(UInt(WORD_LEN.W))
    val rwtype = Input(UInt(MW_LEN.W))
}

class Ram extends Module {
    val io = IO(new DmemPortIo)

    val mem = Mem(16384, Vec(4, UInt(8.W)))
    val dataIn_temp = Wire(Vec(4, UInt(8.W)))
    val dataOut_temp = Wire(Vec(4, UInt(8.W)))
    val mask = Wire(Vec(4, Bool()))


    when (io.wen) {
        mem.write(io.addr(31, 2), dataIn_temp, mask)
        dataOut_temp := mem.read(io.addr)
    } .otherwise {
        for (i <- 0 until 4) {
            dataOut_temp(i) := 0.U(8.W)
        }
    }

    for (i <- 0 until 4)  {
        when(io.rwtype === MW_W) {
            dataIn_temp(i) := io.wdata(8*i+7, 8*i)
            mask(i) := 1.U(1.W).asBool()
        } .otherwise {
            when(io.rwtype === MW_B || io.rwtype === MW_BU) {
                dataIn_temp(i) := io.wdata(7, 0)
                mask(i) := (io.addr(1, 0).asUInt()  === i.asUInt())
            }  .otherwise {
                when(io.rwtype === MW_H || io.rwtype === MW_HU) {
                    dataIn_temp(i) := io.wdata(8*(i%2)+7, 8*(i%2))
                    mask(i) := io.addr(1).asBool()
                } .otherwise {
                    dataIn_temp(i) := 0.U(4.W)
                    mask(i) :=0.U(1.W).asBool()
                }
            }
        }
    }

    io.rdata := MuxCase(0.U(WORD_LEN.W), Seq(
        (io.rwtype === MW_W) -> Cat(dataOut_temp(3), dataOut_temp(2), dataOut_temp(1), dataOut_temp(0)),
        (io.rwtype === MW_B) -> Cat(Fill(24, dataOut_temp(io.addr(1, 0))(7)), dataOut_temp(io.addr(1, 0))),
        (io.rwtype === MW_BU) -> Cat(0.U((3 * WORD_LEN).W), dataOut_temp(io.addr(1, 0))),
        (io.rwtype === MW_H) -> Cat(Fill(16, dataOut_temp(io.addr(1, 0)+ 1.U)(7)), dataOut_temp(io.addr(1, 0) + 1.U), dataOut_temp(io.addr(1, 0))),
        (io.rwtype === MW_HU) -> Cat(0.U((2 * WORD_LEN).W), dataOut_temp(io.addr(1, 0) + 1.U), dataOut_temp(io.addr(1, 0)))
    ))

}