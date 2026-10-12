#!/bin/bash
# =========================================================
# Proposito: Auditar el tamaño y cantidad de elementos en un directorio.
# Uso: ./auditoria_carpetas.sh [ruta_directorio]
# Codigos de Salida: 0 (OK), 2 (ERROR)
# =========================================================
set -euo pipefail

TARGET="${1:-$HOME/proyecto_atlas}"

if [ ! -d "$TARGET" ]; then
	echo "ERROR: La ruta '$TARGET' no es un directorio valido." >&2
	exit 2
fi

echo "==========================================="
echo " AUDITORIA DE DIRECTORIO: $TARGET"
echo "==========================================="
echo ""

CANT_ARCHIVOS=$(find "$TARGET" -type f | wc -l)
TAMANO_TOTAL=$(du -sh "$TARGET" 2>/dev/null | awk '{print $1}')

echo " Archivos totales: $CANT_ARCHIVOS"
echo " Peso total ocupado: $TAMANO_TOTAL"
echo ""
echo "=============================================="
exit 0



