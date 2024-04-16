module Protected_pipelined (
    input  [31:0] base,
    input  [31:0] exponent,
    input  [31:0] phi,
    input  [31:0] modulus,
    input  clk,
    input  rst,
    output reg [31:0] result,
    output reg faulty_flag
);

reg [31:0] temp_result_1, temp_result_2; 
reg [31:0] temp_base_1, temp_base_2;
reg [31:0] temp_exponent_1,temp_exponent_2;
reg [31:0] result_partial_1, result_partial_2;
reg [5:0] weight_1, weight_2;
reg [5:0] weight_temp_1, weight_temp_2;
reg [2:0] stage;  // Pipeline stage control
reg [31:0] clock_counter;
reg [31:0] result_comp;
reg [5:0] weight_comp;
integer k_1x, k_2x, k_1y, k_2y; // encoding indexes
integer l = 10; // number of exponent bits to be used for recomputation
integer i;


always @(posedge clk or posedge rst) begin
    if (rst) begin
        stage <= 0;
        clock_counter <= 32'h0;
        
    end else begin
        clock_counter <= clock_counter + 1;

        case (stage)
            0: begin
                // Encodings and Decoding
                temp_result_1 <= 32'h1;
                temp_result_2 <= 32'h1;
                weight_temp_1 <= 0;
                weight_temp_2 <= 0;
                i = 0;
                k_1x = $urandom % 10;
                k_2x = $urandom % 10;
                k_1y = $urandom % 10;
                k_2y = $urandom % 10;                
                temp_base_1 = base + (k_1x * modulus);
                temp_base_2 = base + (k_2x * modulus);
                temp_exponent_1 = exponent + (k_1y * phi);
                temp_exponent_2 = exponent + (k_2y * phi);
                
                temp_base_1 = temp_base_1 % modulus;
                temp_base_2 = temp_base_2 % modulus;
                temp_exponent_1 = temp_exponent_1 % phi;
                temp_exponent_2 = temp_exponent_2 % phi;
                stage <= 1;

            end
            1: begin
                // Main computation and Recomputation
               if (i == 31) 
                    stage <= 2;
                    
                weight_temp_1 = weight_temp_1 + temp_exponent_1[i];
                if (temp_exponent_1[i])
                    temp_result_1 = (temp_result_1 * temp_base_1) % modulus;
                temp_base_1 = (temp_base_1 * temp_base_1) % modulus;
                if (i == l - 1)
                    result_partial_1 = temp_result_1;
                
                weight_temp_2 = weight_temp_2 + temp_exponent_2[i];
                if (i < l) begin
                    if (temp_exponent_2[i])
                        temp_result_2 = (temp_result_2 * temp_base_2) % modulus;
                    temp_base_2 = (temp_base_2 * temp_base_2) % modulus;
                    result_partial_2 = temp_result_2;
                end
                i = i + 1;
            end
            
            2: begin
                // Comparison
               result = temp_result_1;
               weight_1 = weight_temp_1;
               weight_2 = weight_temp_2;
               result_comp = (result_partial_1 - result_partial_2);
               weight_comp = (weight_1 - weight_2);
               if (weight_comp != 0 | result_comp != 0) begin
                    faulty_flag = 1;
               end
               stage <= 0;
            end

        endcase
    end
end

endmodule
