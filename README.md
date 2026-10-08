# Scripts de Administracion de sistemas Linux

Este repositorio contiene scripts de automatizacion en Bash para la auditoria, monitoreo y gestion de servidores Linux (Ubuntu/Debian).

## Script: `reporte_sistema.sh`
Script de diagnostico inicial del sistema que realiza las siguientes validaciones:
- Muestra timestamp dianmico de ejecucion.
- Audita el espacio libre en disco en las particiones `/home`y `/`
- Verifica los miembros del grupo de trabajo `desarrollo`.
- Prueba y reporta el estado de la conectividad a red/Internet.

## requisitos e Instalacion
Dar permisos de ejecucion antes de usar:
```bash
chmod +x reporte_sistema.sh
./reporte_sistema.sh

