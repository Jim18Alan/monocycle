`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2023 11:40:28
// Design Name: 
// Module Name: control
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


module control(
    input clk_i,
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,
    
    output reg branch,
    output reg mem_read,
    output reg memto_reg,
    output reg [3:0] alu_op,
    output reg mem_write,
    output reg alu_src,
    output reg reg_write    
);
    
    always @(*) begin 
        case (opcode) 
            7'b0110011: begin // R-type
                 branch = 0;
                 mem_read = 0;
                 memto_reg = 0;
                 alu_op = 2'b10;
                 mem_write = 0;
                 alu_src = 0;
                 reg_write = 1; 
                
                 if (funct3 == 3'b000) 
                    begin 
                        if (funct7 == 7'b0000000)
                             alu_op = 4'b0000;   //add
                        else 
                             alu_op = 4'b0001;   //sub  
                    end 
                 else if (funct3 == 3'b010)  //slt   set if less than = menor que
                    alu_op = 4'b0101;
                 else if (funct3 == 3'b100)  //xor
                    alu_op = 4'b0100;
                 else if (funct3 == 3'b111)  //and
                    alu_op = 4'b0010;
                 else if (funct3 == 3'b001)  //sll   desplazamiento a la isquierda
                    alu_op = 4'b0110;
                 else if (funct3 == 3'b011)  //sltu
                    alu_op = 4'b1001;
                 else if (funct3 == 3'b110)  //or
                    alu_op = 4'b0011;
                 else if (funct3 == 3'b101) 
                    begin
                        if (funct7 == 7'b0000000) 
                            alu_op =  4'b0111;//srl  desplazamiento a la derecha
                        else 
                          alu_op = 4'b1000; //sra
                     end 
            end
            7'b0010011: begin //I-type
                branch <= 0;
                mem_read <= 0;
                memto_reg <= 0;
                alu_op <= 2'b00;
                mem_write <= 0;
                alu_src <= 1;  
                reg_write <= 1; 
                                     
                                  
                if (funct3 == 3'b000) 
                    alu_op = 4'b0000;   //add
                else if (funct3 == 3'b010)  //slt   set if less than = menor que, cpn signo
                    alu_op = 4'b0101;
                else if (funct3 == 3'b100)  //xor
                    alu_op = 4'b0100;
                else if (funct3 == 3'b111)  //and
                    alu_op = 4'b0010;
                else if (funct3 == 3'b001)  //sll   desplazamiento a la isquierda
                    alu_op = 4'b0110;
                else if (funct3 == 3'b011)  //sltu
                    alu_op = 4'b1001;
                else if (funct3 == 3'b110)  //or
                     alu_op = 4'b0011;
                else if (funct3 == 3'b101) 
                    begin
                        if (funct7 == 7'b0000000) 
                            alu_op =  4'b0111;//srl  desplazamiento a la derecha
                         else 
                            alu_op = 4'b1000; //sra
                    end 
                                   
            end
            7'b0000011: begin // transferencia de datos I-type
                branch <= 0;
                mem_read <= 1;
                memto_reg <= 1;
                alu_op <= 2'b00;
                mem_write <= 0;
                alu_src <= 1;  
                reg_write <= 1; 
                   
                if(funct3 == 3'b000)begin // lb
                end
                else if(funct3 == 3'b001)begin // lh
                end
                else if(funct3 == 3'b010)begin // lw
                end
                else if(funct3 == 3'b100)begin // lbu
                end
                else if(funct3 == 3'b101)begin // lhu
                end
            end
            7'b0100011: begin // transferencia de datos S-type
                branch <= 0;
                mem_read <= 0;
                memto_reg <= 0;
                alu_op <= 2'b00;
                mem_write <= 1;
                alu_src <= 1;  
                reg_write <= 0; 
             
                if(funct3 == 3'b000)begin // sb
                end
                else if(funct3 == 3'b001)begin // sh
                end
                else if(funct3 == 3'b010)begin // sw
                end
            end
            
          endcase
      end
         
     
         
      /*   
         
         
         
         
         
         
         
         
         
         
         
          7'b0000011: begin //Load
          
                    next_PC_select = 0;
                    branch_op = 0;
                    mem_wEn = 0;
                    op_A_sel = 2'b00;
                    op_B_sel = 1;
                    wb_sel = 1;
                    wEn = 1;
          
          7'b0100011: begin //Store
                   next_PC_select = 0;
                   branch_op = 0;
                   mem_wEn = 1;
                   op_A_sel = 2'b00;
                   op_B_sel = 1;
                   wb_sel = 0;
                   wEn = 0;
                   ALU_Control = 6'b000000;
          7'b1100011: begin //Branch 
                             branch_op = 1;
                             mem_wEn = 0;
                             op_A_sel = 2'b00;
                             op_B_sel = 0;
                             wb_sel = 0;
                             wEn = 0;
          */
          
    
endmodule


