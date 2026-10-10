#!/bin/bash

CANTIDAD=$(find "$HOME/proyecto_atlas" -type f | grep -c "\.log$" || true)

echo "Evaluaundo la carpeta ~/proyecto_atlas..."

if [ "$CANTIDAD" -gt 0 ]; then
	echo "Se encontraron $CANTIDAD archivo(s) .log."
else
	echo "No se encontro ningun archivo .log en la carpeta."
fi

