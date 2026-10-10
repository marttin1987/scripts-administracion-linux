#!/bin/bash


echo "=== Creando archivos de prueba ==="


# Bucle for numerico para generar 3 archivos dentro de tu carpeta de trabajo
for N in 1 2 3; do
	touch "$HOME/proyecto_atlas/archivo_$N.txt"
	echo "Creado: archivo_$N.txt"
done

echo ""
echo "=== Verificando contenido en ~/proyecto_atlas ==="
ls -l ~/proyecto_atlas/*.txt
