module nibble_2s_complement(
    input [3:0]data_in,
    output [3:0]data_out
    );
    assign data_out=~(data_in)+1'b1;
endmodule
