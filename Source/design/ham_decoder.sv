`timescale 1ns/1ps
// Este modulo recibe un numero binario codificado con Hamming y retorna el sindrome

module ham_decoder(input logic [6:0] e, output logic [3:0] p);

    // El sindrome es de 3 bits, pero se le agrega un 0 como cuarto bit para que 
    // funcione como entrada del decoder del display 
    
    assign p[3] = 1'b0;      
    assign p[2] = e[3] ^ e[6] ^ e[5] ^ e[4];
    assign p[1] = e[1] ^ e[6] ^ e[5] ^ e[2];
    assign p[0] = e[0] ^ e[6] ^ e[4] ^ e[2];

endmodule


