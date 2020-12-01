module gates(input      [3:0] a, b,
  output reg [3:0] y1, y2, y3, y4, y5);
  always @(b)
    begin
    y1 = a & b;
    y2 = a | b;
    y3 = a ^ b;
    y4 = ~(a & b);
    y5 = ~(a | b);
  end
endmodule

module priority(input      [3:0] a,
   output reg [1:0] y);
   always @(*)
     if      (a == 4'b1000) y = 2'b11;
     else if (a == 4'b0100) y = 2'b10;
     else if (a == 4'b0010) y = 2'b01;
     else if (a == 4'b0001) y = 2'b00;

endmodule