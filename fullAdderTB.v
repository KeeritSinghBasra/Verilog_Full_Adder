`timescale 1ns / 1ps
module tb_full_adder;

    // Declare testbench signals
    reg a, b, c_in;
    wire sum, carry_out;

    // Instantiate the full adder module
    full_adder dut (a, b, c_in, sum, carry_out);

    // Dumpfile and dumpvars for waveform generation
    initial begin
        $dumpfile("fullAdderTB.vcd");      // Specify dump file name
        $dumpvars(0, tb_full_adder);        // Dump all signals in the testbench
    end

    // Task to apply a test case and automatically check the result
    task check_case;
        input a_in, b_in, cin_in;
        input expected_sum, expected_carry;
        begin
            a = a_in;
            b = b_in;
            c_in = cin_in;
            #10;
            if (sum === expected_sum && carry_out === expected_carry) begin
                $display("PASS: a = %b, b = %b, c_in = %b, sum = %b, carry_out = %b",
                          a, b, c_in, sum, carry_out);
            end else begin
                $display("FAIL: a = %b, b = %b, c_in = %b, sum = %b, carry_out = %b (expected sum = %b, carry_out = %b)",
                          a, b, c_in, sum, carry_out, expected_sum, expected_carry);
            end
        end
    endtask

    // Apply test stimulus
    initial begin
        $display("Testing Full Adder");

        // a, b, c_in, expected_sum, expected_carry_out
        check_case(0, 0, 0,   0, 0);
        check_case(0, 0, 1,   1, 0);
        check_case(0, 1, 0,   1, 0);
        check_case(0, 1, 1,   0, 1);
        check_case(1, 0, 0,   1, 0);
        check_case(1, 0, 1,   0, 1);
        check_case(1, 1, 0,   0, 1);
        check_case(1, 1, 1,   1, 1);

        $finish;
    end

endmodule