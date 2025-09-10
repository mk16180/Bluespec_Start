# Counter Interface in Bluespec

This project shows a simple **counter** implemented with an **interface** in Bluespec SystemVerilog (BSV).  
It supports both **increment** and **reset** operations.

---

## Files
- `counter_interface.bsv` → Contains:
  - `Ifc_counter` → Interface with `ma_incr`, `ma_reset`, and `mv_get`.  
  - `mk_counter` → Counter implementation (8-bit register).  
  - `mk_counter_tb` → Testbench with two versions:  
    - **Without Reset** → counter increments from 0 to 9.  
    - **With Reset** → counter increments, resets at step 5, then continues.

---

## How It Works

### Without Reset
- Counter starts at 0.  
- Increments by 1 each cycle.  
- Stops when it reaches 9.  

### With Reset
1. Counter increments until step 4.  
2. At step 5 → counter is reset to 0.  
3. After reset, counter increments again.  
4. Simulation ends at step 10.  

---