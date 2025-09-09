package AdderProviso; 

/*
function Bit#(nm) addValues(Bit#(n) x, Bit#(m) y )
   // provisos(Add#(n, m, nm));       WITHOUT PROVISO  --> expected BSV 3.8 keyword `provisos'
return zeroExtend(x) + zeroExtend(y);
endfunction

*/


function Bit#(nm) addValues(Bit#(n) x, Bit#(m) y )
    provisos(Add#(n, m, nm));
return zeroExtend(x) + zeroExtend(y);
endfunction





module mkAdderProviso();
    Bit#(8) a = 5;
    Bit#(16) b = 10;


    rule test; 
        let result = addValues(a, b);
        $display("a=%0d, b=%0d, result = %0d", a, b, result);
        $finish;
    endrule

endmodule

endpackage