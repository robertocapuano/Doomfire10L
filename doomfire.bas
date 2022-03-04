1 rem bload"x.bin",R:rem to use KUN BASIC uncomment lines 1,100,160
10 screen1,0,0:COLOR2,1,1:KEYOFF:CLS:DEFINTA-Z:B=base(5):R=RND(-TIME):R=4: BB=B+23*32:CB=BASE(6):
20  for i=0 to 4: READ R$:VPOKE  CB+8+I,VAL("&H"+R$) : next I
100 rem _TURBOON(BB,R)
105  S=32*24-1:for I=0 to S: vpoke BB+31-I, 64 : next I 
110 for I=0 to 31: LL=R* (RND(1)* SIN(I/31 * 3.14)): vpoke BB+I,(8+LL)*8+LL : NEXT I
120 for J=0TO20:for I=0 to 31:A=BB-j*32+I:v= vpeek(a)mod8:d=RND(1)*3: AB=A - D +1 - 32: vpoke AB, (8+V)*8+V:NEXT I,J
150 K$=INKEY$:K=(K$<>""): R=-K*(4-R) + (1+K)*R:goto110:
160 rem _TURBOOFF
310 DATA 11, 88, 99,  ba, 98,   64, 73, 82, 91, 100
