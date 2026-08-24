module cla_4bit (
    input  [3:0] a,
    input  [3:0] b,
    input        cin,
    output [3:0] sum,
    output       cout,
    output       G,     // group generate
    output       P      // group propagate
);

wire [3:0] g, p;
wire c1, c2, c3, c4;

// Generate/Propagate for each bit
gp_1bit gp0(a[0], b[0], g[0], p[0]);
gp_1bit gp1(a[1], b[1], g[1], p[1]);
gp_1bit gp2(a[2], b[2], g[2], p[2]);
gp_1bit gp3(a[3], b[3], g[3], p[3]);

// Carry equations
assign c1 = g[0] | (p[0] & cin);
assign c2 = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
assign c3 = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) 
                      | (p[2] & p[1] & p[0] & cin);
assign c4 = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) 
                      | (p[3] & p[2] & p[1] & g[0]) 
                      | (p[3] & p[2] & p[1] & p[0] & cin);

// Sum
assign sum[0] = p[0] ^ cin;
assign sum[1] = p[1] ^ c1;
assign sum[2] = p[2] ^ c2;
assign sum[3] = p[3] ^ c3;

assign cout = c4;

// Group Propagate & Generate
assign P = p[3] & p[2] & p[1] & p[0];

assign G = g[3] | (p[3] & g[2]) 
                | (p[3] & p[2] & g[1]) 
                | (p[3] & p[2] & p[1] & g[0]);

endmodule
