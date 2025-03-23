module module_bcd_decoder(input logic [3:0] w, output logic [6:0] bcd);
    assign bcd[6] = w[1] | w[3] | (~w[2] & ~w[0]) | (w[2] & w[0]);   // a
    assign bcd[5] = ~w[2] | w[1] | ~w[0];                    // b
    assign bcd[4] = ~w[1] | w[2] | w[0];                      // c
    assign bcd[3] = (~w[2] & ~w[0]) | (~w[2] & w[1]) + (w[1] & ~w[0]) | (w[2] & ~w[1] & w[0]) ;  // d
    assign bcd[2] = (~w[2] & ~w[0]) | (w[1] & ~w[0]);         // e
    assign bcd[1] = w[3] | (~w[1] & ~w[0]) | (w[2] & ~w[1]);  // f
    assign bcd[0] = w[3] | (~w[2] & w[1]) | (w[2] & ~w[0]) | (w[2] & ~w[1]);  // g
endmodule
