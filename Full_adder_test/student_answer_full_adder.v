module student_answer_full_adder(
	input	a,b,cin,
	output	out,cout
);

assign out = a ^ b ^ cin;    
    assign cout = (a & b) | (cin & (a ^ b));  

endmodule