#!/usr/bin/env dmd
import core.thread;
import std.concurrency;
import std.stdio;


class Name {
    shared void myLoop() {
        for (int i = 0; i < 10; i++) {
            writeln("Número: ", i);
            // Hacemos un sleep de 1 segundo en el hilo
            Thread.sleep(dur!"seconds"(1));
        }
    }
}

// Usar shared para permitir pasar la instancia a otro hilo
void funcion(shared Name n) {
    n.myLoop(); // Llamamos a myLoop desde el hilo
}

void main() {
    // Crear una instancia de Name como shared
    shared Name n = new Name();
    
    // Crear un hilo para ejecutar myLoop
    auto thread = spawn(&funcion, n);
    
    writeln("El bucle se está ejecutando en otro hilo.");
    
    // Hacemos otras cosas en el hilo principal
    for (int j = 0; j < 5; j++) {
        writeln("En el hilo principal: ", j);
        // Hacemos un sleep de 5 segundos en el hilo principal
        Thread.sleep(dur!"seconds"(5));
    }


}
