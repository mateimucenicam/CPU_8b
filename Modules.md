# CPU Modules

ALU

The ALU executes arithmetic and logic operations.

Inputs:
- selected register value(first operand)
- stack top value(second operand)
- opcode

Operations:
ADD
SUB
SHL
SHR
AND
OR
XOR
NOT
INC
DEC

Outputs:
- result
  
After the instruction is executed, the stack top value is automatically removed from the stack.
For single operand operations the stack top input is ignored.

---

STACK

The Stack is a 64x8-bit memory used for temporary data storage during program execution.

The stack input can come from:
- the selected register
- the immediate value from the instruction
- the Program Counter

---

REGISTER FILE

The Register File contains 16 general purpose 8-bit registers.

The register write data can come from:
- the ALU result
- the stack top

---

ROM

256x8-bit program memory.

Stores the CPU instructions.

Input:
- Program Counter address

Output:
- current instruction

---

PROGRAM COUNTER

The Program Counter stores the address of the current instruction executed by the CPU.

It is used to access the ROM memory during instruction fetch.

The Program Counter input can come from:
- the instruction address
- the stack top

---

INSTRUCTION REGISTER

The Instruction Register stores the current instruction fetched from ROM.

The upper 4 bits represent the instruction.

The lower 4 bits represent:
- a register
- an immediate value

---

CONTROL UNIT

Main control logic of the CPU.

Reads the instruction from the Instruction Register and generates control signals.

Controls:
- ALU operations
- stack push/pop
- register write
- Program Counter behavior
- instruction execution flow

---

TOP MODULE

Connects all CPU modules together.

Contains:
- ALU
- STACK
- REGISTER FILE
- ROM
- PROGRAM COUNTER
- INSTRUCTION REGISTER
- CONTROL UNIT
- MUX modules

Represents the complete CPU.
