import vibe.d;
import std.stdio;

void main() {
    // Configuración
    string API_KEY = "AIzaSyBGdqGYzr40xTMbUS3wfdQuwHU4Bf-AMyg";
    string API_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=" ~ API_KEY;

    // Función para hacer la solicitud
    auto getGeminiResponse(string prompt) {
        // Crear el cuerpo de la solicitud en formato JSON
        string data = `{"contents": [{"parts": [{"text": "` ~ prompt ~ `"}]}]}`;

        // Hacer la solicitud POST
        auto response = requestHTTP(API_URL,
            (scope HTTPClientRequest req) {
                req.method = HTTPMethod.POST;
                req.headers["Content-Type"] = "application/json"; // Asignar el header correctamente
                req.bodyWriter.write(data); // Escribir el cuerpo de la solicitud
            }
        );

        // Verificar el código de estado
        if (response.statusCode == 200) {
            return response.bodyReader.readAllUTF8(); // Devuelve el cuerpo de la respuesta
        } else {
            return `{"error": "` ~ response.statusCode.to!string ~ " - " ~ response.bodyReader.readAllUTF8() ~ `"}`;
        }
    }

    // Ejemplo de uso
    string prompt = "Dame una receta de cocina para un lunes";
    auto response = getGeminiResponse(prompt);

    // Mostrar la respuesta
    writeln(response);
}
