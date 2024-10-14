module jdoodle;
reg [7:0] din;
wire dout_odd_true;
wire dout_odd_test;

initial begin
	din <= 8'b0;
	#800
	$finish(1);
end

always #10 din <= {$random} % 256;

reg check_res;
always @(*) begin
	if(dout_odd_true==dout_odd_test) 
		check_res = 1'b1;
	else
		check_res = 1'b0;
end

initial begin 
	$timeformat(-9, 0, "ns", 6);
	$monitor("din=%b. Correct?: %b. True Answer: dout_odd_true=%b. Test Answer: dout_odd_test=%b",din, check_res, dout_odd_true, dout_odd_test);
end

parity_check_8bit_test parity_check_8bit
(
	.din(din),
	
	.dout_odd_true(dout_odd_true),
	.dout_odd_test(dout_odd_test)
);

endmodule

module parity_check_8bit_test
(
	input [7:0] din,
	output wire dout_odd_true,
	output wire dout_odd_test
);

odd_even_check odd_even_check_true
(
	.din(din),
	.dout_odd(dout_odd_true)
);

student_answer_odd_even_check odd_even_check_test
(
	.din(din),
	.dout_odd(dout_odd_test)
);

endmodule

module odd_even_check(
	input [7:0] din,
	output 	dout_odd
);

assign dout_odd = ^din;       

endmodule

module student_answer_odd_even_check (
    input [7:0] din,  // 8-bit input
    output dout_odd  // 1-bit output, 1 if odd number of 1's, 0 if even
);

// Use a reduction XOR to count the number of 1's in din
wire [7:0] ones_count;
assign ones_count = {1'b0, din} ^ {din, 1'b0};

// Determine if the count of 1's is odd or even
assign dout_odd = (ones_count[7:0] ^ ones_count[6:0]) & ones_count[7];

endmodule
