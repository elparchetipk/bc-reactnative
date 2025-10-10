# 🔧 Scripts de Automatización

Esta carpeta contiene scripts de automatización y utilidades para el bootcamp.

---

## 📂 Estructura

### ⚙️ [Setup](./setup/)
Scripts de configuración inicial y preparación del entorno.

**Scripts disponibles:**
- `init-proyecto.sh` - Inicializa un nuevo proyecto Expo
- `install-dependencies.sh` - Instala dependencias con pnpm
- `setup-env.sh` - Configura variables de entorno

### 🏗️ [Generators](./generators/)
Generadores de contenido y plantillas.

**Scripts disponibles:**
- `generate-week.js` - Genera estructura completa de una semana
- `create-practice.js` - Crea plantilla de práctica
- `scaffold-project.js` - Genera proyecto base para estudiantes

### ✅ [Validators](./validators/)
Validadores de código y estructura.

**Scripts disponibles:**
- `validate-code.js` - Valida código de estudiantes
- `check-structure.js` - Verifica estructura de archivos
- `lint-markdown.js` - Valida documentación markdown

### 🛠️ [Utils](./utils/)
Utilidades generales.

**Scripts disponibles:**
- `backup.sh` - Crea backups del proyecto
- `cleanup.sh` - Limpia archivos temporales
- `sync-students.sh` - Sincroniza código de estudiantes

---

## 🚀 Uso de Scripts

### Scripts de Setup

#### Inicializar Proyecto Expo
```bash
# Uso básico
./_scripts/setup/init-proyecto.sh nombre-proyecto

# Con template específico
./_scripts/setup/init-proyecto.sh nombre-proyecto --template tabs
```

#### Instalar Dependencias
```bash
# Instalar todas las dependencias
./_scripts/setup/install-dependencies.sh

# Instalar en un proyecto específico
./_scripts/setup/install-dependencies.sh ./bootcamp/semana-01/3-proyecto
```

#### Configurar Variables de Entorno
```bash
# Crear .env desde template
./_scripts/setup/setup-env.sh

# Con valores personalizados
./_scripts/setup/setup-env.sh --api-url https://api.ejemplo.com
```

---

### Scripts Generadores

#### Generar Semana Completa
```bash
# Generar estructura de semana 1
node _scripts/generators/generate-week.js --week 1 --title "Fundamentos"

# Con opciones adicionales
node _scripts/generators/generate-week.js \
  --week 2 \
  --title "Navegación y Routing" \
  --theory 3 \
  --practices 5 \
  --project "App Multi-Pantalla"
```

**¿Qué hace?**
- Crea carpetas: `1-teoria/`, `2-practicas/`, `3-proyecto/`, etc.
- Genera `README.md` con estructura base
- Crea `RUBRICA-EVALUACION.md`
- Inicializa archivos `.gitkeep`

**¿Para qué sirve?**
Automatizar la creación de estructura estándar de cada semana

**¿Cómo funciona?**
Lee templates y los personaliza con los datos proporcionados

#### Crear Práctica
```bash
# Crear nueva práctica
node _scripts/generators/create-practice.js \
  --week 1 \
  --number 1 \
  --title "Componentes Básicos"

# Con código inicial
node _scripts/generators/create-practice.js \
  --week 1 \
  --number 2 \
  --title "Estilos y Flexbox" \
  --scaffold
```

#### Scaffold Proyecto
```bash
# Generar proyecto base
node _scripts/generators/scaffold-project.js \
  --week 1 \
  --name "perfil-app" \
  --template blank

# Con navegación
node _scripts/generators/scaffold-project.js \
  --week 2 \
  --name "navegacion-app" \
  --template navigation
```

---

### Scripts Validadores

#### Validar Código
```bash
# Validar código de un estudiante
node _scripts/validators/validate-code.js \
  --student "juan-perez" \
  --week 1

# Validar todos los estudiantes
node _scripts/validators/validate-code.js --week 1 --all

# Con reporte detallado
node _scripts/validators/validate-code.js \
  --week 1 \
  --all \
  --report
```

**Verifica:**
- ✅ Nomenclatura en inglés
- ✅ Comentarios explicativos
- ✅ Estructura de archivos
- ✅ Imports correctos
- ✅ Estilos consistentes

#### Verificar Estructura
```bash
# Verificar estructura de una semana
node _scripts/validators/check-structure.js --week 1

# Verificar todo el bootcamp
node _scripts/validators/check-structure.js --all

# Con auto-fix
node _scripts/validators/check-structure.js --week 1 --fix
```

