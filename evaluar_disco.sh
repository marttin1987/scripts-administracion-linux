#!/bin/bash

# Capturamos el porcentaje de uso de la particion raiz /
USO=$(df / | grep / | awk '{print $5}' | sed 's/%//')

if [ "$USO" -gt 85 ]; then
	echo "CRITICO: uso de disco al $USO%. Ejecutar limpieza de emergencia."
elif [ "$USO" -gt 70 ]; then
	echo "PRECAUCION: Uso de disco al $USO%. Monitorear espacio."
else
	echo "OK: Uso de disco al $USO%, Nivel dentro del rango normal."
fi
