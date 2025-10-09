// IF/ID pipeline register
module if_id_reg(
	input wire clk,
	input wire rst_n,
	input wire [31:0] if_instr,
	input wire [31:0] if_pc_plus4,
	output reg [31:0] id_instr,
	output reg [31:0] id_pc_plus4
);
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			id_instr <= 32'd0;
			id_pc_plus4 <=32'd0;
		end else begin
			id_instr <=if_instr;
			id_pc_plus4 <= if_pc_plus4;
		end
	end
endmodule 