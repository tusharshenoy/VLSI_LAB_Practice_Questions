//Practice Question 1
module logic_gates_3in(a,b,c,yor,yand,ynor,ynand,yxor,yxnor);

input a,b,c;

output yor,yand,ynor,ynand,yxor,yxnor;

or(yor,a,b,c);
and(yand,a,b,c);
nor(ynor,a,b,c);
nand(ynand,a,b,c);
xor(yxor,a,b,c);
xnor(yxnor,a,b,c);

endmodule