#### Validar Markdown
```bash
# Validar documentación
node _scripts/validators/lint-markdown.js

# Solo una carpeta
node _scripts/validators/lint-markdown.js --dir ./bootcamp/semana-01

# Con corrección automática
node _scripts/validators/lint-markdown.js --fix
```

---

### Scripts de Utilidades

#### Crear Backup
```bash
# Backup completo
./_scripts/utils/backup.sh

# Backup de una semana
./_scripts/utils/backup.sh --week 1

# Backup con fecha personalizada
./_scripts/utils/backup.sh --date 2024-10-01
```

#### Limpiar Archivos Temporales
```bash
# Limpieza básica
./_scripts/utils/cleanup.sh

# Limpieza profunda (incluye node_modules)
./_scripts/utils/cleanup.sh --deep

# Solo archivos de cache
./_scripts/utils/cleanup.sh --cache-only
```

---

## 📝 Crear Nuevos Scripts

### Template Básico (JavaScript/Node.js)

```javascript
#!/usr/bin/env node

/**
 * Script: nombre-del-script.js
 * 
 * ¿Qué hace?
 * [Descripción breve]
 * 
 * ¿Para qué sirve?
 * [Propósito y beneficios]
 * 
 * ¿Cómo funciona?
 * 1. [Paso 1]
 * 2. [Paso 2]
 * 3. [Paso 3]
 * 
 * Uso:
 * node _scripts/[categoria]/nombre-del-script.js [opciones]
 */

const fs = require('fs');
const path = require('path');

// Configuración
const config = {
  // Tu configuración aquí
};

// Función principal
async function main() {
  try {
    console.log('🚀 Iniciando script...');
    
    // Tu lógica aquí
    
    console.log('✅ Script completado exitosamente');
  } catch (error) {
    console.error('❌ Error:', error.message);
    process.exit(1);
  }
}

// Ejecutar
main();
```

### Template Básico (Shell Script)

```bash
#!/bin/bash

# ============================================
# Script: nombre-del-script.sh
# 
# ¿Qué hace?
# [Descripción breve]
# 
# ¿Para qué sirve?
# [Propósito y beneficios]
# 
# ¿Cómo funciona?
# 1. [Paso 1]
# 2. [Paso 2]
# 3. [Paso 3]
# 
# Uso:
# ./_scripts/[categoria]/nombre-del-script.sh [opciones]
# ============================================

set -e # Exit on error

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Función de log
log_info() {
    echo -e "${GREEN}✓${NC} $1"
}

log_error() {
    echo -e "${RED}✗${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# Función principal
main() {
    log_info "Iniciando script..."
    
    # Tu lógica aquí
    
    log_info "Script completado exitosamente"
}

# Ejecutar
main "$@"
```

---

## 🔒 Permisos

Para hacer un script ejecutable:

```bash
chmod +x _scripts/setup/nombre-script.sh
```

---

## 📦 Dependencias

Algunos scripts pueden requerir dependencias adicionales:

```bash
# Para scripts de Node.js
pnpm add -D [paquete]

# Globales (evitar si es posible)
pnpm add -g [paquete]
```

---

## 🧪 Testing de Scripts

Antes de usar un script en producción:

1. **Probar en entorno de desarrollo**
2. **Verificar permisos de archivos**
3. **Validar paths absolutos/relativos**
4. **Testear con diferentes opciones**
5. **Documentar comportamiento**

---

## 📌 Mejores Prácticas

### ✅ Hacer
- Comentar abundantemente
- Usar nombres descriptivos
- Validar inputs
- Manejar errores gracefully
- Logging claro y útil
- Hacer scripts idempotentes

### ❌ Evitar
- Hardcodear paths
- Asumir que archivos existen
- Scripts destructivos sin confirmación
- Dependencias innecesarias
- Output verboso sin opción de silenciar

---

## 🤝 Contribuir

Para agregar nuevos scripts:

1. Crear script en la categoría apropiada
2. Seguir template estándar
3. Documentar en este README
4. Testear exhaustivamente
5. Abrir Pull Request

---

## 📞 Soporte

Si un script no funciona:
1. Verificar permisos de ejecución
2. Revisar logs de error
3. Comprobar dependencias instaladas
4. Consultar documentación específica
5. Abrir issue en GitHub

---

[← Volver al README principal](../README.md)
