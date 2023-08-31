`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2023 19:59:04
// Design Name: 
// Module Name: order_and_sing_extension
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


module order_and_sing_extension (
    input [12:0] data_i,
    output reg [31:0] data_o
);

    always @(*) begin
        if (data_i[12] == 1) 
            data_o = { {19{1'b1}}, data_i };
        else 
            data_o = { {19{1'b0}}, data_i };
    end

endmodule
