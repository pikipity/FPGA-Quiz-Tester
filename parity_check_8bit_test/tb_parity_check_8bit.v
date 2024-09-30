`timescale 1ns/1ns
module tb_parity_check_8bit();

reg [7:0] din;
wire dout_odd_true;
wire dout_odd_test;

initial begin
	din <= 8'b0;
end

always #10 din <= {$random} % 256;

reg check_res;
always @(*) begin
	if(dout_odd_true==dout_odd_test) 
		check_res = 1'b1;
	else
		check_res = 1'b0;
end

initial begin 
	$timeformat(-9, 0, "ns", 6);
	$monitor("din=%b. Correct?: %b. True Answer: dout_odd_true=%b. Test Answer: dout_odd_test=%b",din, check_res, dout_odd_true, dout_odd_test);
end

parity_check_8bit_test parity_check_8bit
(
	.din(din),
	
	.dout_odd_true(dout_odd_true),
	.dout_odd_test(dout_odd_test)
);

endmodule