package riscv

import chisel3._
import chisel3.util._
import common.Instructions._
import common.Consts._

class Core extends Module {
    val io = IO(
        new Bundle {
            val imem = Flipped(new ImemPortIo())
            val dmem = Flipped(new DmemPortIo())
            val data = Output(UInt(WORD_LEN.W))
        }
    )

    val regfile = Mem(32, UInt(WORD_LEN.W))

    // IF Stage

    val pc_reg = RegInit(START_ADDR)
    io.imem.addr := pc_reg
    val inst = io.imem.inst
    
    val pc_plus4 = pc_reg + 4.U(WORD_LEN.W)
    val br_target = Wire(UInt(WORD_LEN.W))
    val br_flg = Wire(Bool())
    val ecall_flg = Wire(Bool())
    val alu_out = Wire(UInt(WORD_LEN.W))

    val pc_next = MuxCase(pc_plus4, Seq(
        br_flg ->br_target,
        (inst === JAL || inst === JALR) ->alu_out,
        (ecall_flg) -> pc_reg
    ))

    pc_reg := pc_next

    // ID Stage
    val rs1_addr = inst(19, 15)
    val rs2_addr = inst(24, 20)
    val wb_addr = inst(11, 7)
    val rs1_data = MuxCase(regfile(rs1_addr), Seq(
        (inst === ECALL) -> regfile(10), // x10/a0
        (inst =/= ECALL && rs1_addr === 0.U(5.W)) -> 0.U(WORD_LEN.W)
    ))

    val rs2_data = MuxCase(regfile(rs2_addr), Seq(
        (inst === ECALL) -> regfile(17), // x17/a7
        (inst =/= ECALL && rs2_addr === 0.U(5.W)) -> 0.U(WORD_LEN.W)
    ))

    val imm_i = inst(31, 20)
    val imm_i_sext = Cat(Fill(20, imm_i(11)), imm_i)
    val imm_s = Cat(inst(31, 25), inst(11, 7))
    val imm_s_sext = Cat(Fill(20, imm_s(11)), imm_s)
    val imm_b = Cat(inst(31), inst(7), inst(30, 25), inst(11, 8))
    val imm_b_sext = Cat(Fill(19, imm_b(11)), imm_b, 0.U(1.W))
    val imm_j = Cat(inst(31), inst(19, 12), inst(20), inst(30, 21))
    val imm_j_sext = Cat(Fill(11, imm_j(19)), imm_j, 0.U(1.W))
    val imm_u = inst(31, 12)
    val imm_u_shifted = Cat(imm_u, Fill(12, 0.U(1.W)))

