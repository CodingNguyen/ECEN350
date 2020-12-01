module HalfAdd(Cout, Sum, A, B);
    // input/output declaration
    output Sum, Cout;
    input A, B;
    // wire declaration
    wire N0, N1, N2, N3;

    // Carryout (AND)
    nand n0(N0, A, B);
    nand nC(Cout, N0, N0);

    // Sum (XOR)
    nand n1(N1, A, B);
    nand n2(N2, A, N1);
    nand n3(N3, N1, B);
    nand nS(Sum, N2, N3);
endmodule