`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2021 04:43:56 PM
// Design Name: 
// Module Name: motor_testbench
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


module motor_testbench(

    );
    reg vin1;
    reg vin2;
    reg [3:0] sw;
    reg clock1;
    reg [3:0]sw2;
    wire [7:0] led;
    wire [3:0] in;
    wire ena;
    wire enb;
    wire [3:0] an;
    wire [6:0] seg;
    Motor TB1(vin1, vin2,sw, clock1, sw2, in, led, ena, enb,an,seg);// sw[0] as A,outA as led[0],outB as port[0]
   
    initial begin
    clock1=0;
    vin1= 0;
    vin2=0;
    sw=1;
    sw2=2;
    #100
    vin1= 0;
    vin2=1;
    sw=9;
    sw2=1;
    #100
    vin1= 1;
    vin2=0;
    sw=6;
    sw2=4;
    #100
    vin1= 1;
    vin2=1;
    sw=10;
    sw2=8;
    
    end
    
   always begin
   #10 clock1=~clock1;
   end
 
 
    
    
endmodule
