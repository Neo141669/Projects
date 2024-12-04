# Simulink Model: DC-DC Converter with PI Control

## Overview
This Simulink model demonstrates the operation of a **DC-DC buck converter** controlled by a **Proportional-Integral (PI)** controller. The model is designed to regulate the output voltage of the converter, ensuring it remains stable at a desired reference value despite variations in load or input voltage.

## Features
1. **Power Circuit**:
   - A DC source feeds a buck converter, consisting of a switch (IGBT), diode, inductor, and capacitor.
2. **Control System**:
   - A PI controller adjusts the duty cycle of the PWM signal to regulate the output voltage.
3. **Graphical Outputs**:
   - Displays the real-time output voltage and control signals.

## Components
### Inputs:
- **DC Voltage Source**: Provides the input voltage for the buck converter.
- **Reference Voltage Block**: Setpoint for the desired output voltage (default: 50 V).

### Control:
- **PI Controller**: Compares the reference voltage with the actual output voltage and minimizes the error.
- **PWM Generator**: Produces the required duty cycle based on the PI controller's output.

### Outputs:
- **Numerical Display**: Real-time display of the output voltage.
- **Graphical Visualization**: Plots key signals to monitor the system performance.

## How It Works
1. **Voltage Regulation**:
   - The PI controller continuously compares the measured output voltage with the reference voltage.
   - It adjusts the duty cycle of the switch to bring the output voltage closer to the reference value.
2. **Buck Converter Operation**:
   - Reduces the input DC voltage to a lower output DC voltage based on the duty cycle of the switch.
3. **Feedback Loop**:
   - Ensures that the system self-corrects for disturbances or variations in load.

## Steps to Use
1. Open the model in MATLAB Simulink.
2. Set the desired reference voltage in the reference voltage block.
3. Run the simulation and observe:
   - Output voltage on the display.
   - System behavior through graphical outputs.

## Applications
- Voltage regulation for DC systems.
- Study of control systems (PI controller performance).
- Demonstrating the operation of DC-DC converters.

## Prerequisites
- MATLAB with Simulink installed.
- Basic understanding of power electronics and control systems.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.