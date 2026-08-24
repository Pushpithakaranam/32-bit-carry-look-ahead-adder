\# 32-bit Carry Look-Ahead Adder



A hierarchical RTL implementation of a \*\*32-bit Carry Look-Ahead Adder (CLA)\*\* using Verilog HDL, with functional verification and FPGA-oriented synthesis analysis.



\---



**\## 📌 Objective**



The objective of this project is to design and verify a \*\*32-bit Carry Look-Ahead Adder\*\* using Verilog HDL.



Unlike a Ripple Carry Adder, where the carry propagates sequentially from one bit to the next, a Carry Look-Ahead Adder calculates carry signals in advance using \*\*Generate (G)\*\* and \*\*Propagate (P)\*\* signals.



This reduces carry propagation delay and makes the CLA suitable for high-speed arithmetic applications.



\---



**\## 🏗️ Design Overview**



The design is implemented hierarchically using smaller modules:





&#x20;                ```text

&#x20;                32-bit Carry Look-Ahead Adder

&#x20;                             │

&#x20;         ┌───────┬───────┬───────┬───────┐

&#x20;         │       │       │       │       │

&#x20;      4-bit    4-bit   4-bit   4-bit    ...

&#x20;        CLA      CLA     CLA     CLA

&#x20;         │       │       │       │

&#x20;         └───────┴───────┴───────┴───────┘

&#x20;                             │

&#x20;                      8 × 4-bit CLA

&#x20;                          Blocks

&#x20;                             │

&#x20;                   Generate / Propagate

&#x20;                          Logic

&#x20;                             │

&#x20;                        Sum + Cout

```



The design uses:



1-bit Generate/Propagate logic

4-bit Carry Look-Ahead Adder

Multiple 4-bit blocks to construct the 32-bit adder

A Verilog testbench for functional verification

**##**⚙️ How Carry Look-Ahead Works**



For each bit position, the Generate and Propagate signals are calculated as:



Generate:

G = A \& B



Propagate:

P = A ^ B



The carry output of each stage is then calculated using these signals instead of waiting for the carry to ripple through every preceding stage.



For a bit position:



C(i+1) = G(i) + P(i)C(i)



This approach allows carry signals to be determined faster than in a conventional Ripple Carry Adder.



**##📂 Module Description**

File	Description

cla\_32bit.v	Top-level 32-bit Carry Look-Ahead Adder

cla\_4bit.v	4-bit Carry Look-Ahead Adder

gp\_1bit.v	Generate and Propagate logic

tb.v	Verilog testbench for functional verification

##**🔬 Simulation \& Verification**



The design was functionally verified using a Verilog testbench.



The testbench applies different combinations of:



32-bit input A

32-bit input B

Input carry Cin



and verifies the resulting:



32-bit Sum

Output carry Cout

Simulation Waveform



The following waveform demonstrates the simulated behavior of the 32-bit Carry Look-Ahead Adder.



**##📊 Synthesis \& Analysis Results**



The design was synthesized using Xilinx ISE 14.7 and analyzed for area, timing, and power characteristics.



Area Analysis

LUT Utilization



I/O Utilization



Timing / Delay Analysis



The timing analysis result is shown below:



Power Analysis



The estimated power analysis result is shown below:



**##🧰 Tools Used**

Verilog HDL

Xilinx ISE 14.7

RTL Design

Functional Simulation

FPGA Synthesis and Analysis

**##📁 Project Structure**

32-bit-carry-look-ahead-adder/

│

├── cla\_32bit.v

├── cla\_4bit.v

├── gp\_1bit.v

├── tb.v

│

├── waveform.png

├── area\_lut.png

├── area\_iob.png

├── delay.png

├── power.png

│

└── README.md

🚀 Applications



Carry Look-Ahead Adders can be used in high-speed arithmetic circuits such as:



Arithmetic Logic Units (ALUs)

Processor datapaths

DSP systems

High-speed arithmetic units

Digital signal processing applications

**##🔮 Future Improvements**

Perform detailed synthesis and area analysis

Analyze maximum operating frequency

Compare CLA performance with a Ripple Carry Adder

Add more comprehensive testbench scenarios

Add corner-case verification

Explore FPGA hardware implementation

Extend verification using SystemVerilog and UVM

