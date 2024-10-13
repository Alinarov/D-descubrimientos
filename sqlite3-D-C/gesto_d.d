#!/usr/bin/env dmd 
/**
 * Aqui hay tipos de funciones
 * 	protected : funciones para esta misma clase
 * 	public : funciones que pueden usar cualquier codigo del proyecto
 */
module gestor_clientes;
import std;
import core.thread;
import core.stdc.string;
import lib;

//import crud;
alias print = writeln;

//void main (string [] args) {
	
//	Gestor_clients g_c = new Gestor_clients();
//	print(g_c.obtener_informacion_clientes_SQL());

//}

/**
 * Gestor_clients
 */

class Gestor_clients {

	long tamanio_data_clients_actual;

	string data_clients;
	string ipV4Cliente;
	string contenido_data_clientes;

	// Aqui tendremos toda la informacion ya cargada de la base de datos de los clientes
	JSONValue ip_clientes_logeados;

	this() {


	//this(string ip_v4_cliente = null, string MAC_address = null) {
		
		print(" (+) Instancia para gestor de clientes esta creado :3");


		//if (ip_v4_cliente == null || MAC_address == null) {

		//	print(" (+) Estoy verificando ");
		//}


		// 1. obtener informacion_clientes
		// 2. validar_credenciales


	}
	
	protected void actualizador () {

		while (true) {

			JSONValue info_clientes = obtener_informacion_clientes_SQL();

			

			Thread.sleep(dur!"seconds"(3)); // hacemos un sleep de 1 segundo

		}

	}
			

	public JSONValue obtener_informacion_clientes_SQL () {

		import lib;

		void* db;  // Puntero para la base de datos

		// Abrir la base de datos
		if (abrir_base_datos(&db, "clientes.db") != 0) {
			writeln("Error al abrir la base de datos");
			return parseJSON("{}");

		}

		{// Ejecutar una transacción: insertar datos
				//const char* sql_insert = 
				//    `INSERT INTO Clientes VALUES(8, 'uga uga', 30);`;
		
				//if (ejecutar_transaccion(db, sql_insert) != 0) {
				//    writeln("Error al ejecutar la transacción");
				//    cerrar_base_datos(db);
				//    return;
				//}
		}

		const char* sql_select = "SELECT * FROM Clientes";
		auto respuesta = consultar_datos(db, sql_select);

		
		string clientes_cargados_str = ``;

		// Manejo de error: revisar si la respuesta es diferente de cero
		if (respuesta != 0) {
			writeln("Error al consultar los datos");
		} else {

			// Asegúrate de que get_respuesta() devuelva una cadena no vacía
			auto result = get_respuesta();

			// Comprobar si el resultado es diferente de null
			if (result !is null) {
				// Imprimir los resultados, omitiendo el último carácter si es necesario
				ulong length = strlen(result);

				if (length > 0) {
					// Imprimir toda la cadena
					clientes_cargados_str = to!string(result[0 .. length - 0]); // Esto evitará el carácter nulo al final
				} else {
					writeln("No se obtuvieron resultados.");
				}
			} else {
				writeln("No se obtuvieron resultados.");
			}
		}

			// Buscar la última coma
		size_t lastCommaIndex = lastIndexOf(clientes_cargados_str,',');
		
		// Si se encontró una coma, eliminarla
		if (lastCommaIndex != size_t.max) {
			clientes_cargados_str = clientes_cargados_str[0..lastCommaIndex] ~ clientes_cargados_str[lastCommaIndex + 1..$];
		}



		JSONValue clientes_cargados = parseJSON(`{ "clientes_cargados" : [` ~ clientes_cargados_str ~ `]}`);

		// Cerrar la base de datos
		cerrar_base_datos(db);
		return clientes_cargados;

	}



	protected void validar_actualizacion_archivo_fn () {
		// Función que obtiene el tamaño del archivo
		long obtener_tamanio_archivo() {
			auto filePath = "clientes.db"; // Reemplaza con la ruta a tu archivo

			// Obtiene el tamaño del archivo
			try {
				
				return to!long(getSize(filePath)); // Obtener el tamaño directamente
				
			} catch (Exception e) {
				// Captura y muestra cualquier error que ocurra
				print(" {!} Error: ", e.msg);
			}
			return 0;
		}

		if (tamanio_data_clients_actual < obtener_tamanio_archivo()) {
			print(" (?) Validando actualizacion de los datos ... ");
			obtener_informacion_clientes_SQL();

		}




	} // validar_actualizacion_archi_fnvo



}
