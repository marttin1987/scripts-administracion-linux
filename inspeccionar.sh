#!/bin/bash

# Validar que se reciba la ruta
if [ "$#" -ne 1 ]; then
	echo "ERROR:  Debes indicar una ruta. Ejemplo: $0 /home"
	exit 1
fi

RUTA=$1

echo "=== Analizando el uso en: $RUTA ==="

# Verificamos si la ruta ingresada existe realmente en el sistema 
if [ -d "$RUTA" ]; then
	CANTIDAD=$(find "$RUTA" -type f 2>/dev/null | wc -l)
	echo "La carpeta '$RUTA' contiene un total de $CANTIDAD archivos."
else
	echo "ERROR: La ruta '$RUTA' no existe o no es un directorio valido."
fi

