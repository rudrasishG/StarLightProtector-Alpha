// ID/EX pipeline register 

module id_ex_reg(
	input wire clk,
	input wire rst_n,
	input wire [6:0] id_opcode,
	input wire [4:0] id_rd,
	input wire [2:0] id_funct3,
	input wire [6:0] id_funct7,
	input wire [31:0] id_imm_i,
	input wire [31:0] reg_rs1,
	input wire [31:0] reg_rs2,
	output reg [6:0] ex_opcode,
	output reg [4:0] ex_rd,
	output reg [2:0] ex_funct3,
	output reg [6:0] ex_funct7,
	output reg [31:0] ex_imm_i,
	output reg [31:0] ex_rs1,
	output reg [31:0] ex_rs2
);
	always @(posedge clk or negedge rst_n) begin
		if( !rst_n) begin
			ex_opcode <= 7'd0;
			ex_rd <= 5'd0;
			ex_funct3 <= 3'd0;
			ex_funct7 <= 7'd0;
			ex_imm_i <=32'd0;
			ex_rs1 <= 32'd0;
			ex_rs2 <= 32'd0;
		end else begin
			ex_opcode <=id_opcode;
			ex_rd <=id_rd;
			ex_funct3 <= id_funct3;
			ex_funct7 <= id_funct7;
			ex_imm_i <= id_imm_i;
			ex_rs1 <= reg_rs1;
			ex_rs2 <=reg_rs2;
		end
	end
endmodule
			
	