
# **Three-Phase Induction Motor Design Using MATLAB**

## **Project Overview**
This MATLAB project calculates the design parameters for a three-phase induction motor using analytical methods. The project employs electrical and magnetic equations to derive key motor specifications such as stator and rotor dimensions, losses, and efficiency.

## **Key Features**
- **Input Parameters**: The program allows specifying input parameters like output power, voltage, efficiency, frequency, and power factor.
- **Derived Outputs**:
  - Main dimensions (stator and rotor diameters, length)
  - Flux density in various motor components
  - Copper losses, iron losses, and overall efficiency
  - Rotor slip and magnetizing current
- **Stator and Rotor Design**: Computes slot dimensions, core dimensions, and winding parameters.
- **Loss Calculation**: Includes iron losses, copper losses, and friction/windage losses.

## **How It Works**
1. **Input Parameters**:
   - Power Output: 2.2 kW
   - Voltage: 400 V
   - Efficiency: 80%
   - Power Factor: 0.825
   - Speed: 1500 rpm
   - Other constants for design considerations like flux densities, current densities, etc.

2. **Calculated Outputs**:
   - Main Dimensions:
     - Diameter (D): `0.11 m`
     - Length (L): `0.12 m`
   - Magnetic Parameters:
     - Flux per pole (Fm): `4.5 mWb`
     - Turns per phase (Ts): `419`
   - Loss and Efficiency:
     - Copper Loss: `92.16 W`
     - Efficiency: `83.89 %`

## **File Description**
- **`Polyphase_induction_motor.m`**: Main MATLAB script containing all calculations for the motor design.
- **Diagrams**:
  - Attach circuit diagrams or a Simulink model screenshot (if applicable).

## **How to Run**
1. Install MATLAB (tested on version R2020a and above).
2. Clone this repository:
   ```bash
   git clone https://github.com/your-username/Polyphase_induction_motor.git
   ```
3. Open `Polyphase_induction_motor.m` in MATLAB.
4. Run the script by typing:
   ```matlab
   run Polyphase_induction_motor
   ```

## **Results**
- The script outputs key motor specifications, including:
  - Input Power (Q): `2.2 kW`
  - Output Co-efficient (Co): `97.0662`
  - Stator Slot Pitch (Yss): `0.0138 m`
  - Rotor Slip (S): `0.0508`
  - Efficiency: `83.89%`

## **Dependencies**
- MATLAB R2020a or newer.
- No additional toolboxes are required.

## **Future Scope**
- Extend the project to support different pole counts and frequencies.
- Automate plotting of motor performance curves.
- Create a GUI for easier parameter selection.

## **License**
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.