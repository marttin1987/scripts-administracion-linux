#!/bin/bash

# =========================================
# Script de Auditoria de Red Local Wi-Fi
# Autor: Martin Coria
# =========================================

INTERFAZ="wlp3s0"

echo "===================================================="
echo "	AUDITORIA DE DISPOSITIVOS EN RED LOCAL ($INTERFAZ)"
echo "===================================================="
echo ""

echo "Escaneando dispositivos conectados..."
echo ""

# Ejecutamos arp-scan sobre la interfaz configurada
sudo arp-scan --interface="$INTERFAZ" --localnet

echo ""
echo "============================================"
echo "Escaneo finalizado con exito."
echo "============================================"
