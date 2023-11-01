# VLSI_LAB_Practice_Questions

## Code Explaination

## Practice Question 1
### Verilog Code
1. **Module Declaration:**
    ```verilog
    module logic_gates_3in(a, b, c, yor, yand, ynor, ynand, yxor, yxnor);
    ```
   - `module` keyword declares the start of a module named `logic_gates_3in`.
   - `input a, b, c;` declares three input signals `a`, `b`, and `c`.
   - `output yor, yand, ynor, ynand, yxor, yxnor;` declares six output signals.

2. **Logical Operations:**
    ```verilog
    or(yor, a, b, c);
    and(yand, a, b, c);
    nor(ynor, a, b, c);
    nand(ynand, a, b, c);
    xor(yxor, a, b, c);
    xnor(yxnor, a, b, c);
    ```
   - `or`: Generates the logical OR of inputs `a`, `b`, and `c` and assigns the result to `yor`.
   - `and`: Generates the logical AND of inputs `a`, `b`, and `c` and assigns the result to `yand`.
   - `nor`: Generates the logical NOR of inputs `a`, `b`, and `c` and assigns the result to `ynor`.
   - `nand`: Generates the logical NAND of inputs `a`, `b`, and `c` and assigns the result to `ynand`.
   - `xor`: Generates the logical XOR of inputs `a`, `b`, and `c` and assigns the result to `yxor`.
   - `xnor`: Generates the logical XNOR of inputs `a`, `b`, and `c` and assigns the result to `yxnor`.

3. **End of Module:**
    ```verilog
    endmodule
    ```
   - `endmodule` denotes the end of the Verilog module.
This Verilog code encapsulates a module that takes three input signals and computes six different logical operations on these inputs, providing the results through six output signals. These operations include OR, AND, NOR, NAND, XOR, and XNOR logic gates applied to the three input signals.


### Testbench Code
1. **Module Declaration:**
    ```verilog
    module logic_gates_3in_tb;
    reg a, b, c;
    wire yor, yand, ynor, ynand, yxor, yxnor;
    ```
   - `module` keyword declares the start of a module named `logic_gates_3in_tb`.
   - `reg a, b, c;` declares three register variables `a`, `b`, and `c` for input.
   - `wire yor, yand, ynor, ynand, yxor, yxnor;` declares six wire variables for output.

2. **Instantiation of `logic_gates_3in`:**
    ```verilog
    logic_gates_3in dut(.a(a), .b(b), .c(c), .yor(yor), .yand(yand), .ynor(ynor), .ynand(ynand), .yxor(yxor), .yxnor(yxnor));
    ```
   - Instantiates the `logic_gates_3in` module, connecting the inputs and outputs of the `logic_gates_3in` module to the testbench.

3. **Initial Block:**
    ```verilog
    initial begin
        repeat(10) begin
            a = $random;
            b = $random;
            c = $random;
            #5; // Delays simulation time by 5 time units
        end
        $finish; // Terminates simulation
    end
    ```
   - `initial` block: Defines the initial behavior of the simulation.
   - `repeat(10)`: Loops 10 times to simulate 10 test cases.
   - Inside the loop, `$random` assigns random values to variables `a`, `b`, and `c`.
   - `#5;` delays simulation time by 5 time units before the next iteration.
   - `$finish;`: Terminates the simulation after the loop is completed.

4. **End of Module:**
    ```verilog
    endmodule
    ```
   - `endmodule` denotes the end of the Verilog module.
This testbench generates random values for inputs a, b, and c and applies them to the logic_gates_3in module for 10 iterations. The delays between each iteration are to simulate some time passing. The simulation terminates after the 10 iterations.
The purpose of this testbench is to verify the functionality of the logic_gates_3in module by providing random inputs and observing the corresponding outputs.


### OUTPUT WAVEFORM
![image](https://github.com/tusharshenoy/VLSI_LAB_Practice_Questions/assets/107348474/f38e76bd-b972-48f2-95a1-d996cd9b76c3)




## Practice Question 2
### Verilog Code
1. **Module Declaration:**
   ```verilog
   module nibble_2s_complement(
       input [3:0] data_in,
       output [3:0] data_out
   );
   ```
   - `input [3:0] data_in`: Declares a 4-bit input named `data_in`.
   - `output [3:0] data_out`: Declares a 4-bit output named `data_out`.

2. **Two's Complement Operation:**
   ```verilog
   assign data_out = ~(data_in) + 1'b1;
   ```
   - `assign` statement is used to perform the two's complement operation on `data_in` and assign the result to `data_out`.
   - `~(data_in)` performs the one's complement (bitwise negation) of the input `data_in`.
   - `1'b1` represents the binary number 1.
   - `+` and the following `1'b1` adds 1 to the one's complement value, effectively performing the addition of 1 in two's complement form.

The two's complement operation in this module takes the input data, negates each bit (one's complement), and adds 1 to obtain the two's complement representation. The result is stored in `data_out`.
This module can be used to convert a positive binary number in 4-bit `two's complement form`.

