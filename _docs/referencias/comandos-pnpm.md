# 🚀 Referencia Rápida: Comandos pnpm

> **Cheat sheet** de comandos pnpm más usados en el bootcamp React Native.

---

## 📋 Comandos Esenciales

### Instalación de Dependencias

```bash
# Instalar todas las dependencias del package.json
pnpm install
# Alias: pnpm i

# Instalar con lockfile exacto (CI/CD)
pnpm install --frozen-lockfile

# Instalar solo dependencias de producción
pnpm install --prod
```

### Agregar Paquetes

```bash
# Agregar dependencia de producción
pnpm add react-navigation
pnpm add lodash axios

# Agregar múltiples paquetes a la vez
pnpm add react-navigation react-native-screens

# Agregar versión específica
pnpm add react@18.2.0

# Agregar dependencia de desarrollo (-D)
pnpm add -D typescript @types/react
pnpm add --save-dev prettier eslint

# Agregar dependencia global (-g)
pnpm add -g expo-cli
pnpm add --global typescript

# Agregar dependencia opcional (-O)
pnpm add -O fsevents
```

### Remover Paquetes

```bash
# Remover dependencia
pnpm remove lodash
# Alias: pnpm rm, pnpm uninstall

# Remover múltiples paquetes
pnpm remove lodash axios moment

# Remover paquete global
pnpm remove -g expo-cli
```

### Actualizar Paquetes

```bash
# Actualizar todas las dependencias
pnpm update
# Alias: pnpm up

# Actualizar paquete específico
pnpm update react-navigation

# Actualizar a última versión (ignorar semver)
pnpm update --latest react
# Alias: pnpm up -L react

# Ver paquetes desactualizados
pnpm outdated
```

---

## 🔧 Comandos de Proyecto

### Ejecutar Scripts

```bash
# Ejecutar script definido en package.json
pnpm start
pnpm dev
pnpm build
pnpm test

# Listar todos los scripts disponibles
pnpm run

# Ejecutar script con argumentos
pnpm start -- --reset-cache
```

### Ejecutar Binarios (pnpx)

```bash
# Ejecutar binario local (como npx)
pnpx expo start
pnpx react-native run-android

# Ejecutar paquete sin instalarlo
pnpx create-expo-app my-app
pnpx prettier --write .

# Ejecutar versión específica
pnpx create-expo-app@latest my-app
```

---

## 📦 Gestión de Paquetes

### Información de Paquetes

```bash
# Ver info del paquete
pnpm view react

# Ver todas las versiones disponibles
pnpm view react versions

# Ver último tag
pnpm view react dist-tags

# Listar dependencias instaladas
pnpm list
# Alias: pnpm ls

# Listar en formato árbol
pnpm list --depth=2

# Listar solo producción
pnpm list --prod

# Listar globales
pnpm list -g
```

### Buscar Paquetes

```bash
# Buscar paquete en npm registry
pnpm search react-navigation
```

---

## 🧹 Limpieza y Mantenimiento

### Limpiar Caché

```bash
# Ver estadísticas del store
pnpm store status

# Limpiar paquetes no referenciados
pnpm store prune

# Ver ruta del store
pnpm store path
```

### Reinstalar Limpio

```bash
# Eliminar node_modules y reinstalar
rm -rf node_modules pnpm-lock.yaml
pnpm install

# O usar script helper
pnpm clean-install
```

---

## 🔍 Diagnóstico y Debugging

### Verificar Instalación

```bash
# Verificar versión de pnpm
pnpm --version
pnpm -v

# Ver configuración
pnpm config list

# Ver configuración específica
pnpm config get registry

# Ver ayuda
pnpm help
pnpm help install
```

### Logs y Debugging

```bash
# Ejecutar con logs verbosos
pnpm install --loglevel debug

# Ver último log de error
cat ~/.pnpm-state/pnpm-errors.log
```

---

## ⚙️ Configuración

### Configurar Registry

