
## MATLAB Filter Design

The filter was designed in MATLAB using a Hamming window. The resulting coefficients were quantized to signed Q1.15 fixed-point representation for use in the Verilog implementation.

### Frequency Response

![FIR Filter Frequency Response](Results/FIR_Frequency_Response.png)

The MATLAB response measurements were approximately:

- At 5 kHz: -0.77 dB
- At 8 kHz: -21.45 dB

## Simulation and Verification

The RTL was simulated using a testbench in the Vivado flow.

- Input samples checked: 32
- Mismatches: 0
- Testbench result: **PASS**

![FIR Simulation Passed](Simulation/FIR_Simulation_Passed.png)

## FPGA Synthesis Results

The following resource utilization values were obtained from the Vivado synthesis report for the target Artix-7 FPGA.

| Resource | Used | Available | Utilization |
|---|---:|---:|---:|
| LUTs | 656 | 20,800 | 3.15% |
| Flip-flops | 93 | 41,600 | 0.22% |
| DSP blocks | 30 | 90 | 33.33% |
| I/O | 36 | 106 | 33.96% |

<!-- Add the real synthesis screenshot here once its filename is confirmed. -->

These figures represent synthesis resource utilization and are specific to the reported design and target FPGA.

## FPGA Implementation

The Vivado implementation flow completed routing with zero reported failed routes.

Timing closure has not been verified because user timing constraints were not specified. A completed implementation flow alone does not establish that the design meets its intended clock timing.

Physical FPGA programming and hardware validation have not been claimed as completed.

## Power Analysis

Vivado reported an estimated total on-chip power of approximately 0.14 W:

- Dynamic power: approximately 0.070 W
- Static power: approximately 0.070 W

The power report indicated **LOW confidence**, and no design power budget was specified. These values are tool estimates, not measurements from physical hardware.

<!-- Add the real power report screenshot here once its filename is confirmed. -->
