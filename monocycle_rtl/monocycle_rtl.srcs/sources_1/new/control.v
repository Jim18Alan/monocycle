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
    output reg reg_write,  
    output reg imm_rd,  
    output reg jump
);
    
    always @(*) begin 
        case (opcode) 
            7'b0110011: begin // R-type
                 branch <= 0;
                 jump <= 0;
                 memto_reg <= 0;
                 alu_op <= 4'b0000;
                 mem_write <= 0;
                 alu_src <= 0;
                 reg_write <= 1;
                 imm_rd <= 0;  
                
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
                jump <= 0;
                memto_reg <= 0;
                alu_op <= 4'b0000;
                mem_write <= 0;
                alu_src <= 1;  
                reg_write <= 1; 
                imm_rd = 0;              
                                  
                if (funct3 == 3'b000) 
                    alu_op <= 4'b0000;   //addi
                else if (funct3 == 3'b010)  //slti   set if less than = menor que, cpn signo
                    alu_op <= 4'b0101;
                else if (funct3 == 3'b100)  //xori
                    alu_op <= 4'b0100;
                else if (funct3 == 3'b111)  //andi
                    alu_op <= 4'b0010;
                else if (funct3 == 3'b001)  //slli   desplazamiento a la isquierda
                    alu_op <= 4'b0110;
                else if (funct3 == 3'b011)  //sltui
                    alu_op <= 4'b1001;
                else if (funct3 == 3'b110)  //ori
                     alu_op <= 4'b0011;
                else if (funct3 == 3'b101) 
                    begin
                        if (funct7 == 7'b0000000) 
                            alu_op <=  4'b0111;//srli  desplazamiento a la derecha
                         else 
                            alu_op <= 4'b1000; //srai
                    end 
                                   
            end
            7'b0000011: begin // load I-type
                branch <= 0;
                jump <= 0;
                memto_reg <= 1;
                alu_op <= 4'b0000;
                mem_write <= 0;
                alu_src <= 1;  
                reg_write <= 1; 
                imm_rd = 0;  
               
                   
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
            7'b0100011: begin // store S-type
                branch <= 0;
                jump <= 0;
                memto_reg <= 0;
                alu_op <= 4'b0000;
                mem_write <= 1;
                alu_src <= 1;  
                reg_write <= 0; 
                imm_rd = 1;  
             
                if(funct3 == 3'b000)begin // sb
                end
                else if(funct3 == 3'b001)begin // sh
                end
                else if(funct3 == 3'b010)begin // sw
                end
            end
            
            
            7'b1100011: begin // branch
                branch <= 1; 
                jump <= 0;
                memto_reg <= 0;
                alu_op <= 4'b0000;
                mem_write <= 0;
                alu_src <= 0;  
                reg_write <= 0; 
                imm_rd = 0; 
                
                if(funct3 == 3'b000)    //if equal
                    alu_op <= 4'b1010;
                else if(funct3 == 3'b001)  //if not equal
                    alu_op <= 4'b1011;
                else if(funct3 == 3'b100)  // on less than
                    alu_op <= 4'b0101;
                if(funct3 == 3'b101)    //on greater than 
                    alu_op <= 4'b1100;
                else if(funct3 == 3'b110)  //if less than, unsigned
                    alu_op <= 4'b1001;
                else if(funct3 == 3'b111)  // if greater than or equal, unsigned
                    alu_op <= 4'b1101;
               
            end
            7'b1101111: begin // jump
                branch <= 0;
                jump <= 1;
                memto_reg <= 0;
                alu_op <= 4'b0000;
                mem_write <= 0;
                alu_src <= 0;  
                reg_write <= 0; 
                imm_rd = 0; 
            end
            
            
            
          endcase
      end
      
          
    
endmodule


