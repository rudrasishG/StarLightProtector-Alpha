Smart FPGA-Based RISC-V Surveillance System

This project aims to develop a smarter alternative to traditional CCTV systems by integrating a machine learning (ML) model into an FPGA-based RISC-V processor. The system processes real-time sensor data to distinguish between normal playful behavior and genuine distress, enabling timely and context-aware alerts.

Phase 1: RISC-V Core Implementation on EP2C5T144 FPGA

The initial phase involves designing a 32-bit pipelined RISC-V processor on the Altera Cyclone II EP2C5T144 FPGA development board. The processor comprises five stages: Fetch, Decode, Execute, Memory, and Writeback, implemented using Verilog. ModelSim is utilized for simulation and verification of the processor's functionality. The EP2C5T144 board features 4Mbit of EPCS4 Flash memory, suitable for storing the processor's configuration and the ML model. 


Phase 2: Sensor Integration via SPI/I2C

In the second phase, external sensors are integrated to capture environmental and behavioral data. The EP2C5T144 board supports communication protocols such as SPI and I²C, facilitating the connection of various sensors. For instance, the L3G4200D gyroscope module communicates via I²C, while the AT45DBXX series data flash memory communicates via SPI. 

 These sensors provide real-time data that the RISC-V processor processes to detect behavioral patterns.

Phase 3: ML Model Deployment for Decision Making

The final phase involves deploying a machine learning model onto the FPGA to analyze sensor data and classify behaviors as normal or distressing. The 4Mbit EPCS4 Flash memory on the EP2C5T144 board is utilized to store the ML model, which is loaded into the processor's memory during initialization. 
 The processor performs inference locally, enabling real-time decision-making without relying on external servers
