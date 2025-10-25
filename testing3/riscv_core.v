// Top file for cpu only
module riscv_core (
    input  wire        clk,
    input  wire        rst_n,
    // instruction memory (external)
    input  wire [31:0] instr_mem_data,
    output wire [31:0] pc_out,
    // data memory interface (external)
    output wire [31:0] data_addr,
    output wire [31:0] data_wdata,
    output wire        data_we,
    output wire        data_re,
    input  wire [31:0] data_rdata
);
    // internal wires 
    wire [31:0] pc_next;
    wire [31:0] if_instr;
    wire [31:0] if_pc_plus4;

    wire [31:0] id_instr;
    wire [31:0] id_pc_plus4;
    wire [6:0]  id_opcode;
    wire [4:0]  id_rd;
    wire [2:0]  id_funct3;
    wire [4:0]  id_rs1;
    wire [4:0]  id_rs2;
    wire [6:0]  id_funct7;
    wire [31:0] id_imm_i;

    wire [31:0] reg_rs1;
    wire [31:0] reg_rs2;

    wire [6:0]  ex_opcode;
    wire [4:0]  ex_rd;
    wire [2:0]  ex_funct3;
    wire [6:0]  ex_funct7;
    wire [31:0] ex_imm_i;
    wire [31:0] ex_rs1;
    wire [31:0] ex_rs2;

    wire [31:0] ex_alu_result;
    wire ex_zero;
    wire [4:0] ex_rd_out;
    wire ex_mem_read, ex_mem_write, ex_reg_write, ex_mem_to_reg;

    wire [31:0] mem_alu_result;
    wire [31:0] mem_store_data;
    wire [4:0] mem_rd;
    wire mem_mem_read, mem_mem_write, mem_reg_write, mem_mem_to_reg;

    wire [31:0] mem_read_data;
    wire [31:0] wb_alu_result;
    wire [31:0] wb_mem_read_data;
    wire [4:0] wb_rd;
    wire wb_reg_write, wb_mem_to_reg;

    wire [31:0] wb_write_data;

    // PC
    pc PC0 (.clk(clk), .rst_n(rst_n), .pc_next(pc_next), .pc_out(pc_out));

    // IF 
    assign pc_next = pc_out + 32'd4;
    if_stage IF0 (.clk(clk), .rst_n(rst_n), .pc_in(pc_out), .instr_in(instr_mem_data),
                  .if_instr(if_instr), .if_pc_plus4(if_pc_plus4));

    if_id_reg IFID (.clk(clk), .rst_n(rst_n), .if_instr(if_instr), .if_pc_plus4(if_pc_plus4),
                    .id_instr(id_instr), .id_pc_plus4(id_pc_plus4));

    id_stage ID0 (.instr(id_instr), .opcode(id_opcode), .rd(id_rd), .funct3(id_funct3),
                  .rs1(id_rs1), .rs2(id_rs2), .funct7(id_funct7), .imm_i(id_imm_i));

    // register file
    reg_file RF (.clk(clk), .rst_n(rst_n), .we(wb_reg_write), .rs1(id_rs1), .rs2(id_rs2),
                 .rd(wb_rd), .wd(wb_write_data), .rd1(reg_rs1), .rd2(reg_rs2));

    // ID/EX register
    id_ex_reg IDEX (.clk(clk), .rst_n(rst_n),
                    .id_opcode(id_opcode), .id_rd(id_rd), .id_funct3(id_funct3),
                    .id_funct7(id_funct7), .id_imm_i(id_imm_i),
                    .reg_rs1(reg_rs1), .reg_rs2(reg_rs2),
                    .ex_opcode(ex_opcode), .ex_rd(ex_rd), .ex_funct3(ex_funct3),
                    .ex_funct7(ex_funct7), .ex_imm_i(ex_imm_i),
                    .ex_rs1(ex_rs1), .ex_rs2(ex_rs2));

    // EX 
    ex_stage EX (.ex_rs1(ex_rs1), .ex_rs2(ex_rs2), .ex_imm_i(ex_imm_i),
                 .ex_opcode(ex_opcode), .ex_funct3(ex_funct3), .ex_funct7(ex_funct7),
                 .ex_alu_result(ex_alu_result), .ex_zero(ex_zero),
                 .ex_rd_out(ex_rd_out), .ex_mem_read(ex_mem_read),
                 .ex_mem_write(ex_mem_write), .ex_reg_write(ex_reg_write),
                 .ex_mem_to_reg(ex_mem_to_reg));

    // EX/MEM register
    ex_mem_reg EXMEM (.clk(clk), .rst_n(rst_n),
                      .ex_alu_result(ex_alu_result),
                      .ex_rs2(ex_rs2),
                      .ex_rd(ex_rd),
                      .ex_mem_read(ex_mem_read),
                      .ex_mem_write(ex_mem_write),
                      .ex_reg_write(ex_reg_write),
                      .ex_mem_to_reg(ex_mem_to_reg),
                      .mem_alu_result(mem_alu_result),
                      .mem_store_data(mem_store_data),
                      .mem_rd(mem_rd),
                      .mem_mem_read(mem_mem_read),
                      .mem_mem_write(mem_mem_write),
                      .mem_reg_write(mem_reg_write),
                      .mem_mem_to_reg(mem_mem_to_reg));

    // MEM 
    mem_stage MEM (.clk(clk), .rst_n(rst_n),
                   .mem_alu_result(mem_alu_result),
                   .mem_store_data(mem_store_data),
                   .mem_mem_read(mem_mem_read),
                   .mem_mem_write(mem_mem_write),
                   .data_addr(data_addr),
                   .data_wdata(data_wdata),
                   .data_we(data_we),
                   .data_re(data_re),
                   .data_rdata(data_rdata),
                   .mem_read_data(mem_read_data));

    // MEM/WB register
    mem_wb_reg MEMWB (.clk(clk), .rst_n(rst_n),
                      .mem_alu_result(mem_alu_result),
                      .mem_read_data(mem_read_data),
                      .mem_rd(mem_rd),
                      .mem_reg_write(mem_reg_write),
                      .mem_mem_to_reg(mem_mem_to_reg),
                      .wb_alu_result(wb_alu_result),
                      .wb_mem_read_data(wb_mem_read_data),
                      .wb_rd(wb_rd),
                      .wb_reg_write(wb_reg_write),
                      .wb_mem_to_reg(wb_mem_to_reg));

    // WB 
    wb_stage WB (.wb_alu_result(wb_alu_result), .wb_mem_read_data(wb_mem_read_data),
                 .wb_mem_to_reg(wb_mem_to_reg), .wb_write_data(wb_write_data));

    // drive writeback outputs
    // wb_rd and wb_reg_write already driven from MEMWB

endmodule
