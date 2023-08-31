`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2023 00:57:05
// Design Name: 
// Module Name: sing_extension_jump
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


module sing_extension_jump(
    input [20:0] data_i,
    output reg [31:0] data_o
);

    always @(*) begin
        if (data_i[20] == 1) 
            data_o = { {11{1'b1}}, data_i };
        else 
            data_o = { {11{1'b0}}, data_i };
    end

endmodule
