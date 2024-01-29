# Ring_Oscillator_PUF

This repository contains the Verilog implementation of a Ring Oscillator (RO) Physical Unclonable Function (PUF) designed for FPGA applications. The project is developed as part of a lab assignment and includes modular components for creating a reliable and secure PUF.

## Overview

### Modules

1. **ring_osc (Ring Oscillator):**
   - Verilog module to create a ring oscillator with an Enable input and an oscillator output.

2. **Counter:**
   - Module with two counters that count up based on the frequency of RO outputs (16 oscillators from ring_osc) selected by the Select Lines.
   - Includes a comparator to check which of the two counters reached its maximum value first. Output 0 indicates counter 1 reaches first, 1 indicates counter 2 reaches first.
3. **tb_counter (Test Bench for Counter):**
   - Verification test bench for ensuring the correct functionality of the Counter module.

4. **tb_ring_osc (Test Bench for Ring Oscillator):**
   - Verification test bench for ensuring the correct functionality of the ring_osc module.

5. **PUF.v:**
   - Module that combines the ring_osc module and Counter module into a single PUF module.
