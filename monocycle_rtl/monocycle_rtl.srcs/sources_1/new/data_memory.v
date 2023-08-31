`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.08.2023 23:21:15
// Design Name: 
// Module Name: data_memory
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


module data_memory(
    input wire clk_i,
    input wire mem_write,
    input wire [31:0] addr,
    input wire [31:0] write_data,
    output reg [31:0] read_data
    );
    
    reg [31:0] ROM [50:0]; 
    
    always @(*)
        read_data <= ROM[addr];
        
    always @(posedge clk_i)begin 
        if(mem_write)
            ROM[addr] = write_data;
    end
        
    initial $readmemb ("C:/Users/alan7/Documents/procesadores/monocycle/kernels/data_memory.txt", ROM, 0, 50);


endmodule
