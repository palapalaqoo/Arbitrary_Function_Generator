`timescale 1ns / 1ps

module REG_VKEY(CLK,KB,KD,INT,VKEY,LED,LED_OUT);
 input CLK;
 input [4:0]KB;
 output INT;//0 means interrupt happened
 output [2:0]KD;//a0~a2
 output [15:0]VKEY; 
 //=======================LED Control===============
 input  [15:0]LED; //led data 
 output LED_OUT;//decoded led data output
 reg LED_OUT;
 
 
 
 
 reg [2:0]KD;
 reg [2:0]KD_CNT;
 localparam KD0 = 3'b000; //0
 localparam KD1 = 3'b001; //1
 localparam  KD2 = 3'b011; //3
 localparam  KD3 = 3'b010; //2
 localparam  KD4 = 3'b110; //6
 localparam  KD5 = 3'b100; //4
 localparam  KD6 = 3'b101; //5
 localparam  KD7 = 3'b111; //7
 
 reg [15:0]VKEY; 
 reg INT;
 wire PRESSING;//KEY_PRESSING
 assign PRESSING=(KB!=5'b00000)? 1:0;
 reg [2:0]SCAN_CNT;//becouse of 8times of one scan
 reg [7:0]PRESS_CNT;//for decline flipflop,can use it to control filpflop time
 localparam DETECTING = 2'b00;
 localparam FLIPFLOP  = 2'b01;
 localparam  INTERRUPT = 2'b10;
 localparam  WAIT_RELEASE = 2'b11;
 
 reg [1:0]   CS;                  //current_state
 //div clk,50MHZ/2^14 about 3.2Khz clk at CLK_0
 //one sweep = 1.56M/8 = 0.2KHz,period =  5us
 //knob is 5 ms,but,output of HC47 some times is 2us, 5us  so it is ok
 reg [12:0]  CLK_DIV; 
 reg CLK_0;
 
 initial
 begin
  CS=0;
  KD=0;
  PRESS_CNT=0;
  SCAN_CNT=0;
  VKEY=0; 
   INT=0;
 end
 
 //divide sys clk
 always@(posedge CLK)
 begin
  CLK_DIV<=CLK_DIV+1;
  if(CLK_DIV==0)
  CLK_0<=~CLK_0;
 end
 
 //LED output
 always@(posedge CLK_0)
 begin
  KD_CNT<=KD_CNT+1;  
  if(KD_CNT==3'b000)
   KD<=KD0;
  else if(KD_CNT==3'b001)
   KD<=KD1;
  else if(KD_CNT==3'b010)
   KD<=KD2;
  else if(KD_CNT==3'b011)
   KD<=KD3;
  else if(KD_CNT==3'b100)
   KD<=KD4;
  else if(KD_CNT==3'b101)
   KD<=KD5;
  else if(KD_CNT==3'b110)
   KD<=KD6;
  else if(KD_CNT==3'b111)
   KD<=KD7;   
  
  //-----------------  LED OUT -----------------------  
  LED_OUT <= //kd output= 000 , ledout=buf[0];
      (KD_CNT==3'b000)? LED[0]:
      (KD_CNT==3'b001)? LED[1]:
      (KD_CNT==3'b010)? LED[3]:
      (KD_CNT==3'b011)? LED[2]:
      (KD_CNT==3'b100)? LED[6]:
      (KD_CNT==3'b101)? LED[4]:
      (KD_CNT==3'b110)? LED[5]:
      LED[7];//decode  
  //-----------------------------------------------  
 end
 
 //key scan 
 always@(negedge CLK_0)
 begin  
  //save key inf
  
  
/*  if(KD==3'b111&&PRESSING&&CS==DETECTING)//if is knob ,then interrupt,no need flipflop detect
   CS<=INTERRUPT;
  else if(PRESSING&&CS==DETECTING)
   CS<=FLIPFLOP;     
  else if((CS==FLIPFLOP)&&((~PRESSING)&&(SCAN_CNT==3'b111)))//return detect
   CS<=DETECTING;
  else if(CS==FLIPFLOP&&PRESS_CNT[7]==0)//
*/
  if(PRESSING&&CS==DETECTING)
   CS<=INTERRUPT;     
  else if(CS==INTERRUPT)
   CS<=WAIT_RELEASE; 
  else if((CS==WAIT_RELEASE)&&(~PRESSING)&&(SCAN_CNT==3'b111))
   CS<=DETECTING;   
  else
   CS<=CS;
  
  
  
  if(CS==DETECTING)//reset
  begin
   SCAN_CNT<=3'b000;
   PRESS_CNT<=8'b11110000;
  end
  
  if(PRESSING&&CS==DETECTING)//save
  begin
    VKEY[2:0]<=KD[2:0];//decimal  
    VKEY[6:4]<=(KB[4:0]==5'b00001)? 3'b000 :
         (KB[4:0]==5'b00010)? 3'b001 :
         (KB[4:0]==5'b00100)? 3'b010 :
         (KB[4:0]==5'b01000)? 3'b011 :
         3'b100;
  end
  
  if(CS!=DETECTING)
   SCAN_CNT<=SCAN_CNT+1;
   
  if(SCAN_CNT==3'b111&&PRESSING)    
   PRESS_CNT<=PRESS_CNT<<1;
  
  if(CS==INTERRUPT)
  begin   
   INT<=0;//assert int signal
  end 
  else
  begin
   INT<=1;
  end
  
 end 
 
endmodule
