// Welcome to JDoodle!
//
// You can execute code here in 88 languages. Right now you’re in the Verilog IDE. 
//
//  1. Click the orange Execute button ️▶ to execute the sample code below and see how it works.
//  2. Want help writing or debugging code? Type a query into JDroid on the right hand side ---------------->
//  3. Try the menu buttons on the left. Save your file, share code with friends and open saved projects.
//
// Want to change languages? Try the search bar up the top.

module jdoodle;
reg [7:0]   x;
reg [7:0]   y;
wire [7:0]   z_true;
wire [7:0]   z_test;
	 
initial begin
	x <= 8'b0;
	y <= 8'b0;
	#800
	$finish(1);
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

module abs(
    input   [7:0]   x,
    input   [7:0]   y,
    output [7:0]   z
    );

assign  z= (x > y) ? (x - y) : (y - x);

endmodule

module student_answer_abs
(x, y, z);
    input [7:0] x, y;
    output reg [7:0] z;

    always @(*) begin
        if (x >= y) begin
            z = x - y;
        end else begin
            z = y - x;
        end
    end

endmodule