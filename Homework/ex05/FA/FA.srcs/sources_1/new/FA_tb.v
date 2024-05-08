`timescale 1ns / 1ps

module FA_tb();
    reg iA,iB,iC;
    wire oS, oC;
    
    FA uul(.iA(iA), .iB(iB), .iC(iC), .oS(oS), .oC(oC));
    
    initial
    begin
       iA = 0;
       iB = 0;
       iC = 0; 
       
       # 40 iA = 0;
       iB = 0;
       iC = 1;
        
       # 40 iA = 0;
       iB = 1;
       iC = 0;
	   
       # 40 iA = 0;
       iB = 1;
       iC = 1;
       
       # 40 iA = 1;
       iB = 0;
       iC = 0;     
       
       # 40 iA = 1;
       iB = 0;
       iC = 1;   
       
       # 40 iA = 1;
       iB = 1;
       iC = 0;      
	   
		# 40 iA = 1;
       iB = 1;
       iC = 1; 
    end
endmodule
