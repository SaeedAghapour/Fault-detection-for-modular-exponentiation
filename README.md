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
Now after concatenating these values, we will have:

x = 107181096097186378386495372756115860548240683684552949497926464298454241768495188094746805632722962677454846352783492038807606632616871985696830

y = 388947570762849937889120895886016267814583191274336692749645606301627675973214121785859906371997644684832365337486375699778064432896283425049912

We also hard-coded the value of the N to:
N = 6546781215792283740026379393655198304433284092086129578966582736192267592811158361160873250205301610942534116815327485528835146905182458761960050655233

By giving the recomputation index l=50 we obtained:

Result = x^y mod N = 1373065806580089022657233789677299315555489534222876430239370087387639501787688406501509484315576859706023473143497978020414499731790532047388955358555
Result_partial 1 = 346425864537359836083092787379260650815507921028777314012174716085051524324362688586421468683649507480232388983612686871620678486381531007385264716321

Result_partial_2 = 3456425864537359836083092787379260650815507921028777314012174716085051524324362688586421468683649507480232388983612686871620678486381531007385264716321

Weight1 = Weight2 = 169

***************************************************************************************************************************************
Based on the value of the l, the design takes at least 69,000 cycles to complete so make sure to change the simulation settings to cover this amount of iterations.
***************************************************************************************************************************************
