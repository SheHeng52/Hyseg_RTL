# HySeg RTL for Elementary Function Evaluation

Verilog HDL implementations of six elementary mathematical functions.

## Overview

This repository provides the HySeg RTL implementations of elementary functions using piecewise-quadratic approximation. Each function includes its coefficient-selection logic and arithmetic datapath in a separate directory.

## Implemented Functions

Each function is organized in a separate directory.

| Directory | Function | Description | RTL interface |
| --- | --- | --- | --- |
| `exp2/` | `2^x` | Base-2 exponential | 24-bit input / 24-bit output |
| `log2/` | `log2(x)` | Base-2 logarithm | 24-bit input / 24-bit output |
| `recip/` | `1/x` | Reciprocal | 24-bit input / 24-bit output |
| `sqrt/` | `sqrt(x)` | Square root | 24-bit input / 24-bit output |
| `rsqrt/` | `1/sqrt(x)` | Reciprocal square root | 24-bit input / 24-bit output |
| `sinx/` | `sin(x)` | Sine | 24-bit input / 24-bit output |

## Implementation

- **Language:** Verilog HDL.
- **Approximation method:** Piecewise-quadratic approximation.
- **Top-level module:** `DC` in each function directory.
- **Interface:** Combinational `x[23:0]` input and `y[23:0]` output, without clock or reset ports.
- **Coefficient selection:** `PPA.v` contains the function-specific coefficient tables and selection logic.
- **Arithmetic datapath:** Booth partial-product generation and multiplier/adder logic are included with each implementation.

## Usage

Select one function directory, add its Verilog sources to your simulation or synthesis project, and select `DC` as the top-level module. Compile each function separately: different directories reuse module names with function-specific implementations.

The sources define function-specific bit slicing, coefficient scaling, and output rounding. The 24-bit interface widths do not by themselves specify numerical accuracy or IEEE 754 compatibility. Confirm the input domain and fixed-point interpretation for your application before integration.

This source release does not include a testbench, coefficient-generation scripts, timing constraints, or a numerical accuracy report.
