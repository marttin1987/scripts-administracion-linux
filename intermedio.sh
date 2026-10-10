#!/bin/bash

# Validamos que el usuario haya enviado exactamente 1 argumento
if [ "$#" -ne 1 ]; then
	echo "Uso incorrecto. Sintaxis: $0 <ruta_del_archivo.txt>"
	exit 1
fi

# Asignamos el parametro de entrada $1 a la variable LISTA
LISTA="$1"

# Validamos que el archivo ingresado realmente exista (-f)
if [ ! -f "$LISTA" ]; then
	echo "Error: El archivo $LISTA no existe o no es valido."
	exit 1
fi

echo "=== Procesando auditoria desde: $LISTA  ==="
echo ""

# Bucle while que lee linea por lines el archivo
while read -r CARPETA; do
	# Omitimos lineas vacias si las hubiera
	[ -z "$CARPETA" ] && continue

	RUTA_COMPLETA="$HOME/proyecto_atlas/$CARPETA"

	if [ -d "$RUTA_COMPLETA" ]; then
		echo "La carpeta '$CARPETA' ya existe. Omitiendo..."
	else
		mkdir -p "$RUTA_COMPLETA"
		echo "La carpeta '$CARPETA' no existia y fue CREADA."
	fi

done < "$LISTA"

echo ""
echo "=== Proceso finalizado ==="

