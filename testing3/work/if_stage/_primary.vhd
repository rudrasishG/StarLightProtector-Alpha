library verilog;
use verilog.vl_types.all;
entity if_stage is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        pc_in           : in     vl_logic_vector(31 downto 0);
        instr_in        : in     vl_logic_vector(31 downto 0);
        if_instr        : out    vl_logic_vector(31 downto 0);
        if_pc_plus4     : out    vl_logic_vector(31 downto 0)
    );
end if_stage;
