`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/01 20:42:38
// Design Name: 
// Module Name: divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module divider(
    input clk,
    output reg clk_N
    );
    reg [31:0] counter;
    parameter N = 500_000_00;
    initial begin
        counter = 0;
        clk_N = 0;
    end
    
    always @(clk) begin
        counter = counter + 1;
        if (counter >= N) begin
            clk_N <= ~clk_N;
            counter <= 0;
        end
        else begin
            clk_N = clk_N;
        end
    end
endmodule
