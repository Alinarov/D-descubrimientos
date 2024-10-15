#!/usr/bin/env dmd
import std;
import core.stdc.stdio; // Para trabajar con punteros estilo C

// Alias para simplificar la impresión en consola
alias print = writeln;

// Estructura que almacena información de un producto
struct Producto {
    string nombre;
    float precio;
    int cantidad;
}

void modificarProducto(Producto* p) {
    // Acceso a los miembros de la estructura usando el puntero
    p.nombre = "Producto Modificado";
    p.precio *= 1.15; // Aumentar el precio en un 15%
    p.cantidad += 10; // Agregar 10 unidades
}

void imprimirProducto(Producto p) {
    print("Nombre del producto: ", p.nombre);
    print("Precio del producto: ", p.precio);
    print("Cantidad disponible: ", p.cantidad);
}

void main() {
    // Crear una instancia de Producto
    Producto prod = Producto("Producto A", 12.50, 20);
    
    // Imprimir el producto antes de la modificación
    print("Producto antes de la modificación:");
    imprimirProducto(prod);

    // Modificar el producto usando un puntero
    Producto* ptrProd = &prod;
    modificarProducto(ptrProd); // Pasar el puntero a la función

    // Imprimir el producto después de la modificación
    print("\nProducto después de la modificación:");
    imprimirProducto(prod);

    // Uso avanzado de punteros: trabajar con memoria dinámica
    int* dynamicArray = cast(int*)malloc(int.sizeof * 5); // Asignar memoria para un arreglo de 5 enteros

    if (dynamicArray !is null) {
        // Inicializar los valores del arreglo dinámico usando el puntero
        foreach (i; 0 .. 5) {
            dynamicArray[i] = i * 2; // Multiplica cada índice por 2
        }

        print("\nValores del arreglo dinámico:");
        foreach (i; 0 .. 5) {
            print("Elemento ", i, ": ", dynamicArray[i]);
        }

        free(dynamicArray); // Liberar la memoria asignada dinámicamente
    } else {
        print("Error al asignar memoria.");
    }
}
