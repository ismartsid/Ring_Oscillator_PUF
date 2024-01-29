# Ring_Oscillator_PUF
# FPGA Ring Oscillator (RO) PUF

This repository contains the implementation of a Ring Oscillator (RO) Physical Unclonable Function (PUF) for an FPGA, as part of a lab assignment.

### Task 1: RO_basic Verilog Module
- Implemented the `RO_basic` Verilog module to create a ring oscillator with an Enable input and an oscillator output (`RO_out`).
- Constrained the placement of the RO to use a single LAB Cell X/Y Coordinate.
- Created a modified version of the module for simulation, addressing the combinational loop issue.

#### Report Details:
- Circuit schematic of the RO module.
- Assignments used to constrain the module placement.
- Screenshot of the synthesized RO placement in the Chip Planner tool, including the Fan-out of each RO signal.
- Explanation of the placement in the Chip Planner tool, addressing the presence of RO Logic and how Verilog maps to different ALMs.

### Task 2: Counter Group Module
- Filled in the contents of the Counter group module with two counters counting based on the frequency of RO outputs.
- Implemented a test bench to verify the correctness of the counter modules.
- Determined the number of bits used by the counter and explained the selection.

#### Report Details:
- Test bench output demonstrating the correct functionality of the counter modules.
- Explanation of the number of bits used in the counter module and the rationale behind the selection.

### Task 3: PUF Template Integration
- Integrated RO modules and counter modules into a single PUF module.
- Configured the PUF with 4 challenge bits for each counter group and 4 response bits.
- Utilized a script to generate location assignment constraints.

#### Report Details:
- Block diagram of the RO PUF, depicting each module and input/output signal.
- Explanation of design decisions, including the script and assignment outputs.

### Task 4: FPGA Integration
- Instantiated the PUF module in the `cyclone_v_top` module, connecting it with FPGA-specific inputs/outputs.
- Assigned FPGA inputs/outputs as follows: Reset (KEY 0), Cha0 (Switches 0-3), Cha1 (Switches 4-7), and Response (LEDG 0-3).

#### Report Details:
- Summary of synthesis results, including ALMs used and any other FPGA resources utilized.
- Screenshot of the Chip Planner showing the placement of RO modules, annotated with descriptions.
- Explanation of the chosen placement, including a detailed screenshot of a single RO with Fan-in and Fan-out.

### Task 5: CRP Harvesting and Evaluation
- Configured an FPGA with the PUF design and harvested at least 16 Challenge-Response Pairs (CRPs).
- Computed the Single-Chip Hamming Distance for the PUF and analyzed its performance.

#### Report Details:
- Explanation of the PUF performance, discussing the Hamming Distance and repeatability.

### Bonus Task: Multi-Chip Hamming Distance
- Configured another FPGA with the PUF design and harvested CRPs, optionally sharing bitstreams with another user.
- Computed the Multi-Chip Hamming Distance and analyzed the PUF performance for two devices.

#### Report Details:
- Explanation of the Multi-Chip Hamming Distance computation and discussion of PUF performance across different devices.

## Conclusion
This repository provides a comprehensive implementation of a Ring Oscillator PUF on an FPGA, along with detailed documentation and reports for each task.
