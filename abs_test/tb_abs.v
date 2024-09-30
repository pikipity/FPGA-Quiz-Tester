`timescale 1ns/1ns
module tb_abs();

reg [7:0]   x;
reg [7:0]   y;
wire [7:0]   z_true;
wire [7:0]   z_test;
	 
initial begin
	x <= 8'b0;
	y <= 8'b0;
end

always #10 x <= {$random} % 256;
always #10 y <= {$random} % 256;

reg check_res;
always @(*) begin
	if(z_true==z_test) 
		check_res = 1'b1;
	else
		check_res = 1'b0;
end

initial begin 
	$timeformat(-9, 0, "ns", 6);
	$monitor("x=%b, y=%b. Correct?: %b. True Answer: z_true=%b. Test Answer: z_test=%b",x,y,check_res,z_true, z_test);
end

abs_test abs
(
	.x(x),
	.y(y),
	
	.z_true(z_true),
	.z_test(z_test)
);

endmodule