module protected(
    input rst,
    input clk,
    input [127:0] bus_input,
    output reg fault_flag
);
parameter size_input = 512;
parameter slice_size = 128;
integer index = 50; // recomputation index

reg [2*size_input-1:0] input_mul1, input_mul2, mod_input, temp2, m;
reg [size_input-1:0] x, y, x1, x2, y1, y2, x_tmp, y_tmp, temp_result, mod_output, modu, result, result_partial_1, result_partial_2;
reg [slice_size-1:0] slice1, slice2;
reg [2*slice_size-1:0] p;
reg [3*size_input-1:0] temp, output_mul, q;
integer clock_counter, i, j, k, length1, length2, flag_state, flag, recomputation_flag;
reg mode, input_ready, lfsr_done, feedback, done;
reg [3:0] counter_input, lfsr_counter, encoder_counter;
reg [7:0] state, lfsr;
integer seed = 5;
reg [8:0] weight_1, weight_2;
reg [5:0] k1, k2, k3, k4; // encoding indexes

parameter [size_input-1:0] N = 512'd6546781215792283740026379393655198304433284092086129578966582736192267592811158361160873250205301610942534116815327485528835146905182458761960050655233;
// N = 2^501 + 2^250 + 2^68 + 1 (prime)
parameter [size_input-1:0] phi = 512'd6546781215792283740026379393655198304433284092086129578966582736192267592811158361160873250205301610942534116815327485528835146905182458761960050655232;
// phi(N) = N - 1
parameter [2*size_input-1:0] m1 = 1024'd27459190640522438859927603196325572869077741200573221637577853836742172733583035658129981808462539071835655874836851530433440531992738742985468138025476161536;
// m1 = 2^(2*size_input)/N
parameter [2*size_input-1:0] m2 = 1024'd27459190640522438859927603196325572869077741200573221637577853836742172733583035658129981808462539071835655874836851530433440531992738742985468138025480355840;
// m2 = 2^(2*size_input)/phi

