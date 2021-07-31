
1 bload"x.bin",R:

10 screen1,0,0:COLOR1,14,14:KEYOFF:CLS:DEFINTA-Z:B=base(5):R=RND(-TIME)
20 CB=BASE(6): vpoke CB+8,&hd5:vpoke CB+9,&h5D::vpoke CB+9,&h34:

100 _TURBOON(B,R)
101 BB=B+23*32
110 for J=0TO3:for I=0 to 31: vpoke BB-32*j+I, 8*(8+RND(1)*4) : NEXT I,J

200 _TURBOOFF

300 input$(1):screen0


 8  -> @ABCDEFG
 9  -> HIJKLMNO
 10 -> PQRSTUVZ