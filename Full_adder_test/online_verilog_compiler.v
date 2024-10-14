module jdoodle;
  reg a, b, cin;

wire out_true, cout_true;

wire out_test, cout_test;

initial begin
	a <= 1'b0;
	b <= 1'b0;
	cin <= 1'b0;
	# 100
	$finish(1) ;
end

always #10 a <= {$random} % 2;
always #10 b <= {$random} % 2;
always #10 cin <= {$random} % 2;

reg check_res;
always @(*) begin
	if(out_true==out_test && cout_true==cout_test) 
		check_res = 1'b1;
	else
		check_res = 1'b0;
end

initial begin 
	$timeformat(-9, 0, "ns", 6);
	$monitor("a=%b, b=%b, cin=%b. Correct?: %b. True Answer: cout=%b, out=%b. Test Answer: cout=%b, out=%b",a,b,cin,check_res,cout_true, out_true,cout_test, out_test);
end

full_adder_test full_adder
(
	.a (a),
	.b (b),
	.cin (cin),

	.out_true(out_true),
	.cout_true(cout_true),
	
	.out_test(out_test), 
	.cout_test(cout_test)
);

endmodule

module full_adder_test(
	input	   a,b,cin,
	output	out_true,cout_true,
	output   out_test, cout_test
);

full_adder full_adder_true
(
	.a (a),
	.b (b),
	.cin (cin),

	.out(out_true),
	.cout(cout_true)
);

student_answer_full_adder full_adder_test
(
	.a (a),
	.b (b),
	.cin (cin),

	.out(out_test),
	.cout(cout_test)
);

endmodule

module full_adder(
	input	a,b,cin,
	output	out,cout
);

assign {cout,out} = a + b + cin;

//assign out = a^b^cin;
//assign cout = a&b|b&cin|a&cin;

endmodule

module student_answer_full_adder(
    input a,
    input b,
    input cin,
    output out,
    output cout
);

// Intermediate wire to hold the sum of a and b
wire sum_ab;

// Intermediate wire to hold the carry from the sum of a and b
wire carry_ab;

// Calculate the sum of a and b
assign sum_ab = a ^ b;

// Calculate the carry from the sum of a and b
assign carry_ab = a & b;

// Calculate the final sum including the input carry
assign out = sum_ab ^ cin;

// Calculate the final carry including the input carry
assign cout = carry_ab | (sum_ab & cin) | (a & b & cin);

endmodule
