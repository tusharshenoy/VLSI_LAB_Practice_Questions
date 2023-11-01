module logic_expression(a,b,c,d,y);

//Consider y=ab+cd+abcd

input a,b,c,d;
output y;

wire w1,w2,w3;

and(w1,a,b);
and(w2,c,d);
and(w3,a,b,c,d);

or(y,w1,w2,w3);

endmodule
