// mem_stage
module mem_stage (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] mem_alu_result,
    input  wire [31:0] mem_store_data,
    input  wire        mem_mem_read,
    input  wire        mem_mem_write,
    output reg  [31:0] data_addr,
    output reg  [31:0] data_wdata,
    output reg         data_we,
    output reg         data_re,
    input  wire [31:0] data_rdata,
    output reg  [31:0] mem_read_data 
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_addr <= 32'd0;
            data_wdata <= 32'd0;
            data_we <= 1'b0;
            data_re <= 1'b0;
            mem_read_data <= 32'd0;
        end else begin
            data_we <= 1'b0;
            data_re <= 1'b0;
            if (mem_mem_write) begin
                data_addr <= mem_alu_result;
                data_wdata <= mem_store_data;
                data_we <= 1'b1;
            end else if (mem_mem_read) begin
                data_addr <= mem_alu_result;
                data_re <= 1'b1;
                mem_read_data <= data_rdata;
            end
        end
    end
endmodule
