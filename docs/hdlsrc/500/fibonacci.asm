// set the maximum value to which the sequence has to go  
@10000
D=A
@4
M=D
// initialize the registers
@1
M=0
@2
M=1
// start loop phase 1
@1               
D=M
@2
D=D+M
@3
M=D
// check if 1000 is reached
@4               
D=D-M
@41
D=D, jgt
// start loop phase 2
@2               
D=M
@3
D=D+M
@1
M=D
// check if 1000 is reached
@4               
D=D-M
@41
D=D, jgt
// start loop phase 3
@3
D=M
@1
D=D+M
@2
M=D
// check if 1000 is reached
@4               
D=D-M
@41
D=D, jgt
// jump back to loop phase 1
@8
0;JMP
// infinite loop to catch end       (INFINITE_LOOP)
@41
0;JMP