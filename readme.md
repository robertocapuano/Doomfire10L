


https://webmsx.org/?M=MSXTR


# Doomfire10L
Doomfire10L is an implementation in MSX2 BASIC of the Doom Fire on PS1

Original source:
https://fabiensanglard.net/doom_fire_psx/

![screenshot](doomfire.gif)

# Controls
Press space to stop/resume the effect.

Sources are stored at: https://github.com/robertocapuano/Doomfire10L

# Installation
Game was developed in MSX-BASIC v3 on a MSX2+. Emulator is available at https://webmsx.org/
1. connect to https://webmsx.org/?M=MSXTR
2. click on the first floppy icon below the blue screen
3. Select "Add Disk Images"
4. Choose "doomfile.dsk"
5. type in:
```
load "a:doomfire.bas"
run
```

WebMSX Launch URL:

- https://webmsx.org?MACHINE=MSXTRA&DISK=https://github.com/robertocapuano/Doomfire10L/raw/main/doomfire.dsk&BASIC_RUN=doomfire.bas

# Source Description

```
1 bload"x.bin",R:DEFUSR=39+PEEK(-2385)+PEEK(-2384)*256:IFUSR(0)THENLINE>1COPY0&H80F6OR384ALLYOURBASEAREBELONGTOUS!
```
```
10 screen1,0,0:COLOR2,1,1:KEYOFF:CLS:DEFINTA-Z:B=base(5):R=RND(-TIME):R=4: BB=B+23*32:CB=BASE(6):
```
```
20  for i=0 to 4: READ R$:VPOKE  CB+8+I,VAL("&H"+R$) : next I
```
```
100 _TURBOON(BB,R)
```
```
105  S=32*24-1:for I=0 to S: vpoke BB+31-I, 64 : next I 
```
```
110 for I=0 to 31: LL=R* (RND(1)* SIN(I/31 * 3.14)): vpoke BB+I,(8+LL)*8+LL : NEXT I
```
```
120 for J=0TO20:for I=0 to 31:A=BB-j*32+I:v= vpeek(a)mod8:d=RND(1)*3: AB=A - D +1 - 32: vpoke AB, (8+V)*8+V:NEXT I,J
```
```
150 K$=INKEY$:K=(K$<>""): R=-K*(4-R) + (1+K)*R:goto110:
```
```
160 _TURBOOFF
```
```
310 DATA 11, 88, 99,  ba, 98,   64, 73, 82, 91, 100



```
1 SCREEN1:COLOR10,9,9:CLS:KEYOFF:DEFINTA-Z:C=1:B=6283:X=B:Z=RND(-TIME):U=64:V=2
```
- SCREEN1: select 32x24 text mode
- COLOR10,9,9: select color yellow on red
- CLS: clear screen
- KEY OFF: hide command bar
- DEF INT A-Z: set A-Z as integer variables
- C=1,R=0: initial cursor position, column 1, row 0
- B=6283: base video memory address for screen1
- Z=RND(-TIME): initialize random number generator
- U=64,V=2: U,V contains offset values for next row and next column

```
2 S=1+31*F:Y=X-S:Z=X+S:T=vpeek(Y):vpokeY,vpeek(Z):vpokeZ,T:W=W-1:ifW=0thenP=0
```
- S contains offset to adjacent cell
- X: pointer to cursor cell
- Y,Z adjacents cells pointers
- T: temporary value of Y
- vpokeY... swaps values
- W=2: user swaps symbols, W=1 swap operation doens't obtain a match-3, W=0: no operation

```
3 locate21,0:?"PTS"P" ":H=0:FORI=0TO4:G=B+I*2:ifvpeek(G)=32thenvpokeG,RND(1)*4+1
```
- P: contains player points
- G: contains video memory pointer to actual row procesed
- H=0: change flag of puzzle content
- FORI=... initialize first row with random symbols

```
4 forJ=4TO1step-1:A=G+J*64:ifvpeek(A)=32thenvpokeA,vpeek(A-64):vpokeA-64,32:H=1
```
- Scroll values for a row to the next one if this is empty (ASCII 32)
- A: contains video memory pointer to actual processed char

```
5 nextJ,I:ifH=1then3elseforK=0to1:forJ=0TO4:forI=0TO2:A=B+J*V+I*U:T=vpeek(A):N=0
```
- if change flag is setted repeat previous step
- else start match-3 check loop

```
6 N=N+1:ifT<32andT=vpeek(A+N*U)then6:elseifN>2thenforM=0toN-1:vpokeA+M*U,32:next
```
- checks if there are at least 3 symbols that matches, this is peformed in horizontal and vertical direction, using variables U,V as offsets for next row/column

```
7 H=H-(N>2):nextI,J:swapU,V:next:ifH>0thenP=P+H:W=0:goto3:elseifW>0then2:elseW=2
```
- add 1 to H in case of a match
- if H, the change flag, is setted repeat previous steps
- otherwise reverse symbols switch: no match-3 performed
- H>0 player did almost one match
- W=0 no other swaps are necessary
- W>0 player failed to obtain a match, a reverse swap will be done
- reset value of W=2

```
8 X=B+C+R*32:vpokeX,254:K$=INKEY$:IFK$=""then8:elsevpokeX,32:ifK$=" "andC<9then2
```
- X contains cursor video memory pointer
- K$=INKEY$:IFK$=""then7 read keyboard input
- vpokeX,254: show cursor
- if user presses space bar and the cursor is on the right side nothing is done
- pokeX,32: hide cursor

```
9 k=ASC(k$):ifK=31andr<8thenR=R+1:C=Cxor1:elseifK=30andR>0thenR=R-1:C=Cxor1
```
- K=31 in case of down direction: cursor is moved to next row: R=R+1
- K=30 in case of up direction: cursor is moved to previous row: R=R-1
- C=Cxor1: produces alternate position of the cursor like a chessboard

```
10 F=Rmod2:ifK=28andC<7thenC=C+2:goto8:elseifK=29andC>1thenC=C-2:goto8:else8
```
- K=28 in case of left direction: cursor is moved to previous column: C=C-2
- K=29 in case of right direction: cursor is moved to next column: C=C+2

