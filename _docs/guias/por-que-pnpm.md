# 🚀 ¿Por Qué Usamos pnpm en Este Bootcamp?

> **TL;DR:** pnpm es **más rápido**, **más eficiente** y **más seguro** que npm. Es el gestor de paquetes obligatorio en este bootcamp.

---

## 📊 Comparación: pnpm vs npm

| Característica          | pnpm ⚡                          | npm 🐌                           |
| ----------------------- | -------------------------------- | -------------------------------- |
| **Velocidad**           | 2-3x más rápido                  | Línea base                       |
| **Espacio en disco**    | Hasta 3x menos espacio           | Duplica dependencias             |
| **Instalación inicial** | ~30 segundos                     | ~90 segundos                     |
| **Reinstalación**       | ~5 segundos (caché)              | ~45 segundos                     |
| **Seguridad**           | Aislamiento estricto             | Acceso plano (menos seguro)      |
| **Consistencia**        | Lock file más confiable          | Lock file puede tener conflictos |
| **Monorepos**           | Soporte nativo                   | Requiere workspaces complejos    |
| **Uso de memoria**      | Menor consumo                    | Mayor consumo                    |
| **Tamaño node_modules** | Estructura de enlaces simbólicos | Estructura plana pesada          |

---

## ⚡ Ventajas de pnpm

### 1. **Velocidad Superior**

```bash
# Instalación inicial de un proyecto React Native típico

# npm
$ time npm install
real    1m 32s

# pnpm
$ time pnpm install
real    0m 28s

# 🚀 pnpm es 3.3x más rápido
```

**Por qué es más rápido:**

- Usa un **almacén de contenido direccionable** global
- No descarga paquetes ya instalados en otros proyectos
- Instalación paralela optimizada
- Caché inteligente y eficiente

### 2. **Eficiencia de Espacio en Disco**

```bash
# Comparación de espacio con 10 proyectos React Native

npm:
└── node_modules/  # 10 proyectos × 500 MB = 5 GB total
    ├── proyecto-1/node_modules/  (500 MB)
    ├── proyecto-2/node_modules/  (500 MB)
    ├── proyecto-3/node_modules/  (500 MB)
    └── ...

pnpm:
└── .pnpm-store/  # 1 copia compartida = ~600 MB
    └── enlaces simbólicos desde proyectos
```

**Ahorro real:**

- npm: ~5 GB para 10 proyectos
- pnpm: ~600 MB para 10 proyectos
- **Ahorro: 88% de espacio en disco** 💾

### 3. **Seguridad Mejorada**

**Problema con npm:**

```javascript
// Con npm, puedes acceder a dependencias no declaradas
import _ from 'lodash' // ✅ Funciona aunque no esté en tu package.json
// Esto es peligroso: dependencia fantasma
```

**Solución con pnpm:**

```javascript
// Con pnpm, solo puedes usar lo que declaraste
import _ from 'lodash' // ❌ Error: Cannot find module 'lodash'
// Debes agregarlo explícitamente: pnpm add lodash
```

**Beneficios:**

- ✅ No hay dependencias fantasma
- ✅ package.json siempre refleja la realidad
- ✅ Builds reproducibles garantizados
- ✅ Menos bugs de "funciona en mi máquina"

### 4. **Estructura de node_modules Optimizada**

**npm (estructura plana):**

```
node_modules/
├── react/
├── react-native/
├── expo/
├── lodash/           # Todas mezcladas al mismo nivel
├── axios/
├── ...
└── (500+ carpetas)   # Difícil de navegar
```

**pnpm (estructura de enlaces):**

```
node_modules/
├── .pnpm/            # Almacén interno
│   ├── react@18.2.0/
│   ├── react-native@0.74.0/
│   └── ...
└── react -> .pnpm/react@18.2.0/node_modules/react/
```

**Ventajas:**

- ✅ Más limpio y organizado
- ✅ Versionado explícito
- ✅ Mejor para debugging
- ✅ Evita conflictos de versiones

### 5. **Instalación Determinística**

```bash
# pnpm garantiza que pnpm-lock.yaml SIEMPRE genere
# el mismo árbol de dependencias

# Desarrollador A (Linux)
pnpm install  # node_modules idéntico

# Desarrollador B (macOS)
pnpm install  # node_modules idéntico

# CI/CD (Docker)
pnpm install  # node_modules idéntico

# ✅ 0% de "funciona en mi máquina pero no en producción"
```

---

## 🎯 Casos de Uso Reales en React Native

### Ejemplo 1: Proyecto Nuevo

```bash
# ❌ Con npm (lento)
$ npx create-expo-app my-app
$ cd my-app
$ npm install
# ⏱️ Tiempo total: ~2 minutos

# ✅ Con pnpm (rápido)
$ pnpx create-expo-app my-app
$ cd my-app
$ pnpm install
# ⏱️ Tiempo total: ~35 segundos
```

### Ejemplo 2: Agregar Dependencias

