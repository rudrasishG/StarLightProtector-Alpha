// simple alu ,hopefully i'll make it low powered just because i can

module alu(
	input wire [31:0] a,
	input wire [31:0] b,
	input wire [3:0] ctrl,
	output reg [31:0] out,
	output wire zero
);
	always @(*) begin
		case (ctrl)
			4'b0010: out=a+b;
			4'b0110: out=a-b;
			4'b0000: out=a&b;
			4'b0001: out=a|b;
			4'b1100: out=a^b;
			4'b0111: out=(a<b)? 32'd1: 32'd0;
			default : out= 32'd0;
		endcase
	end
	assign zero=(out ==32'd0);
endmodule
