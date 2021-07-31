
1 rem bload"x.bin",R:

10 screen1,0,0:COLOR1,14,14:KEYOFF:CLS:DEFINTA-Z:B=base(5):R=RND(-TIME)
20 CB=BASE(6): vpoke CB+8,&hd5:vpoke CB+9,&h5D::vpoke CB+9,&h34:

100 _TURBOON(B,R)
101 BB=B+23*32: S=32*24-1
102 for I=0 to S: vpoke BB+31-I, 48 : next I 

105 for k=0 to 20

110 for I=0 to 31::v= vpeek(BB+I)-48: L=9-v: vpoke BB+I, 48 +RND(1)*L:rem 8*(8+RND(1)*4) : 
111 NEXT I

120 for J=0TO10:for I=0 to 31:

130 A=BB-j*32+I:v= vpeek(a)-48:if v>0 then : d=RND(1)*3: B=A - D +1 - 32: vpoke b, v+48

140 NEXT I,J,K

150 rem goto 105

160 _TURBOOFF

300 k$=INPUT$(1):K=ASC(K$):if k=0 then 300: else screen0


 8  -> @ABCDEFG
 9  -> HIJKLMNO
 10 -> PQRSTUVZ