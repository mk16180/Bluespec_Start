/*

typedef enum {ADD, SUB} OP deriving (Bits, Eq);

typedef struct {
    OP operation;
    Bit#(8) operand1;
    Bit#(8) operand2;
} Instruction deriving (Bits, Eq);

module mkALU();
    Reg#(Instruction) instr <- mkReg(Instruction {operation : ADD , operand1 : 43, operand2 : 32});

    rule execute;
        let result = 
            case (instr.operation)
                ADD : instr.operand1 + instr.operand2;
                SUB : instr.operand1 - instr.operand2;
            endcase;
        $display("Result: %0d", result);
        $finish;
    endrule
endmodule  

*/


package ALU;

typedef enum {ADD, SUB} OP deriving (Bits, Eq);    

//instructio format

typedef struct {
    OP operation;
    Bit#(8) operand1;
    Bit#(8) operand2;
} Instruction deriving (Bits, Eq);

function Bit#(8) alu_execute(Bit#(17) instr_code);
    Instruction instr = unpack(instr_code);

    Bit#(8) result = 
        case (instr.operation)
            ADD : instr.operand1 + instr.operand2;
            SUB : instr.operand1 - instr.operand2;
        endcase;

    return result;

endfunction



module mkALU();
    rule test;
        Bit#(17) inst1 = 17'b0_00001000_00001101; // ADD 8 + 12
        Bit#(17) inst2 = 17'b1_00001100_00001000; // SUB 12 - 8

        Bit#(8) result1 = ALU::alu_execute(inst1);
        Bit#(8) result2 = ALU::alu_execute(inst2);

        $display("Result1 (ADD): %0d", result1); // Expected: 20
        $display("Result2 (SUB): %0d", result2); // Expected: 4
        $finish;


    endrule 


endmodule


endpackage :ALU 