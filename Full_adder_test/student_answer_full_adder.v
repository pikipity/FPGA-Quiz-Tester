module student_answer_full_adder(
	input	a,b,cin,
	output	out,cout
);

assign out = a^b;
assign cout = a&b|b&cin|a&cin;

endmodule