# Scripts de Administracion de sistemas Linux

Repositorio de scripts en Bash para auditoria, monitoreo de insfraestructura y diagnostico de red en sistemas Debian/Ubuntu

## Estructura del repositorio

- `monitoreo/`: Scripts de diagnostico de estado del sistema e infraestructura.
- `red/`: Herramientas de auditoria de red local y conectividad.
- `ejercicios/`: Practicas de sintaxis en Bash (bucles, parametros, inspeccion).

## Scripts Principales

### 1. `monitoreo/reporte_sistema.sh`
Audita en tiempo real los recursos criticos del sistema: 
- **Conectividad:** Verifica resolucion DNS y conectividad IP (1.1.1.1 / google.com).
- **Almacenamiento:** Mide el uso de la particion raiz `/`de forma robusta.
- **Seguridad y Usuarios:** Lista los miembros activos del grupo `desarrollo`.
- **Codigos de Salida:** `0`(OK), `1`(PRECAUCION / Advertencia), `2`(CRITICO).

### 2. `red/escanear_red.sh`
Herramienta de auditoria de red local con `arp-scan`:
- Deteccion automatica de la interfaz con ruta por defecto o mediante argumento `$1`.
- Validacion previa de dependencias (`arp-scan`) y privilegios `root`.

## Requisitos e Instalacion

```bash
# Otorgar permisos de ejecucion
chmod +x monitoreo/reporte_sistema.sh red/escanear_red.sh

# Ejecucion
./monitoreo/reporte_sistema.sh


