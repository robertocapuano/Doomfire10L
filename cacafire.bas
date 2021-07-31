
1 rem bload"x.bin",R:

10 screen1,0,0:COLOR1,14,14:KEYOFF:CLS:DEFINTA-Z:B=base(5):R=RND(-TIME)
20 CB=BASE(6): vpoke CB+8,&hd5:vpoke CB+9,&h5D::vpoke CB+9,&h34:

100 rem _TURBOON(B,R)
101 BB=B+23*32
105 for k=0to1
110 for I=0 to 31: if RND(1)>.5 then vpoke BB+I, 8*(8+RND(1)*4) : 
111 NEXT I
120 for J=1TO3:for I=0 to 31:

130 A=BB-j*32+I:v= vpeek(a):u=vpeek(a+32): p=(u+(.75*v))mod255: vpoke a, p

140 NEXT I,J,K

150 rem goto 105

200 rem _TURBOOFF

300 k$=INPUT$(1):K=ASC(K$):if k=0 then 300: else screen0


 8  -> @ABCDEFG
 9  -> HIJKLMNO
 10 -> PQRSTUVZ