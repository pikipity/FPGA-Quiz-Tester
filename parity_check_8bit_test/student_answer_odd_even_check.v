module student_answer_odd_even_check(
	input [7:0] din,
	output 	dout_odd
);

assign dout_odd = &din;       

endmodule