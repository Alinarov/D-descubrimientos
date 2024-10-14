# Documentación del Proyecto en D

## Descripción

Este proyecto implementa un ejemplo básico de uso de hilos en D, donde se ejecuta un método de una clase en un hilo separado. La clase `Name` contiene un método `myLoop` que imprime números del 0 al 9 con un intervalo de 1 segundo entre cada número.

## Estructura del Código

### Clases y Métodos

#### `Name`

- **Descripción**: Clase que contiene el método `myLoop`.
- **Método**: 
  - `shared void myLoop()`
    - **Descripción**: Imprime números del 0 al 9 y pausa 1 segundo entre cada impresión.
    - **Parámetros**: Ninguno.
    - **Uso**: Este método es llamado desde un hilo separado.

### Funciones

#### `funcion`

- **Descripción**: Función que se ejecuta en un hilo y llama al método `myLoop` de la clase `Name`.
- **Parámetros**:
  - `shared Name n`: Instancia de la clase `Name` que se pasa como argumento.

### `main`

- **Descripción**: Función principal que crea una instancia de `Name`, lanza un hilo para ejecutar `myLoop`, y realiza otras operaciones en el hilo principal.
- **Uso**:
  - Crea una instancia de `Name` como `shared`.
  - Llama a `spawn` para ejecutar la función `funcion` en un hilo separado.
  - Imprime mensajes desde el hilo principal.

## Ejemplo de Uso

```d
#!/usr/bin/env dmd
import core.thread;
import std.concurrency;
import std.stdio;
import std.duration;

class Name {
    shared void myLoop() {
        for (int i = 0; i < 10; i++) {
            writeln("Número: ", i);
            Thread.sleep(dur!"seconds"(1));
        }
    }
}

void funcion(shared Name n) {
    n.myLoop();
}

void main() {
    shared Name n = new Name();
    auto thread = spawn(&funcion, n);
    
    writeln("El bucle se está ejecutando en otro hilo.");
    
    for (int j = 0; j < 5; j++) {
        writeln("En el hilo principal: ", j);
        Thread.sleep(dur!"seconds"(5));
    }
    
    thread.join();
}
```

```bash
rdmd nombre_del_archivo.d
```
