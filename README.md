## Project Overview
This project involves developing and testing a Verilog module that interfaces with the DSM camera, SDRAM, and VGA on the DE1-SoC board. The module processes captured images on the fly and displays the processed images on the screen. The project includes modifying a reference design to implement image processing, specifically 2D convolution with a 3x3 filter, and converting the output to greyscale.

## Skills Highlighted
- **Verilog HDL**: Developed and modified Verilog modules for image processing and interfacing with hardware components.
- **Digital Design**: Designed and implemented a 2D convolution filter for image processing.
- **Hardware Interfacing**: Interfaced with DSM camera, SDRAM, and VGA on the DE1-SoC board.
- **Image Processing**: Implemented Bayer to RGB conversion and greyscale conversion.
- **Simulation and Testing**: Created test benches for verifying the timing and correctness of the image processing module.
- **Quartus Prime**: Used Quartus Prime for synthesis, simulation, and IP generation.
- **System Integration**: Integrated multiple hardware components and ensured proper data flow between them.
- **Problem Solving**: Identified and resolved issues related to timing, data buffering, and filter implementation.

## Project Components
1. **Verilog Code**: 
   - Modified reference design to include image processing module.
   - Implemented 2D convolution with a 3x3 filter.
   - Converted Bayer pattern to RGB and then to greyscale.
   - Handled edge cases in convolution by duplicating edge pixels.

2. **Test Bench**:
   - Developed a test bench to verify the timing and correctness of the filtered pixels.
   - Annotated simulation logs to ensure proper functionality.

3. **Quartus Project**:
   - Synthesized the design using Quartus Prime.
   - Generated IP cores for PLL and FIFO.
   - Exported flow summary and noted resource utilization (ALMs, BRAM, DSP blocks).

4. **Report**:
   - Detailed the implementation process, including challenges faced and solutions.
   - Included simulation results and analysis.

## How to Run the Project
1. **Setup**:
   - Ensure you have Quartus Prime installed.
   - Download the DE1-SoC board support files and reference design.

2. **Synthesis**:
   - Open the Quartus project file.
   - Run synthesis and generate the bitstream.

3. **Simulation**:
   - Use Modelsim to simulate the design.
   - Include the path to Altera megafunctions in the simulation settings.

4. **Deployment**:
   - Program the DE1-SoC board with the generated bitstream.
   - Connect the DSM camera and VGA monitor to the board.
   - Run the design and observe the processed images on the VGA monitor.
