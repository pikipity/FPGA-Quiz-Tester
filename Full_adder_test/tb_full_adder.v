`timescale 1ns/1ns
module tb_full_adder();

reg a, b, cin;

wire out_true, cout_true;

wire out_test, cout_test;

initial begin
	a <= 1'b0;
	b <= 1'b0;
	cin <= 1'b0;
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