`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 08:55:41 PM
// Design Name: 
// Module Name: multiplexer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module multiplexer(data_in, select,data_out);
    input [7:0] data_in;                                                              
    input [2:0] select;                           
    output reg data_out;                                              
                        
                                                  
    always @(select)                         
        begin
        case(select)                                                                
        3'b000: data_out= data_in[0]; //1         
        3'b001: data_out= data_in[1]; //2         
        3'b010: data_out= data_in[2]; //3         
        3'b011: data_out= data_in[3]; //4         
        3'b100: data_out= data_in[4]; //5         
        3'b101: data_out= data_in[5]; //6         
        3'b110: data_out= data_in[6]; //7         
        3'b111: data_out= data_in[7]; //8   
        default: data_out = 1'b00;      
        endcase 
        end                                       
endmodule                                       
