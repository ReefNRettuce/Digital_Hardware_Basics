`timescale 1ns / 1ps

// --- 1. The Module Declaration ---
// A testbench module is the "top level" of the simulation.
// It has no inputs or outputs of its own.
module tb_three_bit_binary_adder;

    // --- 2. Internal Signals ("Wires") ---
    // We need 'reg' types for signals we will *control* from the testbench (inputs).
    // We need 'wire' types for signals we will *observe* from the DUT (outputs).
    
    // Inputs to the DUT (use 'reg')
    reg  [2:0] tb_a;
    reg  [2:0] tb_b;
    reg  tb_c_in;
    
    // Outputs from the DUT (use 'wire')
    wire [2:0] tb_sum;
    wire tb_c_out;


    // --- 3. The DUT Instantiation ---
    // This is where you "place" your adder hardware inside the testbench.
    // We use the "port mapping by name" syntax to connect our 'reg's
    // and 'wire's to the adder's ports.
    three_bit_binary_adder dut_adder (
        .a(tb_a),             // Connects the module's 'a' port to our 'tb_a' reg
        .b(tb_b),             // Connects the module's 'b' port to our 'tb_b' reg
        .c_in(tb_c_in),       // Connects the 'c_in' port to our 'tb_c_in' reg
        .sum(tb_sum),         // Connects the 'sum' port to our 'tb_sum' wire
        .carry_out(tb_c_out)  // Connects the 'carry_out' port to our 'tb_c_out' wire
    );


    // --- 4. The Stimulus Block ---
    // This 'initial' block starts at time 0 and runs *once*.
    // Its job is to provide the "test vectors" (input values)
    // and tell the simulation when to stop.
    initial begin
        // '$display' is like 'printf' or 'cout' for simulation.
        // It prints to the Tcl Console in Vivado.
        $display("Starting 3-bit Adder Testbench...");

        // Test Case 1: 0 + 0, with carry-in = 0
        // Expected: sum = 0, carry = 0
        tb_a = 3'b000;    // Set 3-bit 'a' to 000
        tb_b = 3'b000;    // Set 3-bit 'b' to 000
        tb_c_in = 1'b0;   // Set 1-bit 'c_in' to 0
       
        #20 ;              // Wait 10 nanoseconds for the logic to settle
        $display("tb_a & tb_b: ",tb_a, " ",tb_b);
        $display("tb_sum =", tb_sum);
        $display("tb_cout =", tb_c_out);
        
        // Test Case 2: 3 + 2, with carry-in = 0
        // 3'b011 + 3'b010 = 5 (3'b101).
        // Expected: sum = 5 (101), carry = 0
        tb_a = 3'b011;
        tb_b = 3'b010;
        tb_c_in = 1'b0;
        #20 ;              // Wait 10 ns
        $display("tb_a & tb_b: ",tb_a, " ",tb_b);
        $display("tb_sum =", tb_sum);
        $display("tb_cout =", tb_c_out);
        // Test Case 3: 5 + 3, with carry-in = 1
        // 5 (3'b101) + 3 (3'b011) + 1 = 9 (4'b1001)
        // Expected: sum = 1 (001), carry = 1
        tb_a = 3'b101;
        tb_b = 3'b011;
        tb_c_in = 1'b1;
        #20 ;              // Wait 10 ns
        $display("tb_a & tb_b: ",tb_a, " ",tb_b);
        $display("tb_sum =", tb_sum);
        $display("tb_cout =", tb_c_out);

        // Test Case 4: Full roll-over (7 + 7 + 1)
        // 7 (3'b111) + 7 (3'b111) + 1 = 15 (4'b1111)
        // Expected: sum = 7 (111), carry = 1
        tb_a = 3'b111;
        tb_b = 3'b111;
        tb_c_in = 1'b1;
        #20 ;              // Wait 10 ns
        $display("tb_a & tb_b: ",tb_a, " ",tb_b);
        $display("tb_sum =", tb_sum);
        $display("tb_cout =", tb_c_out);
        
        $display("All test cases complete. Finishing simulation.");
        
        $finish; // Tell the simulator to stop.
    end

endmodule