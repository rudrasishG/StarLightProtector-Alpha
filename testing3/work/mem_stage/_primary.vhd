library verilog;
use verilog.vl_types.all;
entity mem_stage is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        mem_alu_result  : in     vl_logic_vector(31 downto 0);
        mem_store_data  : in     vl_logic_vector(31 downto 0);
        mem_mem_read    : in     vl_logic;
        mem_mem_write   : in     vl_logic;
        data_addr       : out    vl_logic_vector(31 downto 0);
        data_wdata      : out    vl_logic_vector(31 downto 0);
        data_we         : out    vl_logic;
        data_re         : out    vl_logic;
        data_rdata      : in     vl_logic_vector(31 downto 0);
        mem_read_data   : out    vl_logic_vector(31 downto 0)
    );
end mem_stage;
