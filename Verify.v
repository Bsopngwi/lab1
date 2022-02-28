//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 09/03/2021 07:48:50 AM
//// Design Name: 
//// Module Name: Buffer1
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////


//module Buffer1(A,outA,outB);

//    input A;
//    output outA;
//    output outB;
//    assign outA = A;
//    assign outB = A;
    
//endmodule





//module Motor(
//input vin1,
//input vin2,
//input [3:0] sw,
//input clock,
//input [3:0] sw2, 
//output [3:0] in,
//output [7:0] led,

//output enA,
//output enB,

//output reg [3:0] an,
//output reg [6:0] seg

//);

////---Enabling IN1,IN2,IN3,IN4

//Buffer1 in1(sw[0],in[0],led[0]);// sw[0] as A,outA as port[0],outB as led[0]
//Buffer1 in2(sw[1],in[1],led[1]);//right
//Buffer1 in3(sw[2],in[2],led[2]);
//Buffer1 in4(sw[3],in[3],led[3]);//left



//reg [20:0] counter;//21 bit how long the cycle will be 
//reg [20:0] width;//21 bit too
//reg temp_PWM;


//initial begin
//counter=0;
//width =0;
//temp_PWM =0;
//end
////--- PWM Speed Control
//always@(posedge clock) begin
//if (counter>2097152)//reseting counter
//counter<=0;
//else
//counter<=counter+1;

//if (counter < width )
//temp_PWM<=1;
//else
//temp_PWM<=0;
//end

//always@(*) begin
//case(sw2)

//4'b0001: width= 21'd524288;//25%
//4'b0010: width= 21'd1048576;//50%
//4'b0100: width= 21'd1572864;//70%
//4'b1000: width= 21'd1782579;//85%


//default: width=21'd0;

//endcase 
//end
////---Led Display -------
//reg [18:0] count2;
//     always @ (posedge clock)
//          count2 = count2 + 1;

//     // This wire is driven by the 2 MSBs of the counter. We'll use it to
//     // refresh the display.
//     wire [1:0] refresh;
//     assign refresh = count2[18:17];

//     // Usually always @ * is not recommended because it's resource intensive
//     // and usually unnecessary, and if you're not careful it will cause timing
//     // issues. This isn't an issue for a simple program like this though.
//     always @ (*)
//          case(refresh)
//          2'b00:
//               begin
//                    an = 4'b0111;
//                    case(sw)
//                    4'b0001:
//               begin
                    
                    
//                    seg = 7'b0001110;//f
                   
                    
//               end
               

//           4'b0010:
//               begin
                    
//                    seg = 7'b0000011; //b
//               end
               
//           4'b0100:
//               begin
                    
//                    seg = 7'b0000011; //b
//               end
//           4'b1000:
//               begin
                  
//                    seg = 7'b0001110; //f
//               end
//           4'b0110:
//               begin
                    
//                    seg = 7'b0000011; //b
//               end
//             4'b1001:
//               begin
                   
//                    seg = 7'b0001110; //f
//               end
               
//               default: seg = 7'b1111111;
//               endcase
//               end
              
//          2'b01:
//               begin//current control
//                    an = 4'b1011;
//                   if ((vin1||vin2)>=1)
//                   begin
//                   seg=7'b0100011;//o
//                   end
//                   if ((vin1||vin2)==0)
//                   begin
//                   seg=7'b1000001;//U
//                   end


//               end
//          2'b10:
//               begin
//                    an = 4'b1101;
//                    case(sw2)
//                    4'b0001:
//               begin
                    
                    
//                    seg = 7'b0100100;//2
                   
                    
//               end
               

//           4'b0010:
//               begin
                    
//                    seg = 7'b0010010;//5
//               end
               
//           4'b0100:
//               begin
                    
//                    seg = 7'b1111000; //7
//               end
//           4'b1000:
//               begin
                  
//                   seg = 7'b0000000; //8
//               end
           
               
//               default: seg = 7'b1111111;
//               endcase
//               end
               
//          2'b11:
//               begin
//                    an = 4'b1110;
                   
//               case(sw2)
//                    4'b0001:
//               begin
                    
                    
//                  seg = 7'b0010010;//5
                   
                    
//               end
               

//           4'b0010:
//               begin
                    
//                    seg = 7'b1000000;//0
//               end
               
//           4'b0100:
//               begin
                    
//                    seg = 7'b0010010;//5
//               end
//           4'b1000:
//               begin
                  
//                   seg = 7'b0010010;//5
//               end
//               default: seg = 7'b1111111;
           
//          endcase
//          end
//          endcase
          

//assign enA=temp_PWM;
//assign enB=temp_PWM;

//assign led[4]=sw2[0];
//assign led[5]=sw2[1];
//assign led[6]=sw2[2];
//assign led[7]=sw2[3];








//endmodule 