    val csignals = ListLookup(inst,
        List(ALU_X    , OP1_RS1, OP2_RS2, MEN_X, REN_X, WB_X  ,  MW_X),
        Array(
            LB    -> List(ALU_ADD  , OP1_RS1, OP2_IMI, MEN_R, REN_S, WB_MEM, MW_B),
            LH    -> List(ALU_ADD  , OP1_RS1, OP2_IMI, MEN_R, REN_S, WB_MEM, MW_H),
            LW    -> List(ALU_ADD  , OP1_RS1, OP2_IMI, MEN_R, REN_S, WB_MEM, MW_W),
            LBU  -> List(ALU_ADD  , OP1_RS1, OP2_IMI, MEN_R, REN_S, WB_MEM, MW_BU),
            LHU  -> List(ALU_ADD  , OP1_RS1, OP2_IMI, MEN_R, REN_S, WB_MEM, MW_HU),
            SB    -> List(ALU_ADD  , OP1_RS1, OP2_IMS, MEN_S, REN_X, WB_X  , MW_B),
            SH    -> List(ALU_ADD  , OP1_RS1, OP2_IMS, MEN_S, REN_X, WB_X  , MW_H),
            SW    -> List(ALU_ADD  , OP1_RS1, OP2_IMS, MEN_S, REN_X, WB_X  , MW_W),
            ADD   -> List(ALU_ADD  , OP1_RS1, OP2_RS2, MEN_X, REN_S, WB_ALU, MW_X),
            ADDI  -> List(ALU_ADD  , OP1_RS1, OP2_IMI, MEN_X, REN_S, WB_ALU, MW_X),
            SUB   -> List(ALU_SUB  , OP1_RS1, OP2_RS2, MEN_X, REN_S, WB_ALU, MW_X),
            AND   -> List(ALU_AND  , OP1_RS1, OP2_RS2, MEN_X, REN_S, WB_ALU, MW_X),
            OR    -> List(ALU_OR   , OP1_RS1, OP2_RS2, MEN_X, REN_S, WB_ALU, MW_X),
            XOR   -> List(ALU_XOR  , OP1_RS1, OP2_RS2, MEN_X, REN_S, WB_ALU, MW_X),
            ANDI  -> List(ALU_AND  , OP1_RS1, OP2_IMI, MEN_X, REN_S, WB_ALU, MW_X),
            ORI   -> List(ALU_OR   , OP1_RS1, OP2_IMI, MEN_X, REN_S, WB_ALU, MW_X),
            XORI  -> List(ALU_XOR  , OP1_RS1, OP2_IMI, MEN_X, REN_S, WB_ALU, MW_X),
            MUL   -> List(ALU_MUL, OP1_RS1, OP2_RS2, MEN_X, REN_S, WB_ALU, MW_X),
            MULH -> List(ALU_MULH, OP1_RS1, OP2_RS2, MEN_X, REN_S, WB_ALU, MW_X),
            DIV    -> List(ALU_DIV, OP1_RS1, OP2_RS2, MEN_X, REN_S, WB_ALU, MW_X),
            DIVU -> List(ALU_DIVU, OP1_RS1, OP2_RS2, MEN_X, REN_S, WB_ALU, MW_X),
            REM  -> List(ALU_REM, OP1_RS1, OP2_RS2, MEN_X, REN_S, WB_ALU, MW_X),
            REMU -> List(ALU_REMU, OP1_RS1, OP2_RS2, MEN_X, REN_S, WB_ALU, MW_X),
            SLL   -> List(ALU_SLL  , OP1_RS1, OP2_RS2, MEN_X, REN_S, WB_ALU, MW_X),
            SRL   -> List(ALU_SRL  , OP1_RS1, OP2_RS2, MEN_X, REN_S, WB_ALU, MW_X),
            SRA   -> List(ALU_SRA  , OP1_RS1, OP2_RS2, MEN_X, REN_S, WB_ALU, MW_X),
            SLLI  -> List(ALU_SLL  , OP1_RS1, OP2_IMI, MEN_X, REN_S, WB_ALU, MW_X),
            SRLI  -> List(ALU_SRL  , OP1_RS1, OP2_IMI, MEN_X, REN_S, WB_ALU, MW_X),
            SRAI  -> List(ALU_SRA  , OP1_RS1, OP2_IMI, MEN_X, REN_S, WB_ALU, MW_X),
            SLT   -> List(ALU_SLT  , OP1_RS1, OP2_RS2, MEN_X, REN_S, WB_ALU, MW_X),
            SLTU  -> List(ALU_SLTU , OP1_RS1, OP2_RS2, MEN_X, REN_S, WB_ALU, MW_X),
            SLTI  -> List(ALU_SLT  , OP1_RS1, OP2_IMI, MEN_X, REN_S, WB_ALU, MW_X),
            SLTIU -> List(ALU_SLTU , OP1_RS1, OP2_IMI, MEN_X, REN_S, WB_ALU, MW_X),
            BEQ   -> List(BR_BEQ   , OP1_RS1, OP2_RS2, MEN_X, REN_X, WB_X  , MW_X),
            BNE   -> List(BR_BNE   , OP1_RS1, OP2_RS2, MEN_X, REN_X, WB_X  , MW_X),
            BGE   -> List(BR_BGE   , OP1_RS1, OP2_RS2, MEN_X, REN_X, WB_X  , MW_X),
            BGEU  -> List(BR_BGEU  , OP1_RS1, OP2_RS2, MEN_X, REN_X, WB_X  , MW_X),
            BLT   -> List(BR_BLT   , OP1_RS1, OP2_RS2, MEN_X, REN_X, WB_X  , MW_X),
            BLTU  -> List(BR_BLTU  , OP1_RS1, OP2_RS2, MEN_X, REN_X, WB_X  , MW_X),
            JAL   -> List(ALU_ADD  , OP1_PC , OP2_IMJ, MEN_X, REN_S, WB_PC , MW_X),
            JALR  -> List(ALU_JALR , OP1_RS1, OP2_IMI, MEN_X, REN_S, WB_PC , MW_X),
            LUI   -> List(ALU_ADD  , OP1_X  , OP2_IMU, MEN_X, REN_S, WB_ALU, MW_X),
            AUIPC -> List(ALU_ADD  , OP1_PC , OP2_IMU, MEN_X, REN_S, WB_ALU, MW_X),
            ECALL -> List(SP_ECALL  , OP1_RS1 , OP2_RS2, MEN_X, REN_X, WB_X, MW_X),
        )
    )

    val exe_fun :: op1_sel :: op2_sel :: mem_wen :: rf_wen :: wb_sel ::rw_type::Nil = csignals

    val op1_data = MuxCase(0.U(WORD_LEN.W), Seq(
        (op1_sel === OP1_RS1) -> rs1_data,
        (op1_sel === OP1_PC)  -> pc_reg
    ))
    
