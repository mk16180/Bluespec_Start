package Traffic_light;

typedef enum { RED, YELLOW, GREEN } Light_state deriving (Bits, Eq, FShow);

// Function: returns next state of traffic light
function Light_state fn_next_state(Light_state s);
    case (s)
        RED    : return GREEN;
        GREEN  : return YELLOW;
        YELLOW : return RED;
    endcase
endfunction

// Module: traffic light controller
module mk_traffic();
    Reg#(Light_state) state <- mkReg(RED);   // initialize state to RED

    Reg#(UInt#(10)) rg_count <- mkReg(1);

    rule rl_switch(rg_count<=10);

         $display("Count = %0d, Signal = ", rg_count, fshow(state));
        state <= fn_next_state(state);       // update to next state

        rg_count <= rg_count+1;

        if (rg_count == 10) $finish;
    
    endrule
endmodule



endpackage
