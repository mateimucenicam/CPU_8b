# Instruction Set

The CPU uses 8-bit instructions written in hexadecimal format.

Instruction format:

[7:4] -> instruction opcode
[3:0] -> register / value / address

The program is written directly inside the ROM memory.

Hex | Instruction | Behavior

0 | ADD | Uses the selected register and the stack top. Performs R = R + STACK_TOP
1 | SUB | Uses the selected register and the stack top. Performs R = R - STACK_TOP
2 | SHL | Uses the selected register and the stack top. Performs R = R << STACK_TOP
3 | SHR | Uses the selected register and the stack top. Performs R = R >> STACK_TOP
4 | AND | Uses the selected register and the stack top. Performs bitwise AND
5 | OR | Uses the selected register and the stack top. Performs OR
6 | XOR | Uses the selected register and the stack top. Performs XOR
7 | NOT | Uses only the selected register. Performs NOT
8 | INC | Uses only the selected register. Increments the register value
9 | DEC | Uses only the selected register. Decrements the register value
A | PUSHV | Pushes the value to the stack
B | PUSHR | Pushes the selected register value to the stack
C | POP | Pops the stack top into the selected register
D | JMP | Loads the given address into the Program Counter
E | CALL | Automatically pushes the return address to the stack, then jumps to the given address
F | RET | Pops the return address from the stack into the Program Counter
