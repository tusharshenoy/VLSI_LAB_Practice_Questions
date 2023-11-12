//Testbench
module logic_gates_3in_tb;

reg a,b,c;
wire yor,yand,ynor,ynand,yxor,yxnor;

logic_gates_3in dut(.a(a),.b(b),.c(c),.yor(yor),.yand(yand),.ynor(ynor),.ynand(ynand),.yxor(yxor),.yxnor(yxnor));

initial begin

repeat(10)
   begin
   a=$random;
   b=$random;
   c=$random;
   #5;
   end
   $finish;
end
endmodule
