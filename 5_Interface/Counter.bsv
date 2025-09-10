package counter_interface;

// Interface: defines counter operations
interface Ifc_counter;
    method Action ma_incr();   // increment
    method Bit#(8) mv_get();   // read value
endinterface

// Module: counter implementation
module mk_counter(Ifc_counter);

    Reg#(Bit#(8)) rg_count <- mkReg(0); // 8-bit register

    method Action ma_incr();           // increment by 1
        rg_count <= rg_count + 1;
    endmethod   

    method Bit#(8) mv_get();           // return value
        return rg_count;
    endmethod

endmodule

// Testbench
module mk_counter_tb();

    Ifc_counter counter <- mk_counter; // instance

    rule rl_count (counter.mv_get < 10);
        counter.ma_incr;                         // incr
        $display("Count = %0d", counter.mv_get); // print
        if(counter.mv_get==9) $finish;           // stop
    endrule
   
endmodule

endpackage
