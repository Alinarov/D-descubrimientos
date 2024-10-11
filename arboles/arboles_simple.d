#!/usr/bin/env dmd 
import std;

alias print = writeln;

/**
 * Nodo
 */
// Clase que representa un nodo en un árbol binario
class Nodo {
    // Valor almacenado en el nodo
    int valor;
    // Referencia al nodo hijo izquierdo
    Nodo nodo_iz;
    // Referencia al nodo hijo derecho
    Nodo nodo_de;

    // Constructor que inicializa el nodo con un valor
    this(int valor) {
        // Inicializa el hijo izquierdo como null
        this.nodo_iz = null;
        // Inicializa el hijo derecho como null
        this.nodo_de = null;
        // Asigna el valor al nodo
        this.valor = valor;
    }
}

void main(string[] args) {
	// Creamos la raíz del árbol con un valor de 6
	Nodo root = new Nodo(6);

	// Creamos nodos adicionales con valores específicos
	Nodo nod1 = new Nodo(4);  // Nodo con valor 4
	Nodo nod2 = new Nodo(1);  // Nodo con valor 1
	Nodo nod3 = new Nodo(5);  // Nodo con valor 5
	Nodo nod4 = new Nodo(8);  // Nodo con valor 8
	Nodo nod5 = new Nodo(9);  // Nodo con valor 9

	// Establecemos las relaciones entre los nodos para construir el árbol
	root.nodo_iz = nod1;  // El nodo izquierdo de la raíz apunta a nod1
	root.nodo_de = nod4;  // El nodo derecho de la raíz apunta a nod4

	// Construimos la subestructura del árbol
	nod1.nodo_iz = nod2;   // El nodo izquierdo de nod1 apunta a nod2
	nod1.nodo_de = nod3;   // El nodo derecho de nod1 apunta a nod3

	nod4.nodo_de = nod5;   // El nodo derecho de nod4 apunta a nod5


	// Función para realizar un recorrido en orden (in-order) del árbol binario
	void indorder(Nodo nodo) {
	    // Verificamos si el nodo actual es null
	    if (nodo is null) {
	        return;  // Si es null, salimos de la función (caso base)
	    }

	    // Llamamos recursivamente a la función para el nodo izquierdo
	    indorder(nodo.nodo_iz);
	    
	    // Imprimimos el valor del nodo actual
	    print(nodo.valor);
	    
	    // Llamamos recursivamente a la función para el nodo derecho
	    indorder(nodo.nodo_de);
	}

	
	// Función para realizar un recorrido en preorden (pre-order) del árbol binario
	void preorder(Nodo nodo) {
	    // Verificamos si el nodo actual es null
	    if (nodo is null) {
	        return;  // Si es null, salimos de la función (caso base)
	    }

	    // Imprimimos el valor del nodo actual
	    print(nodo.valor);

	    // Llamamos recursivamente a la función para el nodo derecho
	    indorder(nodo.nodo_de);

	    // Llamamos recursivamente a la función para el nodo izquierdo
	    indorder(nodo.nodo_iz);
	}

	// Función para realizar un recorrido en postorden (post-order) del árbol binario
	void postorder(Nodo nodo) {
	    // Verificamos si el nodo actual es null
	    if (nodo is null) {
	        return;  // Si es null, salimos de la función (caso base)
	    }

	    // Llamamos recursivamente a la función para el nodo izquierdo
	    postorder(nodo.nodo_iz);

	    // Llamamos recursivamente a la función para el nodo derecho
	    postorder(nodo.nodo_de);

	    // Imprimimos el valor del nodo actual
	    print(nodo.valor);
	}

	//postorder(root);



	// Función para insertar un nuevo nodo en el árbol binario
	void insert(Nodo nodo, int valor) {
	    // Verificamos si el nodo actual es null
	    if (nodo is null) {
	        return;  // Si es null, no se puede insertar y salimos de la función
	    }

	    // Comparamos el valor a insertar con el valor del nodo actual
	    if (valor >= nodo.valor) {
	        // Si el valor es mayor o igual, vamos al subárbol derecho
	        if (nodo.nodo_de is null) {
	            // Si no hay nodo derecho, creamos un nuevo nodo
	            Nodo nuevo_nodo = new Nodo(valor);
	            nodo.nodo_de = nuevo_nodo;  // Asignamos el nuevo nodo al nodo derecho
	        } else {
	            // Si ya hay un nodo derecho, llamamos a insert de forma recursiva
	            insert(nodo.nodo_de, valor);
	        }
	    } else { // Si el valor es menor que el valor del nodo actual
	        // Vamos al subárbol izquierdo
	        if (nodo.nodo_iz is null) {
	            // Si no hay nodo izquierdo, creamos un nuevo nodo
	            Nodo nuevo_nodo = new Nodo(valor);
	            nodo.nodo_iz = nuevo_nodo;  // Asignamos el nuevo nodo al nodo izquierdo
	        } else {
	            // Si ya hay un nodo izquierdo, llamamos a insert de forma recursiva
	            insert(nodo.nodo_iz, valor);
	        }
	    }
	}


	// Inserta un nuevo nodo con valor 7 en el árbol comenzando desde la raíz
	insert(root, 7);
	// Se puede descomentar para ver el recorrido en orden del árbol
	// indorder(root);

	// Función para encontrar un nodo por su valor y imprimir información sobre él
	void encontrarEImprimir(Nodo nodo, int valor) {
	    // Verificamos si el nodo actual es null
	    if (nodo is null) {
	        writeln("Nodo no encontrado."); // Mensaje si el nodo no existe
	        return; // Salimos de la función
	    }

	    // Comparamos el valor del nodo actual con el valor que buscamos
	    if (nodo.valor == valor) {
	        writeln("Nodo encontrado con valor: ", nodo.valor); // Mensaje de éxito

	        // Verificamos el nodo izquierdo
	        if (nodo.nodo_iz !is null) {
	            writeln("Nodo izquierdo con valor: ", nodo.nodo_iz.valor); // Imprimimos el valor del nodo izquierdo
	        } else {
	            writeln("Nodo izquierdo es null"); // Mensaje si no hay nodo izquierdo
	        }

	        // Verificamos el nodo derecho
	        if (nodo.nodo_de !is null) {
	            writeln("Nodo derecho con valor: ", nodo.nodo_de.valor); // Imprimimos el valor del nodo derecho
	        } else {
	            writeln("Nodo derecho es null"); // Mensaje si no hay nodo derecho
	        }
	        return; // Salimos de la función ya que encontramos el nodo
	    }

	    // Si el nodo actual no es el que buscamos, llamamos a la función recursivamente en ambas ramas
	    encontrarEImprimir(nodo.nodo_iz, valor); // Busca en la rama izquierda
	    encontrarEImprimir(nodo.nodo_de, valor); // Busca en la rama derecha
	}

	// Llamamos a la función para buscar el nodo con valor 8 en el árbol
	encontrarEImprimir(root, 8);


}

