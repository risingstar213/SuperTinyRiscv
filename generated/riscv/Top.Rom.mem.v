module BindsTo_0_Rom(
  input         clock,
  input  [31:0] io_addr,
  output [31:0] io_inst
);

initial begin
  $readmemh("~/Desktop/chisel_project/chisel-template/src/main/resources/risc-v-benchmark_ccab.hex", Rom.mem);
end
                      endmodule

bind Rom BindsTo_0_Rom BindsTo_0_Rom_Inst(.*);