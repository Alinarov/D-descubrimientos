#!/usr/bin/env dmd
/**
 * Programa de ejemplo que demuestra el uso de concurrencia y manejo de JSON en D
 * utilizando clases compartidas (shared) y sincronización de hilos.
 */
import core.thread;    // Para manejo de hilos y sleep
import std.concurrency;// Para spawn y comunicación entre hilos
import std.json;      // Para manejo de JSON
import std.stdio;     // Para operaciones de entrada/salida

// Alias para simplificar la escritura de writeln
alias print = writeln;

/**
 * Clase compartida que maneja datos JSON y proporciona funcionalidades de saludo
 * La clase es thread-safe debido al modificador 'shared' y el uso de 'synchronized'
 */
shared class ClaseB {
    string letras;              // Almacena un string extraído del JSON
    JSONValue jsonpublic;       // Almacena el objeto JSON completo
    
    /**
     * Constructor de ClaseB
     * Inicializa los datos JSON y extrae el valor de 'letras'
     */
    this() {
        JSONValue json = parseJSON(`{"letras" : "abc"}`);
        this.jsonpublic = json;
        letras = json["letras"].str;
    }
    
    /**
     * Método que imprime un saludo repetitivo con el valor de letras
     * Thread-safe debido al bloque synchronized
     */
    shared void saludarX4() {
        synchronized {
            for (int i = 0; i < 10; i++) {
                print("Clase B ", i);
                print(letras);
            }
        }
    }
    
    /**
     * Método que imprime el JSON completo y un saludo numerado
     * Thread-safe debido al bloque synchronized
     */
    shared void saludarX1() {
        synchronized {
            for (int i = 0; i < 10; i++) {
                print(this.jsonpublic);
                print("saludando x1 clase B ", i);
            }
        }
    }
}

/**
 * Clase principal que maneja la lógica de la aplicación
 * Contiene una instancia de ClaseB y métodos para manipularla
 */
shared class Name {
    private string ultimas_letras;      // Almacena un string del JSON
    private shared ClaseB claseb;       // Instancia compartida de ClaseB
    
    /**
     * Constructor compartido de Name
     * Inicializa ClaseB y extrae datos del JSON
     */
    shared this() {
        claseb = new shared ClaseB();
        auto json = parseJSON(`{"ultimas_letras" : "xyz"}`);
        ultimas_letras = json["ultimas_letras"].str;
    }
    
    /**
     * Ejecuta un bucle que imprime números con delays
     * Usado principalmente en un hilo separado
     */
    shared void myLoop() {
        synchronized {
            for (int i = 0; i < 10; i++) {
                writeln("Número: ", i);
                Thread.sleep(dur!"seconds"(1));
            }
        }
    }
    
    /**
     * Imprime un mensaje simple
     */
    shared void saludar_claseA() {
        synchronized {
            print("funcion saludar sin bucle");
        }
    }
    
    /**
     * Llama al método saludarX4 de ClaseB
     * Imprime la dirección de memoria de claseb
     */
    shared void claseBsaludar() {
        synchronized {
            print("direccion de memoria funcion 1 claseb ", &claseb);
            claseb.saludarX4();
        }
    }
    
    /**
     * Llama al método saludarX1 de ClaseB
     * Imprime la dirección de memoria de claseb
     */
    shared void claseBsaludarX1() {
        synchronized {
            print("direccion de memoria funcion 2 claseb ", &claseb);
            claseb.saludarX1();
        }
    }
}

/**
 * Función que se ejecutará en un hilo separado
 * Params:
 *     n = Instancia compartida de Name
 */
void funcion(shared Name n) {
    n.myLoop();
}

/**
 * Función principal del programa
 * Crea y maneja hilos, y coordina la ejecución de diferentes métodos
 */
void main() {
    // Crear una instancia compartida de Name
    shared Name n = new shared Name();
    
    // Crear un nuevo hilo que ejecutará la función 'funcion'
    auto hilo = spawn(&funcion, n);
    
    writeln("El bucle se está ejecutando en otro hilo.");
    
    // Ejecutar métodos en el hilo principal
    n.saludar_claseA();
    n.claseBsaludar();
    n.claseBsaludarX1();
    
    // Bucle en el hilo principal con delays
    for (int j = 0; j < 5; j++) {
        writeln("En el hilo principal: ", j);
        Thread.sleep(dur!"seconds"(2));
    }
}
