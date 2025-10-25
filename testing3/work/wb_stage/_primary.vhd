library verilog;
use verilog.vl_types.all;
entity wb_stage is
    port(
        wb_alu_result   : in     vl_logic_vector(31 downto 0);
        wb_mem_read_data: in     vl_logic_vector(31 downto 0);
        wb_mem_to_reg   : in     vl_logic;
        wb_write_data   : out    vl_logic_vector(31 downto 0)
    );
end wb_stage;
