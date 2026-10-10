#!/bin/bash
# ==============================================================================
# Propósito: Auditar dispositivos activos en la red local mediante arp-scan.
# Uso: sudo ./red/escanear_red.sh [interfaz]
# Codigos de Salida: 0 (OK), 2 (ERROR / Requiere root)
# ==============================================================================
set -euo pipefail

# Validar permisos de root antes de continuar
if [ "$(id -u)" -ne 0 ]; then
    echo "❌ ERROR: Este script requiere privilegios de root (ejecutar con sudo)." >&2
    exit 2
fi

# Validar dependencia de arp-scan
if ! command -v arp-scan &> /dev/null; then
    echo "❌ ERROR: 'arp-scan' no está instalado. Instalalo con: sudo apt install arp-scan" >&2
    exit 2
fi

# Detectar interfaz automáticamente si no se recibe $1
INTERFAZ="${1:-$(ip route show default | awk '/default/ {print $5}' | head -n 1)}"

if [ -z "$INTERFAZ" ]; then
    echo "❌ ERROR: No se pudo detectar una interfaz de red activa." >&2
    exit 2
fi

echo "=================================================="
echo "    AUDITORÍA DE DISPOSITIVOS EN RED LOCAL ($INTERFAZ)"
echo "=================================================="
echo ""

arp-scan --interface="$INTERFAZ" --localnet

echo ""
echo "=================================================="
echo "Escaneo finalizado con éxito."
echo "=================================================="
exit 0
