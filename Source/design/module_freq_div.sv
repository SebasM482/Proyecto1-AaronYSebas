`timescale 1ns/1ps

module module_freq_div(
    input logic clk, 
    output logic clk_out,
    output logic x,
    output logic y);

    parameter frequency = 27_000_000;  // Frecuencia de entrada (27 MHz)
    parameter freq_out = 1_000;        // Frecuencia de salida deseada (1 kHz)
    parameter max_count = frequency / (2 * freq_out);

    logic [24:0] count;  // Tamaño suficiente para almacenar max_count

    // Inicialización
    initial begin
        count = 0;
        clk_out = 0;
        x=0;
        y=1;
    end

    // Lógica para contar y generar clk_out
    always @(posedge clk) begin
        if (count == max_count - 1) begin
            clk_out <= ~clk_out; // Cambia el estado del clock de salida
            x <= ~x;
            y <= ~y;
            count <= 0;
        end 
        else begin
            count <= count + 1;
        end
    end
endmodule
