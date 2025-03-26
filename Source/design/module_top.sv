`timescale 1ns/1ps

module module_top(

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
    module_RX_decoder RX (.e(e), .p(p));
    module_freq_div FREQ (.clk(clk), .clk_out(clk_out), .x(x), .y(y));
    module_mux MUX (.clk_out(clk_out), .i(i), .p(p), .w(w));
    module_bcd_decoder BCD (.w(w), .d(d));
    ////////////////////////////

endmodule