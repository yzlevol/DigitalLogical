////////////////////////////////////////////////////////////////////////////////
// Description: 顶层模块
// Author: Hyoung Yan
// Create Date: 2024-1-11
////////////////////////////////////////////////////////////////////////////////
			
/*宏定义*/
`define S16 s15,s14,s13,s12,s11,s10,s9,s8,s7,s6,s5,s4,s3,s2,s1,s0//日志下每个块的状态
`define U16 u15,u14,u13,u12,u11,u10,u9,u8,u7,u6,u5,u4,u3,u2,u1,u0//上
`define D16 d15,d14,d13,d12,d11,d10,d9,d8,d7,d6,d5,d4,d3,d2,d1,d0//下
`define L16 l15,l14,l13,l12,l11,l10,l9,l8,l7,l6,l5,l4,l3,l2,l1,l0//左
`define R16 r15,r14,r13,r12,r11,r10,r9,r8,r7,r6,r5,r4,r3,r2,r1,r0//右
`define P16 p15,p14,p13,p12,p11,p10,p9,p8,p7,p6,p5,p4,p3,p2,p1,p0//S16上一状态
`define b1 (43)
`define b2 (`b1 + 18)
`define b3 (`b2 + 18)
`define b4 (`b3 + 18)
`define b5 (`b4 + 18)
`define t -`b1+18

module game(rst,clk,key,Hsync,Vsync,vgaRed,vgaGreen,vgaBlue,DREQ,XCS,XDCS,SCK,SI,XRESET,an,seg);  //oData,law
  input rst;                        //重置信号，高电平有效
  input clk;                       //时钟信号，系统100MHz时钟
  //按键相关
  input [3:0] key;             //按键输入
  //VGA相关
  output Hsync,Vsync;  //VGA同步信号
  output [3:0] vgaRed,vgaGreen,vgaBlue;//VGA RGB信号
  // mp3相关
  input     DREQ;           //数据请求，高电平可传输数据
  output    XCS;            // SCI 传输读写指令
  output    XDCS;           // SDI 传输数据
  output    SCK;            // 时钟
  output    SI;             // 传入mp3
  output    XRESET;          // 硬件复位，低电平有效
  // 数码管相关
 output [7:0] an; // 数码管使能
 output [7:0] seg; // 数码管输出
 
  reg [3:0] `P16,`S16;
  wire [3:0] `U16,`D16,`L16,`R16,gu3,gu2,gu1,gu0,gd15,gd14,gd13,gd12,gl12,gl8,gl4,gl0,gr15,gr11,gr7,gr3;//产生随机数 u, d, l, r
  reg [15:0] counter;
  wire clk_game,clk_rand,clk_vga;  //时钟信号
  wire [3:0] keyin;    //处理的输入
  reg [1:0] state;      //00 检查输入和移动， 01 产生随机数 , 10 检查游戏状态, 11结束
  reg [7:0] step;       //记录步数
  reg [31:0] score1;//得分，测试用
  reg [1:0] status;    //? `b0 继续, 1 结束, 2 胜利
  clkdiv clkdiv1(rst,clk,clk_game,clk_rand,clk_vga); //时钟分频
  reg [31:0] sumScore; //总得分
  reg start = 1'b1;    //开始标准
  //reg over = 1'b0; //结束标志
  //assign over = (status==1'b1)?1'b0:1'b1; 

  //MyMP3实例化
  MyMP3 mp3_inst(.clk(clk), .DREQ(DREQ), .rst(rst), .music_id(0), .XDCS(XDCS), .XCS(XCS),
   .XRSET(XRESET), .SI(SI), .SCK(SCK), .start(start));
  //按键防抖实例化
  shake shake_3(rst,clk_game,key[3],keyin[3]);
  shake shake_2(rst,clk_game,key[2],keyin[2]);
  shake shake_1(rst,clk_game,key[1],keyin[1]);
  shake shake_0(rst,clk_game,key[0],keyin[0]);
  //移动模块实例化
  move mu3(s3,s7,s11,s15,u3,u7,u11,u15);
  move mu2(s2,s6,s10,s14,u2,u6,u10,u14);
  move mu1(s1,s5,s9,s13,u1,u5,u9,u13);
  move mu0(s0,s4,s8,s12,u0,u4,u8,u12);
  move md3(s15,s11,s7,s3,d15,d11,d7,d3);
  move md2(s14,s10,s6,s2,d14,d10,d6,d2);
  move md1(s13,s9,s5,s1,d13,d9,d5,d1);
  move md0(s12,s8,s4,s0,d12,d8,d4,d0);
  move ml3(s12,s13,s14,s15,l12,l13,l14,l15);
  move ml2(s8,s9,s10,s11,l8,l9,l10,l11);
  move ml1(s4,s5,s6,s7,l4,l5,l6,l7);
  move ml0(s0,s1,s2,s3,l0,l1,l2,l3);
  move mr3(s15,s14,s13,s12,r15,r14,r13,r12);
  move mr2(s11,s10,s9,s8,r11,r10,r9,r8);
  move mr1(s7,s6,s5,s4,r7,r6,r5,r4);
  move mr0(s3,s2,s1,s0,r3,r2,r1,r0);
  //随机数产生模块实例化
  gen gu(rst,clk_rand,s3,s2,s1,s0,gu3,gu2,gu1,gu0);
  gen gd(rst,clk_rand,s15,s14,s13,s12,gd15,gd14,gd13,gd12);
  gen gl(rst,clk_rand,s12,s8,s4,s0,gl12,gl8,gl4,gl0);
  gen gr(rst,clk_rand,s15,s11,s7,s3,gr15,gr11,gr7,gr3);
  // 分数时间显示实例化
  score score_inst(.rst(rst),.clock(clk),.an(an),.status(status),.seg(seg),.sumScore(sumScore));  
  


always @(posedge clk) begin
    sumScore = 0;
    // 将宏定义展开累加统计得分
    sumScore = sumScore + (s15 ? (1 << s15) : 0);
    sumScore = sumScore + (s14 ? (1 << s14) : 0);
    sumScore = sumScore + (s13 ? (1 << s13) : 0);
    sumScore = sumScore + (s12 ? (1 << s12) : 0);
    sumScore = sumScore + (s11 ? (1 << s11) : 0);
    sumScore = sumScore + (s10 ? (1 << s10) : 0);
    sumScore = sumScore + (s9 ? (1 << s9) : 0);
    sumScore = sumScore + (s8 ? (1 << s8) : 0);
    sumScore = sumScore + (s7 ? (1 << s7) : 0);
    sumScore = sumScore + (s6 ? (1 << s6) : 0);
    sumScore = sumScore + (s5 ? (1 << s5) : 0);
    sumScore = sumScore + (s4 ? (1 << s4) : 0);
    sumScore = sumScore + (s3 ? (1 << s3) : 0);
    sumScore = sumScore + (s2 ? (1 << s2) : 0);
    sumScore = sumScore + (s1 ? (1 << s1) : 0);
    sumScore = sumScore + (s0 ? (1 << s0) : 0);
end

  always @(posedge rst or posedge clk_game) begin
    if(rst) begin
      s15 <= 4'h0;s14 <= 4'h1;s13 <= 4'h0;s12 <= 4'h1;
      s11 <= 4'h0;s10 <= 4'h2;s9 <= 4'h0;s8 <= 4'h0;
      s7 <= 4'h0;s6 <= 4'h0;s5 <= 4'h0;s4 <= 4'h0;
      s3 <= 4'h0;s2 <= 4'h0;s1 <= 4'h1;s0 <= 4'h0;
      {`P16} <= 0;step <= 0;score1 <= 0;status <= 0;state <= 0;
      
    end else begin
      case(state)
        2'b00 : begin
          case(keyin)
            4'b0000 : begin {`S16} <= {`S16};state <= 0;end
            4'b1000 : begin {`S16} <= {`U16};state <= 1;end
            4'b0100 : begin {`S16} <= {`D16};state <= 1;end
            4'b0010 : begin {`S16} <= {`L16};state <= 1;end
            4'b0001 : begin {`S16} <= {`R16};state <= 1;end
            default : begin {`S16} <= {`S16};state <= 0;end
          endcase
          {`P16} <= {`S16};step <= step;score1 <= score1;status <= status;//继续有效 `b1
        end
        2'b01 : begin
            if({`P16} == {`S16}) begin {`S16} <= {`S16};end
            else case(keyin)
                            4'b1000 : begin {`S16} <= {s15,s14,s13,s12,s11,s10,s9,s8,s7,s6,s5,s4,gu3,gu2,gu1,gu0};end
                            4'b0100 : begin {`S16} <= {gd15,gd14,gd13,gd12,s11,s10,s9,s8,s7,s6,s5,s4,s3,s2,s1,s0};end
                            4'b0010 : begin {`S16} <= {s15,s14,s13,gl12,s11,s10,s9,gl8,s7,s6,s5,gl4,s3,s2,s1,gl0};end
                            4'b0001 : begin {`S16} <= {gr15,s14,s13,s12,gr11,s10,s9,s8,gr7,s6,s5,s4,gr3,s2,s1,s0};end
                            default : begin {`S16} <= {s15,s14,s13,s12,s11,s10,s9,s8,s7,s6,s5,s4,s3,s2,s1,s0};end
                        endcase
          {`P16} <= {`P16};step <= step;score1 <= score1;state <= 2;status <= status;
        end
        2'b10 : begin
          {`S16} <= {`S16};{`P16} <= {`P16};step <= step + 1;score1 <= score1;
          if({`U16}=={`D16} && {`L16}=={`R16}) begin 
            status <= 1;state<= 3;
          end//结束
          else if(keyin == 4'b0000) begin
                if(s15==4'hb||s14==4'hb||s13==4'hb||s12==4'hb||s11==4'hb||s10==4'hb||s9==4'hb||s8==4'hb||s7==4'hb||s6==4'hb||s5==4'hb||s4==4'hb||s3==4'hb||s2==4'hb||s1==4'hb||s0==4'hb)
                    status <= 2;//继续
                else status <= status;
                state <= 0;
          end 
          else begin
                status <= status;
                state <= 2;
            end
        end
        2'b11 : begin {`S16} <= {`S16};{`P16} <= {`P16};step <= step;score1 <= score1;status <= status;state <= 3;end
        default : begin {`S16} <= {`S16};{`P16} <= {`P16};step <= step;score1 <= score1;status <= status;state <= 0;end
      endcase
    end
  end

  //显示
  wire [0:287] e15,e14,e13,e12,e11,e10,e9,e8,e7,e6,e5,e4,e3,e2,e1,e0;
  reg [0:103] faceu,faced;
  reg [9:0] position;
  reg [7:0] din;
  wire [6:0] xin,xin_shift;
  wire [2:0] yin;
  assign xin = position[6:0];
  assign yin = position[9:7];
  assign xin_shift = xin + 7'h01;
        
    seg seg15(s15,e15);
    seg seg14(s14,e14);
    seg seg13(s13,e13);
    seg seg12(s12,e12);
    seg seg11(s11,e11);
    seg seg10(s10,e10);
    seg seg9(s9,e9);
    seg seg8(s8,e8);
    seg seg7(s7,e7);
    seg seg6(s6,e6);
    seg seg5(s5,e5);
    seg seg4(s4,e4);
    seg seg3(s3,e3);
    seg seg2(s2,e2);
    seg seg1(s1,e1);
    seg seg0(s0,e0);

    reg [2:0] db;
    wire [9:0] vx,vy;
    wire [7:0] inx;
    wire [4:0] iny;
    wire [2:0] calcy;
    
    vga vga_0(rst,clk_vga,db,vgaRed[3],vgaGreen[3],vgaBlue[3],Hsync,Vsync,vx,vy);
    assign vgaRed[2:0] = 3'h0;
    assign vgaGreen[2:0] = 3'h0;
    assign vgaBlue[2:0] = 3'h0;
    assign inx = vx[9:2];//横向位置
    assign iny = vy[9:5];//纵向位置
    assign calcy = vy[4:2];//白线位置
    
    always @(inx or iny) begin
        case(iny)
            5'h00 :if(inx==`b1||inx==`b2||inx==`b3||inx==`b4||inx==`b5) db <= 3'b111;
              else if(inx<`b1) db <= 3'b000;
              else if(inx<= `b5 && calcy == 3'b000) db <= 3'b111;
              else if(inx<`b2) db <= {3{e15[(inx-`b1)*8+calcy]}} ^ (s15[2:0]);
              else if(inx<`b3) db <= {3{e14[(inx-`b2)*8+calcy]}} ^ (s14[2:0]);
              else if(inx<`b4) db <= {3{e13[(inx-`b3)*8+calcy]}} ^ (s13[2:0]);
              else if(inx<`b5) db <= {3{e12[(inx-`b4)*8+calcy]}} ^ (s12[2:0]);
              else db <= 3'b000;
            5'h01 :if(inx==`b1||inx==`b2||inx==`b3||inx==`b4||inx==`b5) db <= 3'b111;              
              else if(inx<`b1) db <= 3'b000;
              else if(inx<`b2) db <= {3{e15[(inx+`t)*8+calcy]}} ^ (s15[2:0]);
              else if(inx<`b3) db <= {3{e14[(inx-`b1)*8+calcy]}} ^ (s14[2:0]);
              else if(inx<`b4) db <= {3{e13[(inx-`b2)*8+calcy]}} ^ (s13[2:0]);
              else if(inx<`b5) db <= {3{e12[(inx-`b3)*8+calcy]}} ^ (s12[2:0]);
              else db <= 3'b000;
            5'h02 :if(inx==`b1||inx==`b2||inx==`b3||inx==`b4||inx==`b5) db <= 3'b111;
              else if(inx<`b1) db <= 3'b000;
              else if(inx<=`b5 && calcy == 3'b000) db <= 3'b111;
              else if(inx<`b2) db <= {3{e11[(inx-`b1)*8+calcy]}} ^ (s11[2:0]);
              else if(inx<`b3) db <= {3{e10[(inx-`b2)*8+calcy]}} ^ (s10[2:0]);
              else if(inx<`b4) db <= {3{ e9[(inx-`b3)*8+calcy]}} ^ ( s9[2:0]);
              else if(inx<`b5) db <= {3{ e8[(inx-`b4)*8+calcy]}} ^ ( s8[2:0]);
              else db <= 3'b000;
            5'h03 :if(inx==`b1||inx==`b2||inx==`b3||inx==`b4||inx==`b5) db <= 3'b111;
              else if(inx<`b1) db <= 3'b000;
              else if(inx<`b2) db <= {3{e11[(inx+`t)*8+calcy]}} ^ (s11[2:0]);
              else if(inx<`b3) db <= {3{e10[(inx-`b1)*8+calcy]}} ^ (s10[2:0]);
              else if(inx<`b4) db <= {3{ e9[(inx-`b2)*8+calcy]}} ^ ( s9[2:0]);
              else if(inx<`b5) db <= {3{ e8[(inx-`b3)*8+calcy]}} ^ ( s8[2:0]);
              else db <= 3'b000;
            5'h04 :if(inx==`b1||inx==`b2||inx==`b3||inx==`b4||inx==`b5) db <= 3'b111;
              else if(inx<`b1) db <= 3'b000;
              else if(inx<=`b5 && calcy == 3'b000) db <= 3'b111;
              else if(inx<`b2) db <= {3{ e7[(inx-`b1)*8+calcy]}} ^ (s7[2:0]);
              else if(inx<`b3) db <= {3{ e6[(inx-`b2)*8+calcy]}} ^ (s6[2:0]);
              else if(inx<`b4) db <= {3{ e5[(inx-`b3)*8+calcy]}} ^ (s5[2:0]);
              else if(inx<`b5) db <= {3{ e4[(inx-`b4)*8+calcy]}} ^ (s4[2:0]);
              else db <= 3'b000;
            5'h05 :if(inx==`b1||inx==`b2||inx==`b3||inx==`b4||inx==`b5) db <= 3'b111;
              else if(inx<`b1) db <= 3'b000;
              else if(inx<`b2) db <= {3{ e7[(inx+`t)*8+calcy]}} ^ (s7[2:0]);
              else if(inx<`b3) db <= {3{ e6[(inx-`b1)*8+calcy]}} ^ (s6[2:0]);
              else if(inx<`b4) db <= {3{ e5[(inx-`b2)*8+calcy]}} ^ (s5[2:0]);
              else if(inx<`b5) db <= {3{ e4[(inx-`b3)*8+calcy]}} ^ (s4[2:0]);
              else db <= 3'b000;
            5'h06 :if(inx==`b1||inx==`b2||inx==`b3||inx==`b4||inx==`b5) db <= 3'b111;
              else if(inx<`b1) db <= 3'b000;
              else if(inx<=`b5 && calcy == 3'b000) db <= 3'b111;
              else if(inx<`b2) db <= {3{ e3[(inx-`b1)*8+calcy]}} ^ (s3[2:0]);
              else if(inx<`b3) db <= {3{ e2[(inx-`b2)*8+calcy]}} ^ (s2[2:0]);
              else if(inx<`b4) db <= {3{ e1[(inx-`b3)*8+calcy]}} ^ (s1[2:0]);
              else if(inx<`b5) db <= {3{ e0[(inx-`b4)*8+calcy]}} ^ (s0[2:0]);
              else db <= 3'b000;
            5'h07 :if(inx==`b1||inx==`b2||inx==`b3||inx==`b4||inx==`b5) db <= 3'b111;
              else if(inx<`b1) db <= 3'b000;
              else if(inx<`b2) db <= {3{ e3[(inx+`t)*8+calcy]}} ^ (s3[2:0]);
              else if(inx<`b3) db <= {3{ e2[(inx-`b1)*8+calcy]}} ^ (s2[2:0]);
              else if(inx<`b4) db <= {3{ e1[(inx-`b2)*8+calcy]}} ^ (s1[2:0]);
              else if(inx<`b5) db <= {3{ e0[(inx-`b3)*8+calcy]}} ^ (s0[2:0]);
              else db <= 3'b000;
            5'h08 :if(inx>=`b1 && inx<=`b5 && calcy == 3'b000) db <= 3'b111;
              else db <= 3'b000;
            5'h09: if(inx>=72 && inx<=86)begin
              case(status)
                  1 : db <= {faceu[(inx-72)*8+calcy],2'b00};
                  2 : db <= {1'b0,faceu[(inx-72)*8+calcy],1'b0};
                  default : db <= {2'b00,faceu[(inx-72)*8+calcy]};
              endcase
              end
             else db <= 3'b000;
            5'h0a: if(inx>=72 && inx<=86)begin
              case(status)
                  1 : db <= {faced[(inx-72)*8+calcy],2'b00};
                  2 : db <= {1'b0,faced[(inx-72)*8+calcy],1'b0};
                  default : db <= {2'b00,faced[(inx-72)*8+calcy]};
              endcase
              end
             else db <= 3'b000;
            default : db <= 3'b000;
        endcase
    end
    
    always @(status) begin
        case(status)
        0 : begin faceu <= 104'h08_08_08_08_08_00_00_00_08_08_08_08_08;
                  faced <= 104'h00_00_00_0c_02_01_61_01_02_0c_00_00_00;
            end
        1 : begin faceu <= 104'h22_14_08_14_22_00_00_00_22_14_08_14_22;
                  faced <= 104'h00_00_00_1c_22_41_41_41_22_1c_00_00_00;
            end
        2 : begin faceu <= 104'h06_0c_08_08_04_00_00_00_06_0c_08_08_04;
                  faced <= 104'h00_00_00_0c_02_01_61_01_02_0c_00_00_00;
            end
        default : begin faceu <= 104'h00_00_00_00_00_00_00_00_00_00_00_00_00;
                        faced <= 104'h00_00_00_0c_02_01_01_01_02_0c_00_00_00;
                  end
        endcase
    end

endmodule