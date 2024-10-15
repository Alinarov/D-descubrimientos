#!/usr/bin/env dmd
import std; // Importa el módulo estándar de D

// Alias para simplificar la impresión en consola
alias print = writeln;

void main() {

    string s = "sa"; // Declara una variable de tipo string y la inicializa con el valor "sa"
    string q = "e";  // Declara otra variable de tipo string con el valor "e"
    
    // Declara un arreglo de punteros de tipo string y lo inicializa con las direcciones de 's' y 'q'
    string*[] j = [&s, &q]; 
    
    // Recorre el arreglo de punteros 'j' y desreferencia cada puntero para obtener el valor
    foreach (ptr; j) {
        print(*ptr); // Desreferencia el puntero y luego imprime el valor al que apunta
    }
}
