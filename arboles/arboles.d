#!/usr/bin/env dmd
import std.stdio;
import std.array;
import std.conv;
import std.string;

alias print = writeln;

class Nodo
{
    int valor;
    Nodo izquierdo;
    Nodo derecho;

    this(int valor)
    {
        this.valor = valor;
        this.izquierdo = null;
        this.derecho = null;
    }
}

/**
 * Árbol Binario de Búsqueda
 */
class Arbol
{
    Nodo raiz;

    this() {
        this.raiz = null;
    }

    void insertar(int valor) {
        if (raiz is null) {
            raiz = new Nodo(valor);
        } else {
            _insertar(valor, raiz);
        }
    }

    void _insertar(int valor, Nodo nodoActual) {
        if (valor < nodoActual.valor) {
            if (nodoActual.izquierdo is null) {
                nodoActual.izquierdo = new Nodo(valor);
            } else {
                _insertar(valor, nodoActual.izquierdo);
            }
        } else if (valor > nodoActual.valor) {
            if (nodoActual.derecho is null) {
                nodoActual.derecho = new Nodo(valor);
            } else {
                _insertar(valor, nodoActual.derecho);
            }
        } else {
            // Valor duplicado, no se inserta
            writeln("El valor ", valor, " ya existe en el árbol.");
        }
    }

    void recorrerInorden(Nodo nodoActual) {
        if (nodoActual !is null) {
            recorrerInorden(nodoActual.izquierdo);
            print(nodoActual.valor);
            recorrerInorden(nodoActual.derecho);
        }
    }

    void imprimirInorden() {
        recorrerInorden(raiz);
    }
}

void main(string[] args) {
    // Lista de números
	int[] nueva_lista = [60, 188, 148, 124, 202, 76, 216, 234, 292, 95, 230, 88, 205, 278, 62, 254, 243, 93, 199, 168, 248, 282, 32, 195, 284, 242, 272, 111, 260, 228, 224, 44, 81, 108, 203, 194, 218, 261, 193, 287, 103, 190, 131, 200, 238, 264, 214, 65, 208, 211, 92, 63, 149, 172, 139, 178, 27, 276, 201, 121, 277, 16, 170, 198, 89, 142, 153, 257, 107, 226, 141, 163, 26, 240, 37, 181, 22, 138, 132, 34, 174, 265, 19, 83, 156, 267, 18, 229, 161, 159, 97, 116, 117, 24, 110, 115, 135, 236, 249, 84, 183, 255, 247, 28, 157, 166, 270, 104, 122, 71, 36, 67, 20, 118, 231, 109, 130, 90, 43, 245, 223, 140, 120, 114, 298, 66, 274, 169, 91, 85, 154, 0, 40, 45, 38, 50, 47, 8, 147, 30, 207, 113, 269, 286, 146, 152, 235, 225, 72, 289, 33, 196, 125, 56, 69, 57, 182, 206, 150, 233, 13, 137, 210, 280, 167, 299, 9, 297, 7, 164, 100, 290, 123, 294, 191, 46, 180, 187, 252, 259, 99, 160, 42, 244, 212, 17, 266, 295, 86, 268, 143, 4, 101, 1, 151, 3, 79, 105, 165, 6, 74, 197, 59, 162, 134, 10, 75, 179, 275, 250, 263, 204, 78, 256, 96, 241, 237, 80, 35, 48, 171, 126, 73, 186, 251, 232, 68, 281, 70, 219, 54, 52, 133, 176, 77, 41, 102, 94, 11, 279, 222, 51, 55, 173, 293, 25, 296, 291, 285, 273, 136, 271, 106, 21, 64, 209, 14, 2, 253, 49, 177, 184, 61, 217, 58, 82, 129];


    print("Este es la lista desordenada");
    print(nueva_lista);

    print("El número de números es: " ~ to!string(nueva_lista.length));

    // Crear el árbol binario y agregar elementos
    auto arbol = new Arbol();
    foreach (numero; nueva_lista) {
        arbol.insertar(numero);
    }

    print("Recorrido en orden del árbol binario:");
    arbol.imprimirInorden();
}
