# Ring_Oscillator_PUF
# FPGA Ring Oscillator (RO) PUF

This repository contains the implementation of a Ring Oscillator (RO) Physical Unclonable Function (PUF) for an FPGA, as part of a lab assignment.

### Task 1: RO_basic Verilog Module
- Implemented the `RO_basic` Verilog module to create a ring oscillator with an Enable input and an oscillator output (`RO_out`).
- Constrained the placement of the RO to use a single LAB Cell X/Y Coordinate.
- Created a modified version of the module for simulation, addressing the combinational loop issue.

### Task 2: Counter Group Module
- Filled in the contents of the Counter group module with two counters counting based on the frequency of RO outputs.
- Implemented a test bench to verify the correctness of the counter modules.
- Determined the number of bits used by the counter and explained the selection.

### Task 3: PUF Template Integration
- Integrated RO modules and counter modules into a single PUF module.
- Configured the PUF with 4 challenge bits for each counter group and 4 response bits.
- Utilized a script to generate location assignment constraints.

### Task 4: FPGA Integration
- Instantiated the PUF module in the `cyclone_v_top` module, connecting it with FPGA-specific inputs/outputs.
- Assigned FPGA inputs/outputs as follows: Reset (KEY 0), Cha0 (Switches 0-3), Cha1 (Switches 4-7), and Response (LEDG 0-3).
