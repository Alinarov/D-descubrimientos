#!/usr/bin/env dub
/+ dub.sdl:
dependency "vibe-d" version="~>0.8"
dependency "vibe-d:tls" version="~>0.8"
subConfiguration "vibe-d:tls" "botan"
+/
import vibe.vibe;

// Función auxiliar para iniciar sesión
void logIn(HTTPServerResponse res)
{
    // Inicia una nueva sesión para el usuario
    auto session = res.startSession();
    
    // Guarda un valor en la sesión para indicar que el usuario está autenticado
    session.set("autenticado", "true");
}

// Clase para nuestro servicio web
class WebService {
    // Ruta de bienvenida
    void getBienvenida(HTTPServerRequest req, HTTPServerResponse res)
    {
        // Muestra un mensaje de bienvenida
        res.writeBody("¡Bienvenido! Visita /registrar para autenticarte.");
    }
    
    // Ruta de registro (simula la autenticación)
    void getRegistrar(HTTPServerRequest req, HTTPServerResponse res)
    {
        // Llama a la función logIn para iniciar sesión
        logIn(res);
        
        // Muestra un mensaje confirmando que el usuario se ha registrado
        res.writeBody("Te has registrado correctamente. Visita /autorizado para verificar tu autorización.");
    }
    
    // Ruta de autorización
    void getAutorizado(HTTPServerRequest req, HTTPServerResponse res)
    {
        // Obtiene la sesión actual del usuario
        auto session = req.session;
        
        // Verifica si el usuario está autenticado
        if (session && session.get("autenticado", "false") == "true") {
            // Si está autenticado, muestra un mensaje de autorización
            res.writeBody("¡Estás autorizado!");
        } else {
            // Si no está autenticado, muestra un mensaje de no autorización
            res.writeBody("No estás autorizado. Visita /registrar para autenticarte.");
        }
    }

    // Ruta para cerrar sesión
    void getLogout(HTTPServerRequest req, HTTPServerResponse res) {
        // Termina la sesión del usuario
        res.terminateSession();
        
        // Muestra un mensaje confirmando que la sesión se ha cerrado
        res.writeBody("Has cerrado la sesión");
    }
}

void main()
{
    // Configurar el servidor
    auto settings = new HTTPServerSettings;
    settings.port = 8080;  // Puerto en el que escuchará el servidor
    
    // Configurar la sesión
    settings.sessionStore = new MemorySessionStore;  // Almacén de sesiones en memoria
    
    // Configurar el router
    auto router = new URLRouter;
    
    // Registrar la clase WebService en el router
    router.registerWebInterface(new WebService);
    
    // Iniciar el servidor
    listenHTTP(settings, router);  // Escuchar en el puerto 8080 con el router configurado
    runApplication();  // Ejecutar el bucle principal de la aplicación
}
