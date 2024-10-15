import std.concurrency;
import std.stdio;
import std.json;
import std.file;
import core.thread;
import core.time : dur;

alias print = writeln;

void con(shared Gestor_clientes gc) {
    gc.contador();
}

void main() {
    // Inicializamos el gestor de clientes
    shared Gestor_clientes g_c2 = new shared Gestor_clientes(); // Instancia completamente shared

    // Iniciamos el contador en un hilo separado
    spawn(&con, g_c2);  // Usamos la instancia `shared`

    // Verificamos si el usuario existe en la base de datos desde la instancia no compartida
    Gestor_clientes g_c = cast(Gestor_clientes)g_c2;  // Si necesitas operar desde una instancia no `shared`

    ResultadoBusqueda existencia = g_c.verificar_existencia("barkacod123098761", "hashed_password_here");

    if (existencia.encontrado) {
        writeln("El usuario sí se encuentra registrado");
    } else {
        writeln("El usuario no existe");
    }
}

struct ResultadoBusqueda {
    bool encontrado;
    int indice;
}

class Gestor_clientes {
    JSONValue clientes; // Contiene los datos de los clientes

    shared this() {
        // Cargar los datos desde un archivo JSON
        string data = readText("dir_data_clients/data_clients.json");
        clientes = parseJSON(data);
    }

    // Función que cuenta e imprime números en un hilo separado
    shared void contador() {
        foreach (int n; 0 .. 6) {
            print(n);
            Thread.sleep(dur!"seconds"(2)); // Hacemos un sleep de 2 segundos
        }
    }

    // Verifica si un usuario y contraseña existen en la base de datos
    ResultadoBusqueda verificar_existencia(string usuario, string contrasenia) {
        auto clientes_json = clientes["clientes"].array;

        for (int index = 0; index < clientes_json.length; index++) {
            auto cliente = clientes_json[index];
            if (cliente["usuario"].str == usuario && cliente["contrasenia"].str == contrasenia) {
                return ResultadoBusqueda(true, index);
            }
        }

        return ResultadoBusqueda(false, -1); // Retorna -1 si no se encuentra el usuario
    }
}
