`timescale 1ns/1ps
// Este modulo recibe un numero binario codificado con Hamming y retorna el sindrome

module ham_decoder(
    input logic [6:0] e, // Los 7 bits del dipswitch
    output logic [3:0] p,  // El sindrome calculado a partir de e
    output logic [3:0] c); // Contiene la palabra corregida

    // El sindrome es de 3 bits, pero se le agrega un 0 como cuarto bit para que 
    // funcione como entrada del decoder del display 
    
    assign p[3] = 1'b0;      
    assign p[2] = e[3] ^ e[6] ^ e[5] ^ e[4];
    assign p[1] = e[1] ^ e[6] ^ e[5] ^ e[2];
    assign p[0] = e[0] ^ e[6] ^ e[4] ^ e[2];

        // Señal interna para la palabra corregida
    logic [6:0] corrected_e;

    assign corrected_e[0] = (p == 4'b0001) ? ~e[0] : e[0];
    assign corrected_e[1] = (p == 4'b0010) ? ~e[1] : e[1];
    assign corrected_e[2] = (p == 4'b0011) ? ~e[2] : e[2];
    assign corrected_e[3] = (p == 4'b0100) ? ~e[3] : e[3];
    assign corrected_e[4] = (p == 4'b0101) ? ~e[4] : e[4];
    assign corrected_e[5] = (p == 4'b0110) ? ~e[5] : e[5];
    assign corrected_e[6] = (p == 4'b0111) ? ~e[6] : e[6];

    // Extraer los bits de datos correctos
    assign c = ~{corrected_e[6], corrected_e[5], corrected_e[4], corrected_e[2]};

endmodule


