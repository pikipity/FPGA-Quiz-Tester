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