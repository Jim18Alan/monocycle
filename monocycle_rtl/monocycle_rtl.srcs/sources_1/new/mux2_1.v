`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2023 10:42:43
// Design Name: 
// Module Name: mux2_1
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


module mux2_1(
    input wire [31:0] data1,
    input wire [31:0] data2,
    input wire s,
    output reg [31:0] data_output
    );
    
    always @(*)begin 
        if(s)
            data_output <= data1;
        else
            data_output <= data2;
    end
endmodule
