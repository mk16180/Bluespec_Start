package counter_interface;

// Interface: defines counter operations
interface Ifc_counter;
    method Action ma_incr();   // increment
    method Action ma_reset();                   //Adding reset to design
    method Bit#(8) mv_get();   // read value
    
endinterface

// Module: counter implementation
module mk_counter(Ifc_counter);

    Reg#(Bit#(8)) rg_count <- mkReg(0); // 8-bit register

    method Action ma_incr();           // increment by 1
        rg_count <= rg_count + 1;
    endmethod   

    method Action ma_reset();              //resetting
        rg_count <= 0;
    endmethod

    method Bit#(8) mv_get();           // return value
        return rg_count;
    endmethod

endmodule

// Testbench
module mk_counter_tb();

    Ifc_counter counter <- mk_counter; // instance

    Reg#(Bit#(8)) rg_step <- mkReg(0);


    /* /////Without Reset 
    rule rl_count (counter.mv_get < 10);
        counter.ma_incr;                         // incr
        $display("Count = %0d", counter.mv_get); // print
        if(counter.mv_get==9) $finish;           // stop
    endrule
    */

    //With Reset

    rule rl_count (rg_step <= 10);

        //Incrment
        if(rg_step < 5) begin
            counter.ma_incr;
            $display("Count = %0d", counter.mv_get);
        end
        
        
        //Reset
        else if(rg_step == 5) begin
            counter.ma_reset;
            $display("Step = %0d: reset -> Count = %0d ", rg_step, counter.mv_get);
        end

        //Increment
        else if (rg_step > 5 && rg_step < 9) begin
            counter.ma_incr;
            $display("Count = %0d", counter.mv_get);
        end

      rg_step <= rg_step + 1;
      if (rg_step == 10) $finish;

    endrule

endmodule

endpackage


