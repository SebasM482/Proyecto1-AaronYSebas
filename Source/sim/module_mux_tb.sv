`timescale 1ns / 1ps

module mux_tb;

    // Señales del testbench
    logic clk_out;          // Señal de reloj de prueba
    logic [3:0] i;          // Entrada 0
    logic [3:0] e;          // Entrada 1
    logic [3:0] w;          // Salida

    // Instanciar el módulo mux
    mux uut (
        .clk_out(clk_out),
        .i(i),
        .e(e),
        .w(w)
    );

    // Generación de reloj
    always #10 clk_out = ~clk_out; // Cambia cada 5 ns (frecuencia de 100 MHz aprox.)

    initial begin
        // Inicialización
        clk_out = 0;
        i = 4'b0000;
        e = 4'b1111;

        // Prueba 1: clk_out = 0, se espera w = i
        #10;
        $display("Tiempo: %0t | clk_out = %b | i = %b | e = %b | w = %b", 
                 $time, clk_out, i, e, w);
        
        // Prueba 2: clk_out = 1, se espera w = e
        #10;
        $display("Tiempo: %0t | clk_out = %b | i = %b | e = %b | w = %b", 
                 $time, clk_out, i, e, w);
        
        // Prueba 3: Cambiar entradas
        i = 4'b1010;
        e = 4'b0101;

        #10;
        $display("Tiempo: %0t | clk_out = %b | i = %b | e = %b | w = %b", 
                 $time, clk_out, i, e, w);

        // Prueba 4: Cambiar clk_out de nuevo
        #10;
        $display("Tiempo: %0t | clk_out = %b | i = %b | e = %b | w = %b", 
                 $time, clk_out, i, e, w);

        // Terminar simulación
        #20;
        $finish;
    end

        // Generación del archivo VCD
    initial begin
        $dumpfile("module_mux_tb.vcd");
        $dumpvars(0, mux_tb);
    end
endmodule
