# Doomfire10L
Doomfire10L is an implementation in MSX2 BASIC of Doom fire for PS1

Original source:
https://fabiensanglard.net/doom_fire_psx/

For smooth animation you can use Kun-BASIC but we recommend using an accelerated clock.

![screenshot](doomfire.gif)

# Controls
Press space to stop/resume the effect.

Sources are stored at: https://github.com/robertocapuano/Doomfire10L

# Installation
Game was developed in MSX-BASIC v3 on a MSX2+. Emulator is available at https://webmsx.org/
1. connect to https://webmsx.org
2. click on the first floppy icon below the blue screen
3. Select "Add Disk Images"
4. Choose "doomfile.dsk"
5. type in:
```
load "a:doomfire.bas"
run
```

WebMSX Launch URL:

- https://webmsx.org/?DISK=https://github.com/robertocapuano/Doomfire10L/raw/main/doomfire.dsk&BASIC_RUN=doomfire.bas

for a smoother effect use an accelerated clock:

- https://webmsx.org/?Z80_CLOCK_MODE=8&DISK=https://github.com/robertocapuano/Doomfire10L/raw/main/doomfire.dsk&BASIC_RUN=doomfire.bas

# Source Description

```
1 rem bload"x.bin",R:rem to use KUN BASIC uncomment lines 1,100,160
```
- uncomment line to load Kun BASIC.
```
10 screen1,0,0:COLOR2,1,1:KEYOFF:CLS:DEFINTA-Z:B=base(5):R=RND(-TIME):R=4: BB=B+23*32:CB=BASE(6):
```
- screen1,0,0: Set text mode 32x24
- COLOR2,1,1: black color
- KEYOFF: hide function keys
- CLS: clear screen
- DEFINTA-Z: use integer variables
- B=base(5): base of framebuffer
- R=RND(-TIME): init random number generator
- R=4: BB=B+23*32:CB=BASE(6): constants used for base addresses

```
20  for i=0 to 4: READ R$:VPOKE  CB+8+I,VAL("&H"+R$) : next I
```
- load tile sets

```
100 rem _TURBOON(BB,R)
```
- uncomment line to enable turbo mode

```
105  S=32*24-1:for I=0 to S: vpoke BB+31-I, 64 : next I 
```
- scroll screen

```
110 for I=0 to 31: LL=R* (RND(1)* SIN(I/31 * 3.14)): vpoke BB+I,(8+LL)*8+LL : NEXT I
```
- generate random heat values and store them the last screen row

```
120 for J=0TO20:for I=0 to 31:A=BB-j*32+I:v= vpeek(a)mod8:d=RND(1)*3: AB=A - D +1 - 32: vpoke AB, (8+V)*8+V:NEXT I,J
```
- compute heat advection from bottom to top screen

```
150 K$=INKEY$:K=(K$<>""): R=-K*(4-R) + (1+K)*R:goto110:
```
- check key press, R is switched to stop/start generation of new heat values

```
160 _TURBOOFF
```
- uncomment line to end of turbo section
```
310 DATA 11, 88, 99,  ba, 98,   64, 73, 82, 91, 100

```
- tile map