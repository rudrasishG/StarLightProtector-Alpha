library verilog;
use verilog.vl_types.all;
entity id_ex_reg is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        id_opcode       : in     vl_logic_vector(6 downto 0);
        id_rd           : in     vl_logic_vector(4 downto 0);
        id_funct3       : in     vl_logic_vector(2 downto 0);
        id_funct7       : in     vl_logic_vector(6 downto 0);
        id_imm_i        : in     vl_logic_vector(31 downto 0);
        reg_rs1         : in     vl_logic_vector(31 downto 0);
        reg_rs2         : in     vl_logic_vector(31 downto 0);
        ex_opcode       : out    vl_logic_vector(6 downto 0);
        ex_rd           : out    vl_logic_vector(4 downto 0);
        ex_funct3       : out    vl_logic_vector(2 downto 0);
        ex_funct7       : out    vl_logic_vector(6 downto 0);
        ex_imm_i        : out    vl_logic_vector(31 downto 0);
        ex_rs1          : out    vl_logic_vector(31 downto 0);
        ex_rs2          : out    vl_logic_vector(31 downto 0)
    );
end id_ex_reg;
