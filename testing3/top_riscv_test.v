module top_riscv_test (
    input  wire clk,
    input  wire rst_n
);
    // Internal wires connecting CPU and instruction memory
    wire [31:0] pc_out;
    wire [31:0] instr_mem_data;

    // Dummy data memory wires (not implemented yet)
    wire [31:0] data_addr;
    wire [31:0] data_wdata;
    wire        data_we;
    wire        data_re;
    wire [31:0] data_rdata;

    // For now, tie data memory input to zero to avoid floating signals
    assign data_rdata = 32'b0;

    // -----------------------------
    // Instruction Memory
    // -----------------------------
    instr_mem imem (
        .addr(pc_out),
        .instr(instr_mem_data)
    );

    // -----------------------------
    // RISC-V Core
    // -----------------------------
    riscv_core cpu (
        .clk(clk),
        .rst_n(rst_n),
        .instr_mem_data(instr_mem_data),
        .pc_out(pc_out),
        .data_addr(data_addr),
        .data_wdata(data_wdata),
        .data_we(data_we),
        .data_re(data_re),
        .data_rdata(data_rdata)
    );

endmodule

