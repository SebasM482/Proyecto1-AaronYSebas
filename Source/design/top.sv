`timescale 1ns/1ps

module top(
    //input logic module_inputs //Recibe los valores de los Pins
    input logic clk,
    input logic [3:0] i,   // Numero binario
    input logic [6:0] e,   // Numero binario codificado
    output logic [6:0] d,  // Segmentos
    output logic x,        // Control de bjt
    output logic y);       // Control de bjt

    // Declaracion 
    logic [3:0] p;   // Sindrome
    logic [3:0] w;   // Numero binario
    logic clk_out;   // Reloj 1kHz
    ////////////////////////////

    // Instaciamiento de los modulos
    ham_decoder RX (.e(e), .p(p));
    freq_div FREQ (.clk(clk), .clk_out(clk_out), .x(x), .y(y));
    mux MUX (.clk_out(clk_out), .i(i), .p(p), .w(w));
    seg_decoder BCD (.w(w), .d(d));
    ////////////////////////////

endmodule