`timescale 1ns/1ps
// Este modulo recibe un numero binario codificado con Hamming y retorna el sindrome

module ham_decoder(
    input logic [6:0] e, 
    output logic [3:0] p, 
    output logic [3:0] c);

    // El sindrome es de 3 bits, pero se le agrega un 0 como cuarto bit para que 
    // funcione como entrada del decoder del display 
    
    assign p[3] = 1'b0;      
    assign p[2] = e[3] ^ e[6] ^ e[5] ^ e[4];
    assign p[1] = e[1] ^ e[6] ^ e[5] ^ e[2];
    assign p[0] = e[0] ^ e[6] ^ e[4] ^ e[2];

        // Señal interna para la palabra corregida
    logic [6:0] corrected_e;

    always_comb begin
        corrected_e = e; // Inicialmente igual a e
        if (p != 4'b0000)  // Si el síndrome es diferente de 0, hay error
            corrected_e[p[2:0] - 1] = ~corrected_e[p[2:0] - 1]; // Invertir bit erróneo
    end

    // Extraer los bits de datos correctos
    assign c = {corrected_e[6], corrected_e[5], corrected_e[4], corrected_e[2]};

endmodule


