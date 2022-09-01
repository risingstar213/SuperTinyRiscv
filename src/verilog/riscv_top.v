`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/01 20:29:41
// Design Name: 
// Module Name: riscv_top
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


module riscv_top(
    input clk,
    input rst,
    input PS2_CLK,
    input PS2_DATA,
    output [3:0] VGA_R,
    output [3:0] VGA_G,
    output [3:0] VGA_B,
    output VGA_HS,
    output VGA_VS,
    output reg [7:0] AN,
    output [7:0] SEG
);
    wire cpu_clk_p, vga_clk_p, led_clk_p;
    wire cpu_clk, vga_clk, led_clk;
    divider #(5) div_cpu(clk, cpu_clk_p);
    divider #(2) div_vga(clk, vga_clk_p);
    divider #(2500) div_led(clk, led_clk_p);
    
    BUFG bufg_cpu(.O(cpu_clk), .I(cpu_clk_p));
    BUFG bufg_vga(.O(vga_clk), .I(vga_clk_p));
    BUFG bufg_led(.O(led_clk), .I(led_clk_p));
    
    wire [9:0] next_x;
    wire [9:0] next_y;
    wire [11:0] vram_data;
    
    vga_driver vga0(.clk(vga_clk),
                    .rst(rst),
                    .color_in(vram_data),
                    .next_x(next_x),
                    .next_y(next_y),
                    .red(VGA_R),
                    .green(VGA_G),
                    .blue(VGA_B),
                    .hsync(VGA_HS),
                    .vsync(VGA_VS)
                    );
    wire read_enable;
    wire [7:0] kbd_data;
    wire kbd_ready;
    ps2_kbd kbd0(.clk(cpu_clk),
                 .rst(rst),
                 .ps2_clk(PS2_CLK),
                 .ps2_data(PS2_DATA),
                 .read_enable(read_enable),
                 .data(kbd_data),
                 .ready(kbd_ready)
                 );
    wire [7:0] seg[7:0];
    Top top(.clock(cpu_clk),
            .reset(rst),
            .io_led_0(seg[0]),
            .io_led_1(seg[1]),
            .io_led_2(seg[2]),
            .io_led_3(seg[3]),
            .io_led_4(seg[4]),
            .io_led_5(seg[5]),
            .io_led_6(seg[6]),
            .io_led_7(seg[7]),
            .io_vmem_raddr_x(next_x),
            .io_vmem_raddr_y(next_y),
            .io_vmem_rdata(vram_data),
            .io_kbd_kbd_ready(kbd_ready),
            .io_kbd_kbd_data(kbd_data),
            .io_kbd_kbd_read_enable(read_enable)
            );
     reg [3:0] sel;
     always @(posedge led_clk) begin
        if (rst) begin
            sel = 4'b0;
        end 
        else begin
            sel = sel + 1;
        end
        AN[7:0] = 8'hff;
        AN[sel] = 1'b0;
     end
     assign SEG = seg[sel];
endmodule