### Testbench Code
1. **Module Declaration:**
   ```verilog
   module nibble_2s_complement_tb();
   reg [3:0] data_in;
   wire [3:0] data_out;
   ```
   - `module` keyword starts the testbench module named `nibble_2s_complement_tb`.
   - `reg [3:0] data_in;` declares a 4-bit register for input data.
   - `wire [3:0] data_out;` declares a 4-bit wire for output data.

2. **Instantiation of `nibble_2s_complement`:**
   ```verilog
   nibble_2s_complement dut(.data_in(data_in), .data_out(data_out));
   ```
   - Instantiates the `nibble_2s_complement` module, connecting the input and output ports.

3. **Initial Block:**
   ```verilog
   initial begin
       repeat(25) begin
           data_in = $random; // Assigns random 4-bit values to data_in
           #5 $display("The Input Nibble is Data_in=%b and the 2's Complemented Output is Data_out=%b", data_in, data_out);
           #5; // Delays simulation time by 5 time units
       end
       $finish; // Terminates simulation
   end
   ```
   - `initial` block: Defines the initial behavior of the simulation.
   - `repeat(25)`: Loops 25 times to simulate 25 test cases.
   - Inside the loop, `$random` assigns random 4-bit values to the `data_in` register.
   - `#5 $display(...)`: Displays the input `data_in` and the corresponding two's complement output `data_out`.
   - `#5;`: Delays simulation time by 5 time units before the next iteration.
   - `$finish;`: Terminates the simulation after the loop is completed.

4. **End of Module:**
   ```verilog
   endmodule
   ```
   - `endmodule` denotes the end of the Verilog module.
   - This testbench is designed to test the functionality of the `nibble_2s_complement` module by generating random 4-bit input values and displaying the input nibble along with its corresponding two's complement output. The simulation runs for 25 iterations before terminating.

