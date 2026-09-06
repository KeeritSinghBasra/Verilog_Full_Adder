## About
This project implements a full adder in Verilog, one of the fundamental building blocks of digital arithmetic, and verifies its correctness through simulation.

"fullAdder.v" contains the actual full adder design. It takes three single-bit inputs ("a", "b", and a carry-in "c_in") and produces two outputs: "sum", calculated using an XOR of all three inputs, and "carry_out", which is set to 1 whenever at least two of the three inputs are 1.

"fullAdderTB.v" is the testbench used to verify that design. Rather than manually checking outputs, it automatically drives every one of the 8 possible input combinations into the full adder, compares the actual outputs against the expected values, and prints a PASS or FAIL result for each case. It also generates a waveform file, which can be viewed in GTKWave to visually confirm the circuit's behaviour over time.

Together, these two files demonstrate a complete design-and-verification cycle: implementing the logic, then proving it works correctly across every possible case rather than assuming correctness from a handful of examples.



## How to run
Using Icarus Verilog, run the following commands in order:

1. Compile the design and testbench together: iverilog -o fullAdderTB.vvp fullAdder.v fullAdderTB.v
2. Run the simulation: vvp fullAdderTB.vvp
3. (Optional) View the waveform in GTKWave: gtkwave fullAdderTB.vcd

You should see a PASS result printed for each of the 8 possible input combinations.



## Files
- "fullAdder.v" — the full adder design (sum and carry-out logic)
- "fullAdderTB.v" — self-checking testbench that runs all 8 input combinations and prints PASS/FAIL for each



## Tools used
- Icarus Verilog — compiling and simulating the design
- GTKWave — viewing the simulation waveform



## What's next
This was my first step into learning Verilog. I'm planning to build on it with more complex combinational and sequential circuits as I continue learning digital design.
