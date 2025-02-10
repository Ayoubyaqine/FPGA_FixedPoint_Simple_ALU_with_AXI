# FPGA_FixedPoint_Simple_ALU_with_AXI

# FPGA Fixed Point Simple ALU with AXI

## Project Overview

This project implements a **simple ALU (Arithmetic Logic Unit)** with fixed-point arithmetic, which is capable of performing basic arithmetic operations such as **addition**, **subtraction**, and **multiplication**. The ALU is designed to operate using fixed-point representation, with a defined number of integer and fractional bits, making it suitable for FPGA-based hardware design.

The project also integrates **AXI interfaces** for communication, providing a simple way to interact with the ALU through memory-mapped registers.

## Tools Used

- **Vivado 2022.1**: This tool was used for **design, synthesis**, and **implementation** of the hardware description (VHDL). Vivado is the primary tool for targeting Xilinx FPGAs, and it provides all necessary features for FPGA design, including simulation, synthesis, and bitstream generation.

- **Vitis 2022.1**: This tool was used for programming the **ARM processor** that runs alongside the FPGA. Vitis allows you to develop software applications for the processor and communicate with the hardware through the AXI interface.

## Key Features

- **Fixed-point arithmetic**: Supports both **integer** and **fractional** parts with configurable bit widths via **generic parameters** (total of up to 32 bits, with the sum of integer and fractional bits not exceeding 32). This allows flexibility in the precision of the fixed-point representation, making it compatible with both **positive** and **negative** values.
- **Arithmetic operations**: Capable of performing **addition**, **subtraction**, and **multiplication** on fixed-point numbers.
- **AXI communication**: Utilizes **AXI Lite** and **AXI GPIO** interfaces for communication between the ALU and the ARM processor.
- **FPGA-based hardware design**: Designed for implementation on an FPGA using VHDL.

## System Overview

This project includes both the hardware (FPGA-based) and software components. The **hardware part** is designed using VHDL and is responsible for performing the arithmetic operations. The **software part** runs on the ARM processor and sends commands to the FPGA via AXI interfaces.

- **Vivado 2022.1** was used to create the hardware components (ALU), perform **design**, **synthesis**, and **implementation** of the FPGA-based hardware, and integrate them with the AXI interface.
- **Vitis 2022.1** was used to write the **software code**, **build** the application, and **run** it on the ARM processor, enabling interaction with the ALU hardware through AXI communication.

## Project Structure

- **VHDL/**: Contains the VHDL files for the ALU design and the testbench for simulation.
- **C/**: Contains the software files for controlling the ALU and handling AXI communication.
- **bitstream/**: Contains the generated bitstream file for the FPGA and other necessary configuration files for programming the FPGA.
- **xsa/**: Contains the XSA (Xilinx Software Archive) file, which is used for hardware-software co-design and configuration in Vitis.
- **README.md**: This file, which provides an overview of the project.


## Advice


The user is kindly advised to ensure that the Block Diagram is correctly reproduced before testing the following project. 



![image](https://github.com/user-attachments/assets/e0595afb-ee4f-4a70-8a23-44b1c60ebf71)  

## CORA Z7 FPGA Implementation

The **ALU**, with the configuration of **16-bit integer** and **16-bit fractional fixed-point arithmetic**, has been **successfully implemented** on the **CORA Z7 FPGA board** (XC7Z007S-1CL400C). The design utilized **711 LUTs** (5% of available LUTs) and **929 Flip-Flops (FFs)** (3% of available FFs). The **worst negative slack** was **12.158 ns**, and the **worst hold slack** was **0.053 ns**.



