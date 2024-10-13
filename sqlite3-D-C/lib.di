
extern (C) int abrir_base_datos(void** db, const char* nombre_db);
extern (C) int ejecutar_transaccion(void* db, const char* sql);
extern (C) int consultar_datos(void* db, const char* sql);
extern (C) void cerrar_base_datos(void* db);
extern (C) char* get_respuesta();
