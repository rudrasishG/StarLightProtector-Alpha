//instruction rom 
module instr_mem(
	input wire [31:0] addr,
	output reg [31:0] instr
);
	reg [31:0] mem [0:255];
	integer i;
	initial begin
		for(i=0;i<256;i++)
			mem[i]=32'h00000013;
		end
		always @(*) instr=mem[addr[9:2]];
endmodule		