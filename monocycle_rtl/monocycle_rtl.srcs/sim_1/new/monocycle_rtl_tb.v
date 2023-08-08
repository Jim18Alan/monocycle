`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2023 10:27:46
// Design Name: 
// Module Name: monocycle_rtl_tb
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


module monocycle_rtl_tb();
    reg clk_i;
    reg rst_i;
    
    monocycle_rtl prueba(
    .clk_i  (clk_i),
    .rst_i  (rst_i)
    ) ;
    
     initial begin
         rst_i = 1;
         #5 rst_i = 0;
     end
     
     initial begin
         clk_i = 0;
         forever #10 clk_i = ~clk_i;
     end
endmodule
