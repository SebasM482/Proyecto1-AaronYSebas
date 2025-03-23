module mux (
    input logic clk_out,     // Señal de reloj de 1 kHz (selector)
    input logic [3:0] i,    // Entrada 0 (4 bits)
    input logic [3:0] e,    // Entrada 1 (4 bits)
    output logic [3:0] w    // Salida (4 bits)
);

    always_comb begin
        w = (clk_out) ? e : i; // Si clk_1kHz = 1 -> in1, sino -> in0
    end

endmodule