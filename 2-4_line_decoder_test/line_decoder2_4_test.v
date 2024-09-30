module line_decoder2_4_test(
	input		[1:0]	a,
	output	wire	[3:0]	b_true,
	output	wire	[3:0]	b_test
);

decoder2_4 decoder2_4_true(
	.a(a),
	.b(b_true)
);

student_answer_decoder2_4 decoder2_4_test(
	.a(a),
	.b(b_test)
);


endmodule