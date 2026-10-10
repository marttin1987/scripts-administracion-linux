#!/bin/bash

CANTIDAD=$(find ~/proyecto_atlas -type f | grep "\.log$" | wc -l)

echo "Evaluaundo la carpeta ~/proyecto_atlas..."

if [ "$CANTIDAD" -gt 0 ]; then
	echo "Se encontraron $CANTIDAD archivo(s) .log."
else
	echo "No se encontro ningun archivo .log en la carpeta."
fi

