#!/usr/bin/env dmd
import std;
import core.time;
import core.thread;

alias print = writeln;

void main (string[] args) {

        //string output = executeShell("ip link | grep ether ").output;
        //writeln(output);



    // Parseamos el JSON
    JSONValue cache_clientes_iniciados = parseJSON(`{
        "sesiones": {
            "ip_mac_1": {
                "ultima_sesion": "2024-10-10T13:22",
                "usuario_cliente": "usuario_001"
            },
            "ip_mac_2": {
                "ultima_sesion": "2024-10-10T14:34",
                "usuario_cliente": "usuario_002"
            },
            "ip_mac_3": {
                "ultima_sesion": "2024-10-10T06:00",
                "usuario_cliente": "usuario_003"
            },
            "ip_mac_4": {
                "ultima_sesion": "2024-10-10T18:15",
                "usuario_cliente": "usuario_004"
            }
        }
    }`);
    
    cache_clientes_iniciados["sesiones"].object.remove("ip_mac_2");

    print(cache_clientes_iniciados["sesiones"]);

    while (true) {

        // Obtener la hora actual
        SysTime ahora = Clock.currTime();

        // Formatear el año, mes y día con dos dígitos
        string anio_ahora = to!string(ahora.year);
        string mes_ahora = format("%02d", ahora.month);
        string dia_ahora = format("%02d", ahora.day);

        string fecha_ahora = anio_ahora ~ "-" ~ mes_ahora ~ "-" ~ dia_ahora;

        print("Hoy estamos " ~ fecha_ahora);

        // Iterar sobre las claves de "sesiones"
        foreach (clave, sesion; cache_clientes_iniciados["sesiones"].object) {
            // Convertir la hora "ultima_sesion" del JSON a SysTime
            string ultima_sesion_str = sesion["ultima_sesion"].str;

            // Combinar la fecha actual con la hora de la última sesión
            SysTime ultima_sesion = SysTime.fromISOExtString(fecha_ahora ~ "T" ~ ultima_sesion_str ~ ":00");

            // Añadir 60 minutos
            ultima_sesion = ultima_sesion + minutes(60);

            // Comparar con la hora actual
            if (ultima_sesion > ahora) {
                writeln("Clave: ", clave, " - Última sesión es posterior a la hora actual");



            } else {
                writeln("Clave: ", clave, " - Última sesión es anterior a la hora actual");
            }
        }

        Thread.sleep(dur!"seconds"(3)); // hacemos un sleep de 1 segundo

    }


}
