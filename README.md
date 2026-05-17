# 8-bit CPU in SystemVerilog

Simple educational 8-bit CPU implemented in SystemVerilog and tested using Vivado2020.2.

## Description

This project implements a simple 8-bit CPU with a stack-based execution model. The CPU supports arithmetic, logic, stack, jump, call, and return instructions.

The CPU contains:
- ALU
- Stack
- Register File
- ROM
- Program Counter
- Instruction Register
- Control Unit

## Project Structure

```text
src/             CPU source modules
TB.sv            Testbench
MODULES.md       Description of each CPU module
INSTRUCTIONS.md  Instruction set description
