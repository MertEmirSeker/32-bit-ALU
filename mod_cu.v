module mod_cu(
    input clk,                // Clock input
    input reset,              // Reset input
    input start,              // Start signal to initiate the computation
    input [31:0] A,           // Input operand A
    input [31:0] B,           // Input operand B
    input subtract_ack,       // Signal indicating completion of subtraction operation from mod_dp
    output reg subtract,      // Signal to trigger subtraction in mod_dp
    output reg load,          // Signal to load operands A and B into mod_dp
    output reg done           // Signal indicating completion of the modulo operation
);

    // State definitions
    parameter IDLE = 0, LOAD = 1, CALCULATE = 2, DONE_STATE = 3;
    reg [1:0] state = IDLE;     // Current state of the state machine
    reg [1:0] next_state;       // Next state for the state machine

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;      // Reset the state machine to IDLE state
        end else begin
            state <= next_state; // Update the state based on the next_state value
        end
    end

    always @(*) begin
        // Default signals
        load = 0;               // Default to not loading operands
        subtract = 0;           // Default to not triggering subtraction
        done = 0;               // Default to not indicating completion
        next_state = state;     // Preserve the current state

        case (state)
            IDLE: begin
                if (start) next_state = LOAD; // Transition to LOAD state on start signal
            end
            LOAD: begin
                load = 1;            // Load operands into mod_dp
                next_state = CALCULATE;
            end
            CALCULATE: begin
                subtract = 1;        // Trigger subtraction operation
                if (subtract_ack) next_state = DONE_STATE; // Transition to DONE_STATE when subtraction is done
            end
            DONE_STATE: begin
                done = 1;            // Indicate completion of the modulo operation
                if (!start) next_state = IDLE; // Return to IDLE state when start signal goes low
            end
        endcase
    end
endmodule
