`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2023 14:10:38
// Design Name: 
// Module Name: fetch
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


module fetch(
  input wire clk_i,    // reloj
  input wire rst_i,  // reinicio
  input wire branch,
  input wire zero,
  input wire [31:0] dato,
  input wire [31:0] dato2,
  input wire jump,
  output [31:0] data
);
  reg [31:0] pc;

  always @(posedge clk_i or posedge rst_i) 
  begin
    if (rst_i)        
      pc <= 0;
    else begin 
      if (jump)begin 
        pc <= dato2;
      end
      else if(branch & zero)           
        pc <= pc + dato;
      else
        pc <= pc + 1;
    end
  end
  
 
  
  fetch_instruction_memory mem(
  .clk_i   (clk_i),
  .addr  (pc),
  .data  (data)
  );
  
endmodule