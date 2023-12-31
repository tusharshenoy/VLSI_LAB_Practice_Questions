module modnupdowncounter(clk,reset,ud,count);
 parameter N=10;/*MOD*/
 input clk,reset,ud;//if ud=0 Up Count else down count
 output reg [3:0]count;// Change the Count Size if the N value is greater than 16

 
    always@(posedge clk)
      begin
            if(reset)
                begin
                count=0;
                end
            else 
              if(ud==0)
              begin
                 if(count<N-1)
                     count=count+1;
                 else  count=4'b0000;
              end            
              else if(ud==1)
              begin
                 if(count>0)
                     count=count-1;
                 else count=N-1;
              end

       end
endmodule
