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
    input [4:0]read_register_1,
    input [4:0]read_register_2,
    input [4:0]write_register,
    input reg_write,
    input [31:0] write_data,
    output reg [31:0] read_data_1,
    output reg [31:0] read_data_2
    
    );
    
    reg [31:0] register [31:0];
    
    always @(posedge clk_i)begin 
       if(reg_write)
            register[write_register] <= write_data;
    end
    
     always @(*)begin 
               read_data_1 <= register[read_register_1];
               read_data_2 <= register[read_register_2]; 
       end
    
    initial $readmemb ("C:/Users/alan7/Documents/procesadores/monocycle/kernels/data_register.txt", register, 0, 31); 
endmodule