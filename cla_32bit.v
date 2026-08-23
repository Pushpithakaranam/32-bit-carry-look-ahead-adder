module cla_32bit (
    input  [31:0] a,
    input  [31:0] b,
    input         cin,
    output [31:0] sum,
    output        cout
);

wire [7:0] G, P;
wire [8:0] C;

assign C[0] = cin;

// 8 blocks of 4-bit CLA
cla_4bit CLA0(a[3:0],   b[3:0],   C[0], sum[3:0],   , G[0], P[0]);
cla_4bit CLA1(a[7:4],   b[7:4],   C[1], sum[7:4],   , G[1], P[1]);
cla_4bit CLA2(a[11:8],  b[11:8],  C[2], sum[11:8],  , G[2], P[2]);
cla_4bit CLA3(a[15:12], b[15:12], C[3], sum[15:12], , G[3], P[3]);
cla_4bit CLA4(a[19:16], b[19:16], C[4], sum[19:16], , G[4], P[4]);
cla_4bit CLA5(a[23:20], b[23:20], C[5], sum[23:20], , G[5], P[5]);
cla_4bit CLA6(a[27:24], b[27:24], C[6], sum[27:24], , G[6], P[6]);
cla_4bit CLA7(a[31:28], b[31:28], C[7], sum[31:28], , G[7], P[7]);

// Block Carry Look-Ahead Logic
assign C[1] = G[0] | (P[0] & C[0]);
assign C[2] = G[1] | (P[1] & G[0]) 
                     | (P[1] & P[0] & C[0]);

assign C[3] = G[2] | (P[2] & G[1]) 
                     | (P[2] & P[1] & G[0]) 
                     | (P[2] & P[1] & P[0] & C[0]);

assign C[4] = G[3] | (P[3] & G[2]) 
                     | (P[3] & P[2] & G[1]) 
                     | (P[3] & P[2] & P[1] & G[0]) 
                     | (P[3] & P[2] & P[1] & P[0] & C[0]);

assign C[5] = G[4] | (P[4] & C[4]);
assign C[6] = G[5] | (P[5] & C[5]);
assign C[7] = G[6] | (P[6] & C[6]);
assign C[8] = G[7] | (P[7] & C[7]);

assign cout = C[8];

endmodule
