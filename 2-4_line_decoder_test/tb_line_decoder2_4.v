`timescale 1ns/1ns
module tb_line_decoder2_4();

reg [1:0]	a;
wire	[3:0]	b_true;
wire	[3:0]	b_test;

initial begin
	a <= 2'b0;
end

always #10 a[0] <= {$random} % 2;
always #10 a[1] <= {$random} % 2;

reg check_res;
always @(*) begin
	if(b_true==b_test) 
		check_res = 1'b1;
	else
		check_res = 1'b0;
end

initial begin 
	$timeformat(-9, 0, "ns", 6);
	$monitor("a=%b. Correct?: %b. True Answer: b_true=%b. Test Answer: b_test=%b",a,check_res,b_true,b_test);
end

line_decoder2_4_test line_decoder2_4
(
	.a(a),
	
	.b_true(b_true),
	.b_test(b_test)
);

endmodule