module logic_expression_tb;

reg a,b,c,d;
wire y;

logic_expression dut(.a(a),.b(b),.c(c),.d(d),.y(y));

initial begin

repeat(10)
   begin
   a=$random;
   b=$random;
   c=$random;
   d=$random;
   #5;
   end
   $finish;
end
endmodule
