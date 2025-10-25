`timescale 1ns/1ps

module top_riscv_test_tb;

    reg clk;
    reg rst_n;

    // Instantiate the top-level module
    top_riscv_test uut (
        .clk(clk),
        .rst_n(rst_n)
    );

    // Clock generation: 50 MHz = 20 ns period
    always #10 clk = ~clk;

    // Reset sequence
    initial begin
        clk = 0;
        rst_n = 0;
        #100;           // hold reset for 100 ns
        rst_n = 1;      // release reset
    end

    // Run simulation and monitor key signals
    initial begin
        $display("Starting RISC-V CPU simulation...");
        $monitor($time, " | rst_n=%b | PC=%h | INSTR=%h", rst_n, uut.pc_out, uut.instr_mem_data);

        // Run for some cycles
        #2000;  // adjust this depending on your instruction memory depth
        $finish;
    end

    // Optional waveform dump for GTKWave
    initial begin
        $dumpfile("riscv_core_tb.vcd");
        $dumpvars(0, top_riscv_test_tb);
    end

endmodule
