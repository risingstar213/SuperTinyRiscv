package riscv
import org.scalatest._
import chiseltest._
import chisel3._

class RiscvTest extends FlatSpec with ChiselScalatestTester {
  behavior of "mycpu"
  it should "work through hex" in {
    test(new Top) { c =>
        for(i <- 1 until 20){
        c.clock.step(1)
      }
    }
  }
}