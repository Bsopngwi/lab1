`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2021 11:21:48 AM
// Design Name: 
// Module Name: Path_Sensor_tb
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


module Path_Sensor_tb(
 );
 reg sw;
reg [1:0] sensor;
reg sensor3;//left
reg clock;
reg object_sensor;
 wire reg [3:0] in;
wire reg[3:0] led;
//color input
reg colorsignal;
wire reg S0;
wire reg S1;
wire reg S2;
wire reg S3;
wire reg [3:0] an; //anode
wire reg [6:0] seg;
wire enA;
wire enB;

Path_Sensor F1(sensor,sensor3,clock,object_sensor,in, led,colorsignal,S0,S1,S2,S3);
 
 initial begin
    clock1=0;
    S0=1;
    S1=0;
    colorsignal=1;
    S2=0;
    S3=1;
    #100000
    sensor[1]= 0;
    sensor[2]=0;
    #100000
    sensor[1]= 0;
    sensor[2]=1;
    #100000
    sensor[1]= 1;
    sensor[2]=0;
    #100000
    
    object_sensor=1;
    #100000 
    sensor[1]= 1;
    sensor[2]=0;
    end
    
   always begin
   #10 clock1=~clock1;
   end
 
   
endmodule

