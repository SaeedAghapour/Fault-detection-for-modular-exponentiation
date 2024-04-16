module Unprotected_pipelined (
    input  [31:0] base,
    input  [31:0] exponent,
    input  [31:0] phi,
    input  [31:0] modulus,
    input  clk,
    input  rst,
    output reg [31:0] result
);

reg [31:0] temp_result; 
reg [31:0] temp_base;
reg [31:0] temp_exponent;
reg [2:0] stage;
integer i;
reg [31:0] clock_counter = 32'h0; // Clock counter

always @(posedge clk or posedge rst) begin
    if (rst) begin
        stage <= 0;
        clock_counter <= 32'h0; // Reset clock cycle counter on reset
    end else begin
        // Increment clock cycle counter on each clock cycle
        clock_counter <= clock_counter + 1;

        case (stage)
            0: begin
                // Decoding
                temp_result <= 32'h1;
                temp_base = base % modulus;
                temp_exponent = exponent % phi;
                i = 0;
                stage <= 1;
            end
            1: begin
                // Main computation
                if (temp_exponent[i])
                    temp_result = (temp_result * temp_base) % modulus;
                temp_base = (temp_base * temp_base) % modulus;
                if (i == 5'd31)
                    stage <= 2;
                i = i + 1;
            end
            2: begin
                result = temp_result;
                stage <= 0;
            end
        endcase
    end
end

endmodule
