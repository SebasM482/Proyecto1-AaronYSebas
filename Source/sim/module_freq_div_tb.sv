`timescale 1ps/1ps

module module_freq_div_tb;

    // Declaración de señales
    reg clk;           // Reloj de entrada
    wire clk_out;      // Reloj de salida del divisor de frecuencia

    // Instancia del módulo bajo prueba (DUT)
    module_freq_div uut (.clk(clk), .clk_out(clk_out));

    // Generador de reloj (frecuencia de 27 MHz)
    always begin
        #18.5 clk = ~clk;  // T = 1 / 27 MHz => periodo = 37ns, cada mitad del periodo 18.5ns
    end

    // Procedimiento de inicialización
    initial begin
        // Inicialización de señales
        clk = 0;

        // Monitorear el comportamiento de la salida
        $monitor("Time: %t, clk_out: %b", $time, clk_out);

        // Correr la simulación por un periodo suficientemente largo
        #3000000; // 3 ms (aproximadamente)

        // Finalizar la simulación
        $finish;
    end

    // Generación del archivo VCD
    initial begin
        $dumpfile("module_freq_div_tb.vcd");
        $dumpvars(0, module_freq_div_tb);
    end
endmodule
