// predefined symbols
//   A: Address Register.
//   D: Data Register.
//   M: Refers to the register in Main Memory whose address is currently stored in A.
//   SP: RAM address 0.
//   LCL: RAM address 1.
//   ARG: RAM address 2.
//   THIS: RAM address 3.
//   THAT: RAM address 4.
//   R0-R15: Addresses of 16 RAM Registers, mapped from 0 to 15.
//   SCREEN: Base address of the Screen Map in Main Memory, which is equal to 16384.
//   KBD: Keyboard Register address in Main Memory, which is equal to 24576.
//
// set the maximum value to which the sequence has to go  
@10000
D=A
@R15
M=D
// init
@R1
M=0
@R2
M=1
(START_L)
// start loop phase 1
D=0
@R1
D=D+M
@R2
D=D+M
@R3
M=D
// check if MAX is reached
@R15
D=D-M
@INFINITE_LOOP
D;JGE
// start loop phase 2
D=0
@R2
D=D+M
@R3
D=D+M
@R1
M=D
// check if MAX is reached
@R15
D=D-M
@INFINITE_LOOP
D;JGE
// start loop phase 3
D=0
@R3
D=D+M
@R1
D=D+M
@R2
M=D
// check if MAX is reached
@R15
D=D-M
@INFINITE_LOOP
D;JGE
@START_L
0;JMP
// infinite loop to catch end
(INFINITE_LOOP)
@INFINITE_LOOP
0;JMP