```bash
# Ver registry actual
pnpm config get registry

# Cambiar registry
pnpm config set registry https://registry.npmjs.org/

# Configurar registry empresarial
pnpm config set registry https://npm.empresa.com/
```

### Configuraciones Útiles

```bash
# Configurar store global
pnpm config set store-dir /path/to/store

# Deshabilitar verificación SSL (solo desarrollo)
pnpm config set strict-ssl false

# Configurar proxy
pnpm config set proxy http://proxy.empresa.com:8080
pnpm config set https-proxy http://proxy.empresa.com:8080
```

---

## 📁 Archivos de Configuración

### .npmrc (Raíz del Proyecto)

```ini
# Usar shamefully-hoist para compatibilidad con React Native
shamefully-hoist=true

# Store personalizado
store-dir=/path/to/store

# Auto-instalar peers
auto-install-peers=true

# Lockfile estricto
lockfile=true

# Solo permitir pnpm
engine-strict=true
```

### package.json

```json
{
  "name": "mi-app",
  "engines": {
    "node": ">=18.0.0",
    "pnpm": ">=8.0.0"
  },
  "packageManager": "pnpm@8.15.0",
  "scripts": {
    "preinstall": "npx only-allow pnpm",
    "start": "expo start",
    "clean": "rm -rf node_modules pnpm-lock.yaml && pnpm install"
  }
}
```

---

## 🚀 Comandos Comunes en React Native

### Setup Inicial de Proyecto

```bash
# Crear proyecto Expo con pnpm
pnpx create-expo-app my-app
cd my-app

# Instalar dependencias
pnpm install

# Iniciar desarrollo
pnpm start
```

### Instalar React Navigation

```bash
# Stack Navigator
pnpm add @react-navigation/native
pnpm add @react-navigation/native-stack
pnpm add react-native-screens react-native-safe-area-context

# Tab Navigator
pnpm add @react-navigation/bottom-tabs

# Drawer Navigator
pnpm add @react-navigation/drawer
pnpm add react-native-gesture-handler react-native-reanimated
```

### Instalar Librerías Comunes

```bash
# Axios para APIs
pnpm add axios

# AsyncStorage
pnpm add @react-native-async-storage/async-storage

# Expo Icons
pnpm add @expo/vector-icons

# Formularios
pnpm add react-hook-form
pnpm add zod  # Validación

# State Management
pnpm add zustand  # O redux toolkit
```

### Herramientas de Desarrollo

```bash
# TypeScript
pnpm add -D typescript @types/react @types/react-native

# Linting y Formateo
pnpm add -D eslint prettier
pnpm add -D @typescript-eslint/parser @typescript-eslint/eslint-plugin

# Testing
pnpm add -D jest @testing-library/react-native
```

---

## 💡 Tips y Trucos

### Aliases Útiles

Agregar a tu `~/.zshrc` o `~/.bashrc`:

```bash
# pnpm aliases
alias pi="pnpm install"
alias pa="pnpm add"
alias pr="pnpm remove"
alias pu="pnpm update"
alias pls="pnpm list"
alias ps="pnpm start"
alias pd="pnpm dev"
alias pb="pnpm build"
alias pt="pnpm test"
alias px="pnpx"

# React Native específicos
alias pnstart="pnpm start"
alias pnios="pnpm ios"
alias pnandroid="pnpm android"
alias pnclean="rm -rf node_modules pnpm-lock.yaml && pnpm install"
```

### Scripts de package.json Útiles

```json
{
  "scripts": {
    "start": "expo start",
    "android": "expo start --android",
    "ios": "expo start --ios",
    "web": "expo start --web",

    "clean": "rm -rf node_modules pnpm-lock.yaml",
    "reinstall": "pnpm clean && pnpm install",
    "fresh": "pnpm clean && pnpm store prune && pnpm install",

    "check": "pnpm outdated",
    "update:all": "pnpm update --latest",

    "preinstall": "npx only-allow pnpm",
    "postinstall": "pnpm check"
  }
}
```

---

## 🔄 Migración de npm a pnpm

### Paso a Paso

