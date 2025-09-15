package Gcd;

import StmtFSM :: *;

module mk_gcd(Empty);

    Reg#(UInt#(8)) reg_a <- mkReg(36);
    Reg#(UInt#(8)) reg_b <- mkReg(24);

    Stmt fsm = seq
        $display("Starting GCD with a=%0d, b=%0d", reg_a, reg_b);

        while(reg_a != reg_b)
            if(reg_a > reg_b) reg_a <= reg_a-reg_b;
            else              reg_b <= reg_b-reg_a;

        $display("GCD = %0d",reg_a);
        $finish;

    endseq;

    mkAutoFSM(fsm);


endmodule

endpackage