`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/01 21:13:28
// Design Name: 
// Module Name: ps2_kbd
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


module ps2_kbd(
    input clk,
    input rst,
    input ps2_clk,
    input ps2_data,
    input read_enable,
    output [7:0] data,
    output ready
    );

reg [3:0] count;
reg [9:0] buffer;
reg [31:0] fifo[15:0];
reg [4:0] w_ptr, r_ptr;

always @(negedge ps2_clk) begin
    if (rst == 1) begin
        w_ptr <= 0;
        count <= 0;
    end
    else begin
        if (count == 4'd10) begin
            fifo[w_ptr] <= buffer[8:0];
            if (r_ptr != (w_ptr + 1)) begin
                w_ptr <= (w_ptr + 1) % 16;
            end
            count <= 0;
        end
        else begin
            buffer[count] <= ps2_data;
            count <= count + 1'b1;
        end
    end
end

always @(posedge clk) begin
    if (rst == 1) begin
        r_ptr <= 0;
    end
    else if (read_enable && ready) begin
        r_ptr <= (r_ptr + 1) % 16;
    end
end

assign ready = (w_ptr != r_ptr);
assign data = fifo[r_ptr];
    
endmodule
