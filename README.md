# Scripts de Administracion de sistemas Linux

Repositorio de scripts en Bash para auditoria, monitoreo de insfraestructura y diagnostico de red en sistemas Debian/Ubuntu

## Estructura del repositorio

- `monitoreo/`: Scripts de diagnostico de estado del sistema e infraestructura.
- `red/`: Herramientas de auditoria de red local y conectividad.
- `archivos/`: Scripts para auditoria, busqueda y manipulacion de directorios.
- `ejercicios/`: Practicas de sintaxis en Bash (bucles, parametros, inspeccion).

## Scripts Principales

### 1. `monitoreo/reporte_sistema.sh`
Audita en tiempo real los recursos criticos del sistema: 
- **Conectividad:** Verifica resolucion DNS y conectividad IP (1.1.1.1 / google.com).
- **Almacenamiento:** Mide el uso de la particion raiz `/`de forma robusta.
- **Seguridad y Usuarios:** Lista los miembros activos del grupo `desarrollo`.
- **Codigos de Salida:** `0`(OK), `1`(PRECAUCION / Advertencia), `2`(CRITICO).

### 2. `monitoreo/evaluar_disco.sh`
Inspecciona el espacio consumido en la partición raíz:
- Parsing robusto mediante `df --output=pcent`.
- **Códigos de Salida:** `0` (OK), `1` (PRECAUCIÓN), `2` (CRÍTICO).

### 3. `red/escanear_red.sh`
Herramienta de auditoria de red local con `arp-scan`:
- Deteccion automatica de la interfaz con ruta por defecto o mediante argumento `$1`.
- Validacion previa de dependencias (`arp-scan`) y privilegios `root`.

### 4. `archivos/auditoria_carpetas.sh`
Audita el tamaño consumido y conteo de archivos en directorios del sistema de forma dinámica.

## Requisitos e Instalacion

```bash
# Otorgar permisos de ejecucion a todos los scripts
chmod +x monitoreo/*.sh red/*.sh archivos/*.sh ejercicios/*.sh

# Ejemplo de ejecucion
./monitoreo/reporte_sistema.sh
sudo ./red/escanear_red.sh


