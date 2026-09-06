`timescale 1ns / 1ps
module full_adder (
    input a,
    input b,
    input c_in,
    output wire sum,
    output wire carry_out
    );
    
    // sum is XOR of all 3 inputs, gives 1 when an odd number of inputs are 1
    assign sum = a ^ b ^ c_in;

    // carry_out is 1 if at least 2 of the 3 inputs are 1
    assign carry_out = (a & b) | (a & c_in) | (c_in & b);

endmodule
