// Instruction fetch stage
module if_stage(
	input wire clk,
	input wire rst_n,
	input wire [31:0] pc_in,
	input wire [31:0] instr_in,
	output reg [31:0] if_instr,
	output reg [31:0] if_pc_plus4
);
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			if_instr <=32'd0;
			if_pc_plus4 <=32'd0;
		end else begin
			if_instr <= instr_in;
			if_pc_plus4 <=pc_in +32'd4;
		end
	end
endmodule
		