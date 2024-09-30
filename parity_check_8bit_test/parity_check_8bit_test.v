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