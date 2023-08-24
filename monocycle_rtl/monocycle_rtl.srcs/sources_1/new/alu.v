`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2023 20:42:55
// Design Name: 
// Module Name: alu
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

module alu (
    input wire [31:0] alu_read_data_1,
    input wire [31:0] alu_read_data_2,
    input wire [3:0] alu_control,
    output reg [31:0] alu_result
);
    reg is_neg1, is_neg2;
    reg  [31:0]value1, value2;

  
    always @(*)
    begin
        case (alu_control)
            4'b0000: alu_result = alu_read_data_1 + alu_read_data_2; // suma
            4'b0001: alu_result = alu_read_data_1 - alu_read_data_2; // resta
            4'b0010: alu_result = alu_read_data_1 & alu_read_data_2; // and
            4'b0011: alu_result = alu_read_data_1 | alu_read_data_2; // or
            4'b0100: alu_result = alu_read_data_1 ^ alu_read_data_2; // xor
            4'b0101: begin 
                        is_neg1 = alu_read_data_1[31];
                        is_neg2 = alu_read_data_2[31];
                  
                        if (is_neg1 & is_neg2 ) begin
                            value1 = ~(alu_read_data_1) + 1;  // Convertir a original
                            value2 = ~(alu_read_data_2) + 1; 
                            if(value1 < value2)
                                 alu_result =  {{31{1'b0}}, 1'b1};
                            else
                                 alu_result = 32'b0;  
                            end
                        else if (is_neg1 & ~is_neg2)
                            alu_result =  {{31{1'b0}}, 1'b1};
                        else if (is_neg2 & ~is_neg1)
                            alu_result = 32'b0;
                        else if (~is_neg2 & ~is_neg1)begin
                             if(alu_read_data_1 < alu_read_data_2)
                                alu_result =  {{31{1'b0}}, 1'b1};
                             else
                                alu_result = 32'b0;  
                        
                        end
                     
             end
             4'b0110: alu_result = alu_read_data_1 << alu_read_data_2;           // Desplazamiento a la izquierda
             4'b0111: alu_result = alu_read_data_1 >> alu_read_data_2;           // Desplazamiento a la derecha 
             4'b1000: begin 
                
                alu_result = alu_read_data_1 >>> alu_read_data_2[4:0];          // Desplazamiento a la derecha aritmético 
             end
             4'b1001: begin
                if(alu_read_data_1 < alu_read_data_2)
                    alu_result =  {{31{1'b0}}, 1'b1};
                else
                    alu_result = 32'b0;  
             end
             default: alu_result = 32'b0;
        endcase
    end
endmodule
