`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2023 10:22:03
// Design Name: 
// Module Name: fetch_instruction_memory
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


module fetch_instruction_memory(
    input wire clk_i,
    input wire [31:0] addr,
    output reg [31:0] data
    );
    
    reg [31:0] ROM [31:0]; 
    
    always @(posedge clk_i)
        data <= ROM[addr];
    //assign ROM_data = ROM[ROM_addr]; 
    
    initial $readmemb ("C:/Users/alan7/Documents/procesadores/monocycle/kernels/test_branch.txt", ROM, 0, 31); 
endmodule
