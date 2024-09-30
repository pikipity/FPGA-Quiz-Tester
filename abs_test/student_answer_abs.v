module student_answer_abs(
    input   [7:0]   x,
    input   [7:0]   y,
    output [7:0]   z
    );

assign  z= (x < y) ? (x - y) : (y - x);

endmodule