always @(posedge clk or posedge rst) begin
    if (rst) begin
        temp_result <= 512'h0;
        result <= 0;
        result_partial_1 <= 0;
        result_partial_2 <= 0;
        state <= 0;
        k <= 0;
        i <= 0;
        j <= 0;
        temp <= 0;
        x <= 0;
        y <= 0;
        x1 <= 0;
        x2 <= 0;
        y1 <= 0;
        y2 <= 0;
        x_tmp <= 0;
        y_tmp <= 0;
        mod_output <= 0;
        mod_input <= 0;
        temp2 <= 0;
        output_mul <= 0;
        q <= 0;
        clock_counter <= 0;
        done <= 0;
        counter_input <= 0;
        input_ready <= 0;
        fault_flag <= 0;
        recomputation_flag <= 0;
        weight_1 <= 0;
        weight_2 <= 0;
        lfsr <= seed;
        lfsr_counter <= 0;
        k1 <= 0;
        k2 <= 0;
        k3 <= 0;
        k4 <= 0;
        lfsr_done <= 0;
        encoder_counter <= 0;
    end else begin
        clock_counter <= clock_counter + 1;
        if (lfsr_done == 0) begin
            feedback = lfsr[7] ^ lfsr[3] ^ lfsr[2] ^ lfsr[1] ^ lfsr[0];
            lfsr <= {lfsr[6:0], feedback};
            lfsr_counter <= lfsr_counter + 1;
            case (lfsr_counter)
                1: k1 <= lfsr;
                2: k2 <= lfsr;
                3: k3 <= lfsr;
                4: begin
                    k4 <= lfsr;
                    lfsr_done <= 1;
                end
            endcase
        end

        if (input_ready == 0) begin
            case (counter_input)
                5'd0: x[127:0] <= bus_input; // Store first 128 bits
                5'd1: x[255:128] <= bus_input; // Store next 128 bits
                5'd2: x[383:256] <= bus_input; // Store next 128 bits
                5'd3: x[511:384] <= bus_input; // Store the last 128 bits
                // filling y through the 128-bit bus
                5'd4: y[127:0] <= bus_input; // Store first 128 bits
                5'd5: y[255:128] <= bus_input; // Store next 128 bits
                5'd6: y[383:256] <= bus_input; // Store next 128 bits
                5'd7: begin
                    y[511:384] <= bus_input; // Store next 128 bits
                    input_ready <= 1;
                end
            endcase
            if (counter_input < 8) begin
                counter_input <= counter_input + 1;
            end
        end else if (input_ready == 1) begin
            case (state)
                0: begin
                    // Set up for encoding
                    flag_state <= 0;
                    case (encoder_counter)
                        0: begin
                            length1 = 1;
                            length2 = size_input;
                            input_mul1 <= k1;
                            input_mul2 <= N;
                            state <= 3; // Go to multiplication state
                            if (i >= length1) begin
                                state <= 50; // Go to delay state
                            end
                        end
                        1: begin
                            length1 = 1;
                            length2 = size_input;
                            input_mul1 <= k2;
                            input_mul2 <= N;
                            state <= 3; // Go to multiplication state
                            if (i >= length1) begin
                                state <= 50; // Go to delay state
                            end
                        end
                        2: begin
                            length1 = 1;
                            length2 = size_input;
                            input_mul1 <= k3;
                            input_mul2 <= phi;
                            state <= 3; // Go to multiplication state
                            if (i >= length1) begin
                                state <= 50; // Go to delay state
                            end
                        end
                        3: begin
                            length1 = 1;
                            length2 = size_input;
                            input_mul1 <= k4;
                            input_mul2 <= phi;
                            state <= 3; // Go to multiplication state
                            if (i >= length1) begin
                                state <= 50; // Go to delay state
                            end
                        end
                    endcase
                end
                
                50: begin
                    // Delay state to ensure output_mul is ready
                    case (encoder_counter)
                        0: begin
                            x1 <= x + output_mul; // Assign x1
                            i = 0;
                            j = 0;
                            encoder_counter <= encoder_counter + 1;
                            state <= 0; // Return to state 0
                        end
                        1: begin
                            x2 <= x + output_mul; // Assign x2
                            i = 0;
                            j = 0;
                            encoder_counter <= encoder_counter + 1;
                            state <= 0; // Return to state 0
                        end
                        2: begin
                            y1 <= y + output_mul; // Assign y1
                            i = 0;
                            j = 0;
                            encoder_counter <= encoder_counter + 1;
                            state <= 0; // Return to state 0
                        end
                        3: begin
                            y2 <= y + output_mul; // Assign y2
                            i = 0;
                            j = 0;
                            state <= 15; // Go to state 15
                        end
                    endcase
                end
                
                15: begin
                // initialization to decide if we are in main computation or recomputation state
                    k <= 0;
                    flag <= 0;
                    temp_result <= 512'h1;
                    mode <= 1;
                    if (recomputation_flag == 0) begin
                        mod_input <= y1;
                        x_tmp <= x1;
                        state <= 5;
                    end else if (recomputation_flag == 1) begin
                        mod_input <= y2;
                        x_tmp <= x2;
                        state <= 5;
                    end
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
                    // initialization for computing  temp_result * x_tmp
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
                        state <= 5; // go to reduction state
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
                // initialization for computing x_tmp^2
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
                        state <= 5; // go to reduction state
                    end
                end
    
                5: begin
                    // Initialization for the reduction
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
                // states 6, 7, and 8 are related to Barrett Reduction
                    flag_state <= 6;
                    length1 <= 576; // actual size of m
                    length2 <= 2*size_input;
                    input_mul1 <= m;
                    input_mul2 <= mod_input;
                    state <= 3;
                    if (i >= length1) begin
                        i = 0;
                        j = 0;
                        q = output_mul >> (2*size_input);
                        state <= 7;
                    end
                end
    
                7: begin
                    flag_state <= 7;
                    length1 = size_input;
                    length2 = size_input;
                    input_mul1 <= q;
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
                        if (recomputation_flag == 0)
                            y1 <= mod_output;
                        else if (recomputation_flag == 1)
                            y2 <= mod_output;
                         y_tmp <= mod_output;
                        state <= 1;
                    end else if (flag == 2) begin
                        temp_result <= mod_output;
                        state <= 4;
                    end else if (flag == 4) begin
                        x_tmp <= mod_output;
                        if (recomputation_flag == 0)begin
                            state <= 10;
                        end else if (recomputation_flag == 1)begin
                            state <= 11;
                        end
                    end
                end
    
                10: begin
                    // Main computation (computes Weight_1, result_partial_1, and the total result)
                    weight_1 <= weight_1 + y_tmp[k];
                    if (k == index) begin
                        result_partial_1 <= temp_result;
                    end
                    k = k + 1;
                    if (k == size_input) begin
                        result <= temp_result;
                        recomputation_flag <= 1;
                        state <= 15;
                    end else begin
                        state <= 1;
                    end
                end
                
                11: begin
                // recomputation state (computes Weight_2 and result_partial_2)
                    weight_2 <= weight_2 + y_tmp[k];
                    k = k + 1;
                    if (k == index + 1) begin
                        result_partial_2 <= temp_result;
                        state <= 12;
                    end
                    else begin
                        state <= 1;
                    end
                end
                
                12: begin
                // completing the calculation of weight_2
                    weight_2 <= weight_2 + y_tmp[k];
                    k = k + 1;
                    if (k == size_input) begin
                        state <= 13;
                    end
                end
                
                13: begin
                // comparison state
                    if (result_partial_2 == result_partial_1 & weight_1 == weight_2)
                        fault_flag <= 1;
                    done <= 1;
                end
            endcase
        end
    end
end

endmodule
