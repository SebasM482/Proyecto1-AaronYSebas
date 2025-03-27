`timescale 1ns/1ps

module ham_decoder_tb;
    // Declaramos las señales
    reg [6:0] e;    // Entrada de 7 bits
    wire [3:0] p;   // Salida de 3 bits

    // Instanciamos el módulo bajo prueba
    ham_decoder uut (.e(e), .p(p));

    initial begin
        // Error en el bit 5
        e = 7'b1110110; #10;
        $display("TX: %b, Sindrome: %b", e, p);

        // Sin error
        e = 7'b1100110; #10;
        $display("RX: %b, Sindrome: %b", e, p);

        $finish;
    end

    // Generación del archivo VCD
    initial begin
        $dumpfile("ham_decoder_tb.vcd");
        $dumpvars(0, ham_decoder_tb);
    end
endmodule
