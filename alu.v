module alu(
    input [31:0] A,         // Input operand A
    input [31:0] B,         // Input operand B
    input [2:0] ALUop,      // ALU operation code
    input clk,              // Clock signal
    input reset,            // Reset signal
    output reg [31:0] Result // ALU result
);

// Wire declarations for basic logical operations
wire [31:0] and_result, or_result, xor_result, nor_result, add_result, sub_result, less_than_result;

// Wire declarations for MOD operation
wire [31:0] mod_result;
wire mod_done;
wire mod_start = (ALUop == 3'b111); // Start signal for MOD operation

// Instantiate MOD module for MOD operation
mod mod_instance (
    .clk(clk),         // Clock signal
    .reset(reset),     // Reset signal
    .start(mod_start), // Start signal for MOD operation
    .A(A),
    .B(B),
    .Result(mod_result),
    .done(mod_done)
);

// Instantiate modules for AND, OR, XOR, NOR, LESS THAN, ADD, SUB operations
and_module and_op(A, B, and_result);
or_module or_op(A, B, or_result);
xor_module xor_op(A, B, xor_result);
nor_module nor_op(A, B, nor_result);
cla_32bit add_op(A, B, 0, add_result);        // Set carry-in to 0 for addition
subtractor_32bit sub_op(A, B, sub_result);    // Subtractor module
less_than_module lt_op(A, B, less_than_result); // Less than module

// ALU control logic
always @(*) begin
    Result = 32'b0; // Initialize Result to 0 in all cases
    case (ALUop)
        3'b000: Result = and_result;
        3'b001: Result = or_result;
        3'b010: Result = xor_result;
        3'b011: Result = nor_result;
        3'b101: Result = add_result;
        3'b110: Result = sub_result;
        3'b100: Result[0] = less_than_result; // Only update the LSB with less_than_result
        3'b111: begin
                if (mod_done) begin
                    Result = mod_result; // Take the result when MOD operation is done
                end else begin
                    Result = 32'b0; // Set to 0 if MOD operation is not yet completed
                end
            end // When MOD operation is selected
        default: Result = 32'b0;
    endcase
end

endmodule


// ------------------ AND MODULE ------------------ 

module and_module(input [31:0] A, input [31:0] B, output [31:0] result);
// Bit-wise AND operation for bit 0 to 31
    and and_gate0(result[0], A[0], B[0]);
    and and_gate1(result[1], A[1], B[1]);
	 and and_gate2(result[2], A[2], B[2]);
    and and_gate3(result[3], A[3], B[3]);
	 and and_gate4(result[4], A[4], B[4]);
	 and and_gate5(result[5], A[5], B[5]);
	 and and_gate6(result[6], A[6], B[6]);
	 and and_gate7(result[7], A[7], B[7]);
	 and and_gate8(result[8], A[8], B[8]);
	 and and_gate9(result[9], A[9], B[9]);
	 and and_gate10(result[10], A[10], B[10]);
	 and and_gate11(result[11], A[11], B[11]);
	 and and_gate12(result[12], A[12], B[12]);
	 and and_gate13(result[13], A[13], B[13]);
	 and and_gate14(result[14], A[14], B[14]);
	 and and_gate15(result[15], A[15], B[15]);
	 and and_gate16(result[16], A[16], B[16]);
	 and and_gate17(result[17], A[17], B[17]);
	 and and_gate18(result[18], A[18], B[18]);
	 and and_gate19(result[19], A[19], B[19]);
	 and and_gate20(result[20], A[20], B[20]);
	 and and_gate21(result[21], A[21], B[21]);
	 and and_gate22(result[22], A[22], B[22]);
	 and and_gate23(result[23], A[23], B[23]);
	 and and_gate24(result[24], A[24], B[24]);
	 and and_gate25(result[25], A[25], B[25]);
	 and and_gate26(result[26], A[26], B[26]);
	 and and_gate27(result[27], A[27], B[27]);
	 and and_gate28(result[28], A[28], B[28]);
	 and and_gate29(result[29], A[29], B[29]);
	 and and_gate30(result[30], A[30], B[30]);
	 and and_gate31(result[31], A[31], B[31]);
endmodule



// ------------------ OR MODULE ------------------ 

module or_module(input [31:0] A, input [31:0] B, output [31:0] result);
// Bit-wise OR operation for bit 0 to 31

    or or_gate0(result[0], A[0], B[0]);
    or or_gate1(result[1], A[1], B[1]);
	 or or_gate2(result[2], A[2], B[2]);
    or or_gate3(result[3], A[3], B[3]);
	 or or_gate4(result[4], A[4], B[4]);
	 or or_gate5(result[5], A[5], B[5]);
	 or or_gate6(result[6], A[6], B[6]);
	 or or_gate7(result[7], A[7], B[7]);
	 or or_gate8(result[8], A[8], B[8]);
	 or or_gate9(result[9], A[9], B[9]);
	 or or_gate10(result[10], A[10], B[10]);
	 or or_gate11(result[11], A[11], B[11]);
	 or or_gate12(result[12], A[12], B[12]);
	 or or_gate13(result[13], A[13], B[13]);
	 or or_gate14(result[14], A[14], B[14]);
	 or or_gate15(result[15], A[15], B[15]);
	 or or_gate16(result[16], A[16], B[16]);
	 or or_gate17(result[17], A[17], B[17]);
	 or or_gate18(result[18], A[18], B[18]);
	 or or_gate19(result[19], A[19], B[19]);
	 or or_gate20(result[20], A[20], B[20]);
	 or or_gate21(result[21], A[21], B[21]);
	 or or_gate22(result[22], A[22], B[22]);
	 or or_gate23(result[23], A[23], B[23]);
	 or or_gate24(result[24], A[24], B[24]);
	 or or_gate25(result[25], A[25], B[25]);
	 or or_gate26(result[26], A[26], B[26]);
	 or or_gate27(result[27], A[27], B[27]);
	 or or_gate28(result[28], A[28], B[28]);
	 or or_gate29(result[29], A[29], B[29]);
	 or or_gate30(result[30], A[30], B[30]);
	 or or_gate31(result[31], A[31], B[31]);
endmodule


// ------------------ XOR MODULE ------------------ 

module xor_module(input [31:0] A, input [31:0] B, output [31:0] result);
// Bit-wise XOR operation for bit 0 to 31

    xor xor_gate0(result[0], A[0], B[0]);
    xor xor_gate1(result[1], A[1], B[1]);
	 xor xor_gate2(result[2], A[2], B[2]);
    xor xor_gate3(result[3], A[3], B[3]);
	 xor xor_gate4(result[4], A[4], B[4]);
	 xor xor_gate5(result[5], A[5], B[5]);
	 xor xor_gate6(result[6], A[6], B[6]);
	 xor xor_gate7(result[7], A[7], B[7]);
	 xor xor_gate8(result[8], A[8], B[8]);
	 xor xor_gate9(result[9], A[9], B[9]);
	 xor xor_gate10(result[10], A[10], B[10]);
	 xor xor_gate11(result[11], A[11], B[11]);
	 xor xor_gate12(result[12], A[12], B[12]);
	 xor xor_gate13(result[13], A[13], B[13]);
	 xor xor_gate14(result[14], A[14], B[14]);
	 xor xor_gate15(result[15], A[15], B[15]);
	 xor xor_gate16(result[16], A[16], B[16]);
	 xor xor_gate17(result[17], A[17], B[17]);
	 xor xor_gate18(result[18], A[18], B[18]);
	 xor xor_gate19(result[19], A[19], B[19]);
	 xor xor_gate20(result[20], A[20], B[20]);
	 xor xor_gate21(result[21], A[21], B[21]);
	 xor xor_gate22(result[22], A[22], B[22]);
	 xor xor_gate23(result[23], A[23], B[23]);
	 xor xor_gate24(result[24], A[24], B[24]);
	 xor xor_gate25(result[25], A[25], B[25]);
	 xor xor_gate26(result[26], A[26], B[26]);
	 xor xor_gate27(result[27], A[27], B[27]);
	 xor xor_gate28(result[28], A[28], B[28]);
	 xor xor_gate29(result[29], A[29], B[29]);
	 xor xor_gate30(result[30], A[30], B[30]);
	 xor xor_gate31(result[31], A[31], B[31]);
endmodule



// ------------------ NOR MODULE------------------ 


module nor_module(input [31:0] A, input [31:0] B, output [31:0] result);
// Bit-wise NOR operation for bit 0 to 31

    nor nor_gate0(result[0], A[0], B[0]);
    nor nor_gate1(result[1], A[1], B[1]);
	 nor nor_gate2(result[2], A[2], B[2]);
    nor nor_gate3(result[3], A[3], B[3]);
	 nor nor_gate4(result[4], A[4], B[4]);
	 nor nor_gate5(result[5], A[5], B[5]);
	 nor nor_gate6(result[6], A[6], B[6]);
	 nor nor_gate7(result[7], A[7], B[7]);
	 nor nor_gate8(result[8], A[8], B[8]);
	 nor nor_gate9(result[9], A[9], B[9]);
	 nor nor_gate10(result[10], A[10], B[10]);
	 nor nor_gate11(result[11], A[11], B[11]);
	 nor nor_gate12(result[12], A[12], B[12]);
	 nor nor_gate13(result[13], A[13], B[13]);
	 nor nor_gate14(result[14], A[14], B[14]);
	 nor nor_gate15(result[15], A[15], B[15]);
	 nor nor_gate16(result[16], A[16], B[16]);
	 nor nor_gate17(result[17], A[17], B[17]);
	 nor nor_gate18(result[18], A[18], B[18]);
	 nor nor_gate19(result[19], A[19], B[19]);
	 nor nor_gate20(result[20], A[20], B[20]);
	 nor nor_gate21(result[21], A[21], B[21]);
	 nor nor_gate22(result[22], A[22], B[22]);
	 nor nor_gate23(result[23], A[23], B[23]);
	 nor nor_gate24(result[24], A[24], B[24]);
	 nor nor_gate25(result[25], A[25], B[25]);
	 nor nor_gate26(result[26], A[26], B[26]);
	 nor nor_gate27(result[27], A[27], B[27]);
	 nor nor_gate28(result[28], A[28], B[28]);
	 nor nor_gate29(result[29], A[29], B[29]);
	 nor nor_gate30(result[30], A[30], B[30]);
	 nor nor_gate31(result[31], A[31], B[31]);
endmodule


// ------------------ 4 BIT CLA ADDER MODULE ------------------ 

module cla_4bit(
    input [3:0] a,         // 4-bit operand A
    input [3:0] b,         // 4-bit operand B
    input cin,             // Carry-in input
    output [3:0] sum,      // 4-bit sum output
    output cout            // Carry-out output
);
    wire [3:0] g, p;        // Generate (g) and propagate (p) signals
    wire [4:0] c;           // Internal carry signals

    // Generate (g) and propagate (p) signals for each bit position
    and and_g0(g[0], a[0], b[0]); // Generate G0 and propagate P0 signals for bit 0
    and and_g1(g[1], a[1], b[1]); // Generate G1 and propagate P1 signals for bit 1
    and and_g2(g[2], a[2], b[2]); // Generate G2 and propagate P2 signals for bit 2
    and and_g3(g[3], a[3], b[3]); // Generate G3 and propagate P3 signals for bit 3
    
    xor xor_p0(p[0], a[0], b[0]); // Generate P0 signal for bit 0
    xor xor_p1(p[1], a[1], b[1]); // Generate P1 signal for bit 1
    xor xor_p2(p[2], a[2], b[2]); // Generate P2 signal for bit 2
    xor xor_p3(p[3], a[3], b[3]); // Generate P3 signal for bit 3

    // Initial carry input and carry calculations
    buf buf_c0(c[0], cin); // Buffer carry input (cin) to c[0]
    wire temp_and0, temp_and1, temp_and2, temp_and3;
    and and_temp0(temp_and0, p[0], c[0]); // AND operation for bit 0
    and and_temp1(temp_and1, p[1], c[1]); // AND operation for bit 1
    and and_temp2(temp_and2, p[2], c[2]); // AND operation for bit 2
    and and_temp3(temp_and3, p[3], c[3]); // AND operation for bit 3
    or or_c1(c[1], g[0], temp_and0);     // OR operation for carry bit 1
    or or_c2(c[2], g[1], temp_and1);     // OR operation for carry bit 2
    or or_c3(c[3], g[2], temp_and2);     // OR operation for carry bit 3
    or or_c4(c[4], g[3], temp_and3);     // OR operation for carry bit 4

    // Sum calculations
    xor xor_sum0(sum[0], p[0], c[0]); // XOR operation for bit 0
    xor xor_sum1(sum[1], p[1], c[1]); // XOR operation for bit 1
    xor xor_sum2(sum[2], p[2], c[2]); // XOR operation for bit 2
    xor xor_sum3(sum[3], p[3], c[3]); // XOR operation for bit 3

    // Final carry output
    buf buf_cout(cout, c[4]); // Buffer carry-out (cout) from carry bit 4

endmodule

// ------------------ 32 BIT CLA ADDER MODULE ------------------ 

module cla_32bit(
    input [31:0] a,         // 32-bit operand A
    input [31:0] b,         // 32-bit operand B
    input cin,              // Carry-in input
    output [31:0] sum,      // 32-bit sum output
    output cout             // Carry-out output
);
    wire [7:0] carry;        // Array to hold intermediate carry bits

    // Instantiate eight 4-bit CLA modules for each 4-bit group
    // These 4-bit groups are processed in parallel for a 32-bit result
    cla_4bit cla0(a[3:0], b[3:0], cin, sum[3:0], carry[0]);    // Bits 0-3
    cla_4bit cla1(a[7:4], b[7:4], carry[0], sum[7:4], carry[1]); // Bits 4-7
    cla_4bit cla2(a[11:8], b[11:8], carry[1], sum[11:8], carry[2]); // Bits 8-11
    cla_4bit cla3(a[15:12], b[15:12], carry[2], sum[15:12], carry[3]); // Bits 12-15
    cla_4bit cla4(a[19:16], b[19:16], carry[3], sum[19:16], carry[4]); // Bits 16-19
    cla_4bit cla5(a[23:20], b[23:20], carry[4], sum[23:20], carry[5]); // Bits 20-23
    cla_4bit cla6(a[27:24], b[27:24], carry[5], sum[27:24], carry[6]); // Bits 24-27
    cla_4bit cla7(a[31:28], b[31:28], carry[6], sum[31:28], carry[7]); // Bits 28-31

    // Final carry output from the highest 4-bit group
    buf buf_cout(cout, carry[7]);

endmodule



// ------------------ SUBSTRACTOR MODULE ------------------ 

module subtractor_32bit(
    input [31:0] A,          // 32-bit input operand A
    input [31:0] B,          // 32-bit input operand B
    output [31:0] Result,    // 32-bit subtraction result
    output CarryOut          // Output carry bit (not typically used in subtraction)
);
    wire [31:0] B_complement; // 32-bit two's complement of operand B
    wire CarryIn = 1'b1;      // Carry-in input is always set to 1 for subtraction

    // Calculate the two's complement of operand B (B_complement = ~B + 1)
	 not (B_complement[0], B[0]);
    not (B_complement[1], B[1]);
	 not (B_complement[2], B[2]);
    not (B_complement[3], B[3]);
	 not (B_complement[4], B[4]);
	 not (B_complement[5], B[5]);
	 not (B_complement[6], B[6]);
	 not (B_complement[7], B[7]);
	 not (B_complement[8], B[8]);
	 not (B_complement[9], B[9]);
	 not (B_complement[10], B[10]);
	 not (B_complement[11], B[11]);
	 not (B_complement[12], B[12]);
	 not (B_complement[13], B[13]);
	 not (B_complement[14], B[14]);
	 not (B_complement[15], B[15]);
	 not (B_complement[16], B[16]);
	 not (B_complement[17], B[17]);
	 not (B_complement[18], B[18]);
	 not (B_complement[19], B[19]);
	 not (B_complement[20], B[20]);
	 not (B_complement[21], B[21]);
	 not (B_complement[22], B[22]);
	 not (B_complement[23], B[23]);
	 not (B_complement[24], B[24]);
	 not (B_complement[25], B[25]);
	 not (B_complement[26], B[26]);
	 not (B_complement[27], B[27]);
	 not (B_complement[28], B[28]);
	 not (B_complement[29], B[29]);
	 not (B_complement[30], B[30]);
	 not (B_complement[31], B[31]);

    // Use a 2-level Carry Look-Ahead Adder to perform addition of A and B_complement
    cla_32bit adder(
        .a(A),
        .b(B_complement),
        .cin(CarryIn),
        .sum(Result),
        .cout(CarryOut)
    );

endmodule

// ------------------ LESS THAN MODULE------------------ 


module less_than_module(
    input [31:0] A,       // 32-bit input operand A
    input [31:0] B,       // 32-bit input operand B
    output LessThan       // Output indicating if A is less than B
);
    wire [31:0] notA, sum; // Complement of A and sum of notA and B
    wire carryOut;        // Carry-out from the addition of notA and B


    // Calculate the complement of each bit in A
	 not not_gate0(notA[0], A[0]);
    not not_gate1(notA[1], A[1]);
	 not not_gate2(notA[2], A[2]);
    not not_gate3(notA[3], A[3]);
	 not not_gate4(notA[4], A[4]);
	 not not_gate5(notA[5], A[5]);
	 not not_gate6(notA[6], A[6]);
	 not not_gate7(notA[7], A[7]);
	 not not_gate8(notA[8], A[8]);
	 not not_gate9(notA[9], A[9]);
	 not not_gate10(notA[10], A[10]);
	 not not_gate11(notA[11], A[11]);
	 not not_gate12(notA[12], A[12]);
	 not not_gate13(notA[13], A[13]);
	 not not_gate14(notA[14], A[14]);
	 not not_gate15(notA[15], A[15]);
	 not not_gate16(notA[16], A[16]);
	 not not_gate17(notA[17], A[17]);
	 not not_gate18(notA[18], A[18]);
	 not not_gate19(notA[19], A[19]);
	 not not_gate20(notA[20], A[20]);
	 not not_gate21(notA[21], A[21]);
	 not not_gate22(notA[22], A[22]);
	 not not_gate23(notA[23], A[23]);
	 not not_gate24(notA[24], A[24]);
	 not not_gate25(notA[25], A[25]);
	 not not_gate26(notA[26], A[26]);
	 not not_gate27(notA[27], A[27]);
	 not not_gate28(notA[28], A[28]);
	 not not_gate29(notA[29], A[29]);
	 not not_gate30(notA[30], A[30]);
	 not not_gate31(notA[31], A[31]);

    // Use a 32-bit Carry Look-Ahead Adder to add notA and B with carry-in set to 1
    cla_32bit adder(
        .a(notA),
        .b(B),
        .cin(1'b1),       // Carry-in is always set to 1 for less than comparison
        .sum(sum),
        .cout(carryOut)
    );

    // If A is less than B, carryOut will be 0, so take its complement to get the LessThan output
    not buf_LessThan(LessThan, carryOut);
endmodule





