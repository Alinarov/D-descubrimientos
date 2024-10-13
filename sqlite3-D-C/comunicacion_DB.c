#include <stdio.h>
#include <sqlite3.h> 
#include <stdlib.h>
#include <string.h>


static char respuesta_sql[1024]; // Buffer para almacenar la respuesta


char* get_respuesta() {
    return respuesta_sql; // Devuelve un puntero a respuesta_sql
}


// Función para manejar los resultados de la consulta
static int callback(void *data, int argc, char **argv, char **azColName) {

    static int index = 0; // Llevar el conteo del índice
    int maxEntries = *((int *)data); // Límite de entradas

    

    if (index < maxEntries) { // Limitar el número de entradas
        strcat( respuesta_sql,"[ ");
        for (int i = 0; i < argc; i++) {
            char buffer[256]; // Buffer temporal para el valor
            //snprintf(buffer, sizeof(buffer), "\"%s\"", argv[i]); // Formatear el valor
            // strcat("\"%s\"", argv[i]); // Imprimir cada columna como un elemento de la lista
            strcat(respuesta_sql, "\"");
            strcat(respuesta_sql,  argv[i]); // Concatenar el valor a la respuesta_sql
            strcat(respuesta_sql, "\"");

            // Agregar una coma entre los elementos, pero no después del último
            if (i < argc - 1) {
                strcat(respuesta_sql, ", ");
            }
        }
        strcat(respuesta_sql, "]");

        index++;
        if (index < maxEntries) { // Nueva línea, excepto después del último elemento
            strcat(respuesta_sql, ",\n");
        } else {
            strcat(respuesta_sql, "\n"); // Cierra la lista al final
        }
    }    

    return 0;
}



// Función para abrir la base de datos
int abrir_base_datos(sqlite3 **db, const char *nombre_db) {
    int rc = sqlite3_open(nombre_db, db);
    if (rc) {
        fprintf(stderr, "No se pudo abrir la base de datos: %s\n", sqlite3_errmsg(*db));
        return 1;
    } else {
        fprintf(stderr, "Conexión a la base de datos '%s' establecida.\n", nombre_db);
    }
    return 0;
}

// Función para ejecutar una transacción
int ejecutar_transaccion(sqlite3 *db, const char *sql) {
    char *err_msg = 0;
    int rc = sqlite3_exec(db, "BEGIN TRANSACTION;", 0, 0, &err_msg);
    if (rc != SQLITE_OK) {
        fprintf(stderr, "Error al iniciar la transacción: %s\n", err_msg);
        sqlite3_free(err_msg);
        return 1;
    }

    rc = sqlite3_exec(db, sql, 0, 0, &err_msg);
    if (rc != SQLITE_OK) {
        fprintf(stderr, "Error en la consulta SQL: %s\n", err_msg);
        sqlite3_free(err_msg);
        sqlite3_exec(db, "ROLLBACK;", 0, 0, &err_msg); // Revertir los cambios en caso de error
        return 1;
    }

    rc = sqlite3_exec(db, "COMMIT;", 0, 0, &err_msg);
    if (rc != SQLITE_OK) {
        fprintf(stderr, "Error al confirmar la transacción: %s\n", err_msg);
        sqlite3_free(err_msg);
        sqlite3_exec(db, "ROLLBACK;", 0, 0, &err_msg);
        return 1;
    }

    return 0;
}

// Función para realizar una consulta y mostrar los datos
int consultar_datos(sqlite3 *db, const char *sql) {
    char *err_msg = 0;
    const char* data = " ";

    //  Esta funcion lo que hace es que al ejecutar el comando, va a tener un retorno en una funcion 
    // que pasaremos, en este caso se llama "calback"
    int rc = sqlite3_exec(db, sql, callback, (void*)data, &err_msg);



    if (rc != SQLITE_OK) {
        fprintf(stderr, "Error en la consulta SQL: %s\n", err_msg);
        sqlite3_free(err_msg);
        return 1;
    }

    return 0;
}

// Función para cerrar la base de datos
void cerrar_base_datos(sqlite3 *db) {
    sqlite3_close(db);
}
