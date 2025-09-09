package Counter;

module mkCounter();
    Reg#(Bit#(8)) count <- mkReg(0);
    Reg#(Bit#(8)) dcount <- mkReg(10);

    rule increment (dcount == 0);
    if (count == 10) $finish;
    count <= count + 1;
    $display("Count = %0d", count + 1);
   
    endrule

    rule decrement (count == 0);
     if (dcount == 0) $finish;
    dcount <= dcount - 1;
    $display("dCount = %0d", dcount - 1);
    if (dcount == 0) $finish;
    endrule


endmodule    


endpackage