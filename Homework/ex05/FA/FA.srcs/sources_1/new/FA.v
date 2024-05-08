module FA(
    input iA,
    input iB,
    input iC,
    output oS,
    output oC
    );
    wire s1, s2, s3;
    wire tmp1, tmp2;
    
    xor u1 (tmp1, iA, iB);
    xor u2 (oS, tmp1, iC);
    
    and u3 (s1, iA, iB);
    and u4 (s2, iB, iC);
    and u5 (s3, iA, iC);
    or u6 (tmp2, s1, s2);
    or u7 (oC, tmp2, s3);
    
endmodule
