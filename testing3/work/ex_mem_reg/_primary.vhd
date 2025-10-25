library verilog;
use verilog.vl_types.all;
entity ex_mem_reg is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        ex_alu_result   : in     vl_logic_vector(31 downto 0);
        ex_rs2          : in     vl_logic_vector(31 downto 0);
        ex_rd           : in     vl_logic_vector(4 downto 0);
        ex_mem_read     : in     vl_logic;
        ex_mem_write    : in     vl_logic;
        ex_reg_write    : in     vl_logic;
        ex_mem_to_reg   : in     vl_logic;
        mem_alu_result  : out    vl_logic_vector(31 downto 0);
        mem_store_data  : out    vl_logic_vector(31 downto 0);
        mem_rd          : out    vl_logic_vector(4 downto 0);
        mem_mem_read    : out    vl_logic;
        mem_mem_write   : out    vl_logic;
        mem_reg_write   : out    vl_logic;
        mem_mem_to_reg  : out    vl_logic
    );
end ex_mem_reg;
