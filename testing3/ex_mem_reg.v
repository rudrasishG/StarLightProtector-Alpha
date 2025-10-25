// ex_mem_reg
module ex_mem_reg (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] ex_alu_result,
    input  wire [31:0] ex_rs2,
    input  wire [4:0]  ex_rd,
    input  wire        ex_mem_read,
    input  wire        ex_mem_write,
    input  wire        ex_reg_write,
    input  wire        ex_mem_to_reg,
    output reg  [31:0] mem_alu_result,
    output reg  [31:0] mem_store_data,
    output reg  [4:0]  mem_rd,
    output reg         mem_mem_read,
    output reg         mem_mem_write,
    output reg         mem_reg_write,
    output reg         mem_mem_to_reg
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mem_alu_result <= 32'd0;
            mem_store_data <= 32'd0;
            mem_rd <= 5'd0;
            mem_mem_read <= 1'b0;
            mem_mem_write <= 1'b0;
            mem_reg_write <= 1'b0;
            mem_mem_to_reg <= 1'b0;
        end else begin
            mem_alu_result <= ex_alu_result;
            mem_store_data <= ex_rs2;
            mem_rd <= ex_rd;
            mem_mem_read <= ex_mem_read;
            mem_mem_write <= ex_mem_write;
            mem_reg_write <= ex_reg_write;
            mem_mem_to_reg <= ex_mem_to_reg;
        end
    end
endmodule
