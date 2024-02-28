# Jollof Matrix Multiplication Unit
## 4x8 Matrix Multiplication Accelerator ASIC

This repository contains the project files for the ETIN35 - IC Project 1 course. We designed a 4x8 matrix multiplier ASIC starting from the algorithmic description and ending with the actual ASIC PnR. The design utilizes only 2 multipliers for area efficiency and is implemented in VHDL 2002. Simulation is done with QuestaSim, synthesis with Genus, and PnR with Innovus.

## Project Structure
- PnR: Place and Route stage outputs and saved design files from Innovus
- diagrams: ASMDs related to controllers and the overall architecture of the ASIC
- functional_model_stimuli: MATLAB script to generate random matrix input and outputs for the verification
- jollof_sim: QuestaSim configurations folder. Generated output from the testbench is also saved here
- outputs: Genus synthesis step output files; contains synthesized netlist and timing information
- reports: Reports from Genus synthesis
- scripts: Synthesis and PnR scripts
- vhdl: RTL design and testbench files
