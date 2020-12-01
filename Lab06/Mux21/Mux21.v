module Mux21(out, in, sel);
    // input/output declaration
    output out;
    input [1:0] in;
    input sel;
    // wire declaration
    wire N0, N1, N2;

    // gate level logic
    not NOT0(N0, sel);
    and AND0(N1, in[0], N0); // selects in[0] if sel is 0
    and AND1(N2, in[1], sel); // selects in[1] if sel is 1
    or OR0(out, N1, N2); // output from the AND gates
endmodule