    val op2_data = MuxCase(0.U(WORD_LEN.W), Seq(
        (op2_sel === OP2_RS2) -> rs2_data,
        (op2_sel === OP2_IMI) -> imm_i_sext,
        (op2_sel === OP2_IMS) -> imm_s_sext,
        (op2_sel === OP2_IMJ) -> imm_j_sext,
        (op2_sel === OP2_IMU) -> imm_u_shifted
    ))
    
    // EX Stage

    alu_out := MuxCase(0.U(WORD_LEN.W), Seq(
        (exe_fun === ALU_ADD)   -> (op1_data + op2_data),
        (exe_fun === ALU_SUB)   -> (op1_data - op2_data),
        (exe_fun === ALU_AND)   -> (op1_data & op2_data),
        (exe_fun === ALU_OR)    -> (op1_data | op2_data),
        (exe_fun === ALU_XOR)   -> (op1_data ^ op2_data),
        (exe_fun === ALU_MUL)  -> (op1_data * op2_data)(31, 0),
        (exe_fun === ALU_MULH) -> (op1_data *op2_data)(63, 32),
        (exe_fun === ALU_DIV) -> (op1_data.asSInt() / op2_data.asSInt()).asUInt(),
        (exe_fun === ALU_DIVU) -> (op1_data / op2_data),
        (exe_fun === ALU_REM) -> (op1_data.asSInt() % op2_data.asSInt()).asUInt(),
        (exe_fun === ALU_REMU) -> (op1_data % op2_data),
        (exe_fun === ALU_SLL)   -> (op1_data << op2_data(4, 0))(31, 0),
        (exe_fun === ALU_SRL)   -> (op1_data >> op2_data(4, 0)).asUInt(),
        (exe_fun === ALU_SRA)   -> (op1_data.asSInt() >> op2_data(4, 0)).asUInt(),
        (exe_fun === ALU_SLT)   -> (op1_data.asSInt() < op2_data.asSInt()).asUInt(),
        (exe_fun === ALU_SLTU)  -> (op1_data < op2_data).asUInt(),
        (exe_fun === ALU_JALR)  -> ((op1_data + op2_data) & ~1.U(WORD_LEN.W)),
    ))

  // branch
    br_flg := MuxCase(false.B, Seq(
        (exe_fun === BR_BEQ)  ->  (op1_data === op2_data),
        (exe_fun === BR_BNE)  -> !(op1_data === op2_data),
        (exe_fun === BR_BLT)  ->  (op1_data.asSInt() < op2_data.asSInt()),
        (exe_fun === BR_BGE)  -> !(op1_data.asSInt() < op2_data.asSInt()),
        (exe_fun === BR_BLTU) ->  (op1_data < op2_data),
        (exe_fun === BR_BGEU) -> !(op1_data < op2_data)
    ))
    br_target := pc_reg + imm_b_sext

    // ecall
    ecall_flg := (exe_fun === SP_ECALL && op2_data =/= 34.U(WORD_LEN.W))
    val seg_data = RegInit(0.U(WORD_LEN.W))
    io.data := seg_data
    seg_data := Mux((exe_fun === SP_ECALL && op2_data === 34.U(WORD_LEN.W)), op1_data, seg_data)

    //  MEM Stage
    io.dmem.addr := alu_out
    io.dmem.wen := mem_wen
    io.dmem.wdata := rs2_data
    io.dmem.rwtype := rw_type

    // WB Stage
    val wb_data = MuxCase(alu_out, Seq(
        (wb_sel === WB_MEM) -> io.dmem.rdata,
        (wb_sel === WB_PC)  -> pc_plus4,
    ))

    when(rf_wen === REN_S) {
        regfile(wb_addr) := wb_data
    }

    //**********************************
  // Debug
  printf(p"io.pc      : 0x${Hexadecimal(pc_reg)}\n")
  printf(p"inst       : 0x${Hexadecimal(inst)}\n")
  printf(p"gp         : ${regfile(3)}\n")
  printf(p"rs1_addr   : $rs1_addr\n")
  printf(p"rs2_addr   : $rs2_addr\n")
  printf(p"wb_addr    : $wb_addr\n")
  printf(p"rs1_data   : 0x${Hexadecimal(rs1_data)}\n")
  printf(p"rs2_data   : 0x${Hexadecimal(rs2_data)}\n")
  printf(p"wb_data    : 0x${Hexadecimal(wb_data)}\n")
  printf(p"dmem.addr  : ${io.dmem.addr}\n")
  printf(p"dmem.rdata : ${io.dmem.rdata}\n")
  printf("---------\n")
}