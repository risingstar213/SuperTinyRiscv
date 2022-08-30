package riscv

import chisel3._

object riscvMain extends App {
    Driver.execute(args, () => new Top)
}