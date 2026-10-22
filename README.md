# VLSI Design of FIR Filter for DSP Applications

A 32-tap low-pass Finite Impulse Response (FIR) filter designed using MATLAB and implemented in Verilog HDL for an AMD/Xilinx Artix-7 FPGA target using Vivado.

## Project Overview

This project demonstrates the digital design and FPGA implementation workflow for an FIR filter. MATLAB is used to generate and validate the filter coefficients, while Verilog HDL describes the hardware architecture. Vivado is used for behavioral simulation, synthesis, implementation, and resource and power estimation.

## Design Specifications

| Parameter | Value |
|---|---|
| Filter type | Low-pass FIR |
| Filter order | 31 |
| Number of taps | 32 |
| Sampling frequency | 48 kHz |
| Nominal cutoff frequency | 6.5 kHz |
| Window function | Hamming |
| Coefficient format | Signed Q1.15 |
| FPGA target | Artix-7, Basys 3 device |
| Device part | `xc7a35tcpg236-1` |
| Design language | Verilog HDL |

## Tools Used

- MATLAB — coefficient generation and reference response
- Verilog HDL — FIR hardware description
- AMD/Xilinx Vivado 2026.1 — simulation, synthesis, implementation and analysis

## Project Workflow

1. Design the low-pass FIR filter in MATLAB using a Hamming window.
2. Quantize the coefficients into signed Q1.15 fixed-point format.
3. Implement the 32-tap FIR filter in Verilog HDL.
4. Verify the RTL using an impulse-response testbench.
5. Synthesize and implement the design in Vivado.
6. Review FPGA resource utilization and estimated on-chip power.

## Repository Structure

- `MATLAB/` — design scripts, coefficients and frequency-response plots
- `RTL/` — synthesizable FIR filter RTL
- `Testbench/` — Verilog testbench
- `Simulation/` — waveform and simulation evidence
- `Synthesis/` — synthesized schematic, utilization and power evidence
- `Implementation/` — implementation evidence
- `Results/` — coefficient validation and MATLAB reference outputs
- `Documentation/` — design report

## Verification Results

The behavioral simulation was run in Vivado using an impulse input followed by zero-valued samples.

- Samples checked: **32**
- Mismatches: **0**
- Result: **PASS**

The RTL output matched the testbench's expected fixed-point impulse-response values for all 32 samples.

## Synthesis Results

The Vivado synthesis utilization report showed:

| Resource | Used | Available | Utilization |
|---|---:|---:|---:|
| LUT | 656 | 20,800 | 3.15% |
| Flip-flops | 93 | 41,600 | 0.22% |
| DSP blocks | 30 | 90 | 33.33% |
| I/O resources | 36 | 106 | 33.96% |

These values are from the synthesis report and may differ from final implementation resource summaries.

## Implementation and Power

Vivado reported successful completion of the implementation run, with zero failed routes.

The generated power report estimated total on-chip power at **0.14 W**, comprising approximately 0.070 W dynamic power and 0.070 W device static power.

These are tool estimates, not physical board measurements. Vivado marked the power-analysis confidence as low, and no design power budget was specified.

**Timing limitation:** The timing summary was initially generated without user-specified timing constraints. Timing closure at a target clock frequency has therefore not been verified.

## Limitations and Future Work

- Add and validate clock and I/O timing constraints.
- Re-run implementation and review setup and hold timing.
- Improve power-estimation confidence using appropriate switching-activity data.
- Compare resource use and timing under alternative FIR architectures or coefficient implementations.
- Optionally program a Basys 3 board and validate the design in hardware.

## Project Status

MATLAB design, RTL development, behavioral simulation, synthesis, implementation and initial resource/power analysis have been completed. Timing-constraint validation and physical FPGA testing remain future work.

## License

Add a license file before redistributing the project. Until a license is selected, reuse permissions are not explicitly granted.