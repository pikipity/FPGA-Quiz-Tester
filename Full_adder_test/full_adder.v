module full_adder(
	input	a,b,cin,
	output	out,cout
);

assign {cout,out} = a + b + cin;

//assign out = a^b^cin;
//assign cout = a&b|b&cin|a&cin;

endmodule