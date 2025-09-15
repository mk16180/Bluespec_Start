package Producer_consumer;

import FIFO :: *;  

module mk_pc(Empty);

   FIFO#(UInt#(8)) ff_c <- mkFIFO;
   Reg#(UInt#(8)) r_data <- mkReg(0);

   rule rl_producer;
      ff_c.enq(r_data);   // only fires if FIFO not full
      $display("Producer Data -> %0d", r_data);
      r_data <= r_data + 1;
   endrule

   rule rl_consumer;
      $display("Consumer Data -> %0d", (ff_c.first));
      ff_c.deq;           // only fires if FIFO not empty
   endrule

   rule rl_stop;
      if (r_data == 6) $finish;
   endrule

endmodule

endpackage
