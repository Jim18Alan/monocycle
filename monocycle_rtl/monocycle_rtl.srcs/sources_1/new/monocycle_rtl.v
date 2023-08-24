`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2023 10:19:41
// Design Name: 
// Module Name: monocycle_rtl
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


module monocycle_rtl(

//------------------------------------    
// original inputs core
//-----------------------------------
    input  clk_i,
    input  rst_i
    );
    
    /////////////////////////////////////////////
    //  fetch
    wire [31:0]instruction;
    
    /////////////////////////////////////////////
    //  register_file
    //wire reg_write;
    wire [31:0]write_data ;
    wire [31:0] read_data_1;
    wire [31:0] read_data_2;
    
    /////////////////////////////////////////////
    //  control
    wire branch;
    wire mem_read;
    wire memto_reg;
    wire [3:0]alu_op;
    wire mem_write;
    wire alu_src;
    wire reg_write; 
    
    /////////////////////////////////////////////
    //  alu
    wire [31:0] alu_result;
    wire [31:0] data_output_alu_src;
    
    
    wire [31:0] read_data_memory;
    wire [31:0] sing_extension_data;
    

    

    fetch fetch1(
        .clk_i      (clk_i),
        .rst_i      (rst_i),
        .data       (instruction)
    );
    
    /////////////////////////////////////////////
    //  module register_file
    register_file reg_f(
        .clk_i             (clk_i),
        .read_register_1   (instruction[19:15]),
        .read_register_2   (instruction[24:20]),
        .write_register    (instruction[11:7]),
        .reg_write         (reg_write),
        .write_data        (write_data),
        .read_data_1       (read_data_1),
        .read_data_2       (read_data_2) 
    );
    
    /////////////////////////////////////////////
    //  module control
    control ctr1(
        .clk_i       (clk_i),
        .opcode      (instruction[6:0]),
        .funct3      (instruction[14:12]),
        .funct7      (instruction[31:25]),       
        .branch      (branch),
        .mem_read    (mem_read),
        .memto_reg   (memto_reg),
        .alu_op      (alu_op),
        .mem_write   (mem_write),
        .alu_src     (alu_src),
        .reg_write   (reg_write)
    );   
    
    /////////////////////////////////////////////
    //  module alu
    alu alu1(
        .alu_read_data_1    (read_data_1),
        .alu_read_data_2    (data_output_alu_src),
        .alu_control        (alu_op),
        .alu_result         (alu_result)
    ); 
    
    /////////////////////////////////////////////
    //  module data_memory
    data_memory dt_m(
        .clk_i        (clk_i),
        .mem_write    (mem_write),
        .addr         (alu_result),
        .write_data   (read_data_2),
        .read_data    (read_data_memory)
    );
    /////////////////////////////////////////////
    //  module sign_extension
    sign_extension s_e(
         .data_i    (instruction[31:20]),
         .data_o    (sing_extension_data)
    );
    
    /////////////////////////////////////////////
    //  mux alu src
    mux2_1 m_a_s(
        .data1          (sing_extension_data),
        .data2          (read_data_2),
        .s              (alu_src),
        .data_output    (data_output_alu_src)
    );
    
    /////////////////////////////////////////////
    //  mux memto_reg
    mux2_1 m_m_r(
        .data1          (read_data_memory),
        .data2          (alu_result),
        .s              (memto_reg),
        .data_output    (write_data)
    );
    
    
endmodule
