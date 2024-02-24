`timescale 1ns / 1ps

module alu_tb;

// Inputs
reg [31:0] A;       // Operand A
reg [31:0] B;       // Operand B
reg [2:0] ALUop;    // ALU operation code
reg clk;            // Clock input
reg reset;          // Reset input

// Outputs
wire [31:0] Result; // Result of ALU operation

// Instantiate the Unit Under Test (UUT)
alu uut (
    .A(A), 
    .B(B), 
    .ALUop(ALUop), 
    .clk(clk), 
    .reset(reset), 
    .Result(Result)
);

// Clock signal generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period (100MHz)
end

// Test cases
initial begin
    // Initialize Inputs
    clk = 0;
    reset = 1;
    A = 0;
    B = 0;
    ALUop = 0;

    // Wait for global reset
    #100;

    // Release reset
    reset = 0;
    #10;

    // Test scenarios
    // Test 1: AND operation
    A = 32'b1100;
    B = 32'b1010;
    ALUop = 3'b000; // AND
    #10; // Wait period
    $display("Test 1: AND Result = %b", Result);

    // Test 2: OR operation
    A = 32'b1100;
    B = 32'b1010;
    ALUop = 3'b001; // OR
    #10; // Wait period
    $display("Test 2: OR Result = %b", Result);

    // Test 3: XOR operation
    A = 32'b1100;
    B = 32'b1010;
    ALUop = 3'b010; // XOR
    #10; // Wait period
    $display("Test 3: XOR Result = %b", Result);

    // Test 4: NOR operation
    A = 32'b1100;
    B = 32'b1010;
    ALUop = 3'b011; // NOR
    #10; // Wait period
    $display("Test 4: NOR Result = %b", Result);

    // Test 5: Addition operation
    A = 32'b00000000000000000000000000001100; // 12
    B = 32'b00000000000000000000000000001010; // 10
    ALUop = 3'b101; // Addition
    #10; // Wait period
    $display("Test 5: Adder Result = %b", Result);

    // Test 6: Subtraction operation
    A = 32'b1100;
    B = 32'b1010;
    ALUop = 3'b110; // Subtraction
    #10; // Wait period
    $display("Test 6: Subtractor Result = %b", Result);

    // Test 7: Less Than operation
    // A = 32'b00000000000000000000000000000001; // 1
    // B = 32'b00000000000000000000000000001010; // 10
    // ALUop = 3'b100; // Less Than
    // #10; // Wait period
    // $display("Test 7: Less Than Result = %b", Result);
	 
	     // Test 8: Less Than operation
    A = 32'b00000000000000000000000000001111; // 15
    B = 32'b00000000000000000000000000001010; // 10
    ALUop = 3'b100; // Less Than
    #10; // Wait period
    $display("Test 8: Less Than Result = %b", Result);

    // Test 9: MOD operation
    // Uncomment the following lines to perform the MOD tests
    // A = 32'b00000000000000000000000000001111; // 15
    // B = 32'b00000000000000000000000000000100; // 4
    // ALUop = 3'b111; // MOD
    // #5000; // Wait period
    // $display("Test 9: MOD Result = %b", Result);  // Result = 00000000000000000000000000000011

    // Test 10: MOD operation
    // Uncomment the following lines to perform the MOD tests
    // A = 32'b00000000000000000000000000000101; // 5
    // B = 32'b00000000000000000000000000000011; // 3	// Result= 00000000000000000000000000000010
    // ALUop = 3'b111; // MOD
    // #5000; // Wait period
    // $display("Test 10: MOD Result = %b", Result);

    // Test 11: MOD operation
    A = 32'b00000000000000000000000001001110; // 78
    B = 32'b00000000000000000000000000101101; // 45
    ALUop = 3'b111; // MOD
    #5000; // Wait period
    $display("Test 11: MOD Result = %b", Result);		// Result = 00000000000000000000000000100001
	 
	 
    $stop; // End simulation
end

endmodule
