`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NA
// Engineer: Leife
// 
// Create Date: 11/10/2025 11:44:01 AM
// Design Name: 
// Module Name: three_bit_binary_adder
// Project Name: BLAH BLAH
// Target Devices: PYNQ Z2
// Tool Versions: VIVADO 2025.2
// Description: a 3 bit binary adder
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module half_adder(input a, input b , output sum, output carry);
    //declare whats an input and whats an output
  
    assign sum = a ^ b;
    assign carry = a & b;
    
endmodule

module full_adder(input a, input b, input carry_in, output sum_out, output carry_out);
    // what are wires that go from the half adder to the full adder or from one adder to another 
    //make sure the wiring is not named the same thing as the inputs these function as a way to tell vivado 'hey connect this to this'
    //declare a wire for the half adder intermediate values 
    
    wire s1,c1,c2;
    
    half_adder ha_one( .a(a), 
                       .b(b), 
                       .sum(s1), 
                       .carry(c1) 
                       );
    
    half_adder ha_two( .a(s1), 
                       .b(carry_in), 
                       .sum(sum_out), 
                       .carry(c2) 
                       );
    assign carry_out = c1 | c2;
endmodule

module three_bit_binary_adder(
input [2:0] a, 
input [2:0] b, 
input  c_in, 
output [2:0] sum, 
output carry_out);

//declare wires to connect the full adders
wire c1, c2; 

// now we're going to call the full adders
full_adder fa1( .a( a[0]), 
                .b( b[0]), 
                .carry_in(c_in), 
                .sum_out(sum[0]), 
                .carry_out(c1));

full_adder fa2 (.a( a[1]), 
                .b( b[1]), 
                .carry_in(c1), 
                .sum_out(sum[1]), 
                .carry_out(c2)
                );

full_adder fa3 (.a( a[2]), 
                .b( b[2]), 
                .carry_in(c2), 
                .sum_out(sum[2]), 
                .carry_out(carry_out));
                
endmodule 

