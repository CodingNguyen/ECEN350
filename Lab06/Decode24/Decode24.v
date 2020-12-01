module Decode24(out, in);
  // input output declaration
  input [1:0] in;
  output [3:0] out;
  // reg declaration
  reg [3:0] out;
  
  // behavioral logic
  always
  begin @*
    if(in == 2'b00) // if input is 00, output is 0001
      out = 4'b0001;
    if(in == 2'b01) // if input is 01, out is 0010
      out = 4'b0010;
    if(in == 2'b10) // if input is 10, out is 0100
      out = 4'b0100;
    if(in == 2'b11) // if input is 11, out is 1000
      out = 4'b1000;
  end
endmodule