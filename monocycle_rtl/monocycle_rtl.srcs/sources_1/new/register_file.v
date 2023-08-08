`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2023 12:16:26
// Design Name: 
// Module Name: Register_file
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


module register_file(
    input clk_i,
    input read_register_1,
    input read_register_2,
    input register_number,
    input write,
    input [31:0] register_data,
    output reg read_data_1,
    output reg read_data_2
    
    );
    
    reg [31:0][31:0] register;
    
    always @(posedge clk_i)
    begin 
       read_data_1 <= register[read_register_1];
       read_data_2 <= register[read_register_2]; 
    end
    
     always @(posedge clk_i)
     begin
     if(write)
        register[register_number] <= register_data;
     end
    
endmodule