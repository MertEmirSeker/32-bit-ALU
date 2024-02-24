module mod(
    input clk,                  // Clock input
    input reset,                // Reset input
    input start,                // Start signal to initiate the modulo operation
    input [31:0] A,             // Input operand A
    input [31:0] B,             // Input operand B
    output [31:0] Result,       // Output: Result of the modulo operation
    output done                  // Done signal indicating the completion of the operation
);

    // Signal declarations
    wire subtract, load, subtract_ack;   // Control signals for data path
    wire [31:0] mod_result;             // Result from the data path

    // Instantiate the control unit and data path modules
    mod_cu control_unit(
        .clk(clk),
        .reset(reset),
        .start(start),
        .A(A),
        .B(B),
        .subtract_ack(subtract_ack),    // Acknowledgment signal from data path (mod_dp)
        .subtract(subtract),
        .load(load),
        .done(done)
    );

    mod_dp datapath(
        .clk(clk),
        .reset(reset),
        .A(A),
        .B(B),
        .load(load),
        .subtract(subtract),
        .Result(mod_result),
        .subtract_ack(subtract_ack)     // Acknowledgment signal to control unit (mod_cu)
    );

    // Assign the result from the data path to the output
    assign Result = mod_result;

endmodule
