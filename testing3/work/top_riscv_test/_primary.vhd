library verilog;
use verilog.vl_types.all;
entity top_riscv_test is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic
    );
end top_riscv_test;
