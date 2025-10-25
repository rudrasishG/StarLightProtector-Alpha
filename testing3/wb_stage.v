// wb_stage
module wb_stage (
    input  wire [31:0] wb_alu_result,
    input  wire [31:0] wb_mem_read_data,
    input  wire        wb_mem_to_reg,
    output wire [31:0] wb_write_data
);
    assign wb_write_data = wb_mem_to_reg ? wb_mem_read_data : wb_alu_result;
endmodule
