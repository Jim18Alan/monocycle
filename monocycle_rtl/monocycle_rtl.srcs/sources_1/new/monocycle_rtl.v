`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2023 10:19:41
// Design Name: 
// Module Name: monocycle_rtl
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


module monocycle_rtl(

//------------------------------------    
// original inputs core
//-----------------------------------
    input clk_i,
    input rst_i
    );
    
    wire [31:0]pc;
    
    fetch fetch1(
    .clk_i     (clk_i),
    .rst_i    (rst_i),
    .pc   (pc)
    );
    
endmodule
