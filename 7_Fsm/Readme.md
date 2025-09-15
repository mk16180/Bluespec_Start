# GCD Calculation using StmtFSM in Bluespec

This design demonstrates how to implement a **sequential GCD (Greatest Common Divisor) calculation** using **StmtFSM** in Bluespec SystemVerilog (BSV).  
The FSM automatically executes the algorithm step by step without requiring explicit rules.

---

## Files
- **Gcd.bsv**
  - **mk_gcd** → Module implementing the GCD FSM.
  - Uses two `Reg#(UInt#(8))` registers for inputs `a` and `b`.
  - Computes the GCD using a simple subtraction-based algorithm.

---

## How It Works

### Registers
- `reg_a` → stores first number (initialized to 36)  
- `reg_b` → stores second number (initialized to 24)  

### FSM Sequence
1. Display the starting values of `reg_a` and `reg_b`.
2. Execute a **while loop** until the two registers are equal:
   - If `reg_a > reg_b`, subtract `reg_b` from `reg_a`.
   - Else, subtract `reg_a` from `reg_b`.
3. Display the final GCD.
4. Finish the simulation.

### StmtFSM Benefits
- Allows **imperative-style sequences** inside Bluespec.
- Handles automatic rule scheduling.
- Simplifies writing sequential algorithms like GCD.

---

## Simulation Flow

1. Initial values: `a = 36`, `b = 24`.
2. Subtraction steps are executed automatically by the FSM.
3. Final GCD value printed when `reg_a == reg_b`.
4. Simulation stops with `$finish`.

**Expected Output:**
