# Efficient Fault Detection Architectures for Modular Exponentiation Targeting Cryptographic Applications Benchmarked on FPGA

This repository contains all the codes related to our paper, "Efficient Fault Detection Architectures for Modular Exponentiation Targeting Cryptographic Applications Benchmarked on FPGA." The repository is organized into three folders:

## Folders

### Simulation
This folder includes all fault model simulations. 
- Written in C and utilizing the GMP library.

### Overhead
Contains the software implementation of the design on the ARM Cortex-A72 platform using PAPI.
- Written in C and utilizing the GMP library.

### RTL
Contains the RTL implementation of our design
- Written in Verilog.
- Includes two Verilog codes for our design and the unprotected design, two testbenches for these designs, a schematic of the critical path, and an example waveform simulation.
- The code works with inputs of size 512 bits and is written in a way to be easily extendable to bigger numbers.

## Example of the RTL code

In our design, in order to not exceed the total number of IOs, we used a 128-bit bus that fills each of our 512-bit inputs in 4 cycles. As an example, we gave the following values to the inputs:

```verilog
// reading x
bus_input = 128'd2013228201322897231989723198; 
#2 bus_input = 128'd3228201320028972319800972319; 
#2 bus_input = 128'd8923723643734835484584754319; 
#2 bus_input = 128'd2720193879543983574263346274; 

// reading y
#2 bus_input = 128'd5189234201322897231988329784; 
#2 bus_input = 128'd3238236285996847346347348243;
#2 bus_input = 128'd1238721378123123821389218312; 
#2 bus_input = 128'd9871263123613258613272636743; 
#2
