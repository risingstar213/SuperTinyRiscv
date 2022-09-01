package riscv

import chisel3._
import chisel3.util._
import common.Consts._

class VmemPortIoWrapper extends Bundle {
    val raddr_x = Input(Input(UInt(10.W)))
    val raddr_y = Input(Input(UInt(10.W)))
    val rdata = Output(UInt(12.W))
}

class KeyboardPortIo extends Bundle {
    val kbd_ready = Input(Bool())
    val kbd_data = Input(UInt(8.W))
    val kbd_read_enable = Output(Bool())
}

class Mmio extends Module {
    val io = IO(
        new Bundle {
            val dmem = new DmemPortIo()
            val vmem = new VmemPortIoWrapper()
            val kbd = new KeyboardPortIo()
        }
    )
    // RAM
    val ram = Module(new Ram());

    ram.io.addr := io.dmem.addr
    ram.io.wen := Mux((io.dmem.addr < MMIO_BASE), io.dmem.wen, MEN_X)
    ram.io.wdata := io.dmem.wdata
    ram.io.rwtype := io.dmem.rwtype
    // VRAM
    val vram = Module(new Vram());

    vram.io.addr := io.dmem.addr
    vram.io.wen := Mux((io.dmem.addr >= VGA_ADDR && io.dmem.addr < (VGA_ADDR + VGA_SIZE)), io.dmem.wen, MEN_X)
    vram.io.wdata := io.dmem.wdata
    vram.io.commit := ((io.dmem.addr === VGACTL_ADDR && io.dmem.wen === MEN_S)) //  VGA SYNC
    vram.io.raddr_x := io.vmem.raddr_x
    vram.io.raddr_y := io.vmem.raddr_y
    io.vmem.rdata := vram.io.rdata
    // Keyboard
    val keyboard_data = Mux(io.kbd.kbd_ready, io.kbd.kbd_data, 0.U(8.W))
    val keyboard_read = RegInit(0.U(1.W))
    io.kbd.kbd_read_enable:= keyboard_read
    keyboard_read := Mux((io.dmem.addr === KBD_ADDR), 1.U(1.W), 0.U(1.W))
    // Time
    val count = RegInit(0.U(32.W))
    count := count + 1.U(32.W)
    
    // read data
    io.dmem.rdata := MuxCase(ram.io.rdata, Seq(
        (io.dmem.addr === KBD_ADDR) -> Cat(Fill(27, 0.U(1.W)), keyboard_read),
        (io.dmem.addr === RTC_ADDR) -> count
    ))
}