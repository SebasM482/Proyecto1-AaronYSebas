`timescale 1ns/1ps

module module_bcd_decoder_tb;
    logic [3:0] w;         // Señal de entrada
    logic [6:0] bcd;      // Señal de salida

    // Instanciamos el módulo 'module_bcd_syndrome'
    module_bcd_decoder uut (.w(w), .bcd(bcd));

    initial begin
        // 0
        w = 4'b0000; #10;
        $display("Number: %b, Segments: %b", w, bcd);
        
        // 1
        w = 4'b0001; #10;
        $display("Number: %b, Segments: %b", w, bcd);

        // 2
        w = 4'b0010; #10;
        $display("Number: %b, Segments: %b", w, bcd);

        // 3
        w = 4'b0011; #10;
        $display("Number: %b, Segments: %b", w, bcd);

        // 4
        w = 4'b0100; #10;
        $display("Number: %b, Segments: %b", w, bcd);

        // 5
        w = 4'b0101; #10;
        $display("Number: %b, Segments: %b", w, bcd);
        

        // 6
        w = 4'b0110; #10;
        $display("Number: %b, Segments: %b", w, bcd);
        
        // 7
        w = 4'b0111; #10;
        $display("Number: %b, Segments: %b", w, bcd);

        // 8
        w = 4'b1000; #10;
        $display("Number: %b, Segments: %b", w, bcd);

        // 9
        w = 4'b1001; #10;
        $display("Number: %b, Segments: %b", w, bcd);
    end

    initial begin
        // Guardar el archivo de simulación en formato VCD
        $dumpfile("module_bcd_decoder_tb.vcd");
        $dumpvars(0, module_bcd_decoder_tb);  // Nombre correcto del módulo de prueba
    end
endmodule
