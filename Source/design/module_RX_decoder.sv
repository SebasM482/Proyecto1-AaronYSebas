module module_RX_decoder(input reg [6:0] e, output wire [3:0] p);
    assign p[3] = 1'b0;
    assign p[2] = e[3]^e[6]^e[5]^e[4];
    assign p[1] = e[1]^e[6]^e[5]^e[2];
    assign p[0] = e[0]^e[6]^e[4]^e[2];
endmodule


