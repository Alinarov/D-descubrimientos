#!/usr/bin/env dmd
import std; // Importa el módulo estándar de D

// Alias para simplificar la impresión en consola
alias print = writeln;

void main() {
    string s = "sa"; // Declara una variable de tipo string y la inicializa con el valor "sa"
    
    // Declara un puntero de tipo string y lo inicializa con la dirección de 's'
    string* j = &s; 
    
    // Imprime el valor al que apunta el puntero 'j'
    print(*j); // Aquí se desreferencia el puntero 'j' para obtener el valor de 's'
}