### CONSOLE OUTPUT
![image](https://github.com/tusharshenoy/VLSI_LAB_Practice_Questions/assets/107348474/9b2047ce-2c34-4b43-87b1-43e054376388)

### OUTPUT WAVEFORM
![image](https://github.com/tusharshenoy/VLSI_LAB_Practice_Questions/assets/107348474/da9732f2-5b6c-4aa3-91c4-388209c41bd2)



## Practice Question 3
### MOD N UP Counter
### Verilog Code
1. **Module Declaration:**
    ```verilog
    module modnupcounter(clk, reset, count);
    input clk, reset;
    output reg [3:0] count; // Output is a 4-bit counter
    integer i = 0;
    parameter N = 8; // MOD value, can be modified
    ```
    - `module` keyword begins the module named `modnupcounter`.
    - `input clk, reset;` declares input signals for clock and reset.
    - `output reg [3:0] count;` declares a 4-bit output register for the counter.
    - `integer i = 0;` initializes an integer variable `i` (not used in the code).
    - `parameter N = 8;` sets the modulus 'N' for the counter. The counter will count up to this value.

2. **Always Block:**
    ```verilog
    always @(posedge clk)
    begin
        if (reset)
        begin
            count = 0; // Reset the counter to 0 when the reset signal is asserted
        end
        else if (count < N - 1)
        begin
            count = count + 1; // Increment the counter if it's less than N-1
        end
        else
        begin
            count = 4'b0000; // Reset the counter to 0 when it reaches N-1
        end
    end
    ```
    - The `always` block triggers on the positive edge of the clock (`posedge clk`).
    - When the `reset` signal is high, the counter is reset to 0.
    - If the counter is less than N-1, it increments by 1 with each clock cycle.
    - If the counter reaches N-1, it is reset back to 0. This forms the modulo-N behavior.

3. **End of Module:**
    ```verilog
    endmodule
    ```
    - `endmodule` denotes the end of the Verilog module.

This module is a basic up counter that counts up on each clock cycle, except when it reaches the specified modulus 'N'. It then resets the counter to 0 and continues counting, thus implementing a modulo-N up counter. The `N` parameter specifies the modulus, which determines the maximum count before the counter resets.

### Testbench Code
1. **Module Declaration:**
   ```verilog
   module modnupcounter_tb();
   reg clk, reset;
   wire [3:0] count; // Output of the counter
   ```
   - `module` keyword starts the testbench module named `modnupcounter_tb`.
   - `reg clk, reset;` declares two register variables for clock and reset signals.
   - `wire [3:0] count;` declares a 4-bit wire for the counter output.

2. **Instantiation of `modnupcounter`:**
   ```verilog
   modnupcounter dut(.clk(clk), .reset(reset), .count(count));
   ```
   - Instantiates the `modnupcounter` module, connecting its ports to the testbench signals.

3. **Initial Block:**
   ```verilog
   initial begin
       reset = 1'b1; // Sets reset high initially
       clk = 1'b0; // Sets clock low initially
       #8 reset = 1'b0; // After 8 time units, lowers the reset signal
   end
   ```
   - `initial` block defines the initial behavior of the simulation.
   - Initially, the `reset` signal is set to 1 for a brief period.
   - After 8 time units (`#8`), the `reset` signal is lowered to 0.

4. **Clock Generation:**
   ```verilog
   always #5 clk = ~clk;
   ```
   - Generates a clock signal. The `always` block toggles the `clk` signal every 5 time units.

5. **End of Module:**
   ```verilog
   endmodule
   ```
   - `endmodule` denotes the end of the Verilog module.

This testbench initializes the clock and reset signals, sets the initial values, and generates a clock with a period of 10 time units (5 time units high and 5 time units low). The aim is to test the `modnupcounter` module's functionality using the clock and reset signals provided by the testbench.

### OUTPUT WAVEFORM
![image](https://github.com/tusharshenoy/VLSI_LAB_Practice_Questions/assets/107348474/e6f9c637-0e05-49f2-961a-f62ce6a362e5)



### MOD N DOWN Counter
### Verilog Code
1. **Module Declaration:**
    ```verilog
    module modndowncounter(clk, reset, count);
    input clk, reset;
    output reg [3:0] count; // Output is a 4-bit counter
    integer i = 0;
    parameter N = 10; // MOD value, determines the maximum count
    ```
    - `module` keyword begins the module named `modndowncounter`.
    - `input clk, reset;` declares input signals for clock and reset.
    - `output reg [3:0] count;` declares a 4-bit output register for the counter.
    - `integer i = 0;` initializes an integer variable `i` (not used in the code).
    - `parameter N = 10;` sets the modulus 'N' for the counter. The counter will count down to 0 and then load the value N-1.

2. **Always Block:**
    ```verilog
    always @(posedge clk)
    begin
        if (reset)
        begin
            count = 0; // Reset the counter to 0 when the reset signal is asserted
        end
        else if (count > 0)
        begin
            count = count - 1; // Decrement the counter if it's greater than 0
        end
        else
        begin
            count = N - 1; // Load the counter with N-1 when it reaches 0
        end
    end
    ```
    - The `always` block triggers on the positive edge of the clock (`posedge clk`).
    - When the `reset` signal is high, the counter is reset to 0.
    - If the counter is greater than 0, it decrements by 1 with each clock cycle.
    - If the counter reaches 0, it is loaded with the value N-1, implementing a modulo-N down counter.

3. **End of Module:**
    ```verilog
    endmodule
    ```
    - `endmodule` denotes the end of the Verilog module.

This module implements a down counter that counts down on each clock cycle, except when it reaches 0, at which point it loads the value N-1. The `N` parameter specifies the modulus, which determines the maximum count before the counter reloads with N-1.

### Testbench Code
1. **Module Declaration:**
   ```verilog
   module modndowncounter_tb();
   reg clk, reset;
   wire [3:0] count; // Output of the counter
   ```
   - `module` keyword starts the testbench module named `modndowncounter_tb`.
   - `reg clk, reset;` declares two register variables for clock and reset signals.
   - `wire [3:0] count;` declares a 4-bit wire for the counter output.

2. **Instantiation of `modndowncounter`:**
   ```verilog
   modndowncounter dut(.clk(clk), .reset(reset), .count(count));
   ```
   - Instantiates the `modndowncounter` module, connecting its ports to the testbench signals.

3. **Initial Block:**
   ```verilog
   initial begin
       reset = 1'b1; // Sets reset high initially
       clk = 1'b0; // Sets clock low initially
       #8 reset = 1'b0; // After 8 time units, lowers the reset signal
   end
   ```
   - `initial` block defines the initial behavior of the simulation.
   - Initially, the `reset` signal is set to 1 for a brief period.
   - After 8 time units (`#8`), the `reset` signal is lowered to 0.

4. **Clock Generation:**
   ```verilog
   always #5 clk = ~clk;
   ```
   - Generates a clock signal. The `always` block toggles the `clk` signal every 5 time units.

5. **End of Module:**
   ```verilog
   endmodule
   ```
   - `endmodule` denotes the end of the Verilog module.

This testbench initializes the clock and reset signals, sets their initial values, and generates a clock signal. The aim is to test the `modndowncounter` module's functionality using the provided clock and reset signals in the testbench simulation.

### OUTPUT WAVEFORM
![image](https://github.com/tusharshenoy/VLSI_LAB_Practice_Questions/assets/107348474/f6b45032-9aaf-48c8-8c05-d578ffd1aae5)



### MOD N UP DOWN Counter
### Verilog Code
1. **Module Declaration:**
    ```verilog
    module modnupdowncounter(clk, reset, ud, count);
    input clk, reset, ud; // Inputs for clock, reset, and up/down control
    output reg [3:0] count; // Output is a 4-bit counter
    integer i = 0;
    parameter N = 10; // MOD value, sets the maximum count
    ```
    - `module` keyword starts the module named `modnupdowncounter`.
    - `input clk, reset, ud;` declares inputs for clock, reset, and up/down control.
    - `output reg [3:0] count;` declares a 4-bit output register for the counter.
    - `integer i = 0;` initializes an integer variable `i` (not used in the code).
    - `parameter N = 10;` sets the modulus 'N' for the counter.

2. **Always Block:**
    ```verilog
    always @(posedge clk)
    begin
        if (reset)
        begin
            count = 0; // Reset the counter to 0 when the reset signal is asserted
        end
        else if (ud == 0) // Up count
        begin
            if (count < N - 1)
                count = count + 1; // Increment the counter if it's less than N-1
            else
                count = 4'b0000; // Reset the counter to 0 when it reaches N-1
        end
        else if (ud == 1) // Down count
        begin
            if (count > 0)
                count = count - 1; // Decrement the counter if it's greater than 0
            else
                count = N - 1; // Load the counter with N-1 when it reaches 0
        end
    end
    ```
    - The `always` block triggers on the positive edge of the clock (`posedge clk`).
    - When the `reset` signal is high, the counter is reset to 0.
    - If `ud` is 0, the counter increments (up count) up to N-1 and then resets to 0.
    - If `ud` is 1, the counter decrements (down count) to 0 and then loads the value N-1.

3. **End of Module:**
    ```verilog
    endmodule
    ```
    - `endmodule` denotes the end of the Verilog module.

This module functions as a combined up/down counter. The `ud` input controls the direction of the counting operation: when `ud` is 0, it counts up, and when `ud` is 1, it counts down. The counter resets when it reaches the maximum value (N-1 for up count, 0 for down count).

### Testbench Code
1. **Module Declaration:**
   ```verilog
   module modnupdowncounter_tb();
   reg clk, reset, ud;
   wire [3:0] count; // Output of the counter
   ```
   - `module` keyword starts the testbench module named `modnupdowncounter_tb`.
   - `reg clk, reset, ud;` declares three register variables for clock, reset, and up/down control signals.
   - `wire [3:0] count;` declares a 4-bit wire for the counter output.

2. **Instantiation of `modnupdowncounter`:**
   ```verilog
   modnupdowncounter dut(.clk(clk), .reset(reset), .ud(ud), .count(count));
   ```
   - Instantiates the `modnupdowncounter` module, connecting its ports to the testbench signals.

3. **Initial Block:**
   ```verilog
   initial begin
       ud = 0; // Sets up/down control signal initially for up count
       reset = 1'b1; // Sets reset high initially
       clk = 1'b0; // Sets clock low initially
       #8 reset = 1'b0; // After 8 time units, lowers the reset signal
       #400 ud = 1; // After 400 time units, changes the up/down control to down count
   end
   ```
   - `initial` block defines the initial behavior of the simulation.
   - The up/down control `ud` is set to 0 initially for up count.
   - The `reset` signal is set to 1 for a brief period and then lowered.
   - After 400 time units (`#400`), the `ud` signal is changed to 1 for down count.

4. **Clock Generation:**
   ```verilog
   always #5 clk = ~clk;
   ```
   - Generates a clock signal. The `always` block toggles the `clk` signal every 5 time units.

5. **End of Module:**
   ```verilog
   endmodule
   ```
   - `endmodule` denotes the end of the Verilog module.

This testbench initializes the clock, reset, and up/down control signals, generates a clock, and changes the up/down control signal from up count to down count during the simulation. The aim is to test the functionality of the `modnupdowncounter` module using the provided signals in the testbench simulation.

### OUTPUT WAVEFORMS
#### 1)	 When ud=0 UP Count , MOD N UP Counter
![image](https://github.com/tusharshenoy/VLSI_LAB_Practice_Questions/assets/107348474/ac692aa0-bc18-4085-b92b-c1c9c246fc94)


#### 2)	When ud changes from 0 to 1 Down Count starts
![image](https://github.com/tusharshenoy/VLSI_LAB_Practice_Questions/assets/107348474/7efe7b2d-c87f-448d-9b37-09ffa85ea9ea)


#### 3)	When ud=1, DOWN Count, MOD N DOWN Counter
![image](https://github.com/tusharshenoy/VLSI_LAB_Practice_Questions/assets/107348474/d7252387-ed11-4734-9750-c49cb7e169f5)
