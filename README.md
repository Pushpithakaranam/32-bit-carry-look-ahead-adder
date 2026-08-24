\# 32-bit Carry Look-Ahead Adder



\## Overview



This project implements a \*\*32-bit Carry Look-Ahead Adder (CLA)\*\* using Verilog HDL.



A Carry Look-Ahead Adder is a fast binary adder that reduces the delay caused by ripple carry propagation by calculating carry signals in advance using \*\*Generate (G)\*\* and \*\*Propagate (P)\*\* signals.



\## Objective



The objective of this project is to design and simulate a \*\*32-bit Carry Look-Ahead Adder\*\* using hierarchical Verilog modules.



The design is built using smaller modules and combines them to create the complete 32-bit adder.



\## Architecture



The 32-bit CLA is designed hierarchically:



\- 1-bit Generate/Propagate logic

\- 4-bit Carry Look-Ahead Adder

\- 32-bit Carry Look-Ahead Adder

\- Verilog testbench for functional verification



\### Basic Concept



For each bit:



\- \*\*Generate:\*\* `G = A \& B`

\- \*\*Propagate:\*\* `P = A ^ B`



The carry signals are calculated using the generate and propagate signals instead of waiting for the carry to ripple through every stage.



\## Project Files



| File | Description |

|------|-------------|

| `cla\_32bit.v` | Top-level 32-bit Carry Look-Ahead Adder |

| `cla\_4bit.v` | 4-bit Carry Look-Ahead Adder module |

| `gp\_1bit.v` | 1-bit Generate and Propagate logic |

| `tb.v` | Verilog testbench for functional verification |



\## Features



\- 32-bit binary addition

\- Carry Look-Ahead architecture

\- Hierarchical Verilog design

\- Modular RTL implementation

\- Functional verification using a Verilog testbench

\- Designed using standard digital design principles



\## Tools Used



\- \*\*Verilog HDL\*\*

\- \*\*Xilinx ISE 14.7\*\*

\- \*\*ModelSim / Xilinx simulation environment\*\* (as applicable)



\## Expected Inputs and Outputs



\### Inputs



\- `A` – 32-bit input

\- `B` – 32-bit input

\- `Cin` – Input carry



\### Outputs



\- `Sum` – 32-bit sum

\- `Cout` – Output carry



The design performs:



`A + B + Cin = Sum + Cout`



\## Verification



A Verilog testbench is provided in `tb.v` to verify the functionality of the 32-bit Carry Look-Ahead Adder with different input combinations.



\## Applications



Carry Look-Ahead Adders are useful in high-speed arithmetic circuits such as:



\- ALUs

\- CPUs

\- DSP processors

\- Arithmetic datapaths

\- Digital signal processing systems



\## Project Structure



```text

32-bit-carry-look-ahead-adder/

│

├── cla\_32bit.v

├── cla\_4bit.v

├── gp\_1bit.v

├── tb.v

└── README.md

