module gp_1bit (
    input  a,
    input  b,
    output g,   // generate
    output p    // propagate
);

assign g = a & b;
assign p = a ^ b;

endmodule
