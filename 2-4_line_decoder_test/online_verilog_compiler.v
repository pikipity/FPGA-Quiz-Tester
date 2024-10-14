module jdoodle;
reg [1:0]	a;
wire	[3:0]	b_true;
wire	[3:0]	b_test;

initial begin
	a <= 2'b0;
		# 100
	$finish(1) ;
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

module decoder2_4(
	input		[1:0]	a,
	output	reg	[3:0]	b
);
always @ (*)
	case(a)
		2'b00:b=4'b1110;
		2'b01:b=4'b1101;
		2'b10:b=4'b1011;
		2'b11:b=4'b0111;
		default:b=4'b1111;
	endcase
endmodule

module student_answer_decoder2_4(
    input [1:0] a,   
    output [3:0] b   
);
    assign b[0] = ~(~a[1] & ~a[0]); 
    assign b[1] = ~(~a[1] &  a[0]); 
    assign b[2] = ~( a[1] & ~a[0]);
    assign b[3] = ~( a[1] &  a[0]); 

endmodule