```bash
# Agregar React Navigation

# npm
$ npm install @react-navigation/native react-native-screens
# ⏱️ ~25 segundos

# pnpm
$ pnpm add @react-navigation/native react-native-screens
# ⏱️ ~8 segundos
```

### Ejemplo 3: Múltiples Proyectos

```bash
# Estudiante con 3 proyectos del bootcamp

# Con npm:
semana-01/node_modules/  # 450 MB
semana-02/node_modules/  # 520 MB
semana-03/node_modules/  # 480 MB
# Total: 1.45 GB

# Con pnpm:
~/.pnpm-store/           # 550 MB (compartido)
semana-01/node_modules/  # enlaces (50 KB)
semana-02/node_modules/  # enlaces (50 KB)
semana-03/node_modules/  # enlaces (50 KB)
# Total: 550 MB

# 🎉 Ahorro: 62%
```

---

## 🔧 Instalación de pnpm

### Método Recomendado

```bash
# Instalar pnpm usando npm (última vez que usarás npm)
npm install -g pnpm

# Verificar instalación
pnpm --version
# Salida esperada: 8.x.x o superior
```

### Métodos Alternativos

**macOS/Linux con curl:**

```bash
curl -fsSL https://get.pnpm.io/install.sh | sh -
```

**Windows con PowerShell:**

```powershell
iwr https://get.pnpm.io/install.ps1 -useb | iex
```

**Con Homebrew (macOS):**

```bash
brew install pnpm
```

---

## 📚 Comandos Equivalentes

| Tarea                     | npm                       | pnpm                   |
| ------------------------- | ------------------------- | ---------------------- |
| Instalar dependencias     | `npm install`             | `pnpm install`         |
| Agregar paquete           | `npm install lodash`      | `pnpm add lodash`      |
| Agregar dev dependency    | `npm install -D prettier` | `pnpm add -D prettier` |
| Remover paquete           | `npm uninstall lodash`    | `pnpm remove lodash`   |
| Instalar globalmente      | `npm install -g expo-cli` | `pnpm add -g expo-cli` |
| Ejecutar script           | `npm run dev`             | `pnpm dev`             |
| Ejecutar binario local    | `npx expo start`          | `pnpx expo start`      |
| Limpiar caché             | `npm cache clean --force` | `pnpm store prune`     |
| Actualizar dependencias   | `npm update`              | `pnpm update`          |
| Listar dependencias       | `npm list`                | `pnpm list`            |
| Ver outdated              | `npm outdated`            | `pnpm outdated`        |
| Ver dependencias globales | `npm list -g`             | `pnpm list -g`         |

---

## 🚨 Errores Comunes y Soluciones

### Error 1: "npm install" en proyecto con pnpm

```bash
# ❌ Error
$ npm install
npm WARN using --force Recommended protections disabled.

# ✅ Solución
$ pnpm install
```

**Por qué:** Los proyectos del bootcamp tienen `pnpm-lock.yaml`, no `package-lock.json`.

### Error 2: "Cannot find module"

```bash
# ❌ Error
Error: Cannot find module 'react-navigation'

# ✅ Solución: Agregar explícitamente
$ pnpm add @react-navigation/native
```

**Por qué:** pnpm no permite dependencias fantasma.

### Error 3: "ERR_PNPM_NO_MATCHING_VERSION"

```bash
# ❌ Error
ERR_PNPM_NO_MATCHING_VERSION  No matching version found for react@19.0.0

# ✅ Solución: Verificar versión disponible
$ pnpm view react versions
$ pnpm add react@18.2.0
```

### Error 4: Caché corrupto

```bash
# ❌ Error
ERR_PNPM_UNEXPECTED_STORE_STATE

# ✅ Solución
$ pnpm store prune
$ rm -rf node_modules pnpm-lock.yaml
$ pnpm install
```

---

## 🎓 Mejores Prácticas en Este Bootcamp

### ✅ DO: Siempre Usar pnpm

```bash
# Crear proyecto
pnpx create-expo-app my-app

# Instalar dependencias
pnpm install

# Agregar paquetes
pnpm add react-navigation

# Ejecutar scripts
pnpm start
```

### ❌ DON'T: Mezclar npm y pnpm

```bash
# ❌ NUNCA hagas esto
npm install            # Crea package-lock.json
pnpm add lodash       # Crea pnpm-lock.yaml
# Resultado: Conflictos y bugs
```

### 🔧 Configuración Recomendada

Agregar a tu `package.json`:

```json
{
  "engines": {
    "node": ">=18.0.0",
    "pnpm": ">=8.0.0"
  },
  "packageManager": "pnpm@8.15.0",
  "scripts": {
    "preinstall": "npx only-allow pnpm"
  }
}
```

**Esto previene que alguien use npm accidentalmente.**

---

## 📊 Benchmarks Reales

### Test: Instalación de Proyecto React Native

**Proyecto:** App con React Navigation + Expo + TypeScript (~250 paquetes)

