#!/bin/bash

# ====================================
# Script de auditoria y estado del sistema - Proyecto Atlas
# Autor: mcoria
# ====================================

FECHA=$(date "+%Y-%m-%d %H:%M:%S")

echo "==============================="
echo "   REPORTE DE ESTADO DEL SISTEMA - $FECHA"
echo ""

echo "[1] Espacio libre en disco:"
df -h /home /
echo ""

echo "[2] Estado de la conexion a internet:"
ping -c 2 google.com | grep "packets transmitted"
echo ""

echo "================================="
echo "Reporte generado con exito."
echo "================================="

