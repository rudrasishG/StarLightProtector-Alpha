// instruction decode stage
module id_stage(
	input wire[31:0] instr,
	output reg [6:0] opcode,
	output reg [4:0] rd,
	output reg [2:0] funct3,
	output reg [4:0] rs1,
	output reg [4:0] rs2,
	output reg [6:0] funct7,
	output reg [31:0] imm_i
);
	always@(*) begin
		opcode= instr[6:0];
		rd=instr[11:7];
		funct3= instr[14:12];
		rs1=instr[19:15];
		rs2= instr[24:20];
		funct7= instr[31:25];
		imm_i ={{20{instr[31]}},instr[31:20]};
	end
endmodule	