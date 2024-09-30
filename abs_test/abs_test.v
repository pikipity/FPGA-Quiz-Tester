module abs_test
(
	input   [7:0]   x,
    input   [7:0]   y,
    output wire [7:0]   z_true,
	 output wire [7:0]   z_test
);

abs abs_true
(
	.x(x),
	.y(y),
	
	.z(z_true)
);

student_answer_abs abs_test
(
	.x(x),
	.y(y),
	
	.z(z_test)
);

endmodule