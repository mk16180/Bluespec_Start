# Room-Light with Subinterfaces in Bluespec

This design demonstrates the concept of **subinterfaces** in Bluespec SystemVerilog (BSV).  
A `Room` contains two `Light` subinterfaces, and a testbench toggles them ON and OFF step by step.

---

## Files
- **Room_light.bsv**
  - **Ifc_light** → Interface for a single light (`ma_on`, `ma_off`, `is_on`).
  - **mk_light** → Light implementation (ON/OFF state using a register).
  - **Ifc_room** → Interface with two subinterfaces (`subifc_light1`, `subifc_light2`).
  - **mk_room** → Room implementation (instantiates two lights).
  - **mktb_room** → Testbench that controls both lights step by step.

---

## How It Works

### Light Module
- Provides three methods:
  - `ma_on` → Turn ON the light.
  - `ma_off` → Turn OFF the light.
  - `is_on` → Check whether the light is ON or OFF.
- Maintains state using a **Bool register (`rg_state`)**.

### Room Module
- Encapsulates **two light modules**.
- Exposes them as subinterfaces:
  - `subifc_light1`
  - `subifc_light2`

### Testbench (mktb_room)
- Uses a **step counter (`rg_step`)** to sequence operations.
- Simulation steps:
  1. Turn ON Light1 → print status.
  2. Turn ON Light2 → print status.
  3. Turn OFF Light1 → print status.
  4. Turn OFF Light2 → print status and **end simulation**.

---

## Simulation Flow
1. **Step 0** → Light1 ON  
2. **Step 1** → Light2 ON  
3. **Step 2** → Light1 OFF  
4. **Step 3** → Light2 OFF → Simulation ends  

---

## Key Takeaways
- **Subinterfaces** allow hierarchical design (`Room` → `Lights`).
- Scalable: `Room` could contain multiple lights, fans, or devices.
- Demonstrates **interface composition** in Bluespec.
- Shows how a testbench can control submodules step by step.
