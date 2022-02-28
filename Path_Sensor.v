`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2021 01:23:42 PM
// Design Name: 
// Module Name: Path_Sensor
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
module Path_Sensor(
//input sw,
input [1:0]sw,
input [1:0] sensor,
input  sensor3,//left
input clock,
input  object_sensor,
output reg [3:0] in,
output [4:0] led,
//color input
input colorsignal,
output S0,
output S1,
output reg S2,
output reg S3,
output reg [3:0] an, //anode
output reg [6:0] seg,
output enA,
output enB);

assign led[0]=~sensor[0];
assign led[1]=~sensor[1];
assign led[3]=object_sensor ;
assign led[2]=~sensor3;

//========================== P W M ======================================
 reg [20:0] counter; //2^20 = 2,097,152 //also using count for the resfresh
    reg [20:0] width; //width of pulse or duty cycle 
    reg temp_PWM2; 
    reg PWM; 
    initial
    begin
        counter = 0;
        width = 0; //524288; //5% of 2^20 = 104,857
        temp_PWM2 = 0;
        PWM=0;
    end
    
 always@(posedge clock)begin
if (counter>4761905)
 counter<=0;
 else
 counter<=counter+1;
 if (counter < width )
 PWM<=1;
 else
 PWM<=0;

end

parameter move =0;
parameter break = 1;
parameter  slowly= 2;
parameter path = 3;
parameter object = 4;
  
reg [4:0] pathstate = move;
always@(posedge clock) begin
case(pathstate)
move:
begin
in[0]=0;
in[3]=0;
in[1]=0;
in[2]=0;
temp_PWM2=0;
//notice=0;
if (start==1)
begin
//width=21'd1048576;
case(sensor)

2'b01:
begin //left sensor greater than right clock//left turn

in[1]=0;
in[2]=1;
in[0]=1;
in[3]=0;
temp_PWM2=PWM;
width=21'd1572864;
end
//right turn
2'b10:
begin
in[1]=1;
in[2]=0;
in[0]=0;
in[3]=1;
temp_PWM2=PWM;
width=21'd1572864;
end

2'b11:
begin
in[1]=1;
in[2]=1;
in[0]=0;
in[3]=0;
temp_PWM2=PWM;
width=21'd1572864;
end

2'b00:
begin
in[1]=1;
in[2]=1;
in[0]=0;
in[3]=0;
temp_PWM2=PWM;
width=21'd1572864;
end

endcase


if ((sw[0]&&object_sensor)==1) begin
//in[1]=0;
//in[2]=1;
//in[0]=1;
//in[3]=0;
//temp_PWM2=PWM;
//width=21'd1572864;
pathstate=object;
end

if(slow==1) begin
pathstate=slowly;
end
if (stop==1) begin
pathstate=break;
end
if ((sw[0])&&(~sensor3==1))begin
pathstate=path;

end
//else begin
//pathstate<=move;
//end
end

end
object:
begin

temp_PWM2=0;
in[1]=0;
in[2]=0;
in[0]=1;
in[3]=1;
temp_PWM2=PWM;
//width=21'd524288;
if (sensor3==0) begin
pathstate=move;
end

end

path:
begin
temp_PWM2=0;
in[1]=0;
in[2]=0;
in[0]=0;
in[3]=0;

in[1]=0;
in[2]=1;
in[0]=0;
in[3]=0;
temp_PWM2=PWM;
width=21'd1572864;

if (((~sensor[0]||~sensor[1])&&(~sensor3))==1)
begin
pathstate=move;
end
end

slowly:
begin
temp_PWM2=PWM;
width=21'd524288;//15%
case(sensor)

2'b01:
begin //left sensor greater than right clock//left turn

in[1]=0;
in[2]=1;
in[0]=1;
in[3]=0;

//width=21'd1572864;
end
//right turn
2'b10:
begin
in[1]=1;
in[2]=0;
in[0]=0;
in[3]=1;

//width=21'd1572864;
end

2'b11:
begin
in[1]=1;
in[2]=1;
in[0]=0;
in[3]=0;

//width=21'd1572864;
end

2'b00:
begin
in[1]=1;
in[2]=1;
in[0]=0;
in[3]=0;

//width=21'd1572864;
end

endcase
if (stop==1)begin
pathstate=break;
end
end

break:
begin
temp_PWM2 =0;
in[0]=0;
in[3]=0;
in[1]=0;
in[2]=0;
if ((~sensor[0]||~sensor[1])==1) begin
pathstate=move;
end
end
endcase
end

assign enA=temp_PWM2;
assign enB=temp_PWM2;

//===========================O B J E T  D E T E C T I O N  A N D  A L T E R N A T I V E  P A T H ===================
//reg alterpath, objectsensor;
//initial begin
//alterpath=0;
//objectsensor=0;
//end

//always @(posedge clock) begin
//if (object_sensor==1) 
//objectsensor=1;
//if (sensor3==0) 
//alterpath =1;
//end



////===========================O B J E T  D E T E C T I O N  A N D  A L T E R N A T I V E  P A T H ===================
//reg alterpath, objectsensor;
//initial begin
//alterpath=0;
//objectsensor=0;
//end

//always @(posedge clock) begin
//if (object_sensor==1) 
//objectsensor=1;
//if (sensor3==0) 
//alterpath =1;
//end

//===========================O B J E T  D E T E C T I O N  A N D  A L T E R N A T I V E  P A T H ===================
//reg alterpath, objectsensor;
//initial begin
//alterpath=0;
//objectsensor=0;
//end

//always @(posedge clock) begin
//if (object_sensor==1) 
//objectsensor=1;
//if (sensor3==0) 
//alterpath =1;
//end


//assign led[3]=objectsensor;
 


//========================== C O L O R  S E N S O R =========================   
    parameter bluestate = 0;
    parameter greenstate = 1;
    parameter redstate = 2;
    parameter clearstate = 3;
    parameter displaystate = 4;
    
    reg [4:0] colorstate = bluestate; //2^4 = 16 //starting from BLUE filter
//===================== START of Registers for BLUE Color ===========================    
    reg [32:0] freq = 33'b0; //Initialize registers
    reg last; //to contain last state
    reg flag;
    reg [32:0] edgecount = 33'b0; //to count the positive edges of the frequency of the color sensor
    reg finish = 0;
    reg [32:0] val = 33'b0;
//===================== END of Registers for BLUE Color =========================== 
//===================== START of Registers for GREEN Color ===========================       
    reg [32:0]edgecount1 = 33'b0;
    reg flag1;
    reg finish1 = 0;
    reg [32:0]val1 = 33'b0;
    reg [32:0] freq1 = 33'b0;
 //===================== END of Registers for GREEN Color =========================== 
 //===================== START of Registers for RED Color ===========================    
    reg [32:0]edgecount2=33'b0;
    reg flag2;
    reg finish2 = 0;
    reg [32:0]val2 = 33'b0;
    reg [32:0] freq2 = 33'b0;
 //===================== END of Registers for RED Color =========================== 
 //===================== START of Registers for CLEAR Color ===========================    
    reg [32:0] edgecount3 = 33'b0;
    reg flag3;
    reg finish3 = 0;
    reg [32:0] val3 = 33'b0;
    reg [32:0] freq3 = 33'b0;
 //===================== END of Registers for CLEAR Color ===========================     
 
    reg [32:0] greenfreq = 33'b0;
    reg [32:0] redfreq = 33'b0;
    reg [32:0] bluefreq = 33'b0;
    reg [32:0] clearfreq = 33'b0;
    
    reg [6:0] num; //to loght up the LEDs. 1: RED; 2: GREEN; 3: BLUE; 4: CLEAR
    
    assign S0 = 1;
    assign S1 = 0; //20% scaling frequency
    
    always @ (posedge clock)
        last <= colorsignal;
        
 //--------------------START of B L U E-----------------------   
always@(posedge clock)
    if(~flag) //NOT flag //resetting
        begin
            freq=0;
            edgecount=0;
            val=0;
            finish=0;
        end
    
    else 
    begin
        if(val<6250000)//6,250,000
            begin
                val<=val+1;
                if(~last & colorsignal)
                begin
                    edgecount<=edgecount+1;
            end
    end

    else 
    begin
        freq = 0;
        freq = edgecount*30; //blue
        edgecount = 0;
        val = 0;
        finish = 1;
    end
end
//--------------------END of B L U E-----------------------
//--------------------START of G R E E N-----------------------
always@(posedge clock)
    if(~flag1)
        begin
            freq1=0;
            edgecount1=0;
            val1=0;
            finish1=0;
        end
    else 
    begin
        if(val1 < 6250000)
        begin
            val1 <= val1+1;
            if(~last & colorsignal)
            begin
                edgecount1 <= edgecount1+1;
            end
        end
    else 
        begin
            freq1=0;
            freq1=edgecount1*35; //green//amplification
            edgecount1=0;
            val1=0;
            finish1=1;
        end
end
//--------------------END of G R E E N-----------------------
//--------------------START of R E D-----------------------
always@(posedge clock)
    if(~flag2)
    begin
        freq2=0;
        edgecount2=0;
        val2=0;
        finish2=0;
    end
    else 
    begin
    if(val2<6250000)
    begin
        val2<=val2+1;
        if(~last & colorsignal)
        begin
            edgecount2<=edgecount2 + 1;//red
        end
    end
    else begin
        freq2=0;
        freq2=edgecount2*21; //RED
        edgecount2=0;
        val2=0;
        finish2=1;
    end
end
//--------------------END of R E D-----------------------
//--------------------START of C L E A R-----------------------
always@(posedge clock)
    if(~flag3)
    begin
        freq3=0;
        edgecount3=0;
        val3=0;
        finish3=0;
    end
    else 
    begin
        if(val3<6250000)
        begin
            val3<=val3+1;
            if(~last & colorsignal)
            begin
                edgecount3<=edgecount3+1;
            end
        end
    else 
    begin
        freq3=0;
        freq3=edgecount3*12;
        edgecount3=0;
        val3=0;
        finish3=1;
    end
end
//--------------------END of C L E A R-----------------------
//--------------------- T O P  M O D U L E -------------------------
//    parameter bluestate=0,greenstate=1,redstate=2,displaystate=3;     
always@(posedge clock)
    case(colorstate)
    bluestate:
    begin
       S2 <= 0;//ready to receive blue photodiode
       S3 <= 1;
       flag = 1;
       if(finish == 1)
       begin
            bluefreq <= freq;
            flag=0;
            colorstate = greenstate; //Starts from Blue and goes to the next state which is GREEN
       end
    end
    
    greenstate:
    begin
       S2<=1;
       S3<=1;
       flag1=1;
       if(finish1==1)
       begin
            greenfreq<=freq1;
            flag1=0;
            colorstate=redstate;
       end
    end
    
    redstate:
    begin
       S2<=0;
       S3<=0;
       flag2=1;
       if(finish2==1)
       begin   //parameter redstate=0,greenstate=1,bluestate=2,displaystate=3;
            redfreq<=freq2;
            flag2=0;
            colorstate=clearstate;
       end
    end
    
    clearstate:
    begin
       S2<=1;
       S3<=0;
       flag3=1;
       if(finish3==1)
       begin
            clearfreq<=freq3;
            flag3=0;
            colorstate=displaystate;
       end
    end
       
    displaystate:
    begin
       if( (redfreq > greenfreq) && (redfreq > bluefreq) && (redfreq > clearfreq) )
       begin
            num = 1;
            colorstate = bluestate;
       end
       else if( (greenfreq > redfreq) && (greenfreq > bluefreq) && (greenfreq > clearfreq) )
       begin
            num = 2;  
            colorstate = bluestate;
       end
       else if( (bluefreq > redfreq) && (bluefreq > greenfreq) && (bluefreq > clearfreq) )
       begin
            num = 3;  
            colorstate = bluestate;
       end   
       else begin
            num = 4;
            colorstate = bluestate;
       end
       end
    endcase

    
 //----------- T O P  M O D U L E --------------------   
 reg start, stop,slow;
 initial begin
 start=0;
 stop=0;
 slow=0;
 end

//  always@(*) begin
//      width= 21'd524288;//25%
//      end
always@(posedge clock)
begin
if (sw[1]==1)begin
    if(num == 1)
    begin
    
        an = 4'b0111;
        seg = 7'b0101111; // displays r for RED: 0101111
        stop=1;
        //pathstate=stop;
       
    end
    else if(num == 2)
    begin
        an = 4'b0111;
        seg = 7'b0010000; //displays g for GREEN: 0000010
        //temp_PWM2=0;
        //pathstate=start;
        start=1;
    end
    else if(num == 3)
    begin
        an = 4'b0111;
        seg = 7'b0000011; //displays b for BLUE: 0000011
//        width2=21'd1048576;
//        width=21'd1048576;
        slow=1;
      end
  else if(num == 4)
    begin
        an = 4'b0111;
        seg = 7'b0111111; // displays - for CLEAR: 0101111
    end
   
    end
end
endmodule







