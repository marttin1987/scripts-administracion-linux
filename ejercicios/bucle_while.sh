#!/bin/bash
# =========================================================
# Proposito: Recorrer iterativamente los archivos de un directorio objetivo.
# Uso: ./bucle_while.sh [ruta_directorio]
# Codigos de Salida: 0 (OK), 2 (ERROR)
# =========================================================
set -euo pipefail

DIRECTORIO="${1:-$HOME/proyecto_atlas}"

if [ ! -d "$DIRECTORIO" ]; then
	echo "ERROR: El directorio '$DIRECTORIO' no existe." >&2
	exit 2
fi

echo "Recorriendo archivos en $DIRECTORIO"

find  "$DIRECTORIO" -maxdepth 1 -type f | while read -r ARCHIVO; do
	echo "Archivo encontrado: $(basename "$ARCHIVO")"
done

exit 0
EOF




