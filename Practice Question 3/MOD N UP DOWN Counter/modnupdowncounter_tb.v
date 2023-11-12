module modnupdowncounter_tb();

reg clk,reset,ud;
wire [3:0]count;// Change the Count Size if the N value is greater than 16

modnupdowncounter dut(.clk(clk),.reset(reset),.ud(ud),.count(count));

initial begin
ud=0;
reset=1'b1;
clk=1'b0;
#8 reset=1'b0;
#400 ud=1;
end

always #5 clk=~clk;
endmodule
