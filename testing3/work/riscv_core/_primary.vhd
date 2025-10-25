library verilog;
use verilog.vl_types.all;
entity riscv_core is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        instr_mem_data  : in     vl_logic_vector(31 downto 0);
        pc_out          : out    vl_logic_vector(31 downto 0);
        data_addr       : out    vl_logic_vector(31 downto 0);
        data_wdata      : out    vl_logic_vector(31 downto 0);
        data_we         : out    vl_logic;
        data_re         : out    vl_logic;
        data_rdata      : in     vl_logic_vector(31 downto 0)
    );
end riscv_core;
