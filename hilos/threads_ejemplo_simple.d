#!/usr/bin/env dmd
import core.thread;
import std.concurrency;
import std.stdio;

void myLoop() {
    for (int i = 0; i < 10; i++) {
        writeln("Número: ", i);
        // Hacemos un sleep de 10 segundos en el hilo principal
        Thread.sleep(dur!"seconds"(7));
    }
}

void main() {
    // Crear un hilo para ejecutar myLoop
    auto thread = spawn(&myLoop);
    
    writeln("El bucle se está ejecutando en otro hilo.");
    
    // Puedes seguir haciendo otras cosas aquí
    for (int j = 0; j < 5; j++) {
        writeln("En el hilo principal: ", j);
        // Hacemos un sleep de 10 segundos en el hilo principal
        Thread.sleep(dur!"seconds"(5));
    }

}
