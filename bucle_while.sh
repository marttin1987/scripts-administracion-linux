#!/bin/bash

# Archivo que contiene la lista
LISTA="$HOME/proyecto_atlas/carpetas.txt"

echo "=== Creando estructura desde $LISTA ==="
echo ""

# Bucle while que lee linea por linea la variable CARPETA 
while read -r CARPETA; do

	# Creamos la carpeta dentro de ~/proyecta_atlas
	mkdir -p "$HOME/proyecto_atlas/$CARPETA"
	echo "Creada la carpeta: $HOME/proyecto_atlas/$CARPETA"

done < "$LISTA"

echo ""
echo "=== Estructura resultante ==="
ls -ld ~/proyecto_atlas/*/

