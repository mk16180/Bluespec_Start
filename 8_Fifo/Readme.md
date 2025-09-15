# Producer-Consumer using FIFO in Bluespec

This design demonstrates a **simple producer-consumer system** using a **FIFO** in Bluespec SystemVerilog (BSV).  
The producer inserts data into the FIFO, and the consumer retrieves it. A stop condition ends the simulation.  

---

## Files
- **Producer_consumer.bsv**
  - **mk_pc** → Module implementing the producer-consumer system.
  - Uses one `FIFO#(UInt#(8))` for communication between producer and consumer.
  - A register `r_data` generates incremental data for the producer.  

---

## How It Works

### Components
- `ff_c` → FIFO buffer for transferring data between producer and consumer.  
- `r_data` → Register holding the current data to be produced (initialized to 0).  

### Rules
1. **Producer Rule (`rl_producer`)**  
   - Enqueues the value of `r_data` into the FIFO (if not full).  
   - Prints the produced value.  
   - Increments `r_data`.  

2. **Consumer Rule (`rl_consumer`)**  
   - Reads the front element from the FIFO (if not empty).  
   - Prints the consumed value.  
   - Dequeues the element.  

3. **Stop Rule (`rl_stop`)**  
   - Terminates the simulation when `r_data` reaches 6.  

---

## Execution Flow

1. `r_data` starts at 0.  
2. Producer enqueues data into the FIFO, consumer dequeues it.  
3. Both producer and consumer run in parallel, synchronized by the FIFO’s `notFull` / `notEmpty` conditions.  
4. Simulation stops after producing 6 values.  

---


