`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2023 00:06:11
// Design Name: 
// Module Name: sign_extension
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


module sign_extension(
    input [11:0] data_i,
    output reg [31:0] data_o
);

    always @(*) begin
        if (data_i[11] == 1) 
            data_o = { {20{1'b1}}, data_i };
        else 
            data_o = { {20{1'b0}}, data_i };
    end

endmodule
