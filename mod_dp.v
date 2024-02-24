module mod_dp(
    input clk,                // Clock input
    input reset,              // Reset input
    input [31:0] A,           // Input operand A
    input [31:0] B,           // Input operand B
    input load,               // Signal to load operands A and B
    input subtract,           // Signal to trigger subtraction operation
    output reg [31:0] Result, // Output: Result of modulo operation
    output reg subtract_ack   // Acknowledgment signal for completed subtraction
);

    reg [31:0] temp_A;         // Temporary register to hold operand A
    reg processing;            // Flag to indicate if subtraction is in progress

    wire [31:0] subtractor_output;         // Output of the 32-bit subtractor
    wire subtractor_carry_out;             // Carry-out signal from subtractor

    // Instantiate a 32-bit subtractor module
    subtractor_32bit subtractor(
        .A(temp_A),
        .B(B),
        .Result(subtractor_output),
        .CarryOut(subtractor_carry_out)
    );

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            temp_A <= 0;            // Initialize temp_A to 0
            Result <= 0;            // Initialize Result to 0
            processing <= 0;        // Reset processing flag
            subtract_ack <= 0;      // Reset subtraction acknowledgment
        end else begin
            if (load) begin
                temp_A <= A;        // Load operand A into temp_A
                processing <= 1;    // Set processing flag to indicate subtraction is in progress
                subtract_ack <= 0;  // Reset subtraction acknowledgment
            end else if (subtract && processing) begin
                if (temp_A >= B) begin
                    temp_A <= temp_A - B; // Subtract B from temp_A if it's greater than or equal to B
                end else begin
                    processing <= 0;    // If temp_A is less than B, stop processing
                    subtract_ack <= 1;  // Set subtraction acknowledgment to indicate completion
                end
            end
            if (!processing) begin
                Result <= temp_A;    // Store the result in Result when subtraction is complete
            end
        end
    end

endmodule
