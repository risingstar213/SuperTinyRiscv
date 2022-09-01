module Core(
  input         clock,
  input         reset,
  output [31:0] io_imem_addr,
  input  [31:0] io_imem_inst,
  output [31:0] io_dmem_addr,
  output [1:0]  io_dmem_wen,
  output [31:0] io_dmem_wdata,
  output [2:0]  io_dmem_rwtype,
  input  [31:0] io_dmem_rdata,
  output [31:0] io_data
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] regfile [0:31]; // @[Core.scala 17:22]
  wire [31:0] regfile_rs1_data_MPORT_data; // @[Core.scala 17:22]
  wire [4:0] regfile_rs1_data_MPORT_addr; // @[Core.scala 17:22]
  wire [31:0] regfile_rs1_data_MPORT_1_data; // @[Core.scala 17:22]
  wire [4:0] regfile_rs1_data_MPORT_1_addr; // @[Core.scala 17:22]
  wire [31:0] regfile_rs2_data_MPORT_data; // @[Core.scala 17:22]
  wire [4:0] regfile_rs2_data_MPORT_addr; // @[Core.scala 17:22]
  wire [31:0] regfile_rs2_data_MPORT_1_data; // @[Core.scala 17:22]
  wire [4:0] regfile_rs2_data_MPORT_1_addr; // @[Core.scala 17:22]
  wire [31:0] regfile_MPORT_1_data; // @[Core.scala 17:22]
  wire [4:0] regfile_MPORT_1_addr; // @[Core.scala 17:22]
  wire [31:0] regfile_MPORT_data; // @[Core.scala 17:22]
  wire [4:0] regfile_MPORT_addr; // @[Core.scala 17:22]
  wire  regfile_MPORT_mask; // @[Core.scala 17:22]
  wire  regfile_MPORT_en; // @[Core.scala 17:22]
  reg [31:0] pc_reg; // @[Core.scala 21:25]
  wire [31:0] pc_plus4 = pc_reg + 32'h4; // @[Core.scala 25:27]
  wire [31:0] _pc_next_T = io_imem_inst & 32'h7f; // @[Core.scala 33:15]
  wire  _pc_next_T_1 = 32'h6f == _pc_next_T; // @[Core.scala 33:15]
  wire [31:0] _pc_next_T_2 = io_imem_inst & 32'h707f; // @[Core.scala 33:31]
  wire  _pc_next_T_3 = 32'h67 == _pc_next_T_2; // @[Core.scala 33:31]
  wire  _pc_next_T_4 = 32'h6f == _pc_next_T | 32'h67 == _pc_next_T_2; // @[Core.scala 33:23]
  wire  _csignals_T_1 = 32'h3 == _pc_next_T_2; // @[Lookup.scala 31:38]
  wire  _csignals_T_3 = 32'h1003 == _pc_next_T_2; // @[Lookup.scala 31:38]
  wire  _csignals_T_5 = 32'h2003 == _pc_next_T_2; // @[Lookup.scala 31:38]
  wire  _csignals_T_7 = 32'h4003 == _pc_next_T_2; // @[Lookup.scala 31:38]
  wire  _csignals_T_9 = 32'h5003 == _pc_next_T_2; // @[Lookup.scala 31:38]
  wire  _csignals_T_11 = 32'h23 == _pc_next_T_2; // @[Lookup.scala 31:38]
  wire  _csignals_T_13 = 32'h1023 == _pc_next_T_2; // @[Lookup.scala 31:38]
  wire  _csignals_T_15 = 32'h2023 == _pc_next_T_2; // @[Lookup.scala 31:38]
  wire [31:0] _csignals_T_16 = io_imem_inst & 32'hfe00707f; // @[Lookup.scala 31:38]
  wire  _csignals_T_17 = 32'h33 == _csignals_T_16; // @[Lookup.scala 31:38]
  wire  _csignals_T_19 = 32'h13 == _pc_next_T_2; // @[Lookup.scala 31:38]
  wire  _csignals_T_21 = 32'h40000033 == _csignals_T_16; // @[Lookup.scala 31:38]
  wire  _csignals_T_23 = 32'h7033 == _csignals_T_16; // @[Lookup.scala 31:38]
  wire  _csignals_T_25 = 32'h6033 == _csignals_T_16; // @[Lookup.scala 31:38]
  wire  _csignals_T_27 = 32'h4033 == _csignals_T_16; // @[Lookup.scala 31:38]
  wire  _csignals_T_29 = 32'h7013 == _pc_next_T_2; // @[Lookup.scala 31:38]
  wire  _csignals_T_31 = 32'h6013 == _pc_next_T_2; // @[Lookup.scala 31:38]
  wire  _csignals_T_33 = 32'h4013 == _pc_next_T_2; // @[Lookup.scala 31:38]
  wire  _csignals_T_35 = 32'h2000033 == _csignals_T_16; // @[Lookup.scala 31:38]
  wire  _csignals_T_37 = 32'h2001033 == _csignals_T_16; // @[Lookup.scala 31:38]
  wire  _csignals_T_39 = 32'h2004033 == _csignals_T_16; // @[Lookup.scala 31:38]
  wire  _csignals_T_41 = 32'h2005033 == _csignals_T_16; // @[Lookup.scala 31:38]
  wire  _csignals_T_43 = 32'h2006033 == _csignals_T_16; // @[Lookup.scala 31:38]
  wire  _csignals_T_45 = 32'h2007033 == _csignals_T_16; // @[Lookup.scala 31:38]
  wire  _csignals_T_47 = 32'h1033 == _csignals_T_16; // @[Lookup.scala 31:38]
  wire  _csignals_T_49 = 32'h5033 == _csignals_T_16; // @[Lookup.scala 31:38]
  wire  _csignals_T_51 = 32'h40005033 == _csignals_T_16; // @[Lookup.scala 31:38]
  wire  _csignals_T_53 = 32'h1013 == _csignals_T_16; // @[Lookup.scala 31:38]
  wire  _csignals_T_55 = 32'h5013 == _csignals_T_16; // @[Lookup.scala 31:38]
  wire  _csignals_T_57 = 32'h40005013 == _csignals_T_16; // @[Lookup.scala 31:38]
  wire  _csignals_T_59 = 32'h2033 == _csignals_T_16; // @[Lookup.scala 31:38]
  wire  _csignals_T_61 = 32'h3033 == _csignals_T_16; // @[Lookup.scala 31:38]
  wire  _csignals_T_63 = 32'h2013 == _pc_next_T_2; // @[Lookup.scala 31:38]
  wire  _csignals_T_65 = 32'h3013 == _pc_next_T_2; // @[Lookup.scala 31:38]
  wire  _csignals_T_67 = 32'h63 == _pc_next_T_2; // @[Lookup.scala 31:38]
  wire  _csignals_T_69 = 32'h1063 == _pc_next_T_2; // @[Lookup.scala 31:38]
  wire  _csignals_T_71 = 32'h5063 == _pc_next_T_2; // @[Lookup.scala 31:38]
  wire  _csignals_T_73 = 32'h7063 == _pc_next_T_2; // @[Lookup.scala 31:38]
  wire  _csignals_T_75 = 32'h4063 == _pc_next_T_2; // @[Lookup.scala 31:38]
  wire  _csignals_T_77 = 32'h6063 == _pc_next_T_2; // @[Lookup.scala 31:38]
  wire  _csignals_T_83 = 32'h37 == _pc_next_T; // @[Lookup.scala 31:38]
  wire  _csignals_T_85 = 32'h17 == _pc_next_T; // @[Lookup.scala 31:38]
  wire  _csignals_T_87 = 32'h73 == io_imem_inst; // @[Lookup.scala 31:38]
  wire [4:0] _csignals_T_88 = _csignals_T_87 ? 5'h18 : 5'h0; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_89 = _csignals_T_85 ? 5'h1 : _csignals_T_88; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_90 = _csignals_T_83 ? 5'h1 : _csignals_T_89; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_91 = _pc_next_T_3 ? 5'h11 : _csignals_T_90; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_92 = _pc_next_T_1 ? 5'h1 : _csignals_T_91; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_93 = _csignals_T_77 ? 5'hf : _csignals_T_92; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_94 = _csignals_T_75 ? 5'hd : _csignals_T_93; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_95 = _csignals_T_73 ? 5'h10 : _csignals_T_94; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_96 = _csignals_T_71 ? 5'he : _csignals_T_95; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_97 = _csignals_T_69 ? 5'hc : _csignals_T_96; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_98 = _csignals_T_67 ? 5'hb : _csignals_T_97; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_99 = _csignals_T_65 ? 5'ha : _csignals_T_98; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_100 = _csignals_T_63 ? 5'h9 : _csignals_T_99; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_101 = _csignals_T_61 ? 5'ha : _csignals_T_100; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_102 = _csignals_T_59 ? 5'h9 : _csignals_T_101; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_103 = _csignals_T_57 ? 5'h8 : _csignals_T_102; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_104 = _csignals_T_55 ? 5'h7 : _csignals_T_103; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_105 = _csignals_T_53 ? 5'h6 : _csignals_T_104; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_106 = _csignals_T_51 ? 5'h8 : _csignals_T_105; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_107 = _csignals_T_49 ? 5'h7 : _csignals_T_106; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_108 = _csignals_T_47 ? 5'h6 : _csignals_T_107; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_109 = _csignals_T_45 ? 5'h17 : _csignals_T_108; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_110 = _csignals_T_43 ? 5'h16 : _csignals_T_109; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_111 = _csignals_T_41 ? 5'h15 : _csignals_T_110; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_112 = _csignals_T_39 ? 5'h14 : _csignals_T_111; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_113 = _csignals_T_37 ? 5'h13 : _csignals_T_112; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_114 = _csignals_T_35 ? 5'h12 : _csignals_T_113; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_115 = _csignals_T_33 ? 5'h5 : _csignals_T_114; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_116 = _csignals_T_31 ? 5'h4 : _csignals_T_115; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_117 = _csignals_T_29 ? 5'h3 : _csignals_T_116; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_118 = _csignals_T_27 ? 5'h5 : _csignals_T_117; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_119 = _csignals_T_25 ? 5'h4 : _csignals_T_118; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_120 = _csignals_T_23 ? 5'h3 : _csignals_T_119; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_121 = _csignals_T_21 ? 5'h2 : _csignals_T_120; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_122 = _csignals_T_19 ? 5'h1 : _csignals_T_121; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_123 = _csignals_T_17 ? 5'h1 : _csignals_T_122; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_124 = _csignals_T_15 ? 5'h1 : _csignals_T_123; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_125 = _csignals_T_13 ? 5'h1 : _csignals_T_124; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_126 = _csignals_T_11 ? 5'h1 : _csignals_T_125; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_127 = _csignals_T_9 ? 5'h1 : _csignals_T_126; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_128 = _csignals_T_7 ? 5'h1 : _csignals_T_127; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_129 = _csignals_T_5 ? 5'h1 : _csignals_T_128; // @[Lookup.scala 33:37]
  wire [4:0] _csignals_T_130 = _csignals_T_3 ? 5'h1 : _csignals_T_129; // @[Lookup.scala 33:37]
  wire [4:0] csignals_0 = _csignals_T_1 ? 5'h1 : _csignals_T_130; // @[Lookup.scala 33:37]
  wire  _ecall_flg_T = csignals_0 == 5'h18; // @[Core.scala 163:27]
  wire [2:0] _csignals_T_175 = _csignals_T_85 ? 3'h5 : 3'h1; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_176 = _csignals_T_83 ? 3'h5 : _csignals_T_175; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_177 = _pc_next_T_3 ? 3'h2 : _csignals_T_176; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_178 = _pc_next_T_1 ? 3'h4 : _csignals_T_177; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_179 = _csignals_T_77 ? 3'h1 : _csignals_T_178; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_180 = _csignals_T_75 ? 3'h1 : _csignals_T_179; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_181 = _csignals_T_73 ? 3'h1 : _csignals_T_180; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_182 = _csignals_T_71 ? 3'h1 : _csignals_T_181; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_183 = _csignals_T_69 ? 3'h1 : _csignals_T_182; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_184 = _csignals_T_67 ? 3'h1 : _csignals_T_183; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_185 = _csignals_T_65 ? 3'h2 : _csignals_T_184; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_186 = _csignals_T_63 ? 3'h2 : _csignals_T_185; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_187 = _csignals_T_61 ? 3'h1 : _csignals_T_186; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_188 = _csignals_T_59 ? 3'h1 : _csignals_T_187; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_189 = _csignals_T_57 ? 3'h2 : _csignals_T_188; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_190 = _csignals_T_55 ? 3'h2 : _csignals_T_189; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_191 = _csignals_T_53 ? 3'h2 : _csignals_T_190; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_192 = _csignals_T_51 ? 3'h1 : _csignals_T_191; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_193 = _csignals_T_49 ? 3'h1 : _csignals_T_192; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_194 = _csignals_T_47 ? 3'h1 : _csignals_T_193; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_195 = _csignals_T_45 ? 3'h1 : _csignals_T_194; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_196 = _csignals_T_43 ? 3'h1 : _csignals_T_195; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_197 = _csignals_T_41 ? 3'h1 : _csignals_T_196; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_198 = _csignals_T_39 ? 3'h1 : _csignals_T_197; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_199 = _csignals_T_37 ? 3'h1 : _csignals_T_198; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_200 = _csignals_T_35 ? 3'h1 : _csignals_T_199; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_201 = _csignals_T_33 ? 3'h2 : _csignals_T_200; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_202 = _csignals_T_31 ? 3'h2 : _csignals_T_201; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_203 = _csignals_T_29 ? 3'h2 : _csignals_T_202; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_204 = _csignals_T_27 ? 3'h1 : _csignals_T_203; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_205 = _csignals_T_25 ? 3'h1 : _csignals_T_204; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_206 = _csignals_T_23 ? 3'h1 : _csignals_T_205; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_207 = _csignals_T_21 ? 3'h1 : _csignals_T_206; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_208 = _csignals_T_19 ? 3'h2 : _csignals_T_207; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_209 = _csignals_T_17 ? 3'h1 : _csignals_T_208; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_210 = _csignals_T_15 ? 3'h3 : _csignals_T_209; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_211 = _csignals_T_13 ? 3'h3 : _csignals_T_210; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_212 = _csignals_T_11 ? 3'h3 : _csignals_T_211; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_213 = _csignals_T_9 ? 3'h2 : _csignals_T_212; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_214 = _csignals_T_7 ? 3'h2 : _csignals_T_213; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_215 = _csignals_T_5 ? 3'h2 : _csignals_T_214; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_216 = _csignals_T_3 ? 3'h2 : _csignals_T_215; // @[Lookup.scala 33:37]
  wire [2:0] csignals_2 = _csignals_T_1 ? 3'h2 : _csignals_T_216; // @[Lookup.scala 33:37]
  wire  _op2_data_T = csignals_2 == 3'h1; // @[Core.scala 122:18]
  wire  _rs2_data_T_4 = ~_csignals_T_87; // @[Core.scala 50:15]
  wire [4:0] rs2_addr = io_imem_inst[24:20]; // @[Core.scala 41:24]
  wire  _rs2_data_T_6 = ~_csignals_T_87 & rs2_addr == 5'h0; // @[Core.scala 50:25]
  wire [31:0] _rs2_data_T_7 = _rs2_data_T_6 ? 32'h0 : regfile_rs2_data_MPORT_data; // @[Mux.scala 98:16]
  wire [31:0] rs2_data = _csignals_T_87 ? regfile_rs2_data_MPORT_1_data : _rs2_data_T_7; // @[Mux.scala 98:16]
  wire  _op2_data_T_1 = csignals_2 == 3'h2; // @[Core.scala 123:18]
  wire [11:0] imm_i = io_imem_inst[31:20]; // @[Core.scala 53:21]
  wire [19:0] imm_i_sext_hi = imm_i[11] ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [31:0] imm_i_sext = {imm_i_sext_hi,imm_i}; // @[Cat.scala 30:58]
  wire  _op2_data_T_2 = csignals_2 == 3'h3; // @[Core.scala 124:18]
  wire [6:0] imm_s_hi = io_imem_inst[31:25]; // @[Core.scala 55:25]
  wire [4:0] imm_s_lo = io_imem_inst[11:7]; // @[Core.scala 55:39]
  wire [11:0] imm_s = {imm_s_hi,imm_s_lo}; // @[Cat.scala 30:58]
  wire [19:0] imm_s_sext_hi = imm_s[11] ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [31:0] imm_s_sext = {imm_s_sext_hi,imm_s_hi,imm_s_lo}; // @[Cat.scala 30:58]
  wire  _op2_data_T_3 = csignals_2 == 3'h4; // @[Core.scala 125:18]
  wire  imm_j_hi_hi = io_imem_inst[31]; // @[Core.scala 59:25]
  wire [7:0] imm_j_hi_lo = io_imem_inst[19:12]; // @[Core.scala 59:35]
  wire  imm_j_lo_hi = io_imem_inst[20]; // @[Core.scala 59:49]
  wire [9:0] imm_j_lo_lo = io_imem_inst[30:21]; // @[Core.scala 59:59]
  wire [19:0] imm_j = {imm_j_hi_hi,imm_j_hi_lo,imm_j_lo_hi,imm_j_lo_lo}; // @[Cat.scala 30:58]
  wire [10:0] imm_j_sext_hi_hi = imm_j[19] ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  wire [31:0] imm_j_sext = {imm_j_sext_hi_hi,imm_j_hi_hi,imm_j_hi_lo,imm_j_lo_hi,imm_j_lo_lo,1'h0}; // @[Cat.scala 30:58]
  wire  _op2_data_T_4 = csignals_2 == 3'h5; // @[Core.scala 126:18]
  wire [19:0] imm_u = io_imem_inst[31:12]; // @[Core.scala 61:21]
  wire [31:0] imm_u_shifted = {imm_u,12'h0}; // @[Cat.scala 30:58]
  wire [31:0] _op2_data_T_5 = _op2_data_T_4 ? imm_u_shifted : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _op2_data_T_6 = _op2_data_T_3 ? imm_j_sext : _op2_data_T_5; // @[Mux.scala 98:16]
  wire [31:0] _op2_data_T_7 = _op2_data_T_2 ? imm_s_sext : _op2_data_T_6; // @[Mux.scala 98:16]
  wire [31:0] _op2_data_T_8 = _op2_data_T_1 ? imm_i_sext : _op2_data_T_7; // @[Mux.scala 98:16]
  wire [31:0] op2_data = _op2_data_T ? rs2_data : _op2_data_T_8; // @[Mux.scala 98:16]
  wire  ecall_flg = csignals_0 == 5'h18 & op2_data != 32'h22; // @[Core.scala 163:40]
  wire  _alu_out_T = csignals_0 == 5'h1; // @[Core.scala 132:18]
  wire [1:0] _csignals_T_132 = _csignals_T_85 ? 2'h2 : 2'h1; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_133 = _csignals_T_83 ? 2'h0 : _csignals_T_132; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_134 = _pc_next_T_3 ? 2'h1 : _csignals_T_133; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_135 = _pc_next_T_1 ? 2'h2 : _csignals_T_134; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_136 = _csignals_T_77 ? 2'h1 : _csignals_T_135; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_137 = _csignals_T_75 ? 2'h1 : _csignals_T_136; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_138 = _csignals_T_73 ? 2'h1 : _csignals_T_137; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_139 = _csignals_T_71 ? 2'h1 : _csignals_T_138; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_140 = _csignals_T_69 ? 2'h1 : _csignals_T_139; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_141 = _csignals_T_67 ? 2'h1 : _csignals_T_140; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_142 = _csignals_T_65 ? 2'h1 : _csignals_T_141; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_143 = _csignals_T_63 ? 2'h1 : _csignals_T_142; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_144 = _csignals_T_61 ? 2'h1 : _csignals_T_143; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_145 = _csignals_T_59 ? 2'h1 : _csignals_T_144; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_146 = _csignals_T_57 ? 2'h1 : _csignals_T_145; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_147 = _csignals_T_55 ? 2'h1 : _csignals_T_146; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_148 = _csignals_T_53 ? 2'h1 : _csignals_T_147; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_149 = _csignals_T_51 ? 2'h1 : _csignals_T_148; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_150 = _csignals_T_49 ? 2'h1 : _csignals_T_149; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_151 = _csignals_T_47 ? 2'h1 : _csignals_T_150; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_152 = _csignals_T_45 ? 2'h1 : _csignals_T_151; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_153 = _csignals_T_43 ? 2'h1 : _csignals_T_152; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_154 = _csignals_T_41 ? 2'h1 : _csignals_T_153; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_155 = _csignals_T_39 ? 2'h1 : _csignals_T_154; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_156 = _csignals_T_37 ? 2'h1 : _csignals_T_155; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_157 = _csignals_T_35 ? 2'h1 : _csignals_T_156; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_158 = _csignals_T_33 ? 2'h1 : _csignals_T_157; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_159 = _csignals_T_31 ? 2'h1 : _csignals_T_158; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_160 = _csignals_T_29 ? 2'h1 : _csignals_T_159; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_161 = _csignals_T_27 ? 2'h1 : _csignals_T_160; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_162 = _csignals_T_25 ? 2'h1 : _csignals_T_161; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_163 = _csignals_T_23 ? 2'h1 : _csignals_T_162; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_164 = _csignals_T_21 ? 2'h1 : _csignals_T_163; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_165 = _csignals_T_19 ? 2'h1 : _csignals_T_164; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_166 = _csignals_T_17 ? 2'h1 : _csignals_T_165; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_167 = _csignals_T_15 ? 2'h1 : _csignals_T_166; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_168 = _csignals_T_13 ? 2'h1 : _csignals_T_167; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_169 = _csignals_T_11 ? 2'h1 : _csignals_T_168; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_170 = _csignals_T_9 ? 2'h1 : _csignals_T_169; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_171 = _csignals_T_7 ? 2'h1 : _csignals_T_170; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_172 = _csignals_T_5 ? 2'h1 : _csignals_T_171; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_173 = _csignals_T_3 ? 2'h1 : _csignals_T_172; // @[Lookup.scala 33:37]
  wire [1:0] csignals_1 = _csignals_T_1 ? 2'h1 : _csignals_T_173; // @[Lookup.scala 33:37]
  wire  _op1_data_T = csignals_1 == 2'h1; // @[Core.scala 117:18]
  wire [4:0] rs1_addr = io_imem_inst[19:15]; // @[Core.scala 40:24]
  wire  _rs1_data_T_6 = _rs2_data_T_4 & rs1_addr == 5'h0; // @[Core.scala 45:25]
  wire [31:0] _rs1_data_T_7 = _rs1_data_T_6 ? 32'h0 : regfile_rs1_data_MPORT_data; // @[Mux.scala 98:16]
  wire [31:0] rs1_data = _csignals_T_87 ? regfile_rs1_data_MPORT_1_data : _rs1_data_T_7; // @[Mux.scala 98:16]
  wire  _op1_data_T_1 = csignals_1 == 2'h2; // @[Core.scala 118:18]
  wire [31:0] _op1_data_T_2 = _op1_data_T_1 ? pc_reg : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] op1_data = _op1_data_T ? rs1_data : _op1_data_T_2; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_2 = op1_data + op2_data; // @[Core.scala 132:46]
  wire  _alu_out_T_3 = csignals_0 == 5'h2; // @[Core.scala 133:18]
  wire [31:0] _alu_out_T_5 = op1_data - op2_data; // @[Core.scala 133:46]
  wire  _alu_out_T_6 = csignals_0 == 5'h3; // @[Core.scala 134:18]
  wire [31:0] _alu_out_T_7 = op1_data & op2_data; // @[Core.scala 134:46]
  wire  _alu_out_T_8 = csignals_0 == 5'h4; // @[Core.scala 135:18]
  wire [31:0] _alu_out_T_9 = op1_data | op2_data; // @[Core.scala 135:46]
  wire  _alu_out_T_10 = csignals_0 == 5'h5; // @[Core.scala 136:18]
  wire [31:0] _alu_out_T_11 = op1_data ^ op2_data; // @[Core.scala 136:46]
  wire  _alu_out_T_12 = csignals_0 == 5'h12; // @[Core.scala 137:18]
  wire [63:0] _alu_out_T_13 = op1_data * op2_data; // @[Core.scala 137:45]
  wire  _alu_out_T_15 = csignals_0 == 5'h13; // @[Core.scala 138:18]
  wire  _alu_out_T_18 = csignals_0 == 5'h14; // @[Core.scala 139:18]
  wire [31:0] _alu_out_T_19 = _op1_data_T ? rs1_data : _op1_data_T_2; // @[Core.scala 139:50]
  wire [31:0] _alu_out_T_20 = _op2_data_T ? rs2_data : _op2_data_T_8; // @[Core.scala 139:70]
  wire [32:0] _alu_out_T_22 = $signed(_alu_out_T_19) / $signed(_alu_out_T_20); // @[Core.scala 139:80]
  wire  _alu_out_T_23 = csignals_0 == 5'h15; // @[Core.scala 140:18]
  wire [31:0] _alu_out_T_24 = op1_data / op2_data; // @[Core.scala 140:45]
  wire  _alu_out_T_25 = csignals_0 == 5'h16; // @[Core.scala 141:18]
  wire [31:0] _alu_out_T_29 = $signed(_alu_out_T_19) % $signed(_alu_out_T_20); // @[Core.scala 141:80]
  wire  _alu_out_T_30 = csignals_0 == 5'h17; // @[Core.scala 142:18]
  wire [31:0] _GEN_0 = op1_data % op2_data; // @[Core.scala 142:45]
  wire [31:0] _alu_out_T_31 = _GEN_0[31:0]; // @[Core.scala 142:45]
  wire  _alu_out_T_32 = csignals_0 == 5'h6; // @[Core.scala 143:18]
  wire [62:0] _GEN_5 = {{31'd0}, op1_data}; // @[Core.scala 143:46]
  wire [62:0] _alu_out_T_34 = _GEN_5 << op2_data[4:0]; // @[Core.scala 143:46]
  wire  _alu_out_T_36 = csignals_0 == 5'h7; // @[Core.scala 144:18]
  wire [31:0] _alu_out_T_38 = op1_data >> op2_data[4:0]; // @[Core.scala 144:46]
  wire  _alu_out_T_39 = csignals_0 == 5'h8; // @[Core.scala 145:18]
  wire [31:0] _alu_out_T_43 = $signed(_alu_out_T_19) >>> op2_data[4:0]; // @[Core.scala 145:80]
  wire  _alu_out_T_44 = csignals_0 == 5'h9; // @[Core.scala 146:18]
  wire  _alu_out_T_47 = $signed(_alu_out_T_19) < $signed(_alu_out_T_20); // @[Core.scala 146:55]
  wire  _alu_out_T_48 = csignals_0 == 5'ha; // @[Core.scala 147:18]
  wire  _alu_out_T_49 = op1_data < op2_data; // @[Core.scala 147:46]
  wire  _alu_out_T_50 = csignals_0 == 5'h11; // @[Core.scala 148:18]
  wire [31:0] _alu_out_T_54 = _alu_out_T_2 & 32'hfffffffe; // @[Core.scala 148:59]
  wire [31:0] _alu_out_T_55 = _alu_out_T_50 ? _alu_out_T_54 : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_56 = _alu_out_T_48 ? {{31'd0}, _alu_out_T_49} : _alu_out_T_55; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_57 = _alu_out_T_44 ? {{31'd0}, _alu_out_T_47} : _alu_out_T_56; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_58 = _alu_out_T_39 ? _alu_out_T_43 : _alu_out_T_57; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_59 = _alu_out_T_36 ? _alu_out_T_38 : _alu_out_T_58; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_60 = _alu_out_T_32 ? _alu_out_T_34[31:0] : _alu_out_T_59; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_61 = _alu_out_T_30 ? _alu_out_T_31 : _alu_out_T_60; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_62 = _alu_out_T_25 ? _alu_out_T_29 : _alu_out_T_61; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_63 = _alu_out_T_23 ? _alu_out_T_24 : _alu_out_T_62; // @[Mux.scala 98:16]
  wire [32:0] _alu_out_T_64 = _alu_out_T_18 ? _alu_out_T_22 : {{1'd0}, _alu_out_T_63}; // @[Mux.scala 98:16]
  wire [32:0] _alu_out_T_65 = _alu_out_T_15 ? {{1'd0}, _alu_out_T_13[63:32]} : _alu_out_T_64; // @[Mux.scala 98:16]
  wire [32:0] _alu_out_T_66 = _alu_out_T_12 ? {{1'd0}, _alu_out_T_13[31:0]} : _alu_out_T_65; // @[Mux.scala 98:16]
  wire [32:0] _alu_out_T_67 = _alu_out_T_10 ? {{1'd0}, _alu_out_T_11} : _alu_out_T_66; // @[Mux.scala 98:16]
  wire [32:0] _alu_out_T_68 = _alu_out_T_8 ? {{1'd0}, _alu_out_T_9} : _alu_out_T_67; // @[Mux.scala 98:16]
  wire [32:0] _alu_out_T_69 = _alu_out_T_6 ? {{1'd0}, _alu_out_T_7} : _alu_out_T_68; // @[Mux.scala 98:16]
  wire [32:0] _alu_out_T_70 = _alu_out_T_3 ? {{1'd0}, _alu_out_T_5} : _alu_out_T_69; // @[Mux.scala 98:16]
  wire [32:0] _alu_out_T_71 = _alu_out_T ? {{1'd0}, _alu_out_T_2} : _alu_out_T_70; // @[Mux.scala 98:16]
  wire [31:0] alu_out = _alu_out_T_71[31:0]; // @[Core.scala 29:23 Core.scala 131:13]
  wire  _br_flg_T = csignals_0 == 5'hb; // @[Core.scala 153:18]
  wire  _br_flg_T_1 = op1_data == op2_data; // @[Core.scala 153:45]
  wire  _br_flg_T_2 = csignals_0 == 5'hc; // @[Core.scala 154:18]
  wire  _br_flg_T_4 = ~_br_flg_T_1; // @[Core.scala 154:34]
  wire  _br_flg_T_5 = csignals_0 == 5'hd; // @[Core.scala 155:18]
  wire  _br_flg_T_9 = csignals_0 == 5'he; // @[Core.scala 156:18]
  wire  _br_flg_T_13 = ~_alu_out_T_47; // @[Core.scala 156:34]
  wire  _br_flg_T_14 = csignals_0 == 5'hf; // @[Core.scala 157:18]
  wire  _br_flg_T_16 = csignals_0 == 5'h10; // @[Core.scala 158:18]
  wire  _br_flg_T_18 = ~_alu_out_T_49; // @[Core.scala 158:34]
  wire  _br_flg_T_20 = _br_flg_T_14 ? _alu_out_T_49 : _br_flg_T_16 & _br_flg_T_18; // @[Mux.scala 98:16]
  wire  _br_flg_T_21 = _br_flg_T_9 ? _br_flg_T_13 : _br_flg_T_20; // @[Mux.scala 98:16]
  wire  _br_flg_T_22 = _br_flg_T_5 ? _alu_out_T_47 : _br_flg_T_21; // @[Mux.scala 98:16]
  wire  _br_flg_T_23 = _br_flg_T_2 ? _br_flg_T_4 : _br_flg_T_22; // @[Mux.scala 98:16]
  wire  br_flg = _br_flg_T ? _br_flg_T_1 : _br_flg_T_23; // @[Mux.scala 98:16]
  wire  imm_b_hi_lo = io_imem_inst[7]; // @[Core.scala 57:35]
  wire [5:0] imm_b_lo_hi = io_imem_inst[30:25]; // @[Core.scala 57:44]
  wire [3:0] imm_b_lo_lo = io_imem_inst[11:8]; // @[Core.scala 57:58]
  wire [11:0] imm_b = {imm_j_hi_hi,imm_b_hi_lo,imm_b_lo_hi,imm_b_lo_lo}; // @[Cat.scala 30:58]
  wire [18:0] imm_b_sext_hi_hi = imm_b[11] ? 19'h7ffff : 19'h0; // @[Bitwise.scala 72:12]
  wire [31:0] imm_b_sext = {imm_b_sext_hi_hi,imm_j_hi_hi,imm_b_hi_lo,imm_b_lo_hi,imm_b_lo_lo,1'h0}; // @[Cat.scala 30:58]
  wire [31:0] br_target = pc_reg + imm_b_sext; // @[Core.scala 160:25]
  wire [1:0] _csignals_T_253 = _csignals_T_15 ? 2'h1 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_254 = _csignals_T_13 ? 2'h1 : _csignals_T_253; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_255 = _csignals_T_11 ? 2'h1 : _csignals_T_254; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_256 = _csignals_T_9 ? 2'h2 : _csignals_T_255; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_257 = _csignals_T_7 ? 2'h2 : _csignals_T_256; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_258 = _csignals_T_5 ? 2'h2 : _csignals_T_257; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_259 = _csignals_T_3 ? 2'h2 : _csignals_T_258; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_261 = _csignals_T_85 ? 2'h1 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_262 = _csignals_T_83 ? 2'h1 : _csignals_T_261; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_263 = _pc_next_T_3 ? 2'h1 : _csignals_T_262; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_264 = _pc_next_T_1 ? 2'h1 : _csignals_T_263; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_265 = _csignals_T_77 ? 2'h0 : _csignals_T_264; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_266 = _csignals_T_75 ? 2'h0 : _csignals_T_265; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_267 = _csignals_T_73 ? 2'h0 : _csignals_T_266; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_268 = _csignals_T_71 ? 2'h0 : _csignals_T_267; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_269 = _csignals_T_69 ? 2'h0 : _csignals_T_268; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_270 = _csignals_T_67 ? 2'h0 : _csignals_T_269; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_271 = _csignals_T_65 ? 2'h1 : _csignals_T_270; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_272 = _csignals_T_63 ? 2'h1 : _csignals_T_271; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_273 = _csignals_T_61 ? 2'h1 : _csignals_T_272; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_274 = _csignals_T_59 ? 2'h1 : _csignals_T_273; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_275 = _csignals_T_57 ? 2'h1 : _csignals_T_274; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_276 = _csignals_T_55 ? 2'h1 : _csignals_T_275; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_277 = _csignals_T_53 ? 2'h1 : _csignals_T_276; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_278 = _csignals_T_51 ? 2'h1 : _csignals_T_277; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_279 = _csignals_T_49 ? 2'h1 : _csignals_T_278; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_280 = _csignals_T_47 ? 2'h1 : _csignals_T_279; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_281 = _csignals_T_45 ? 2'h1 : _csignals_T_280; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_282 = _csignals_T_43 ? 2'h1 : _csignals_T_281; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_283 = _csignals_T_41 ? 2'h1 : _csignals_T_282; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_284 = _csignals_T_39 ? 2'h1 : _csignals_T_283; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_285 = _csignals_T_37 ? 2'h1 : _csignals_T_284; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_286 = _csignals_T_35 ? 2'h1 : _csignals_T_285; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_287 = _csignals_T_33 ? 2'h1 : _csignals_T_286; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_288 = _csignals_T_31 ? 2'h1 : _csignals_T_287; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_289 = _csignals_T_29 ? 2'h1 : _csignals_T_288; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_290 = _csignals_T_27 ? 2'h1 : _csignals_T_289; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_291 = _csignals_T_25 ? 2'h1 : _csignals_T_290; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_292 = _csignals_T_23 ? 2'h1 : _csignals_T_291; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_293 = _csignals_T_21 ? 2'h1 : _csignals_T_292; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_294 = _csignals_T_19 ? 2'h1 : _csignals_T_293; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_295 = _csignals_T_17 ? 2'h1 : _csignals_T_294; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_296 = _csignals_T_15 ? 2'h0 : _csignals_T_295; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_297 = _csignals_T_13 ? 2'h0 : _csignals_T_296; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_298 = _csignals_T_11 ? 2'h0 : _csignals_T_297; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_299 = _csignals_T_9 ? 2'h1 : _csignals_T_298; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_300 = _csignals_T_7 ? 2'h1 : _csignals_T_299; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_301 = _csignals_T_5 ? 2'h1 : _csignals_T_300; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_302 = _csignals_T_3 ? 2'h1 : _csignals_T_301; // @[Lookup.scala 33:37]
  wire [1:0] csignals_4 = _csignals_T_1 ? 2'h1 : _csignals_T_302; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_306 = _pc_next_T_3 ? 3'h2 : 3'h0; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_307 = _pc_next_T_1 ? 3'h2 : _csignals_T_306; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_308 = _csignals_T_77 ? 3'h0 : _csignals_T_307; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_309 = _csignals_T_75 ? 3'h0 : _csignals_T_308; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_310 = _csignals_T_73 ? 3'h0 : _csignals_T_309; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_311 = _csignals_T_71 ? 3'h0 : _csignals_T_310; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_312 = _csignals_T_69 ? 3'h0 : _csignals_T_311; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_313 = _csignals_T_67 ? 3'h0 : _csignals_T_312; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_314 = _csignals_T_65 ? 3'h0 : _csignals_T_313; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_315 = _csignals_T_63 ? 3'h0 : _csignals_T_314; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_316 = _csignals_T_61 ? 3'h0 : _csignals_T_315; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_317 = _csignals_T_59 ? 3'h0 : _csignals_T_316; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_318 = _csignals_T_57 ? 3'h0 : _csignals_T_317; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_319 = _csignals_T_55 ? 3'h0 : _csignals_T_318; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_320 = _csignals_T_53 ? 3'h0 : _csignals_T_319; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_321 = _csignals_T_51 ? 3'h0 : _csignals_T_320; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_322 = _csignals_T_49 ? 3'h0 : _csignals_T_321; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_323 = _csignals_T_47 ? 3'h0 : _csignals_T_322; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_324 = _csignals_T_45 ? 3'h0 : _csignals_T_323; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_325 = _csignals_T_43 ? 3'h0 : _csignals_T_324; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_326 = _csignals_T_41 ? 3'h0 : _csignals_T_325; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_327 = _csignals_T_39 ? 3'h0 : _csignals_T_326; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_328 = _csignals_T_37 ? 3'h0 : _csignals_T_327; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_329 = _csignals_T_35 ? 3'h0 : _csignals_T_328; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_330 = _csignals_T_33 ? 3'h0 : _csignals_T_329; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_331 = _csignals_T_31 ? 3'h0 : _csignals_T_330; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_332 = _csignals_T_29 ? 3'h0 : _csignals_T_331; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_333 = _csignals_T_27 ? 3'h0 : _csignals_T_332; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_334 = _csignals_T_25 ? 3'h0 : _csignals_T_333; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_335 = _csignals_T_23 ? 3'h0 : _csignals_T_334; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_336 = _csignals_T_21 ? 3'h0 : _csignals_T_335; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_337 = _csignals_T_19 ? 3'h0 : _csignals_T_336; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_338 = _csignals_T_17 ? 3'h0 : _csignals_T_337; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_339 = _csignals_T_15 ? 3'h0 : _csignals_T_338; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_340 = _csignals_T_13 ? 3'h0 : _csignals_T_339; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_341 = _csignals_T_11 ? 3'h0 : _csignals_T_340; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_342 = _csignals_T_9 ? 3'h1 : _csignals_T_341; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_343 = _csignals_T_7 ? 3'h1 : _csignals_T_342; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_344 = _csignals_T_5 ? 3'h1 : _csignals_T_343; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_345 = _csignals_T_3 ? 3'h1 : _csignals_T_344; // @[Lookup.scala 33:37]
  wire [2:0] csignals_5 = _csignals_T_1 ? 3'h1 : _csignals_T_345; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_382 = _csignals_T_15 ? 3'h1 : 3'h0; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_383 = _csignals_T_13 ? 3'h2 : _csignals_T_382; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_384 = _csignals_T_11 ? 3'h3 : _csignals_T_383; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_385 = _csignals_T_9 ? 3'h4 : _csignals_T_384; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_386 = _csignals_T_7 ? 3'h5 : _csignals_T_385; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_387 = _csignals_T_5 ? 3'h1 : _csignals_T_386; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_388 = _csignals_T_3 ? 3'h2 : _csignals_T_387; // @[Lookup.scala 33:37]
  reg [31:0] seg_data; // @[Core.scala 164:27]
  wire  _wb_data_T = csignals_5 == 3'h1; // @[Core.scala 176:17]
  wire  _wb_data_T_1 = csignals_5 == 3'h2; // @[Core.scala 177:17]
  wire [31:0] _wb_data_T_2 = _wb_data_T_1 ? pc_plus4 : alu_out; // @[Mux.scala 98:16]
  wire [31:0] wb_data = _wb_data_T ? io_dmem_rdata : _wb_data_T_2; // @[Mux.scala 98:16]
  wire  _T_2 = ~reset; // @[Core.scala 186:9]
  assign regfile_rs1_data_MPORT_addr = io_imem_inst[19:15];
  assign regfile_rs1_data_MPORT_data = regfile[regfile_rs1_data_MPORT_addr]; // @[Core.scala 17:22]
  assign regfile_rs1_data_MPORT_1_addr = 5'ha;
  assign regfile_rs1_data_MPORT_1_data = regfile[regfile_rs1_data_MPORT_1_addr]; // @[Core.scala 17:22]
  assign regfile_rs2_data_MPORT_addr = io_imem_inst[24:20];
  assign regfile_rs2_data_MPORT_data = regfile[regfile_rs2_data_MPORT_addr]; // @[Core.scala 17:22]
  assign regfile_rs2_data_MPORT_1_addr = 5'h11;
  assign regfile_rs2_data_MPORT_1_data = regfile[regfile_rs2_data_MPORT_1_addr]; // @[Core.scala 17:22]
  assign regfile_MPORT_1_addr = 5'h3;
  assign regfile_MPORT_1_data = regfile[regfile_MPORT_1_addr]; // @[Core.scala 17:22]
  assign regfile_MPORT_data = _wb_data_T ? io_dmem_rdata : _wb_data_T_2;
  assign regfile_MPORT_addr = io_imem_inst[11:7];
  assign regfile_MPORT_mask = 1'h1;
  assign regfile_MPORT_en = csignals_4 == 2'h1;
  assign io_imem_addr = pc_reg; // @[Core.scala 22:18]
  assign io_dmem_addr = _alu_out_T_71[31:0]; // @[Core.scala 29:23 Core.scala 131:13]
  assign io_dmem_wen = _csignals_T_1 ? 2'h2 : _csignals_T_259; // @[Lookup.scala 33:37]
  assign io_dmem_wdata = _csignals_T_87 ? regfile_rs2_data_MPORT_1_data : _rs2_data_T_7; // @[Mux.scala 98:16]
  assign io_dmem_rwtype = _csignals_T_1 ? 3'h3 : _csignals_T_388; // @[Lookup.scala 33:37]
  assign io_data = seg_data; // @[Core.scala 165:13]
  always @(posedge clock) begin
    if(regfile_MPORT_en & regfile_MPORT_mask) begin
      regfile[regfile_MPORT_addr] <= regfile_MPORT_data; // @[Core.scala 17:22]
    end
    if (reset) begin // @[Core.scala 21:25]
      pc_reg <= 32'h0; // @[Core.scala 21:25]
    end else if (br_flg) begin // @[Mux.scala 98:16]
      pc_reg <= br_target;
    end else if (_pc_next_T_4) begin // @[Mux.scala 98:16]
      pc_reg <= alu_out;
    end else if (!(ecall_flg)) begin // @[Mux.scala 98:16]
      pc_reg <= pc_plus4;
    end
    if (reset) begin // @[Core.scala 164:27]
      seg_data <= 32'h0; // @[Core.scala 164:27]
    end else if (_ecall_flg_T & op2_data == 32'h22) begin // @[Core.scala 166:20]
      if (_op1_data_T) begin // @[Mux.scala 98:16]
        if (_csignals_T_87) begin // @[Mux.scala 98:16]
          seg_data <= regfile_rs1_data_MPORT_1_data;
        end else begin
          seg_data <= _rs1_data_T_7;
        end
      end else if (_op1_data_T_1) begin // @[Mux.scala 98:16]
        seg_data <= pc_reg;
      end else begin
        seg_data <= 32'h0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"io.pc      : 0x%x\n",pc_reg); // @[Core.scala 186:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2) begin
          $fwrite(32'h80000002,"inst       : 0x%x\n",io_imem_inst); // @[Core.scala 187:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2) begin
          $fwrite(32'h80000002,"gp         : %d\n",regfile_MPORT_1_data); // @[Core.scala 188:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2) begin
          $fwrite(32'h80000002,"rs1_addr   : %d\n",rs1_addr); // @[Core.scala 189:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2) begin
          $fwrite(32'h80000002,"rs2_addr   : %d\n",rs2_addr); // @[Core.scala 190:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2) begin
          $fwrite(32'h80000002,"wb_addr    : %d\n",imm_s_lo); // @[Core.scala 191:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2) begin
          $fwrite(32'h80000002,"rs1_data   : 0x%x\n",rs1_data); // @[Core.scala 192:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2) begin
          $fwrite(32'h80000002,"rs2_data   : 0x%x\n",rs2_data); // @[Core.scala 193:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2) begin
          $fwrite(32'h80000002,"wb_data    : 0x%x\n",wb_data); // @[Core.scala 194:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2) begin
          $fwrite(32'h80000002,"dmem.addr  : %d\n",io_dmem_addr); // @[Core.scala 195:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2) begin
          $fwrite(32'h80000002,"dmem.rdata : %d\n",io_dmem_rdata); // @[Core.scala 196:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2) begin
          $fwrite(32'h80000002,"---------\n"); // @[Core.scala 197:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    regfile[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  pc_reg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  seg_data = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Rom(
  input         clock,
  input  [31:0] io_addr,
  output [31:0] io_inst
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] mem [0:4095]; // @[Rom.scala 17:18]
  wire [31:0] mem_io_inst_MPORT_data; // @[Rom.scala 17:18]
  wire [11:0] mem_io_inst_MPORT_addr; // @[Rom.scala 17:18]
  assign mem_io_inst_MPORT_addr = io_addr[13:2];
  assign mem_io_inst_MPORT_data = mem[mem_io_inst_MPORT_addr]; // @[Rom.scala 17:18]
  assign io_inst = mem_io_inst_MPORT_data; // @[Rom.scala 19:13]
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4096; initvar = initvar+1)
    mem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Ram(
  input         clock,
  input  [31:0] io_addr,
  input  [1:0]  io_wen,
  input  [31:0] io_wdata,
  input  [2:0]  io_rwtype,
  output [31:0] io_rdata
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] mem_0 [0:16383]; // @[Ram.scala 18:18]
  wire [7:0] mem_0_MPORT_1_data; // @[Ram.scala 18:18]
  wire [13:0] mem_0_MPORT_1_addr; // @[Ram.scala 18:18]
  wire [7:0] mem_0_MPORT_data; // @[Ram.scala 18:18]
  wire [13:0] mem_0_MPORT_addr; // @[Ram.scala 18:18]
  wire  mem_0_MPORT_mask; // @[Ram.scala 18:18]
  wire  mem_0_MPORT_en; // @[Ram.scala 18:18]
  reg [7:0] mem_1 [0:16383]; // @[Ram.scala 18:18]
  wire [7:0] mem_1_MPORT_1_data; // @[Ram.scala 18:18]
  wire [13:0] mem_1_MPORT_1_addr; // @[Ram.scala 18:18]
  wire [7:0] mem_1_MPORT_data; // @[Ram.scala 18:18]
  wire [13:0] mem_1_MPORT_addr; // @[Ram.scala 18:18]
  wire  mem_1_MPORT_mask; // @[Ram.scala 18:18]
  wire  mem_1_MPORT_en; // @[Ram.scala 18:18]
  reg [7:0] mem_2 [0:16383]; // @[Ram.scala 18:18]
  wire [7:0] mem_2_MPORT_1_data; // @[Ram.scala 18:18]
  wire [13:0] mem_2_MPORT_1_addr; // @[Ram.scala 18:18]
  wire [7:0] mem_2_MPORT_data; // @[Ram.scala 18:18]
  wire [13:0] mem_2_MPORT_addr; // @[Ram.scala 18:18]
  wire  mem_2_MPORT_mask; // @[Ram.scala 18:18]
  wire  mem_2_MPORT_en; // @[Ram.scala 18:18]
  reg [7:0] mem_3 [0:16383]; // @[Ram.scala 18:18]
  wire [7:0] mem_3_MPORT_1_data; // @[Ram.scala 18:18]
  wire [13:0] mem_3_MPORT_1_addr; // @[Ram.scala 18:18]
  wire [7:0] mem_3_MPORT_data; // @[Ram.scala 18:18]
  wire [13:0] mem_3_MPORT_addr; // @[Ram.scala 18:18]
  wire  mem_3_MPORT_mask; // @[Ram.scala 18:18]
  wire  mem_3_MPORT_en; // @[Ram.scala 18:18]
  wire  _T_4 = io_rwtype == 3'h1; // @[Ram.scala 34:24]
  wire  _T_5 = io_rwtype == 3'h3; // @[Ram.scala 37:31]
  wire  _T_6 = io_rwtype == 3'h5; // @[Ram.scala 37:53]
  wire  _T_8 = io_rwtype == 3'h2; // @[Ram.scala 40:32]
  wire  _T_9 = io_rwtype == 3'h4; // @[Ram.scala 40:54]
  wire  _GEN_25 = (io_rwtype == 3'h2 | io_rwtype == 3'h4) & io_addr[1]; // @[Ram.scala 40:65 Ram.scala 42:21 Ram.scala 45:21]
  wire  _GEN_27 = io_rwtype == 3'h3 | io_rwtype == 3'h5 ? io_addr[1:0] == 2'h0 : _GEN_25; // @[Ram.scala 37:64 Ram.scala 39:21]
  wire [7:0] _GEN_24 = io_rwtype == 3'h2 | io_rwtype == 3'h4 ? io_wdata[7:0] : 8'h0; // @[Ram.scala 40:65 Ram.scala 41:28 Ram.scala 44:28]
  wire [7:0] _GEN_26 = io_rwtype == 3'h3 | io_rwtype == 3'h5 ? io_wdata[7:0] : _GEN_24; // @[Ram.scala 37:64 Ram.scala 38:28]
  wire  _GEN_33 = io_rwtype == 3'h3 | io_rwtype == 3'h5 ? io_addr[1:0] == 2'h1 : _GEN_25; // @[Ram.scala 37:64 Ram.scala 39:21]
  wire [7:0] _GEN_30 = io_rwtype == 3'h2 | io_rwtype == 3'h4 ? io_wdata[15:8] : 8'h0; // @[Ram.scala 40:65 Ram.scala 41:28 Ram.scala 44:28]
  wire [7:0] _GEN_32 = io_rwtype == 3'h3 | io_rwtype == 3'h5 ? io_wdata[7:0] : _GEN_30; // @[Ram.scala 37:64 Ram.scala 38:28]
  wire  _GEN_39 = io_rwtype == 3'h3 | io_rwtype == 3'h5 ? io_addr[1:0] == 2'h2 : _GEN_25; // @[Ram.scala 37:64 Ram.scala 39:21]
  wire  _GEN_45 = io_rwtype == 3'h3 | io_rwtype == 3'h5 ? io_addr[1:0] == 2'h3 : _GEN_25; // @[Ram.scala 37:64 Ram.scala 39:21]
  wire [7:0] dataOut_temp_0 = io_wen == 2'h1 ? mem_0_MPORT_1_data : 8'h0; // @[Ram.scala 24:29 Ram.scala 26:22 Ram.scala 29:29]
  wire [7:0] dataOut_temp_1 = io_wen == 2'h1 ? mem_1_MPORT_1_data : 8'h0; // @[Ram.scala 24:29 Ram.scala 26:22 Ram.scala 29:29]
  wire [7:0] dataOut_temp_2 = io_wen == 2'h1 ? mem_2_MPORT_1_data : 8'h0; // @[Ram.scala 24:29 Ram.scala 26:22 Ram.scala 29:29]
  wire [7:0] dataOut_temp_3 = io_wen == 2'h1 ? mem_3_MPORT_1_data : 8'h0; // @[Ram.scala 24:29 Ram.scala 26:22 Ram.scala 29:29]
  wire [31:0] _io_rdata_T_1 = {dataOut_temp_3,dataOut_temp_2,dataOut_temp_1,dataOut_temp_0}; // @[Cat.scala 30:58]
  wire [7:0] _GEN_49 = 2'h1 == io_addr[1:0] ? dataOut_temp_1 : dataOut_temp_0; // @[Ram.scala 51:73 Ram.scala 51:73]
  wire [7:0] _GEN_50 = 2'h2 == io_addr[1:0] ? dataOut_temp_2 : _GEN_49; // @[Ram.scala 51:73 Ram.scala 51:73]
  wire [7:0] _GEN_51 = 2'h3 == io_addr[1:0] ? dataOut_temp_3 : _GEN_50; // @[Ram.scala 51:73 Ram.scala 51:73]
  wire [23:0] io_rdata_hi_1 = _GEN_51[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _io_rdata_T_7 = {io_rdata_hi_1,_GEN_51}; // @[Cat.scala 30:58]
  wire [103:0] _io_rdata_T_10 = {96'h0,_GEN_51}; // @[Cat.scala 30:58]
  wire [1:0] _io_rdata_T_14 = io_addr[1:0] + 2'h1; // @[Ram.scala 53:72]
  wire [7:0] _GEN_61 = 2'h1 == _io_rdata_T_14 ? dataOut_temp_1 : dataOut_temp_0; // @[Ram.scala 53:78 Ram.scala 53:78]
  wire [7:0] _GEN_62 = 2'h2 == _io_rdata_T_14 ? dataOut_temp_2 : _GEN_61; // @[Ram.scala 53:78 Ram.scala 53:78]
  wire [7:0] _GEN_63 = 2'h3 == _io_rdata_T_14 ? dataOut_temp_3 : _GEN_62; // @[Ram.scala 53:78 Ram.scala 53:78]
  wire [15:0] io_rdata_hi_hi = _GEN_63[7] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _io_rdata_T_21 = {io_rdata_hi_hi,_GEN_63,_GEN_51}; // @[Cat.scala 30:58]
  wire [79:0] _io_rdata_T_27 = {64'h0,_GEN_63,_GEN_51}; // @[Cat.scala 30:58]
  wire [79:0] _io_rdata_T_28 = _T_9 ? _io_rdata_T_27 : 80'h0; // @[Mux.scala 98:16]
  wire [79:0] _io_rdata_T_29 = _T_8 ? {{48'd0}, _io_rdata_T_21} : _io_rdata_T_28; // @[Mux.scala 98:16]
  wire [103:0] _io_rdata_T_30 = _T_6 ? _io_rdata_T_10 : {{24'd0}, _io_rdata_T_29}; // @[Mux.scala 98:16]
  wire [103:0] _io_rdata_T_31 = _T_5 ? {{72'd0}, _io_rdata_T_7} : _io_rdata_T_30; // @[Mux.scala 98:16]
  wire [103:0] _io_rdata_T_32 = _T_4 ? {{72'd0}, _io_rdata_T_1} : _io_rdata_T_31; // @[Mux.scala 98:16]
  assign mem_0_MPORT_1_addr = io_addr[13:0];
  assign mem_0_MPORT_1_data = mem_0[mem_0_MPORT_1_addr]; // @[Ram.scala 18:18]
  assign mem_0_MPORT_data = _T_4 ? io_wdata[7:0] : _GEN_26;
  assign mem_0_MPORT_addr = io_addr[15:2];
  assign mem_0_MPORT_mask = _T_4 | _GEN_27;
  assign mem_0_MPORT_en = io_wen == 2'h1;
  assign mem_1_MPORT_1_addr = io_addr[13:0];
  assign mem_1_MPORT_1_data = mem_1[mem_1_MPORT_1_addr]; // @[Ram.scala 18:18]
  assign mem_1_MPORT_data = _T_4 ? io_wdata[15:8] : _GEN_32;
  assign mem_1_MPORT_addr = io_addr[15:2];
  assign mem_1_MPORT_mask = _T_4 | _GEN_33;
  assign mem_1_MPORT_en = io_wen == 2'h1;
  assign mem_2_MPORT_1_addr = io_addr[13:0];
  assign mem_2_MPORT_1_data = mem_2[mem_2_MPORT_1_addr]; // @[Ram.scala 18:18]
  assign mem_2_MPORT_data = _T_4 ? io_wdata[23:16] : _GEN_26;
  assign mem_2_MPORT_addr = io_addr[15:2];
  assign mem_2_MPORT_mask = _T_4 | _GEN_39;
  assign mem_2_MPORT_en = io_wen == 2'h1;
  assign mem_3_MPORT_1_addr = io_addr[13:0];
  assign mem_3_MPORT_1_data = mem_3[mem_3_MPORT_1_addr]; // @[Ram.scala 18:18]
  assign mem_3_MPORT_data = _T_4 ? io_wdata[31:24] : _GEN_32;
  assign mem_3_MPORT_addr = io_addr[15:2];
  assign mem_3_MPORT_mask = _T_4 | _GEN_45;
  assign mem_3_MPORT_en = io_wen == 2'h1;
  assign io_rdata = _io_rdata_T_32[31:0]; // @[Ram.scala 49:14]
  always @(posedge clock) begin
    if(mem_0_MPORT_en & mem_0_MPORT_mask) begin
      mem_0[mem_0_MPORT_addr] <= mem_0_MPORT_data; // @[Ram.scala 18:18]
    end
    if(mem_1_MPORT_en & mem_1_MPORT_mask) begin
      mem_1[mem_1_MPORT_addr] <= mem_1_MPORT_data; // @[Ram.scala 18:18]
    end
    if(mem_2_MPORT_en & mem_2_MPORT_mask) begin
      mem_2[mem_2_MPORT_addr] <= mem_2_MPORT_data; // @[Ram.scala 18:18]
    end
    if(mem_3_MPORT_en & mem_3_MPORT_mask) begin
      mem_3[mem_3_MPORT_addr] <= mem_3_MPORT_data; // @[Ram.scala 18:18]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16384; initvar = initvar+1)
    mem_0[initvar] = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16384; initvar = initvar+1)
    mem_1[initvar] = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16384; initvar = initvar+1)
    mem_2[initvar] = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16384; initvar = initvar+1)
    mem_3[initvar] = _RAND_3[7:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Vram(
  input         clock,
  input         reset,
  input  [1:0]  io_wen,
  input  [31:0] io_wdata,
  input         io_commit,
  input  [9:0]  io_raddr_x,
  input  [9:0]  io_raddr_y,
  output [11:0] io_rdata
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem0 [0:4799]; // @[Vram.scala 19:19]
  wire [31:0] mem0_io_rdata_MPORT_data; // @[Vram.scala 19:19]
  wire [12:0] mem0_io_rdata_MPORT_addr; // @[Vram.scala 19:19]
  wire [31:0] mem0_MPORT_1_data; // @[Vram.scala 19:19]
  wire [12:0] mem0_MPORT_1_addr; // @[Vram.scala 19:19]
  wire  mem0_MPORT_1_mask; // @[Vram.scala 19:19]
  wire  mem0_MPORT_1_en; // @[Vram.scala 19:19]
  reg [31:0] mem1 [0:4799]; // @[Vram.scala 20:19]
  wire [31:0] mem1_io_rdata_MPORT_1_data; // @[Vram.scala 20:19]
  wire [12:0] mem1_io_rdata_MPORT_1_addr; // @[Vram.scala 20:19]
  wire [31:0] mem1_MPORT_data; // @[Vram.scala 20:19]
  wire [12:0] mem1_MPORT_addr; // @[Vram.scala 20:19]
  wire  mem1_MPORT_mask; // @[Vram.scala 20:19]
  wire  mem1_MPORT_en; // @[Vram.scala 20:19]
  wire [19:0] _raddr_T = io_raddr_x * 10'h50; // @[Vram.scala 22:28]
  wire [19:0] _GEN_21 = {{10'd0}, io_raddr_y}; // @[Vram.scala 22:41]
  wire [19:0] raddr = _raddr_T + _GEN_21; // @[Vram.scala 22:41]
  reg  sel; // @[Vram.scala 23:22]
  wire  _io_rdata_T = ~sel; // @[Vram.scala 25:25]
  wire  _T = io_wen == 2'h1; // @[Vram.scala 27:18]
  wire  _GEN_7 = _io_rdata_T ? 1'h0 : 1'h1; // @[Vram.scala 28:33 Vram.scala 19:19]
  assign mem0_io_rdata_MPORT_addr = raddr[12:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem0_io_rdata_MPORT_data = mem0[mem0_io_rdata_MPORT_addr]; // @[Vram.scala 19:19]
  `else
  assign mem0_io_rdata_MPORT_data = mem0_io_rdata_MPORT_addr >= 13'h12c0 ? _RAND_1[31:0] :
    mem0[mem0_io_rdata_MPORT_addr]; // @[Vram.scala 19:19]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem0_MPORT_1_data = io_wdata;
  assign mem0_MPORT_1_addr = {{1'd0}, raddr[13:2]};
  assign mem0_MPORT_1_mask = 1'h1;
  assign mem0_MPORT_1_en = _T & _GEN_7;
  assign mem1_io_rdata_MPORT_1_addr = raddr[12:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem1_io_rdata_MPORT_1_data = mem1[mem1_io_rdata_MPORT_1_addr]; // @[Vram.scala 20:19]
  `else
  assign mem1_io_rdata_MPORT_1_data = mem1_io_rdata_MPORT_1_addr >= 13'h12c0 ? _RAND_3[31:0] :
    mem1[mem1_io_rdata_MPORT_1_addr]; // @[Vram.scala 20:19]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem1_MPORT_data = io_wdata;
  assign mem1_MPORT_addr = {{1'd0}, raddr[13:2]};
  assign mem1_MPORT_mask = 1'h1;
  assign mem1_MPORT_en = _T & _io_rdata_T;
  assign io_rdata = ~sel ? mem0_io_rdata_MPORT_data[11:0] : mem1_io_rdata_MPORT_1_data[11:0]; // @[Vram.scala 25:20]
  always @(posedge clock) begin
    if(mem0_MPORT_1_en & mem0_MPORT_1_mask) begin
      mem0[mem0_MPORT_1_addr] <= mem0_MPORT_1_data; // @[Vram.scala 19:19]
    end
    if(mem1_MPORT_en & mem1_MPORT_mask) begin
      mem1[mem1_MPORT_addr] <= mem1_MPORT_data; // @[Vram.scala 20:19]
    end
    if (reset) begin // @[Vram.scala 23:22]
      sel <= 1'h0; // @[Vram.scala 23:22]
    end else if (io_commit) begin // @[Vram.scala 35:30]
      sel <= _io_rdata_T; // @[Vram.scala 36:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {1{`RANDOM}};
  _RAND_3 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4800; initvar = initvar+1)
    mem0[initvar] = _RAND_0[31:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4800; initvar = initvar+1)
    mem1[initvar] = _RAND_2[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  sel = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mmio(
  input         clock,
  input         reset,
  input  [31:0] io_dmem_addr,
  input  [1:0]  io_dmem_wen,
  input  [31:0] io_dmem_wdata,
  input  [2:0]  io_dmem_rwtype,
  output [31:0] io_dmem_rdata,
  input  [9:0]  io_vmem_raddr_x,
  input  [9:0]  io_vmem_raddr_y,
  output [11:0] io_vmem_rdata,
  output        io_kbd_kbd_read_enable
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  ram_clock; // @[Mmio.scala 28:21]
  wire [31:0] ram_io_addr; // @[Mmio.scala 28:21]
  wire [1:0] ram_io_wen; // @[Mmio.scala 28:21]
  wire [31:0] ram_io_wdata; // @[Mmio.scala 28:21]
  wire [2:0] ram_io_rwtype; // @[Mmio.scala 28:21]
  wire [31:0] ram_io_rdata; // @[Mmio.scala 28:21]
  wire  vram_clock; // @[Mmio.scala 35:22]
  wire  vram_reset; // @[Mmio.scala 35:22]
  wire [1:0] vram_io_wen; // @[Mmio.scala 35:22]
  wire [31:0] vram_io_wdata; // @[Mmio.scala 35:22]
  wire  vram_io_commit; // @[Mmio.scala 35:22]
  wire [9:0] vram_io_raddr_x; // @[Mmio.scala 35:22]
  wire [9:0] vram_io_raddr_y; // @[Mmio.scala 35:22]
  wire [11:0] vram_io_rdata; // @[Mmio.scala 35:22]
  reg  keyboard_read; // @[Mmio.scala 46:32]
  wire  _keyboard_read_T = io_dmem_addr == 32'ha0000060; // @[Mmio.scala 48:40]
  reg [31:0] count; // @[Mmio.scala 50:24]
  wire [31:0] _count_T_1 = count + 32'h1; // @[Mmio.scala 51:20]
  wire [27:0] _io_dmem_rdata_T_1 = {27'h0,keyboard_read}; // @[Cat.scala 30:58]
  wire  _io_dmem_rdata_T_2 = io_dmem_addr == 32'ha0000048; // @[Mmio.scala 56:23]
  wire [31:0] _io_dmem_rdata_T_3 = _io_dmem_rdata_T_2 ? count : ram_io_rdata; // @[Mux.scala 98:16]
  Ram ram ( // @[Mmio.scala 28:21]
    .clock(ram_clock),
    .io_addr(ram_io_addr),
    .io_wen(ram_io_wen),
    .io_wdata(ram_io_wdata),
    .io_rwtype(ram_io_rwtype),
    .io_rdata(ram_io_rdata)
  );
  Vram vram ( // @[Mmio.scala 35:22]
    .clock(vram_clock),
    .reset(vram_reset),
    .io_wen(vram_io_wen),
    .io_wdata(vram_io_wdata),
    .io_commit(vram_io_commit),
    .io_raddr_x(vram_io_raddr_x),
    .io_raddr_y(vram_io_raddr_y),
    .io_rdata(vram_io_rdata)
  );
  assign io_dmem_rdata = _keyboard_read_T ? {{4'd0}, _io_dmem_rdata_T_1} : _io_dmem_rdata_T_3; // @[Mux.scala 98:16]
  assign io_vmem_rdata = vram_io_rdata; // @[Mmio.scala 43:19]
  assign io_kbd_kbd_read_enable = keyboard_read; // @[Mmio.scala 47:27]
  assign ram_clock = clock;
  assign ram_io_addr = io_dmem_addr; // @[Mmio.scala 30:17]
  assign ram_io_wen = io_dmem_addr < 32'ha0000000 ? io_dmem_wen : 2'h0; // @[Mmio.scala 31:22]
  assign ram_io_wdata = io_dmem_wdata; // @[Mmio.scala 32:18]
  assign ram_io_rwtype = io_dmem_rwtype; // @[Mmio.scala 33:19]
  assign vram_clock = clock;
  assign vram_reset = reset;
  assign vram_io_wen = io_dmem_addr >= 32'ha1000000 & io_dmem_addr < 32'ha1004b00 ? io_dmem_wen : 2'h0; // @[Mmio.scala 38:23]
  assign vram_io_wdata = io_dmem_wdata; // @[Mmio.scala 39:19]
  assign vram_io_commit = io_dmem_addr == 32'ha0000100 & io_dmem_wen == 2'h1; // @[Mmio.scala 40:54]
  assign vram_io_raddr_x = io_vmem_raddr_x; // @[Mmio.scala 41:21]
  assign vram_io_raddr_y = io_vmem_raddr_y; // @[Mmio.scala 42:21]
  always @(posedge clock) begin
    if (reset) begin // @[Mmio.scala 46:32]
      keyboard_read <= 1'h0; // @[Mmio.scala 46:32]
    end else begin
      keyboard_read <= io_dmem_addr == 32'ha0000060; // @[Mmio.scala 48:19]
    end
    if (reset) begin // @[Mmio.scala 50:24]
      count <= 32'h0; // @[Mmio.scala 50:24]
    end else begin
      count <= _count_T_1; // @[Mmio.scala 51:11]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  keyboard_read = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  count = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Seg(
  input  [31:0] io_data,
  output [7:0]  io_led_0,
  output [7:0]  io_led_1,
  output [7:0]  io_led_2,
  output [7:0]  io_led_3,
  output [7:0]  io_led_4,
  output [7:0]  io_led_5,
  output [7:0]  io_led_6,
  output [7:0]  io_led_7
);
  wire  _io_led_0_T_1 = io_data[3:0] == 4'h0; // @[Seg.scala 16:40]
  wire  _io_led_0_T_3 = io_data[3:0] == 4'h1; // @[Seg.scala 17:40]
  wire  _io_led_0_T_5 = io_data[3:0] == 4'h2; // @[Seg.scala 18:40]
  wire  _io_led_0_T_7 = io_data[3:0] == 4'h3; // @[Seg.scala 19:40]
  wire  _io_led_0_T_9 = io_data[3:0] == 4'h4; // @[Seg.scala 20:40]
  wire  _io_led_0_T_11 = io_data[3:0] == 4'h5; // @[Seg.scala 21:40]
  wire  _io_led_0_T_13 = io_data[3:0] == 4'h6; // @[Seg.scala 22:40]
  wire  _io_led_0_T_15 = io_data[3:0] == 4'h7; // @[Seg.scala 23:40]
  wire  _io_led_0_T_17 = io_data[3:0] == 4'h8; // @[Seg.scala 24:40]
  wire  _io_led_0_T_19 = io_data[3:0] == 4'h9; // @[Seg.scala 25:40]
  wire  _io_led_0_T_21 = io_data[3:0] == 4'ha; // @[Seg.scala 26:40]
  wire  _io_led_0_T_23 = io_data[3:0] == 4'hb; // @[Seg.scala 27:40]
  wire  _io_led_0_T_25 = io_data[3:0] == 4'hc; // @[Seg.scala 28:40]
  wire  _io_led_0_T_27 = io_data[3:0] == 4'hd; // @[Seg.scala 29:40]
  wire  _io_led_0_T_29 = io_data[3:0] == 4'he; // @[Seg.scala 30:40]
  wire [7:0] _io_led_0_T_30 = _io_led_0_T_29 ? 8'h86 : 8'h8e; // @[Mux.scala 98:16]
  wire [7:0] _io_led_0_T_31 = _io_led_0_T_27 ? 8'ha1 : _io_led_0_T_30; // @[Mux.scala 98:16]
  wire [7:0] _io_led_0_T_32 = _io_led_0_T_25 ? 8'hc6 : _io_led_0_T_31; // @[Mux.scala 98:16]
  wire [7:0] _io_led_0_T_33 = _io_led_0_T_23 ? 8'h83 : _io_led_0_T_32; // @[Mux.scala 98:16]
  wire [7:0] _io_led_0_T_34 = _io_led_0_T_21 ? 8'h88 : _io_led_0_T_33; // @[Mux.scala 98:16]
  wire [7:0] _io_led_0_T_35 = _io_led_0_T_19 ? 8'h98 : _io_led_0_T_34; // @[Mux.scala 98:16]
  wire [7:0] _io_led_0_T_36 = _io_led_0_T_17 ? 8'h80 : _io_led_0_T_35; // @[Mux.scala 98:16]
  wire [7:0] _io_led_0_T_37 = _io_led_0_T_15 ? 8'hf8 : _io_led_0_T_36; // @[Mux.scala 98:16]
  wire [7:0] _io_led_0_T_38 = _io_led_0_T_13 ? 8'h82 : _io_led_0_T_37; // @[Mux.scala 98:16]
  wire [7:0] _io_led_0_T_39 = _io_led_0_T_11 ? 8'h92 : _io_led_0_T_38; // @[Mux.scala 98:16]
  wire [7:0] _io_led_0_T_40 = _io_led_0_T_9 ? 8'h99 : _io_led_0_T_39; // @[Mux.scala 98:16]
  wire [7:0] _io_led_0_T_41 = _io_led_0_T_7 ? 8'hb0 : _io_led_0_T_40; // @[Mux.scala 98:16]
  wire [7:0] _io_led_0_T_42 = _io_led_0_T_5 ? 8'ha4 : _io_led_0_T_41; // @[Mux.scala 98:16]
  wire [7:0] _io_led_0_T_43 = _io_led_0_T_3 ? 8'hf9 : _io_led_0_T_42; // @[Mux.scala 98:16]
  wire  _io_led_1_T_1 = io_data[7:4] == 4'h0; // @[Seg.scala 16:40]
  wire  _io_led_1_T_3 = io_data[7:4] == 4'h1; // @[Seg.scala 17:40]
  wire  _io_led_1_T_5 = io_data[7:4] == 4'h2; // @[Seg.scala 18:40]
  wire  _io_led_1_T_7 = io_data[7:4] == 4'h3; // @[Seg.scala 19:40]
  wire  _io_led_1_T_9 = io_data[7:4] == 4'h4; // @[Seg.scala 20:40]
  wire  _io_led_1_T_11 = io_data[7:4] == 4'h5; // @[Seg.scala 21:40]
  wire  _io_led_1_T_13 = io_data[7:4] == 4'h6; // @[Seg.scala 22:40]
  wire  _io_led_1_T_15 = io_data[7:4] == 4'h7; // @[Seg.scala 23:40]
  wire  _io_led_1_T_17 = io_data[7:4] == 4'h8; // @[Seg.scala 24:40]
  wire  _io_led_1_T_19 = io_data[7:4] == 4'h9; // @[Seg.scala 25:40]
  wire  _io_led_1_T_21 = io_data[7:4] == 4'ha; // @[Seg.scala 26:40]
  wire  _io_led_1_T_23 = io_data[7:4] == 4'hb; // @[Seg.scala 27:40]
  wire  _io_led_1_T_25 = io_data[7:4] == 4'hc; // @[Seg.scala 28:40]
  wire  _io_led_1_T_27 = io_data[7:4] == 4'hd; // @[Seg.scala 29:40]
  wire  _io_led_1_T_29 = io_data[7:4] == 4'he; // @[Seg.scala 30:40]
  wire [7:0] _io_led_1_T_30 = _io_led_1_T_29 ? 8'h86 : 8'h8e; // @[Mux.scala 98:16]
  wire [7:0] _io_led_1_T_31 = _io_led_1_T_27 ? 8'ha1 : _io_led_1_T_30; // @[Mux.scala 98:16]
  wire [7:0] _io_led_1_T_32 = _io_led_1_T_25 ? 8'hc6 : _io_led_1_T_31; // @[Mux.scala 98:16]
  wire [7:0] _io_led_1_T_33 = _io_led_1_T_23 ? 8'h83 : _io_led_1_T_32; // @[Mux.scala 98:16]
  wire [7:0] _io_led_1_T_34 = _io_led_1_T_21 ? 8'h88 : _io_led_1_T_33; // @[Mux.scala 98:16]
  wire [7:0] _io_led_1_T_35 = _io_led_1_T_19 ? 8'h98 : _io_led_1_T_34; // @[Mux.scala 98:16]
  wire [7:0] _io_led_1_T_36 = _io_led_1_T_17 ? 8'h80 : _io_led_1_T_35; // @[Mux.scala 98:16]
  wire [7:0] _io_led_1_T_37 = _io_led_1_T_15 ? 8'hf8 : _io_led_1_T_36; // @[Mux.scala 98:16]
  wire [7:0] _io_led_1_T_38 = _io_led_1_T_13 ? 8'h82 : _io_led_1_T_37; // @[Mux.scala 98:16]
  wire [7:0] _io_led_1_T_39 = _io_led_1_T_11 ? 8'h92 : _io_led_1_T_38; // @[Mux.scala 98:16]
  wire [7:0] _io_led_1_T_40 = _io_led_1_T_9 ? 8'h99 : _io_led_1_T_39; // @[Mux.scala 98:16]
  wire [7:0] _io_led_1_T_41 = _io_led_1_T_7 ? 8'hb0 : _io_led_1_T_40; // @[Mux.scala 98:16]
  wire [7:0] _io_led_1_T_42 = _io_led_1_T_5 ? 8'ha4 : _io_led_1_T_41; // @[Mux.scala 98:16]
  wire [7:0] _io_led_1_T_43 = _io_led_1_T_3 ? 8'hf9 : _io_led_1_T_42; // @[Mux.scala 98:16]
  wire  _io_led_2_T_1 = io_data[11:8] == 4'h0; // @[Seg.scala 16:40]
  wire  _io_led_2_T_3 = io_data[11:8] == 4'h1; // @[Seg.scala 17:40]
  wire  _io_led_2_T_5 = io_data[11:8] == 4'h2; // @[Seg.scala 18:40]
  wire  _io_led_2_T_7 = io_data[11:8] == 4'h3; // @[Seg.scala 19:40]
  wire  _io_led_2_T_9 = io_data[11:8] == 4'h4; // @[Seg.scala 20:40]
  wire  _io_led_2_T_11 = io_data[11:8] == 4'h5; // @[Seg.scala 21:40]
  wire  _io_led_2_T_13 = io_data[11:8] == 4'h6; // @[Seg.scala 22:40]
  wire  _io_led_2_T_15 = io_data[11:8] == 4'h7; // @[Seg.scala 23:40]
  wire  _io_led_2_T_17 = io_data[11:8] == 4'h8; // @[Seg.scala 24:40]
  wire  _io_led_2_T_19 = io_data[11:8] == 4'h9; // @[Seg.scala 25:40]
  wire  _io_led_2_T_21 = io_data[11:8] == 4'ha; // @[Seg.scala 26:40]
  wire  _io_led_2_T_23 = io_data[11:8] == 4'hb; // @[Seg.scala 27:40]
  wire  _io_led_2_T_25 = io_data[11:8] == 4'hc; // @[Seg.scala 28:40]
  wire  _io_led_2_T_27 = io_data[11:8] == 4'hd; // @[Seg.scala 29:40]
  wire  _io_led_2_T_29 = io_data[11:8] == 4'he; // @[Seg.scala 30:40]
  wire [7:0] _io_led_2_T_30 = _io_led_2_T_29 ? 8'h86 : 8'h8e; // @[Mux.scala 98:16]
  wire [7:0] _io_led_2_T_31 = _io_led_2_T_27 ? 8'ha1 : _io_led_2_T_30; // @[Mux.scala 98:16]
  wire [7:0] _io_led_2_T_32 = _io_led_2_T_25 ? 8'hc6 : _io_led_2_T_31; // @[Mux.scala 98:16]
  wire [7:0] _io_led_2_T_33 = _io_led_2_T_23 ? 8'h83 : _io_led_2_T_32; // @[Mux.scala 98:16]
  wire [7:0] _io_led_2_T_34 = _io_led_2_T_21 ? 8'h88 : _io_led_2_T_33; // @[Mux.scala 98:16]
  wire [7:0] _io_led_2_T_35 = _io_led_2_T_19 ? 8'h98 : _io_led_2_T_34; // @[Mux.scala 98:16]
  wire [7:0] _io_led_2_T_36 = _io_led_2_T_17 ? 8'h80 : _io_led_2_T_35; // @[Mux.scala 98:16]
  wire [7:0] _io_led_2_T_37 = _io_led_2_T_15 ? 8'hf8 : _io_led_2_T_36; // @[Mux.scala 98:16]
  wire [7:0] _io_led_2_T_38 = _io_led_2_T_13 ? 8'h82 : _io_led_2_T_37; // @[Mux.scala 98:16]
  wire [7:0] _io_led_2_T_39 = _io_led_2_T_11 ? 8'h92 : _io_led_2_T_38; // @[Mux.scala 98:16]
  wire [7:0] _io_led_2_T_40 = _io_led_2_T_9 ? 8'h99 : _io_led_2_T_39; // @[Mux.scala 98:16]
  wire [7:0] _io_led_2_T_41 = _io_led_2_T_7 ? 8'hb0 : _io_led_2_T_40; // @[Mux.scala 98:16]
  wire [7:0] _io_led_2_T_42 = _io_led_2_T_5 ? 8'ha4 : _io_led_2_T_41; // @[Mux.scala 98:16]
  wire [7:0] _io_led_2_T_43 = _io_led_2_T_3 ? 8'hf9 : _io_led_2_T_42; // @[Mux.scala 98:16]
  wire  _io_led_3_T_1 = io_data[15:12] == 4'h0; // @[Seg.scala 16:40]
  wire  _io_led_3_T_3 = io_data[15:12] == 4'h1; // @[Seg.scala 17:40]
  wire  _io_led_3_T_5 = io_data[15:12] == 4'h2; // @[Seg.scala 18:40]
  wire  _io_led_3_T_7 = io_data[15:12] == 4'h3; // @[Seg.scala 19:40]
  wire  _io_led_3_T_9 = io_data[15:12] == 4'h4; // @[Seg.scala 20:40]
  wire  _io_led_3_T_11 = io_data[15:12] == 4'h5; // @[Seg.scala 21:40]
  wire  _io_led_3_T_13 = io_data[15:12] == 4'h6; // @[Seg.scala 22:40]
  wire  _io_led_3_T_15 = io_data[15:12] == 4'h7; // @[Seg.scala 23:40]
  wire  _io_led_3_T_17 = io_data[15:12] == 4'h8; // @[Seg.scala 24:40]
  wire  _io_led_3_T_19 = io_data[15:12] == 4'h9; // @[Seg.scala 25:40]
  wire  _io_led_3_T_21 = io_data[15:12] == 4'ha; // @[Seg.scala 26:40]
  wire  _io_led_3_T_23 = io_data[15:12] == 4'hb; // @[Seg.scala 27:40]
  wire  _io_led_3_T_25 = io_data[15:12] == 4'hc; // @[Seg.scala 28:40]
  wire  _io_led_3_T_27 = io_data[15:12] == 4'hd; // @[Seg.scala 29:40]
  wire  _io_led_3_T_29 = io_data[15:12] == 4'he; // @[Seg.scala 30:40]
  wire [7:0] _io_led_3_T_30 = _io_led_3_T_29 ? 8'h86 : 8'h8e; // @[Mux.scala 98:16]
  wire [7:0] _io_led_3_T_31 = _io_led_3_T_27 ? 8'ha1 : _io_led_3_T_30; // @[Mux.scala 98:16]
  wire [7:0] _io_led_3_T_32 = _io_led_3_T_25 ? 8'hc6 : _io_led_3_T_31; // @[Mux.scala 98:16]
  wire [7:0] _io_led_3_T_33 = _io_led_3_T_23 ? 8'h83 : _io_led_3_T_32; // @[Mux.scala 98:16]
  wire [7:0] _io_led_3_T_34 = _io_led_3_T_21 ? 8'h88 : _io_led_3_T_33; // @[Mux.scala 98:16]
  wire [7:0] _io_led_3_T_35 = _io_led_3_T_19 ? 8'h98 : _io_led_3_T_34; // @[Mux.scala 98:16]
  wire [7:0] _io_led_3_T_36 = _io_led_3_T_17 ? 8'h80 : _io_led_3_T_35; // @[Mux.scala 98:16]
  wire [7:0] _io_led_3_T_37 = _io_led_3_T_15 ? 8'hf8 : _io_led_3_T_36; // @[Mux.scala 98:16]
  wire [7:0] _io_led_3_T_38 = _io_led_3_T_13 ? 8'h82 : _io_led_3_T_37; // @[Mux.scala 98:16]
  wire [7:0] _io_led_3_T_39 = _io_led_3_T_11 ? 8'h92 : _io_led_3_T_38; // @[Mux.scala 98:16]
  wire [7:0] _io_led_3_T_40 = _io_led_3_T_9 ? 8'h99 : _io_led_3_T_39; // @[Mux.scala 98:16]
  wire [7:0] _io_led_3_T_41 = _io_led_3_T_7 ? 8'hb0 : _io_led_3_T_40; // @[Mux.scala 98:16]
  wire [7:0] _io_led_3_T_42 = _io_led_3_T_5 ? 8'ha4 : _io_led_3_T_41; // @[Mux.scala 98:16]
  wire [7:0] _io_led_3_T_43 = _io_led_3_T_3 ? 8'hf9 : _io_led_3_T_42; // @[Mux.scala 98:16]
  wire  _io_led_4_T_1 = io_data[19:16] == 4'h0; // @[Seg.scala 16:40]
  wire  _io_led_4_T_3 = io_data[19:16] == 4'h1; // @[Seg.scala 17:40]
  wire  _io_led_4_T_5 = io_data[19:16] == 4'h2; // @[Seg.scala 18:40]
  wire  _io_led_4_T_7 = io_data[19:16] == 4'h3; // @[Seg.scala 19:40]
  wire  _io_led_4_T_9 = io_data[19:16] == 4'h4; // @[Seg.scala 20:40]
  wire  _io_led_4_T_11 = io_data[19:16] == 4'h5; // @[Seg.scala 21:40]
  wire  _io_led_4_T_13 = io_data[19:16] == 4'h6; // @[Seg.scala 22:40]
  wire  _io_led_4_T_15 = io_data[19:16] == 4'h7; // @[Seg.scala 23:40]
  wire  _io_led_4_T_17 = io_data[19:16] == 4'h8; // @[Seg.scala 24:40]
  wire  _io_led_4_T_19 = io_data[19:16] == 4'h9; // @[Seg.scala 25:40]
  wire  _io_led_4_T_21 = io_data[19:16] == 4'ha; // @[Seg.scala 26:40]
  wire  _io_led_4_T_23 = io_data[19:16] == 4'hb; // @[Seg.scala 27:40]
  wire  _io_led_4_T_25 = io_data[19:16] == 4'hc; // @[Seg.scala 28:40]
  wire  _io_led_4_T_27 = io_data[19:16] == 4'hd; // @[Seg.scala 29:40]
  wire  _io_led_4_T_29 = io_data[19:16] == 4'he; // @[Seg.scala 30:40]
  wire [7:0] _io_led_4_T_30 = _io_led_4_T_29 ? 8'h86 : 8'h8e; // @[Mux.scala 98:16]
  wire [7:0] _io_led_4_T_31 = _io_led_4_T_27 ? 8'ha1 : _io_led_4_T_30; // @[Mux.scala 98:16]
  wire [7:0] _io_led_4_T_32 = _io_led_4_T_25 ? 8'hc6 : _io_led_4_T_31; // @[Mux.scala 98:16]
  wire [7:0] _io_led_4_T_33 = _io_led_4_T_23 ? 8'h83 : _io_led_4_T_32; // @[Mux.scala 98:16]
  wire [7:0] _io_led_4_T_34 = _io_led_4_T_21 ? 8'h88 : _io_led_4_T_33; // @[Mux.scala 98:16]
  wire [7:0] _io_led_4_T_35 = _io_led_4_T_19 ? 8'h98 : _io_led_4_T_34; // @[Mux.scala 98:16]
  wire [7:0] _io_led_4_T_36 = _io_led_4_T_17 ? 8'h80 : _io_led_4_T_35; // @[Mux.scala 98:16]
  wire [7:0] _io_led_4_T_37 = _io_led_4_T_15 ? 8'hf8 : _io_led_4_T_36; // @[Mux.scala 98:16]
  wire [7:0] _io_led_4_T_38 = _io_led_4_T_13 ? 8'h82 : _io_led_4_T_37; // @[Mux.scala 98:16]
  wire [7:0] _io_led_4_T_39 = _io_led_4_T_11 ? 8'h92 : _io_led_4_T_38; // @[Mux.scala 98:16]
  wire [7:0] _io_led_4_T_40 = _io_led_4_T_9 ? 8'h99 : _io_led_4_T_39; // @[Mux.scala 98:16]
  wire [7:0] _io_led_4_T_41 = _io_led_4_T_7 ? 8'hb0 : _io_led_4_T_40; // @[Mux.scala 98:16]
  wire [7:0] _io_led_4_T_42 = _io_led_4_T_5 ? 8'ha4 : _io_led_4_T_41; // @[Mux.scala 98:16]
  wire [7:0] _io_led_4_T_43 = _io_led_4_T_3 ? 8'hf9 : _io_led_4_T_42; // @[Mux.scala 98:16]
  wire  _io_led_5_T_1 = io_data[23:20] == 4'h0; // @[Seg.scala 16:40]
  wire  _io_led_5_T_3 = io_data[23:20] == 4'h1; // @[Seg.scala 17:40]
  wire  _io_led_5_T_5 = io_data[23:20] == 4'h2; // @[Seg.scala 18:40]
  wire  _io_led_5_T_7 = io_data[23:20] == 4'h3; // @[Seg.scala 19:40]
  wire  _io_led_5_T_9 = io_data[23:20] == 4'h4; // @[Seg.scala 20:40]
  wire  _io_led_5_T_11 = io_data[23:20] == 4'h5; // @[Seg.scala 21:40]
  wire  _io_led_5_T_13 = io_data[23:20] == 4'h6; // @[Seg.scala 22:40]
  wire  _io_led_5_T_15 = io_data[23:20] == 4'h7; // @[Seg.scala 23:40]
  wire  _io_led_5_T_17 = io_data[23:20] == 4'h8; // @[Seg.scala 24:40]
  wire  _io_led_5_T_19 = io_data[23:20] == 4'h9; // @[Seg.scala 25:40]
  wire  _io_led_5_T_21 = io_data[23:20] == 4'ha; // @[Seg.scala 26:40]
  wire  _io_led_5_T_23 = io_data[23:20] == 4'hb; // @[Seg.scala 27:40]
  wire  _io_led_5_T_25 = io_data[23:20] == 4'hc; // @[Seg.scala 28:40]
  wire  _io_led_5_T_27 = io_data[23:20] == 4'hd; // @[Seg.scala 29:40]
  wire  _io_led_5_T_29 = io_data[23:20] == 4'he; // @[Seg.scala 30:40]
  wire [7:0] _io_led_5_T_30 = _io_led_5_T_29 ? 8'h86 : 8'h8e; // @[Mux.scala 98:16]
  wire [7:0] _io_led_5_T_31 = _io_led_5_T_27 ? 8'ha1 : _io_led_5_T_30; // @[Mux.scala 98:16]
  wire [7:0] _io_led_5_T_32 = _io_led_5_T_25 ? 8'hc6 : _io_led_5_T_31; // @[Mux.scala 98:16]
  wire [7:0] _io_led_5_T_33 = _io_led_5_T_23 ? 8'h83 : _io_led_5_T_32; // @[Mux.scala 98:16]
  wire [7:0] _io_led_5_T_34 = _io_led_5_T_21 ? 8'h88 : _io_led_5_T_33; // @[Mux.scala 98:16]
  wire [7:0] _io_led_5_T_35 = _io_led_5_T_19 ? 8'h98 : _io_led_5_T_34; // @[Mux.scala 98:16]
  wire [7:0] _io_led_5_T_36 = _io_led_5_T_17 ? 8'h80 : _io_led_5_T_35; // @[Mux.scala 98:16]
  wire [7:0] _io_led_5_T_37 = _io_led_5_T_15 ? 8'hf8 : _io_led_5_T_36; // @[Mux.scala 98:16]
  wire [7:0] _io_led_5_T_38 = _io_led_5_T_13 ? 8'h82 : _io_led_5_T_37; // @[Mux.scala 98:16]
  wire [7:0] _io_led_5_T_39 = _io_led_5_T_11 ? 8'h92 : _io_led_5_T_38; // @[Mux.scala 98:16]
  wire [7:0] _io_led_5_T_40 = _io_led_5_T_9 ? 8'h99 : _io_led_5_T_39; // @[Mux.scala 98:16]
  wire [7:0] _io_led_5_T_41 = _io_led_5_T_7 ? 8'hb0 : _io_led_5_T_40; // @[Mux.scala 98:16]
  wire [7:0] _io_led_5_T_42 = _io_led_5_T_5 ? 8'ha4 : _io_led_5_T_41; // @[Mux.scala 98:16]
  wire [7:0] _io_led_5_T_43 = _io_led_5_T_3 ? 8'hf9 : _io_led_5_T_42; // @[Mux.scala 98:16]
  wire  _io_led_6_T_1 = io_data[27:24] == 4'h0; // @[Seg.scala 16:40]
  wire  _io_led_6_T_3 = io_data[27:24] == 4'h1; // @[Seg.scala 17:40]
  wire  _io_led_6_T_5 = io_data[27:24] == 4'h2; // @[Seg.scala 18:40]
  wire  _io_led_6_T_7 = io_data[27:24] == 4'h3; // @[Seg.scala 19:40]
  wire  _io_led_6_T_9 = io_data[27:24] == 4'h4; // @[Seg.scala 20:40]
  wire  _io_led_6_T_11 = io_data[27:24] == 4'h5; // @[Seg.scala 21:40]
  wire  _io_led_6_T_13 = io_data[27:24] == 4'h6; // @[Seg.scala 22:40]
  wire  _io_led_6_T_15 = io_data[27:24] == 4'h7; // @[Seg.scala 23:40]
  wire  _io_led_6_T_17 = io_data[27:24] == 4'h8; // @[Seg.scala 24:40]
  wire  _io_led_6_T_19 = io_data[27:24] == 4'h9; // @[Seg.scala 25:40]
  wire  _io_led_6_T_21 = io_data[27:24] == 4'ha; // @[Seg.scala 26:40]
  wire  _io_led_6_T_23 = io_data[27:24] == 4'hb; // @[Seg.scala 27:40]
  wire  _io_led_6_T_25 = io_data[27:24] == 4'hc; // @[Seg.scala 28:40]
  wire  _io_led_6_T_27 = io_data[27:24] == 4'hd; // @[Seg.scala 29:40]
  wire  _io_led_6_T_29 = io_data[27:24] == 4'he; // @[Seg.scala 30:40]
  wire [7:0] _io_led_6_T_30 = _io_led_6_T_29 ? 8'h86 : 8'h8e; // @[Mux.scala 98:16]
  wire [7:0] _io_led_6_T_31 = _io_led_6_T_27 ? 8'ha1 : _io_led_6_T_30; // @[Mux.scala 98:16]
  wire [7:0] _io_led_6_T_32 = _io_led_6_T_25 ? 8'hc6 : _io_led_6_T_31; // @[Mux.scala 98:16]
  wire [7:0] _io_led_6_T_33 = _io_led_6_T_23 ? 8'h83 : _io_led_6_T_32; // @[Mux.scala 98:16]
  wire [7:0] _io_led_6_T_34 = _io_led_6_T_21 ? 8'h88 : _io_led_6_T_33; // @[Mux.scala 98:16]
  wire [7:0] _io_led_6_T_35 = _io_led_6_T_19 ? 8'h98 : _io_led_6_T_34; // @[Mux.scala 98:16]
  wire [7:0] _io_led_6_T_36 = _io_led_6_T_17 ? 8'h80 : _io_led_6_T_35; // @[Mux.scala 98:16]
  wire [7:0] _io_led_6_T_37 = _io_led_6_T_15 ? 8'hf8 : _io_led_6_T_36; // @[Mux.scala 98:16]
  wire [7:0] _io_led_6_T_38 = _io_led_6_T_13 ? 8'h82 : _io_led_6_T_37; // @[Mux.scala 98:16]
  wire [7:0] _io_led_6_T_39 = _io_led_6_T_11 ? 8'h92 : _io_led_6_T_38; // @[Mux.scala 98:16]
  wire [7:0] _io_led_6_T_40 = _io_led_6_T_9 ? 8'h99 : _io_led_6_T_39; // @[Mux.scala 98:16]
  wire [7:0] _io_led_6_T_41 = _io_led_6_T_7 ? 8'hb0 : _io_led_6_T_40; // @[Mux.scala 98:16]
  wire [7:0] _io_led_6_T_42 = _io_led_6_T_5 ? 8'ha4 : _io_led_6_T_41; // @[Mux.scala 98:16]
  wire [7:0] _io_led_6_T_43 = _io_led_6_T_3 ? 8'hf9 : _io_led_6_T_42; // @[Mux.scala 98:16]
  wire  _io_led_7_T_1 = io_data[31:28] == 4'h0; // @[Seg.scala 16:40]
  wire  _io_led_7_T_3 = io_data[31:28] == 4'h1; // @[Seg.scala 17:40]
  wire  _io_led_7_T_5 = io_data[31:28] == 4'h2; // @[Seg.scala 18:40]
  wire  _io_led_7_T_7 = io_data[31:28] == 4'h3; // @[Seg.scala 19:40]
  wire  _io_led_7_T_9 = io_data[31:28] == 4'h4; // @[Seg.scala 20:40]
  wire  _io_led_7_T_11 = io_data[31:28] == 4'h5; // @[Seg.scala 21:40]
  wire  _io_led_7_T_13 = io_data[31:28] == 4'h6; // @[Seg.scala 22:40]
  wire  _io_led_7_T_15 = io_data[31:28] == 4'h7; // @[Seg.scala 23:40]
  wire  _io_led_7_T_17 = io_data[31:28] == 4'h8; // @[Seg.scala 24:40]
  wire  _io_led_7_T_19 = io_data[31:28] == 4'h9; // @[Seg.scala 25:40]
  wire  _io_led_7_T_21 = io_data[31:28] == 4'ha; // @[Seg.scala 26:40]
  wire  _io_led_7_T_23 = io_data[31:28] == 4'hb; // @[Seg.scala 27:40]
  wire  _io_led_7_T_25 = io_data[31:28] == 4'hc; // @[Seg.scala 28:40]
  wire  _io_led_7_T_27 = io_data[31:28] == 4'hd; // @[Seg.scala 29:40]
  wire  _io_led_7_T_29 = io_data[31:28] == 4'he; // @[Seg.scala 30:40]
  wire [7:0] _io_led_7_T_30 = _io_led_7_T_29 ? 8'h86 : 8'h8e; // @[Mux.scala 98:16]
  wire [7:0] _io_led_7_T_31 = _io_led_7_T_27 ? 8'ha1 : _io_led_7_T_30; // @[Mux.scala 98:16]
  wire [7:0] _io_led_7_T_32 = _io_led_7_T_25 ? 8'hc6 : _io_led_7_T_31; // @[Mux.scala 98:16]
  wire [7:0] _io_led_7_T_33 = _io_led_7_T_23 ? 8'h83 : _io_led_7_T_32; // @[Mux.scala 98:16]
  wire [7:0] _io_led_7_T_34 = _io_led_7_T_21 ? 8'h88 : _io_led_7_T_33; // @[Mux.scala 98:16]
  wire [7:0] _io_led_7_T_35 = _io_led_7_T_19 ? 8'h98 : _io_led_7_T_34; // @[Mux.scala 98:16]
  wire [7:0] _io_led_7_T_36 = _io_led_7_T_17 ? 8'h80 : _io_led_7_T_35; // @[Mux.scala 98:16]
  wire [7:0] _io_led_7_T_37 = _io_led_7_T_15 ? 8'hf8 : _io_led_7_T_36; // @[Mux.scala 98:16]
  wire [7:0] _io_led_7_T_38 = _io_led_7_T_13 ? 8'h82 : _io_led_7_T_37; // @[Mux.scala 98:16]
  wire [7:0] _io_led_7_T_39 = _io_led_7_T_11 ? 8'h92 : _io_led_7_T_38; // @[Mux.scala 98:16]
  wire [7:0] _io_led_7_T_40 = _io_led_7_T_9 ? 8'h99 : _io_led_7_T_39; // @[Mux.scala 98:16]
  wire [7:0] _io_led_7_T_41 = _io_led_7_T_7 ? 8'hb0 : _io_led_7_T_40; // @[Mux.scala 98:16]
  wire [7:0] _io_led_7_T_42 = _io_led_7_T_5 ? 8'ha4 : _io_led_7_T_41; // @[Mux.scala 98:16]
  wire [7:0] _io_led_7_T_43 = _io_led_7_T_3 ? 8'hf9 : _io_led_7_T_42; // @[Mux.scala 98:16]
  assign io_led_0 = _io_led_0_T_1 ? 8'hc0 : _io_led_0_T_43; // @[Mux.scala 98:16]
  assign io_led_1 = _io_led_1_T_1 ? 8'hc0 : _io_led_1_T_43; // @[Mux.scala 98:16]
  assign io_led_2 = _io_led_2_T_1 ? 8'hc0 : _io_led_2_T_43; // @[Mux.scala 98:16]
  assign io_led_3 = _io_led_3_T_1 ? 8'hc0 : _io_led_3_T_43; // @[Mux.scala 98:16]
  assign io_led_4 = _io_led_4_T_1 ? 8'hc0 : _io_led_4_T_43; // @[Mux.scala 98:16]
  assign io_led_5 = _io_led_5_T_1 ? 8'hc0 : _io_led_5_T_43; // @[Mux.scala 98:16]
  assign io_led_6 = _io_led_6_T_1 ? 8'hc0 : _io_led_6_T_43; // @[Mux.scala 98:16]
  assign io_led_7 = _io_led_7_T_1 ? 8'hc0 : _io_led_7_T_43; // @[Mux.scala 98:16]
endmodule
module Top(
  input         clock,
  input         reset,
  output [7:0]  io_led_0,
  output [7:0]  io_led_1,
  output [7:0]  io_led_2,
  output [7:0]  io_led_3,
  output [7:0]  io_led_4,
  output [7:0]  io_led_5,
  output [7:0]  io_led_6,
  output [7:0]  io_led_7,
  input  [9:0]  io_vmem_raddr_x,
  input  [9:0]  io_vmem_raddr_y,
  output [11:0] io_vmem_rdata,
  input         io_kbd_kbd_ready,
  input  [7:0]  io_kbd_kbd_data,
  output        io_kbd_kbd_read_enable
);
  wire  core_clock; // @[Top.scala 12:22]
  wire  core_reset; // @[Top.scala 12:22]
  wire [31:0] core_io_imem_addr; // @[Top.scala 12:22]
  wire [31:0] core_io_imem_inst; // @[Top.scala 12:22]
  wire [31:0] core_io_dmem_addr; // @[Top.scala 12:22]
  wire [1:0] core_io_dmem_wen; // @[Top.scala 12:22]
  wire [31:0] core_io_dmem_wdata; // @[Top.scala 12:22]
  wire [2:0] core_io_dmem_rwtype; // @[Top.scala 12:22]
  wire [31:0] core_io_dmem_rdata; // @[Top.scala 12:22]
  wire [31:0] core_io_data; // @[Top.scala 12:22]
  wire  rom_clock; // @[Top.scala 13:21]
  wire [31:0] rom_io_addr; // @[Top.scala 13:21]
  wire [31:0] rom_io_inst; // @[Top.scala 13:21]
  wire  mmio_clock; // @[Top.scala 14:22]
  wire  mmio_reset; // @[Top.scala 14:22]
  wire [31:0] mmio_io_dmem_addr; // @[Top.scala 14:22]
  wire [1:0] mmio_io_dmem_wen; // @[Top.scala 14:22]
  wire [31:0] mmio_io_dmem_wdata; // @[Top.scala 14:22]
  wire [2:0] mmio_io_dmem_rwtype; // @[Top.scala 14:22]
  wire [31:0] mmio_io_dmem_rdata; // @[Top.scala 14:22]
  wire [9:0] mmio_io_vmem_raddr_x; // @[Top.scala 14:22]
  wire [9:0] mmio_io_vmem_raddr_y; // @[Top.scala 14:22]
  wire [11:0] mmio_io_vmem_rdata; // @[Top.scala 14:22]
  wire  mmio_io_kbd_kbd_read_enable; // @[Top.scala 14:22]
  wire [31:0] seg_io_data; // @[Top.scala 15:21]
  wire [7:0] seg_io_led_0; // @[Top.scala 15:21]
  wire [7:0] seg_io_led_1; // @[Top.scala 15:21]
  wire [7:0] seg_io_led_2; // @[Top.scala 15:21]
  wire [7:0] seg_io_led_3; // @[Top.scala 15:21]
  wire [7:0] seg_io_led_4; // @[Top.scala 15:21]
  wire [7:0] seg_io_led_5; // @[Top.scala 15:21]
  wire [7:0] seg_io_led_6; // @[Top.scala 15:21]
  wire [7:0] seg_io_led_7; // @[Top.scala 15:21]
  Core core ( // @[Top.scala 12:22]
    .clock(core_clock),
    .reset(core_reset),
    .io_imem_addr(core_io_imem_addr),
    .io_imem_inst(core_io_imem_inst),
    .io_dmem_addr(core_io_dmem_addr),
    .io_dmem_wen(core_io_dmem_wen),
    .io_dmem_wdata(core_io_dmem_wdata),
    .io_dmem_rwtype(core_io_dmem_rwtype),
    .io_dmem_rdata(core_io_dmem_rdata),
    .io_data(core_io_data)
  );
  Rom rom ( // @[Top.scala 13:21]
    .clock(rom_clock),
    .io_addr(rom_io_addr),
    .io_inst(rom_io_inst)
  );
  Mmio mmio ( // @[Top.scala 14:22]
    .clock(mmio_clock),
    .reset(mmio_reset),
    .io_dmem_addr(mmio_io_dmem_addr),
    .io_dmem_wen(mmio_io_dmem_wen),
    .io_dmem_wdata(mmio_io_dmem_wdata),
    .io_dmem_rwtype(mmio_io_dmem_rwtype),
    .io_dmem_rdata(mmio_io_dmem_rdata),
    .io_vmem_raddr_x(mmio_io_vmem_raddr_x),
    .io_vmem_raddr_y(mmio_io_vmem_raddr_y),
    .io_vmem_rdata(mmio_io_vmem_rdata),
    .io_kbd_kbd_read_enable(mmio_io_kbd_kbd_read_enable)
  );
  Seg seg ( // @[Top.scala 15:21]
    .io_data(seg_io_data),
    .io_led_0(seg_io_led_0),
    .io_led_1(seg_io_led_1),
    .io_led_2(seg_io_led_2),
    .io_led_3(seg_io_led_3),
    .io_led_4(seg_io_led_4),
    .io_led_5(seg_io_led_5),
    .io_led_6(seg_io_led_6),
    .io_led_7(seg_io_led_7)
  );
  assign io_led_0 = seg_io_led_0; // @[Top.scala 20:12]
  assign io_led_1 = seg_io_led_1; // @[Top.scala 20:12]
  assign io_led_2 = seg_io_led_2; // @[Top.scala 20:12]
  assign io_led_3 = seg_io_led_3; // @[Top.scala 20:12]
  assign io_led_4 = seg_io_led_4; // @[Top.scala 20:12]
  assign io_led_5 = seg_io_led_5; // @[Top.scala 20:12]
  assign io_led_6 = seg_io_led_6; // @[Top.scala 20:12]
  assign io_led_7 = seg_io_led_7; // @[Top.scala 20:12]
  assign io_vmem_rdata = mmio_io_vmem_rdata; // @[Top.scala 21:13]
  assign io_kbd_kbd_read_enable = mmio_io_kbd_kbd_read_enable; // @[Top.scala 22:12]
  assign core_clock = clock;
  assign core_reset = reset;
  assign core_io_imem_inst = rom_io_inst; // @[Top.scala 17:18]
  assign core_io_dmem_rdata = mmio_io_dmem_rdata; // @[Top.scala 18:18]
  assign rom_clock = clock;
  assign rom_io_addr = core_io_imem_addr; // @[Top.scala 17:18]
  assign mmio_clock = clock;
  assign mmio_reset = reset;
  assign mmio_io_dmem_addr = core_io_dmem_addr; // @[Top.scala 18:18]
  assign mmio_io_dmem_wen = core_io_dmem_wen; // @[Top.scala 18:18]
  assign mmio_io_dmem_wdata = core_io_dmem_wdata; // @[Top.scala 18:18]
  assign mmio_io_dmem_rwtype = core_io_dmem_rwtype; // @[Top.scala 18:18]
  assign mmio_io_vmem_raddr_x = io_vmem_raddr_x; // @[Top.scala 21:13]
  assign mmio_io_vmem_raddr_y = io_vmem_raddr_y; // @[Top.scala 21:13]
  assign seg_io_data = core_io_data; // @[Top.scala 19:18]
endmodule
