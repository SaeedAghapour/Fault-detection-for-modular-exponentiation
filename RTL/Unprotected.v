
module Unprotected(
    input rst,
    input clk,
    input [127:0] bus_input,
    output reg done
);
parameter size_input = 512;
parameter slice_size = 128;

reg [size_input-1:0] x, y, x_tmp, y_tmp, temp_result, mod_output, modu, result;
reg [2*size_input-1:0] input_mul1, input_mul2, mod_input, temp2, m;
reg [3*size_input-1:0] temp, output_mul;
reg [slice_size-1:0] slice1, slice2;
reg [2*slice_size-1:0] p;
integer clock_counter, i, j, k, length1, length2, flag_state, flag;
reg [7:0] state;
reg mode, input_ready;
reg [3:0] counter_input;

parameter [size_input-1:0] N = 512'd6546781215792283740026379393655198304433284092086129578966582736192267592811158361160873250205301610942534116815327485528835146905182458761960050655233;
// N = 2^501 + 2^250 + 2^68 + 1 (prime)
parameter [size_input-1:0] phi = 512'd6546781215792283740026379393655198304433284092086129578966582736192267592811158361160873250205301610942534116815327485528835146905182458761960050655232;
// phi(N) = N - 1
parameter [2*size_input-1:0] m1 = 1024'd27459190640522438859927603196325572869077741200573221637577853836742172733583035658129981808462539071835655874836851530433440531992738742985468138025476161536;
// m1 = 2^(2*size_input)/N
parameter [2*size_input-1:0] m2 = 1024'd27459190640522438859927603196325572869077741200573221637577853836742172733583035658129981808462539071835655874836851530433440531992738742985468138025480355840;
// m2 = 2^(2*size_input)/phi

always @(posedge clk) begin
    if (rst) begin
        temp_result <= 512'h0;
        result <= 512'h0;
        state <= 0;
        done <= 0;
        k <= 0;
        i <= 0;
        j <= 0;
        temp <= 0;
        x_tmp <= 0;
        x <= 0;
        y <= 0;
        y_tmp <= 0;
        mod_output <= 0;
        mod_input <= 0;
        temp2 <= 0;
        output_mul <= 0;
        clock_counter <= 0;
        input_ready <= 0;
        counter_input <= 0;
    end else begin
        clock_counter <= clock_counter + 1;
        if (input_ready == 0) begin
            case (counter_input)
                5'd0: x[127:0] <= bus_input;   // Store first 128 bits
                5'd1: x[255:128] <= bus_input; // Store next 128 bits
                5'd2: x[383:256] <= bus_input; // Store next 128 bits
                5'd3: x[511:384] <= bus_input; // Store the last 128 bits
                // filling y through the 128-bit bus
                5'd4: y[127:0] <= bus_input;   // Store first 128 bits
                5'd5: y[255:128] <= bus_input; // Store next 128 bits
                5'd6: y[383:256] <= bus_input; // Store next 128 bits
                5'd7: begin
                    y[511:384] <= bus_input;   // Store next 128 bits
                    input_ready <= 1;
                end
            endcase
            if (counter_input < 8) begin
                counter_input <= counter_input + 1;
            end
        end else if (input_ready == 1) begin
            case (state)
                0: begin
                    flag <= 0;
                    temp_result <= 512'h1;
                    mode <= 1;
                    mod_input <= y;
                    x_tmp <= x;
                    k <= 0;
                    state <= 5;
                end
    
                1: begin
                    mode <= 0;
                    if (y_tmp[k] == 1) begin
                        state <= 2;
                    end else if (y_tmp[k] == 0) begin
                        state <= 4;
                    end
                end
    
                2: begin
                    flag_state <= 2;
                    flag <= 2;
                    length1 = size_input;
                    length2 = size_input;
                    input_mul1 <= temp_result;
                    input_mul2 <= x_tmp;
                    state <= 3;
                    if (i >= length1) begin
                        mod_input <= output_mul;
                        i = 0;
                        j = 0;
                        mode = 0;
                        state <= 5;
                    end
                end
    
                3: begin
                    // multiplication state (Schoolbook method)
                    slice1 = input_mul1 >> i;   // Shift x to obtain slice
                    slice2 = input_mul2 >> j;   // Shift y to obtain slice
                    p = slice1 * slice2;        // Multiply sliced portions
                    temp = temp + (p << (i+j)); // Shift and accumulate the product
                    j = j + slice_size;
                    if (j == length2) begin
                        if (i >= length1) begin
                            output_mul <= temp;
                            temp <= 0;
                            state <= flag_state;
                        end else begin
                            i = i + slice_size;
                            j = 0;
                        end
                    end
                end
    
                4: begin
                    flag_state <= 4;
                    flag <= 4;
                    length1 = size_input;
                    length2 = size_input;
                    input_mul1 <= x_tmp;
                    input_mul2 <= x_tmp;
                    state <= 3;
                    if (i >= length1) begin
                        mod_input <= output_mul;
                        i <= 0;
                        j <= 0;
                        mode = 0;
                        state <= 5;
                    end
                end
    
                5: begin
                    // initialization for the reduction
                    if (mode == 0) begin
                        m = m1;
                        modu = N;
                    end else if (mode == 1) begin
                        m = m2;
                        modu = phi;
                    end
                    if (mod_input < modu) begin
                        mod_output <= mod_input;
                        state <= 9;
                    end else begin
                        i = 0;
                        j = 0;
                        state <= 6;
                    end
                end
    
                6: begin
                    // Barrett Reduction (states 6, 7, and 8)
                    flag_state <= 6;
                    length1 <= 576; // actual size of m
                    length2 <= 2*size_input;
                    input_mul1 <= m;
                    input_mul2 <= mod_input;
                    state <= 3;
                    if (i >= length1) begin
                        i = 0;
                        j = 0;
                        output_mul = output_mul >> (2*size_input);
                        state <= 7;
                    end
                end
    
                7: begin
                    flag_state <= 7;
                    length1 = size_input;
                    length2 = size_input;
                    input_mul1 <= output_mul;
                    input_mul2 <= modu;
                    state <= 3;
                    if (i >= length1) begin
                        state <= 8;
                        i = 0;
                        j = 0;
                    end
                end
    
                8: begin
                    temp2 = (mod_input) - output_mul;
                    if (temp2 >= modu)
                        temp2 = temp2 - modu;
                    else begin
                        mod_output <= temp2;
                        state <= 9;
                    end
                end
    
                9: begin
                    if (flag == 0) begin
                        y_tmp <= mod_output;
                        state <= 1;
                    end else if (flag == 2) begin
                        temp_result <= mod_output;
                        state <= 4;
                    end else if (flag == 4) begin
                        x_tmp <= mod_output;
                        state <= 10;
                    end
                end
    
                10: begin
                    // Updating the exponent and going to the next bit
                    k = k + 1;
                    if (k == size_input) begin
                        done <= 1;
                        result <= temp_result;
                        state <= 11;
                    end else begin
                        state <= 1;
                    end
                end
            endcase
        end
    end
end

endmodule
