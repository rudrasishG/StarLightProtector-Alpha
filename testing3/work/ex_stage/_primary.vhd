library verilog;
use verilog.vl_types.all;
entity ex_stage is
    port(
        ex_rs1          : in     vl_logic_vector(31 downto 0);
        ex_rs2          : in     vl_logic_vector(31 downto 0);
        ex_imm_i        : in     vl_logic_vector(31 downto 0);
        ex_opcode       : in     vl_logic_vector(6 downto 0);
        ex_funct3       : in     vl_logic_vector(2 downto 0);
        ex_funct7       : in     vl_logic_vector(6 downto 0);
        ex_alu_result   : out    vl_logic_vector(31 downto 0);
        ex_zero         : out    vl_logic;
        ex_rd_out       : out    vl_logic_vector(4 downto 0);
        ex_mem_read     : out    vl_logic;
        ex_mem_write    : out    vl_logic;
        ex_reg_write    : out    vl_logic;
        ex_mem_to_reg   : out    vl_logic
    );
end ex_stage;
