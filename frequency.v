`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2021 10:37:39 AM
// Design Name: 
// Module Name: frequency
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


module frequency(
     // The inputs are...
     input clock,          // 100 MHz clock signal from the Basys3 oscillator
     input flag,       // Enable bit to turn this module ON from another module //basically flag
     input colorsignal, // The signal we're counting the frequency of //IN for Rice's source
     // The outputs are...
     output reg [32:0] freq = 33'b0,    // The frequency we found for the input signal
     output reg finish = 0 // Done flag so that we can tell that this module has finished counting the frequency of the signal

          
      ); 
     reg[32:0] positive_count = 33'b0;
     reg [32:0] pos_neg_count = 33'b0;
     reg last_state = 0; //last

     // 100 million / 16 = 6250k
     localparam max = 'd6250000;

     // Flip-flop stores last value in register. We'll be using this to detect
     // the positive edges of the incoming signal
     always @(posedge clock)
          last_state <= colorsignal;

     always @ (posedge clock)
     begin
     finish = 0;
          if(~flag) begin //when the frequency sub module is not called, make everything ZERO       
               freq = 0;
               pos_neg_count= 0;
               positive_count= 0;
               finish= 0;
          end
          else begin
               if (positive_count< max)
               begin
                    positive_count <= positive_count + 1;
                    if(~finish & colorsignal)
                         pos_neg_count <= pos_neg_count + 1;
               end
               else begin
                    
                    freq = 0;
                   
                    freq = pos_neg_count;
                   
                    pos_neg_count = 0;
                  
                    positive_count= 0;
                    
                    finish = 1;
               end
               end
               end
endmodule

    

