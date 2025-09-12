// ================================================================
// Package: Room_tb
// Contains Light, Room, and Testbench in one file
// ================================================================
package Room_light;

// ----------------------------
// Light interface + module
// ----------------------------
interface Ifc_light;
    method Action ma_on;     // turn ON the light
    method Action ma_off;    // turn OFF the light
    method Bool   is_on;     // check current state
endinterface

module mk_light(Ifc_light);

    Reg#(Bool) rg_state <- mkReg(False);   // state register

    method Action ma_on;
        rg_state <= True;
    endmethod

    method Action ma_off;
        rg_state <= False;
    endmethod

    method Bool is_on;
        return rg_state;
    endmethod

endmodule


// ----------------------------
// Room interface + module
// ----------------------------
interface Ifc_room;
    interface Ifc_light subifc_light1;   // first light
    interface Ifc_light subifc_light2;   // second light
endinterface

module mk_room(Ifc_room);

    Ifc_light l1 <- mk_light;   // instantiate light1
    Ifc_light l2 <- mk_light;   // instantiate light2

    interface subifc_light1 = l1;
    interface subifc_light2 = l2;

endmodule


// ----------------------------
// Testbench
// ----------------------------
module mktb_room(Empty);

    Ifc_room room1 <- mk_room;             // instantiate a room
    Reg#(UInt#(4)) rg_step <- mkReg(0);    // step counter

    rule rl_switch;
        case (rg_step)

            0: begin 
                   room1.subifc_light1.ma_on;
                   $display("Light1 On ? %0d", room1.subifc_light1.is_on);
               end

            1: begin 
                   room1.subifc_light2.ma_on;
                   $display("Light2 On ? %0d", room1.subifc_light2.is_on);
               end

            2: begin 
                   room1.subifc_light1.ma_off;
                   $display("Light1 On ? %0d", room1.subifc_light1.is_on);
               end

            3: begin 
                   room1.subifc_light2.ma_off;
                   $display("Light2 On ? %0d", room1.subifc_light2.is_on);
                   $finish;   // end simulation
               end

        endcase

        rg_step <= rg_step + 1;   // increment step
    endrule

endmodule

endpackage
