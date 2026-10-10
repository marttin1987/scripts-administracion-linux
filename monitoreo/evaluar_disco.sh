#!/bin/bash
# ==============================================================================
# Propósito: Evaluar el porcentaje de uso de la partición raíz (/)...
# Uso: ./monitoreo/evaluar_disco.sh
# Codigos de Salida: 0 (OK), 1 (PRECAUCIÓN), 2 (CRÍTICO)
# ==============================================================================
set -euo pipefail

# Extraer el porcentaje de uso de la raiz de forma robusta
PORCENTAJE=$(df --output=pcent / | tail -1 | tr -dc '0-9')

echo "Uso actual del disco raiz (/): ${PORCENTAJE}%"

if [ "$PORCENTAJE" -gt 85 ]; then
	echo "CRITICO: uso de disco al ${PORCENTAJE}%. Ejecutar limpieza de emergencia."
	exit 2
elif [ "$PORCENTAJE" -gt 70 ]; then
	echo "PRECAUCION: Uso de disco al ${PORCENTAJE}%. Monitorear uso."
	exit 1
else
	echo "OK: Uso de disco en nivel normal (${PORCENTAJE}%)."
fi
