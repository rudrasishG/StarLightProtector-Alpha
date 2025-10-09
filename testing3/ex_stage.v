// execute stage
module ex_stage(
	input wire [31:0] ex_rs1,
	input wire [31:0] ex_rs2,
	input wire [31:0] ex_imm_i,
	input wire [6:0] ex_opcode,
	input wire [2:0] ex_funct3,
	input wire [6:0] ex_funct7,
	output wire[31:0] ex_alu_result,
	output wire ex_zero,
	output reg [4:0] ex_rd_out,
	output reg ex_mem_read,
	output reg ex_mem_write,
	output reg ex_reg_write,
	output reg ex_mem_to_reg
);
	reg [3:0] alu_ctrl;
	reg alu_src;
	reg [31:0] operand_b;
	
	always @(*) begin
		alu_ctrl= 4'b0010;
		alu_src =1'b0;
		ex_mem_read= 1'b0;
		ex_mem_write= 1'b0;
		ex_reg_write =1'b0;
		ex_mem_to_reg =1'b0;
		case(ex_opcode)
			7'b0110011:begin //R-type
				ex_reg_write=1'b1;
				if(ex_funct3 == 3'b000 && ex_funct7==7'b0000000)
					alu_ctrl=4'b0010; //add
				else if(ex_funct3==3'b000 && ex_funct7==7'b0100000)
					alu_ctrl=4'b0110; //sub
				else if(ex_funct3==3'b111)
					alu_ctrl=4'b0000; //and
				else if(ex_funct3==3'b110)
					alu_ctrl=4'b0001; //or 
			end
			7'b0010011:begin //add i
				ex_reg_write=1'b1;
				alu_src=1'b1;
				alu_ctrl=4'b0010;
			end
			7'b0100011:begin //sw
				ex_mem_write=1'b1;
				alu_src=1'b1;
				alu_ctrl= 4'b0010;
			end
			7'b0000011:begin //lw
				ex_mem_read=1'b1;
				ex_reg_write=1'b1;
				ex_mem_to_reg=1'b1;
				alu_src=1'b1;
				alu_ctrl=4'b0010;
			end
			default:begin
			end
		endcase
	end
	always @(*) begin	
		operand_b=alu_src ? ex_imm_i: ex_rs2;
	end
	// ALU instance
	alu ALU0(
		.a(ex_rs1),
		.b(operand_b),
		.ctrl(alu_ctrl),
		.out(ex_alu_result),
		.zero(ex_zero)
	);
	
	always @(*) begin
		ex_rd_out=5'd0;
		ex_rd_out= ex_rd_out; //CHANGE LATER CHANGE LATER
	end
endmodule

	
			
		
		
	
	