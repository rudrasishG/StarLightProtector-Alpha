library verilog;
use verilog.vl_types.all;
entity mem_wb_reg is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        mem_alu_result  : in     vl_logic_vector(31 downto 0);
        mem_read_data   : in     vl_logic_vector(31 downto 0);
        mem_rd          : in     vl_logic_vector(4 downto 0);
        mem_reg_write   : in     vl_logic;
        mem_mem_to_reg  : in     vl_logic;
        wb_alu_result   : out    vl_logic_vector(31 downto 0);
        wb_mem_read_data: out    vl_logic_vector(31 downto 0);
        wb_rd           : out    vl_logic_vector(4 downto 0);
        wb_reg_write    : out    vl_logic;
        wb_mem_to_reg   : out    vl_logic
    );
end mem_wb_reg;
