package light;

interface Ifc_light;
    method Action ma_on;
    method Action ma_off;
    method Bool is_on;
endinterface

module mk_light(Ifc_light);

    Reg#(Bool) rg_state <- mkReg;

    method Action ma_on;
        rg_state <= 1;
    endmethod

    method Action ma_off;
        rg_state <= 0;
    endmethod

    method Bool is_on;
        return rg_state;
    endmethod

endmodule

endpackage