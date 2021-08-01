
1 bload"x.bin",R:

10 screen1,0,0:COLOR1,14,14:KEYOFF:CLS:DEFINTA-Z:B=base(5):R=RND(-TIME)
20 CB=BASE(6): for i=0 to 4: READ R$:VPOKE  CB+8+I,VAL("&H"+R$) : next I

100 _TURBOON(B,R)
101 BB=B+23*32: S=32*24-1
102 for I=0 to S: vpoke BB+31-I, 64 : next I 

105 for k=0 to 20

110 for I=0 to 31::v=vpeek(BB+I)mod 8: L=4-v: LL=RND(1)*L: vpoke BB+I,(8+LL)*8+LL : 
111 NEXT I

120 for J=0TO5:for I=0 to 31:

130 A=BB-j*32+I:v= vpeek(a)mod8:if v>0 then : d=RND(1)*3: B=A - D +1 - 32: vpoke b, (8+V)*8+V

140 NEXT I,J,K

150 rem goto 105

160 _TURBOOFF

300 k$=INPUT$(1):K=ASC(K$):if k=0 then 300: else screen0

310 DATA 11, 88, 99,  ba, 98
320 data 64, 73, 82, 91, 100


 8  -> @ABCDEFG    64 10000
 9  -> HIJKLMNO    72 10100
 10 -> PQRSTUVZ    80 11000 
 11       d         88 11100
 12                96 11000
 