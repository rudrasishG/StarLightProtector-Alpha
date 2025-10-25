// reg_file
module reg_file (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        we,
    input  wire [4:0]  rs1,
    input  wire [4:0]  rs2,
    input  wire [4:0]  rd,
    input  wire [31:0] wd,
    output wire [31:0] rd1,
    output wire [31:0] rd2
);
    reg [31:0] regs [0:31];
    integer i;

    // initialize regs on reset (optional)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (i=0; i<32; i=i+1) regs[i] <= 32'd0;
        end else begin
            if (we && rd != 5'd0) regs[rd] <= wd;
        end
    end

    assign rd1 = (rs1 != 5'd0) ? regs[rs1] : 32'd0;
    assign rd2 = (rs2 != 5'd0) ? regs[rs2] : 32'd0;
endmodule
