module tb;

    reg [3:0] t_a;
    reg [3:0] t_b;
    reg       t_op;

    wire [3:0] t_result;

    alu U1 (
        .a(t_a),
        .b(t_b),
        .op(t_op),
        .result(t_result)
    );

    initial begin

        // ADDITION
        t_a = 4'd5;
        t_b = 4'd3;
        t_op = 1'b0;
        #10;

        // Change ONLY op
        // a and b stay the same.
        // Expected: 5 - 3 = 2
        t_op = 1'b1;
        #10;

        // Change b while doing subtraction
        // Expected: 7 - 2 = 5
        t_a = 4'd7;
        t_b = 4'd2;
        #10;

        // Another subtraction
        // Expected: 9 - 4 = 5
        t_a = 4'd9;
        t_b = 4'd4;
        #10;

        $finish;
    end

    initial begin
        $monitor($time,
                 " a=%d b=%d op=%b | result=%d",
                 t_a, t_b, t_op, t_result);
    end

endmodule