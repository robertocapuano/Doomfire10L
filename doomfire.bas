
1 bload"x.bin",R:

10 screen1,0,0:COLOR2,1,1:KEYOFF:CLS:DEFINTA-Z:B=base(5):R=RND(-TIME)
20 CB=BASE(6): for i=0 to 4: READ R$:VPOKE  CB+8+I,VAL("&H"+R$) : next I

100 _TURBOON(B,R)
101 BB=B+23*32: S=32*24-1: R=4
102 for I=0 to S: vpoke BB+31-I, 64 : next I 

105 for k=0 to 30

110 for I=0 to 31::: LL=R* (RND(1)* SIN(I/31 * 3.14)): vpoke BB+I,(8+LL)*8+LL : rem v=vpeek(BB+I)mod 8
111 NEXT I

120 for J=0TO20:for I=0 to 31:

130 A=BB-j*32+I:v= vpeek(a)mod8:d=RND(1)*3: B=A - D +1 - 32: vpoke b, (8+V)*8+V

140 NEXT I,J,K

150 R=0: goto 105

160 _TURBOOFF

300 k$=INPUT$(1):K=ASC(K$):if k=0 then 300: else screen0

310 DATA 11, 88, 99,  ba, 98
320 data 64, 73, 82, 91, 100


 8  -> @ABCDEFG    64 10000
 9  -> HIJKLMNO    72 10100
 10 -> PQRSTUVZ    80 11000 
 11       d         88 11100
 12                96 11000
 