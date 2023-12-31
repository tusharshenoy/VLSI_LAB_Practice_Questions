module modnupcounter(clk,reset,count);
 parameter N=8;/*MOD*/
 input clk,reset;
 output reg [3:0]count;// Change the Count Size if the N value is greater than 16

 
    always@(posedge clk)
      begin
            if(reset)
                begin
               count=0;
                end
            else if(count<N-1) 
                begin
                      count=count+1;
                end
            else count=4'b0000;
       end
endmodule
