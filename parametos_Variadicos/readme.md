# Parámetros Variádicos en D
Los parámetros variádicos (o argumentos variables) en D permiten que una función acepte cualquier número de argumentos del mismo tipo. Se definen usando el operador ... después del tipo de parámetro.
```d
#!/usr/bin/env dmd
import std;
alias print = writeln;

void main() {
    // Función con parámetros variádicos
    int sumarNumeros(int[] args ...) {
        print("Argumentos recibidos: ", args);
        return args.sum;  // Suma todos los argumentos
    }

    // Diferentes formas de llamar a la función
    print("Suma de 1, 2: ", sumarNumeros(1, 2));
    print("Suma de 1, 2, 3, 4: ", sumarNumeros(1, 2, 3, 4));
    
    // También puedes pasar un array
    int[] numeros = [1, 2, 3, 4, 5];
    print("Suma del array: ", sumarNumeros(numeros));
    
    // O mezclar valores individuales y arrays
    print("Suma mixta: ", sumarNumeros(1, 2, numeros));
}
```
# Características clave:

Sintaxis: tipo[] nombreParametro ...
Flexibilidad: Permite pasar cualquier número de argumentos
Conversión automática: Los argumentos se convierten en un array
Compatibilidad: Funciona con valores individuales y arrays existentes

Ejemplos de uso común:
```d
// Función para concatenar strings
string concatenar(string[] palabras ...) {
    return palabras.join(" ");
}

// Función para encontrar el máximo
T maximo(T)(T[] valores ...) {
    return valores.maxElement;
}

// Función para imprimir con formato personalizado
void imprimirFormato(string[] args ...) {
    writefln("Total de argumentos: %d", args.length);
    foreach(i, arg; args) {
        writefln("Argumento %d: %s", i, arg);
    }
}
```
Los parámetros variádicos son especialmente útiles cuando:

No sabes cuántos argumentos necesitarás de antemano
Quieres hacer la función más flexible
Necesitas procesar múltiples valores del mismo tipo
Quieres reducir la duplicación de código
