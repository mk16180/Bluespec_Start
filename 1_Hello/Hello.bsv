package Hello;

module mkHello();
    rule say_hello;
        $display("Hello, Bluespec World!");
        $finish;
    endrule
endmodule

endpackage