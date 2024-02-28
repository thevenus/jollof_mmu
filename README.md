# Jollof Matrix Multiplication Unit
## 4x8 Matrix Multiplication Accelerator ASIC

This repository contains the project files for the ETIN35 - IC Project 1 course. We designed a 4x8 matrix multiplier ASIC starting from the algorithmic description and ending with the actual ASIC PnR. The design utilizes only 2 multipliers for area efficiency and is implemented in VHDL 2002. Simulation is done with QuestaSim, synthesis with Genus, and PnR with Innovus.

![A test image](https://github.com/thevenus/jollof_mmu/blob/master/diagrams/Block%20Diagram.jpg)

## Project Structure
- PnR: Place and Route stage outputs and saved design files from Innovus
- diagrams: ASMDs related to controllers and the overall architecture of the ASIC
- functional_model_stimuli: MATLAB script to generate random matrix input and outputs for the verification
- jollof_sim: QuestaSim configurations folder. Generated output from the testbench is also saved here
- outputs: Genus synthesis step output files; contains synthesized netlist and timing information
- reports: Reports from Genus synthesis
- scripts: Synthesis and PnR scripts
- vhdl: RTL design and testbench files

## I/O Specification
## Inputs
- input[7:0]: Input matrix element; 1 sample per clock cycle; unsigned integer 
- valid_input: should stay high during the matrix element entry
- read_ram: when high, MMU dumps all the RAM content

## Outputs
- read_data_out[8:0]: time-multiplexed output matrix elements; each element is 18 bits and is divided to 2 parts to reduce number of pins
- finish: set to high for one clock-cycle upon completion of each matrix multiplication
