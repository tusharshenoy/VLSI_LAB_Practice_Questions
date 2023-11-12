module modndowncounter(clk,reset,count);
 parameter N=10;/*MOD*/
 input clk,reset;
 output reg [3:0]count;// Change the Count Size if the N value is greater than 16

 
    always@(posedge clk)
      begin
            if(reset)
                begin
               count=0;
                end
            else if(count>0)
                begin
                      count=count-1;
                end
            else count=N-1;
       end
endmodule
