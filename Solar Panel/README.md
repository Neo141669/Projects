# Simulink Model: PV System Simulation with Irradiance and Ramp Input

## Overview
This Simulink model simulates the behavior of a photovoltaic (PV) system under varying irradiance and load conditions. The model calculates key outputs such as:
- PV voltage (\(V_{pv}\))
- PV current (\(I_{pv}\))
- PV power (\(P_{pv}\))

Additionally, it features graphical outputs for data visualization and analyzes the performance of the PV system.

## Features
1. **PV Subsystem**: Simulates a photovoltaic module with inputs for irradiance and ramp-based load variation.
2. **Dynamic Calculations**:
   - \(I_{pv}\): Photovoltaic current
   - \(V_{pv}\): Photovoltaic voltage
   - \(P_{pv}\): Power output
3. **Graphical Outputs**:
   - XY Graphs for visualizing relationships between \(V_{pv}\), \(I_{pv}\), and \(P_{pv}\).
4. **Output Monitoring**:
   - Outputs critical values as Simulink `out.simout` signals.
   - Displays computed values for reference, including total power and voltage levels.

## Components
### Inputs:
- **Irradiance Block**: Input irradiance value in W/m² (set to 1000 in this simulation).
- **RAMP Block**: Represents load variation over time.

### Subsystems:
- **PV Module**: Core calculation of PV behavior based on inputs.
- **Function Block (`Fcn`)**: Processes \(V_{pv}\) and \(I_{pv}\) to generate reference signals or evaluate PV behavior.

### Outputs:
- **Numerical Outputs**:
  - Real-time computed values such as \(V_{pv}\) and \(I_{pv}\) displayed on digital displays.
- **Graphical Outputs**:
  - XY graphs for visual analysis of system performance.

## How to Use
1. Open the Simulink model in MATLAB.
2. Set the irradiance value in the **Irradiance Block** (default: 1000 W/m²).
3. Adjust the load using the **RAMP Block** to simulate different conditions.
4. Run the simulation and observe:
   - Graphs for PV performance.
   - Numerical outputs for \(V_{pv}\), \(I_{pv}\), and \(P_{pv}\).

## Applications
- PV system analysis and optimization.
- Studying the impact of irradiance on PV system performance.
- Load variation impact on PV system behavior.

## Prerequisites
- MATLAB with Simulink installed.
- Basic knowledge of PV system dynamics.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.