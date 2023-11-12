module nibble_2s_complement_tb();
reg [3:0]data_in;
wire [3:0]data_out;

nibble_2s_complement dut(.data_in(data_in),.data_out(data_out));

initial begin
   repeat(25)
        begin
        data_in=$random;
        #5$display("The Input Nibble is Data_in=%b and the 2's Complemented Output is Data_out=%b",data_in,data_out);
        #5;
        end
    $finish;
end
endmodule
