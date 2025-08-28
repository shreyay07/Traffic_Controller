#  Traffic Light Controller 

## Overview
This project implements a **Traffic Light Controller** using Verilog HDL.  
The design is based on a **finite state machine (FSM)**, controlling North-South (NS) and East-West (EW) signals.

### Encoding of Lights
- `00` → Green  
- `01` → Yellow  
- `10` → Red  

The **red phase is implicit**: when one direction is Green/Yellow, the opposite direction is Red.  
Thus, total Red time = Green + Yellow of the opposite signal.

---

## Tools Used
- **Cadence Xcelium** → Simulation & Verification  
- **Cadence Genus** → Logic Synthesis  

---

## File Structure

├── src/ 
│   └── Traffic_controller.v          # RTL code 
│ 
├── tb/ 
│   └──Traffic_controller_tb.v       # Testbench 
│ 
├── synthesis/ 
│   └──Traffic_controller_synth.v   # Synthesized netlist   
│   └──synth_script.tcl             # Genus Synthesis script
│   
├── images/ 
│   └──Waveform.png                 # Simulation Waveform
│   └──testbench_schematic.png      #Schematic of testbench   
│   └── stdcell_schematic.png       #Schematic after synthesis
│    
└── README.md

---

## Usage

### 1. Simulation (Xcelium)
```bash
xrun src/Traffic_controller.v Traffic_controller_tb.v -access +rwc -gui &

2. Synthesis (Genus)

genus -files synthesis/synth_script.tcl
 ```


---

Results

✅ FSM transitions verified with Xcelium.

✅ Waveforms confirm correct Green → Yellow → Red sequencing.

✅ Synthesized successfully in Genus with timing met.
