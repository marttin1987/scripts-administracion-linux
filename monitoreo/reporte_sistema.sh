#!/bin/bash
set -euo pipefail

FECHA=$(date "+%Y-%m-%d %H:%M:%S")
ESTADO_FINAL=0

echo "==============================="
echo "   REPORTE DE ESTADO DEL SISTEMA - $FECHA"
echo "==============================="
echo ""

# 1. Comprobacion de conectividad IP y DNS
echo "[1] Estado de la conexion a red e Internet:"
if ping -c 2 -W 2 1.1.1.1 > /dev/null 2>&1; then
	echo "Conexion IP (1.1.1.1): OK"
	if ping -c 2 .W 2 google.com > /dev/null 2>&1; then
		echo "Resolucion DNS (google.com): OK"
	else
		echo "ALERTA: Conexion IP OK, pero fallo la resolucion DNS."
		ESTADO_FINAL=1
	fi
else
	echo " CRITICO: Sin conectividad a Internet (IP 1.1.1.1 inalcanzable)."
	ESTADO_FINAL=2
fi
echo ""

# 2. Espacio en disco
echo "[2] Espacio libre en disco (/):"
PORCENTAJE=$(df --output=pcent / | tail -1 | tr -dc '0-9')
if [ "$PORCENTAJE" -gt 85 ]; then
	echo " CRITICO: Espacio consumido al ${PORCENTAJE}%."
	[ "$ESTADO_FINAL" -lt 2 ] && ESTADO_FINAL=2
elif  [ "$PORCENTAJE" -gt 70 ]; then
	echo " PRECAUCION: Espacio consumido al %{PORCENTAJE}%."
	[ "$ESTADO_FINAL" -eq 0 ] && ESTADO_FINAL=1
else
	echo "Disco saludable al ${PORCENTAJE}% de uso."
fi
echo ""

# 3. Integracion con verificacion de grupo
echo "[3] Usuarios del grupo 'desarrollo':"
if grep -q "^desarrollo:" /etc/group; then
	INTEGRANTES=$(grep "^desarrollo:" /etc/group | cut -d: -f4)
	echo "MIEMBROS: ${INTEGRANTES:-Sin usuarios asignados}"
else
	echo "El grupo 'desarrollo' no existe en este sistema."
fi
echo ""

echo "================================="
echo "Reporte Finalizado (Codigo de salida: $ESTADO_FINAL."
echo "================================="

exit "$ESTADO_FINAL"