```bash
# 1. Eliminar archivos de npm
rm -rf node_modules package-lock.json

# 2. Instalar con pnpm
pnpm install

# 3. Verificar que funciona
pnpm start

# 4. Actualizar scripts si es necesario
# Cambiar "npm run" por "pnpm" en package.json

# 5. Agregar .npmrc si necesario
echo "shamefully-hoist=true" > .npmrc

# 6. Commit
git add pnpm-lock.yaml .npmrc
git rm package-lock.json
git commit -m "Migrar de npm a pnpm"
```

---

## ⚠️ Problemas Comunes

### Error: "Cannot find module"

```bash
# Solución: Reinstalar con hoist
echo "shamefully-hoist=true" > .npmrc
rm -rf node_modules
pnpm install
```

### Error: "Peer dependencies"

```bash
# Instalar peers automáticamente
pnpm config set auto-install-peers true
pnpm install
```

### Caché corrupto

```bash
# Limpiar y reinstalar
pnpm store prune
rm -rf node_modules pnpm-lock.yaml
pnpm install
```

### Lockfile desactualizado

```bash
# Actualizar lockfile
pnpm install --no-frozen-lockfile
```

---

## 📊 Comparación con npm/yarn

| Comando          | npm                    | yarn                 | pnpm                 |
| ---------------- | ---------------------- | -------------------- | -------------------- |
| Instalar         | `npm install`          | `yarn`               | `pnpm install`       |
| Agregar          | `npm install lodash`   | `yarn add lodash`    | `pnpm add lodash`    |
| Agregar dev      | `npm install -D jest`  | `yarn add -D jest`   | `pnpm add -D jest`   |
| Remover          | `npm uninstall lodash` | `yarn remove lodash` | `pnpm remove lodash` |
| Actualizar       | `npm update`           | `yarn upgrade`       | `pnpm update`        |
| Ejecutar script  | `npm run dev`          | `yarn dev`           | `pnpm dev`           |
| Ejecutar binario | `npx expo`             | `yarn expo`          | `pnpx expo`          |
| Global           | `npm install -g`       | `yarn global add`    | `pnpm add -g`        |
| Listar           | `npm list`             | `yarn list`          | `pnpm list`          |
| Limpiar caché    | `npm cache clean`      | `yarn cache clean`   | `pnpm store prune`   |

---

## 🎯 Comandos del Día a Día

```bash
# Iniciar nuevo proyecto
pnpx create-expo-app my-app && cd my-app

# Instalar dependencias
pnpm install

# Agregar librería
pnpm add react-navigation

# Iniciar desarrollo
pnpm start

# Limpiar y reinstalar (cuando hay problemas)
rm -rf node_modules pnpm-lock.yaml && pnpm install

# Ver qué está desactualizado
pnpm outdated

# Actualizar todo
pnpm update --latest
```

---

## 📚 Recursos

- [Documentación oficial pnpm](https://pnpm.io/)
- [pnpm CLI Reference](https://pnpm.io/cli/install)
- [pnpm vs npm Benchmark](https://pnpm.io/benchmarks)
- [Motivación y Comparación](https://pnpm.io/motivation)
- [¿Por qué pnpm?](./por-que-pnpm.md)

---

## ✅ Checklist de Comandos Memorizados

Comandos que deberías saber de memoria:

- [ ] `pnpm install` - Instalar dependencias
- [ ] `pnpm add <paquete>` - Agregar paquete
- [ ] `pnpm add -D <paquete>` - Agregar dev dependency
- [ ] `pnpm remove <paquete>` - Remover paquete
- [ ] `pnpm start` - Iniciar desarrollo
- [ ] `pnpx <comando>` - Ejecutar binario
- [ ] `pnpm update` - Actualizar paquetes
- [ ] `pnpm outdated` - Ver desactualizados
- [ ] `pnpm store prune` - Limpiar caché
- [ ] `pnpm list` - Ver dependencias

---

**Siguiente:** [¿Por qué pnpm?](./por-que-pnpm.md)

---

_Bootcamp React Native 2025_  
_Última actualización: Octubre 2025_