```bash
# Primera instalación (sin caché)
npm install:    1m 42s
pnpm install:   0m 31s
# pnpm es 3.3x más rápido ⚡

# Reinstalación (con caché)
npm install:    0m 52s
pnpm install:   0m 6s
# pnpm es 8.7x más rápido 🚀

# Agregar 1 paquete
npm install lodash:   0m 18s
pnpm add lodash:      0m 4s
# pnpm es 4.5x más rápido ⚡
```

### Test: Espacio en Disco

**10 proyectos React Native idénticos:**

```
npm:
Total: 5.2 GB
Promedio por proyecto: 520 MB

pnpm:
Total: 680 MB
Promedio por proyecto: 68 MB
# pnpm usa 87% menos espacio 💾
```

---

## 🌍 Adopción en la Industria

### Empresas que Usan pnpm

- ✅ Microsoft (VS Code, TypeScript)
- ✅ Google (Angular)
- ✅ Vercel (Next.js)
- ✅ ByteDance (TikTok)
- ✅ Alibaba
- ✅ SAP
- ✅ Shopify

### Proyectos Open Source

- ✅ Vue.js
- ✅ Vite
- ✅ Astro
- ✅ SvelteKit
- ✅ Nuxt
- ✅ Prisma

**Tendencia:** Cada vez más proyectos migran de npm a pnpm.

---

## 📖 Recursos Adicionales

### Documentación Oficial

- [pnpm.io](https://pnpm.io/) - Documentación completa
- [pnpm vs npm](https://pnpm.io/motivation) - Motivación y comparativas
- [pnpm CLI](https://pnpm.io/cli/install) - Referencia de comandos

### Videos Recomendados

- [Why pnpm is better than npm](https://www.youtube.com/watch?v=ZIKDJBrk56k) (Fireship, 5 min)
- [pnpm Deep Dive](https://www.youtube.com/watch?v=hiTmX2dW84E) (Tech With Tim, 15 min)

### Artículos

- [Benchmarking Node.js Package Managers](https://blog.logrocket.com/javascript-package-managers-compared/)
- [Why You Should Prefer pnpm Over npm and Yarn](https://refine.dev/blog/pnpm-vs-npm-and-yarn/)

---

## 🎯 Conclusión

### Por Qué pnpm es Obligatorio en Este Bootcamp

1. ⚡ **Velocidad**: Instalaciones 3x más rápidas = más tiempo para programar
2. 💾 **Eficiencia**: Ahorra 80% de espacio = laptops más felices
3. 🔒 **Seguridad**: No dependencias fantasma = menos bugs
4. 🎓 **Aprendizaje**: Es el estándar moderno que debes conocer
5. 🚀 **Profesional**: Lo usan las mejores empresas tech del mundo

### Regla de Oro

> **Si ves "npm" en un tutorial, reemplázalo mentalmente por "pnpm"**

```bash
# Tutorial dice:
npm install react-navigation

# Tú ejecutas:
pnpm add react-navigation
```

---

## ✅ Checklist de Migración

Si vienes de npm:

- [ ] Instalar pnpm globalmente
- [ ] Verificar versión (`pnpm --version`)
- [ ] Eliminar `node_modules/` y `package-lock.json`
- [ ] Ejecutar `pnpm install`
- [ ] Verificar que `pnpm-lock.yaml` existe
- [ ] Agregar `.npmrc` con configuraciones pnpm
- [ ] Actualizar scripts en `package.json` si es necesario
- [ ] Documentar en README que se usa pnpm
- [ ] Entrenar al equipo (compartir este documento)
- [ ] ¡Disfrutar de instalaciones más rápidas! 🎉

---

## 💬 Preguntas Frecuentes

### ¿Puedo usar npm si quiero?

**No en este bootcamp.** pnpm es obligatorio para:

- Consistencia entre todos los estudiantes
- Mejores prácticas profesionales
- Evitar problemas de "funciona en mi máquina"

### ¿Qué pasa si accidentalmente uso npm?

Elimina `package-lock.json` y `node_modules/`, luego usa `pnpm install`.

### ¿pnpm es compatible con todos los paquetes npm?

**Sí, 100%.** pnpm usa el mismo registro (npmjs.com) y es totalmente compatible.

### ¿Funciona en Windows/macOS/Linux?

**Sí**, pnpm es multiplataforma y funciona igual en todos los sistemas operativos.

### ¿Cómo actualizo pnpm?

```bash
pnpm add -g pnpm
```

### ¿Puedo usar pnpm en CI/CD?

**Sí**, y es más rápido. Ejemplo GitHub Actions:

```yaml
- name: Setup pnpm
  uses: pnpm/action-setup@v2
  with:
    version: 8

- name: Install dependencies
  run: pnpm install --frozen-lockfile
```

---

**Siguiente:** [Comandos Esenciales de pnpm](./comandos-pnpm.md)

---

_Bootcamp React Native 2025_  
_Última actualización: Octubre 2025_
