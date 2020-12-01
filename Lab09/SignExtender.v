module SignExtender(BusImm, Instr, Ctrl); 
    output [63:0] BusImm; 
    input [25:0] Instr; 
    input [1:0] Ctrl; 

    reg [63:0] result;

    always @ (*)
    begin
        // assign output, BusImm
        case(Ctrl)
            2'b00: // I-type, 12-bit immediate
            begin
                result = {52'b0, Instr[21:10]};
            end
            2'b01: // D-type, 9-bit address offset
            begin
                result = {{55{Instr[20]}}, Instr[20:12]};
            end
            2'b10: // B-type, 26-bit branch address
            begin
                result = {{36{Instr[25]}}, Instr[25:0], 2'b0};
            end
            2'b11: // CB-type, 19-bit branch address
            begin
                result = {{43{Instr[23]}}, Instr[23:5], 2'b0};
            end
        endcase
    end
    assign BusImm = result;
endmodule