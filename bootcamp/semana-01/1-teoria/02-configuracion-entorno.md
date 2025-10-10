# 2. Configuración del Entorno de Desarrollo

**Duración:** 1 hora  
**Nivel:** Fundamentos  
**Pre-requisitos:** Conocimientos básicos de terminal/CLI

---

## 🎯 Objetivos de Aprendizaje

Al completar este tema, serás capaz de:

- ✅ Instalar Node.js y pnpm correctamente
- ✅ Configurar Expo CLI y crear proyectos
- ✅ Configurar VS Code con extensiones esenciales
- ✅ Instalar y usar Expo Go en tu dispositivo
- ✅ Configurar NativeWind (TailwindCSS) en React Native
- ✅ Ejecutar tu primera aplicación React Native
- ✅ Entender la estructura de un proyecto Expo
- ✅ Realizar debugging básico

---

## 📋 Requisitos del Sistema

### Hardware Mínimo

**Computadora:**

- **CPU:** Intel Core i5 o equivalente (64-bit)
- **RAM:** 8 GB mínimo (16 GB recomendado)
- **Disco:** 10 GB espacio libre
- **OS:** Windows 10+, macOS 10.15+, Ubuntu 20.04+

**Dispositivo Móvil:**

- **iOS:** iPhone con iOS 13+ (para testing)
- **Android:** Dispositivo con Android 8.0+ (para testing)
- O usar emuladores (requiere más recursos)

### Conexiones

- ✅ Internet estable (para descargas)
- ✅ Dispositivo móvil y PC en la misma red WiFi (para Expo Go)

---

## 1️⃣ Instalación de Node.js y pnpm

### ¿Por qué Node.js y pnpm?

**Node.js:**

- **¿Qué?** Runtime de JavaScript fuera del navegador
- **¿Para qué?** Ejecutar herramientas de desarrollo y Metro bundler
- **¿Impacto?** Base para todo el ecosistema de React Native

**pnpm:**

- **¿Qué?** Gestor de paquetes rápido y eficiente
- **¿Para qué?** Instalar y gestionar dependencias
- **¿Impacto?** Ahorra espacio en disco (~70%) y es más rápido que npm

### Instalación de Node.js

#### Opción 1: Descarga Directa (Recomendado para principiantes)

1. **Visita:** https://nodejs.org/
2. **Descarga:** Versión LTS (Long Term Support)
3. **Instala:** Sigue el instalador
4. **Verifica:**

```bash
# Verificar instalación de Node.js
node --version
# Debe mostrar: v20.x.x o v18.x.x

# Verificar npm (viene incluido)
npm --version
# Debe mostrar: 10.x.x o 9.x.x
```

#### Opción 2: Node Version Manager (Recomendado para profesionales)

**Para macOS/Linux (nvm):**

```bash
# Instalar nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Reiniciar terminal, luego:
nvm install 20
nvm use 20
nvm alias default 20
```

**Para Windows (nvm-windows):**

```bash
# Descargar de: https://github.com/coreybutler/nvm-windows/releases
# Instalar y luego en PowerShell:
nvm install 20
nvm use 20
```

### Instalación de pnpm

```bash
# Instalar pnpm globalmente
npm install -g pnpm

# Verificar instalación
pnpm --version
# Debe mostrar: 9.x.x

# Configurar pnpm (opcional pero recomendado)
pnpm config set store-dir ~/.pnpm-store
```

**¿Por qué pnpm en este bootcamp?**

- ✅ 3x más rápido que npm
- ✅ Ahorra ~70% de espacio en disco
- ✅ Instalaciones más consistentes
- ✅ Soporte para monorepos
- ✅ Compatible con npm (mismo package.json)

---

## 2️⃣ Instalación de Expo CLI

### ¿Qué es Expo?

**Expo:**

- **¿Qué?** Plataforma y conjunto de herramientas para React Native
- **¿Para qué?** Simplificar el desarrollo móvil sin configuración nativa
- **¿Impacto?** Desarrollo más rápido y fácil sin Xcode/Android Studio

### Instalación

```bash
# Instalar Expo CLI globalmente
pnpm add -g expo-cli

# Verificar instalación
npx expo --version
# Debe mostrar: 51.x.x o superior

# También instalar EAS CLI (para builds)
pnpm add -g eas-cli

# Verificar EAS
eas --version
```

### Crear cuenta de Expo (Opcional pero recomendado)

```bash
# Registrarse en Expo
npx expo register

# O login si ya tienes cuenta
npx expo login
```

**Beneficios de tener cuenta:**

- ✅ Publicar apps en Expo Go
- ✅ Usar EAS Build y EAS Update
- ✅ Colaborar con equipos
- ✅ Analytics y error tracking

---

## 3️⃣ Configuración de VS Code

### Instalación de VS Code

1. **Descargar:** https://code.visualstudio.com/
2. **Instalar:** Sigue el instalador
3. **Abrir:** Visual Studio Code

### Extensiones Esenciales

#### Obligatorias:

```bash
# Abrir VS Code y presionar Ctrl+Shift+X (Cmd+Shift+X en Mac)
# Buscar e instalar las siguientes extensiones:
```

1. **ES7+ React/Redux/React-Native snippets**

   - **ID:** `dsznajder.es7-react-js-snippets`
   - **¿Para qué?** Snippets de código para React Native
   - **Ejemplo:** `rnfe` → genera componente funcional

2. **React Native Tools**

   - **ID:** `msjsdiag.vscode-react-native`
   - **¿Para qué?** Debugging, IntelliSense, comandos
   - **Ejemplo:** Debugger integrado para React Native

3. **Prettier - Code formatter**

   - **ID:** `esbenp.prettier-vscode`
   - **¿Para qué?** Formateo automático de código
   - **Ejemplo:** Auto-formatear al guardar

4. **ESLint**

   - **ID:** `dbaeumer.vscode-eslint`
   - **¿Para qué?** Detectar errores y problemas de código
   - **Ejemplo:** Advertencias en tiempo real

5. **TypeScript and JavaScript Language Features**

   - **Incluido:** Ya viene con VS Code
   - **¿Para qué?** Soporte para TypeScript
   - **Ejemplo:** IntelliSense y autocompletado

6. **Tailwind CSS IntelliSense**
   - **ID:** `bradlc.vscode-tailwindcss`
   - **¿Para qué?** Autocompletado de clases de Tailwind en className
   - **Ejemplo:** Sugerencias inteligentes de `bg-`, `text-`, `flex-`, etc.

#### Recomendadas:

7. **Auto Rename Tag**

   - **ID:** `formulahendry.auto-rename-tag`
   - **¿Para qué?** Renombrar tags JSX automáticamente

8. **Path Intellisense**

   - **ID:** `christian-kohler.path-intellisense`
   - **¿Para qué?** Autocompletado de rutas de archivos

9. **Material Icon Theme**

   - **ID:** `pkief.material-icon-theme`
   - **¿Para qué?** Iconos visuales para tipos de archivos

10. **GitLens**

- **ID:** `eamodio.gitlens`
- **¿Para qué?** Visualizar historial de Git

### Configuración de VS Code

Crear archivo de configuración en el proyecto:

```json
// .vscode/settings.json
{
  // Formateo automático
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",

  // TypeScript/JavaScript
  "typescript.tsdk": "node_modules/typescript/lib",
  "typescript.enablePromptUseWorkspaceTsdk": true,

  // React Native
  "reactNative.android.runArguments": {
    "type": "emulator",
    "id": "AVD_NAME"
  },

  // Prettier
  "prettier.semi": false,
  "prettier.singleQuote": true,
  "prettier.trailingComma": "es5",

  // ESLint
  "eslint.validate": [
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact"
  ],

  // Editor
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true
  },
  "editor.tabSize": 2,
  "files.eol": "\n"
}
```

---

## 4️⃣ Instalación de Expo Go

### En tu Dispositivo Móvil

**iOS (iPhone/iPad):**

1. Abrir **App Store**
2. Buscar **"Expo Go"**
3. Instalar la app
4. Abrir y crear cuenta (opcional)

**Android:**

1. Abrir **Google Play Store**
2. Buscar **"Expo Go"**
3. Instalar la app
4. Abrir y crear cuenta (opcional)

### ¿Qué es Expo Go?

**Expo Go:**

- **¿Qué?** App para ejecutar proyectos Expo en desarrollo
- **¿Para qué?** Testing rápido sin compilar builds nativos
- **¿Cómo funciona?** Escanea QR y descarga el bundle de JavaScript

**Ventajas:**

- ✅ Testing instantáneo
- ✅ Hot reload en dispositivo real
- ✅ No requiere Xcode ni Android Studio
- ✅ Testing con cámara, GPS, sensores reales

---

## 5️⃣ Crear tu Primer Proyecto

### Paso 1: Crear Proyecto con Expo

```bash
# Crear proyecto con TypeScript
npx create-expo-app@latest my-first-app --template blank-typescript

# Navegar al directorio
cd my-first-app

# Instalar dependencias (si no se instalaron automáticamente)
pnpm install
```

### Paso 2: Configurar NativeWind (TailwindCSS)

**¿Qué es NativeWind?**

- **¿Qué?** TailwindCSS para React Native
- **¿Para qué?** Estilos con clases utility-first
- **¿Impacto?** Desarrollo más rápido, estilos consistentes

**Instalación:**

```bash
# Instalar NativeWind y dependencias
pnpm add nativewind
pnpm add -D tailwindcss

# Inicializar Tailwind
npx tailwindcss init
```

**Configurar tailwind.config.js:**

```javascript
/** @type {import('tailwindcss').Config} */
module.exports = {
  // Archivos a escanear para clases de Tailwind
  content: [
    './App.{js,jsx,ts,tsx}',
    './app/**/*.{js,jsx,ts,tsx}',
    './components/**/*.{js,jsx,ts,tsx}',
    './screens/**/*.{js,jsx,ts,tsx}',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
```

**Configurar babel.config.js:**

```javascript
module.exports = function (api) {
  api.cache(true)
  return {
    presets: ['babel-preset-expo'],
    plugins: ['nativewind/babel'],
  }
}
```

**Crear archivo global.css (opcional pero recomendado):**

```css
/* global.css */
@tailwind base;
@tailwind components;
@tailwind utilities;
```

**Configurar TypeScript para NativeWind:**

Crear archivo `nativewind-env.d.ts` en la raíz:

```typescript
/// <reference types="nativewind/types" />
```

### Paso 3: Estructura del Proyecto

```
my-first-app/
├── .expo/                  # Archivos de configuración de Expo (ignorado por Git)
├── assets/                 # Imágenes, fuentes, iconos
│   ├── adaptive-icon.png
│   ├── favicon.png
│   ├── icon.png
│   └── splash.png
├── node_modules/           # Dependencias (ignorado por Git)
├── .gitignore             # Archivos ignorados por Git
├── app.json               # Configuración de la app (nombre, versión, etc.)
├── App.tsx                # Componente principal (punto de entrada)
├── babel.config.js        # Configuración de Babel (con NativeWind)
├── global.css             # Estilos globales de Tailwind
├── nativewind-env.d.ts    # Tipos de TypeScript para NativeWind
├── package.json           # Dependencias y scripts
├── pnpm-lock.yaml         # Lock file de pnpm
├── tailwind.config.js     # Configuración de TailwindCSS
└── tsconfig.json          # Configuración de TypeScript
```

### Paso 4: Actualizar App.tsx con NativeWind

```tsx
// App.tsx - Componente principal con NativeWind
import { StatusBar } from 'expo-status-bar'
import { Text, View } from 'react-native'

/**
 * Componente App - Punto de entrada de la aplicación
 *
 * ¿Qué hace? Renderiza la pantalla principal con estilos de Tailwind
 * ¿Para qué? Iniciar la aplicación con NativeWind configurado
 * ¿Cómo? Usa className prop de NativeWind en lugar de style
 */
export default function App(): JSX.Element {
  return (
    <View className="flex-1 bg-white items-center justify-center">
      <Text className="text-2xl font-bold">
        Open up App.tsx to start working on your app!
      </Text>
      <StatusBar style="auto" />
    </View>
  )
}
```

**Observa:**

- ✅ No hay `StyleSheet.create()` - Usamos clases de Tailwind
- ✅ `className` en lugar de `style`
- ✅ Clases familiares: `flex-1`, `bg-white`, `items-center`, `text-2xl`

### Paso 5: Ejecutar el Proyecto

      <StatusBar style="auto" />

**Observa:**

- ✅ No hay `StyleSheet.create()` - Usamos clases de Tailwind
- ✅ `className` en lugar de `style`
- ✅ Clases familiares: `flex-1`, `bg-white`, `items-center`, `text-2xl`

### Paso 5: Ejecutar el Proyecto

```bash
# Iniciar el servidor de desarrollo
pnpm start

# O usar comandos específicos:
pnpm run android    # Abrir en emulador Android
pnpm run ios        # Abrir en simulador iOS (solo macOS)
pnpm run web        # Abrir en navegador web
```

### Paso 6: Conectar con Expo Go

1. **En la terminal**, verás un QR code
2. **En tu teléfono:**
   - **iOS:** Abrir Cámara y escanear el QR
   - **Android:** Abrir Expo Go y escanear el QR
3. **Espera** mientras se descarga el bundle
4. **¡Listo!** Tu app está corriendo

### Paso 7: Hacer tu Primer Cambio con Tailwind

Edita `App.tsx`:

```tsx
import { StatusBar } from 'expo-status-bar'
import { Text, View } from 'react-native'

export default function App(): JSX.Element {
  return (
    <View className="flex-1 bg-blue-50 items-center justify-center p-5">
      <Text className="text-3xl font-bold text-gray-800 mb-2">
        ¡Mi Primera App! 🚀
      </Text>
      <Text className="text-base text-gray-600">
        Hecha con React Native + Expo + TailwindCSS
      </Text>
      <StatusBar style="auto" />
    </View>
  )
}
```

**Ventajas de TailwindCSS:**

- ✅ Estilos más rápidos con clases utility
- ✅ No necesitas StyleSheet.create()
- ✅ Consistencia de diseño
- ✅ Responsive design más fácil
- ✅ Famil iar si conoces Tailwind Web

**Observa:** Los cambios se reflejan automáticamente en tu dispositivo (Hot Reload) 🔥

---

## 6️⃣ Debugging Básico

### Herramientas de Desarrollo

#### 1. **Developer Menu**

**Abrir en dispositivo:**

- **iOS:** Shake (sacudir) el dispositivo
- **Android:** Shake o Ctrl+M (emulador)

**Opciones disponibles:**

- Reload → Recargar app
- Debug → Abrir debugger
- Show Perf Monitor → Monitor de performance
- Toggle Inspector → Inspeccionar elementos

#### 2. **Console Logs**

```tsx
import { useEffect } from 'react'

export default function App(): JSX.Element {
  useEffect(() => {
    console.log('✅ App iniciada')
    console.warn('⚠️ Advertencia de ejemplo')
    console.error('❌ Error de ejemplo')
  }, [])

  return (
    <View style={styles.container}>
      <Text>Revisa la terminal para ver los logs</Text>
    </View>
  )
}
```

**Ver logs:**

- Terminal donde ejecutaste `pnpm start`
- O usar React Native Debugger

#### 3. **React DevTools**

```bash
# Instalar React DevTools
pnpm add -g react-devtools

# Ejecutar en una terminal separada
react-devtools
```

**Funcionalidades:**

- Inspeccionar árbol de componentes
- Ver props y state
- Editar props en tiempo real
- Performance profiling

#### 4. **Errores Comunes y Soluciones**

**Error: "Unable to resolve module"**

```bash
# Solución: Limpiar cache y reinstalar
pnpm start --clear
rm -rf node_modules
pnpm install
```

**Error: "Metro bundler crashed"**

```bash
# Solución: Reiniciar servidor
# Ctrl+C para detener
pnpm start --reset-cache
```

**Error: "Device not connecting"**

```bash
# Solución: Verificar que estén en la misma red WiFi
# O usar tunnel:
pnpm start --tunnel
```

---

## 📱 Emuladores y Simuladores (Opcional)

### Android Emulator (Todas las plataformas)

**Requisitos:**

- Android Studio instalado
- Intel HAXM o AMD Virtualization habilitado

**Setup:**

1. Instalar Android Studio
2. Abrir AVD Manager
3. Crear Virtual Device
4. Ejecutar: `pnpm run android`

### iOS Simulator (Solo macOS)

**Requisitos:**

- macOS 10.15+
- Xcode instalado desde App Store

**Setup:**

1. Instalar Xcode (15+ GB)
2. Ejecutar: `pnpm run ios`
3. Seleccionar simulador

**Nota:** Los simuladores consumen muchos recursos. Para aprendizaje inicial, Expo Go en dispositivo físico es más eficiente.

---

## ✅ Checklist de Configuración

Verifica que tengas todo configurado:

- [ ] Node.js v18+ instalado (`node --version`)
- [ ] pnpm instalado (`pnpm --version`)
- [ ] Expo CLI funcionando (`npx expo --version`)
- [ ] VS Code instalado y configurado
- [ ] Extensiones esenciales instaladas (incluyendo Tailwind CSS IntelliSense)
- [ ] Expo Go instalado en tu dispositivo móvil
- [ ] NativeWind (TailwindCSS) configurado correctamente
- [ ] Primer proyecto creado y ejecutándose
- [ ] Hot reload funcionando
- [ ] Puedes ver console.log en la terminal
- [ ] className de Tailwind funciona correctamente

---

## 💡 Tips y Mejores Prácticas

### Organización del Proyecto

```tsx
// Usar TypeScript para todo
// ✅ BIEN
export default function MyComponent(): JSX.Element {
  // ...
}

// ❌ MAL (JavaScript sin tipos)
export default function MyComponent() {
  // ...
}
```

### Nombres de Archivos

- Componentes: `PascalCase.tsx` (ej: `UserProfile.tsx`)
- Utils: `camelCase.ts` (ej: `formatDate.ts`)
- Constantes: `UPPER_CASE.ts` (ej: `API_CONFIG.ts`)

### Imports Organizados

```tsx
// 1. React y librerías de React
import React, { useState, useEffect } from 'react'

// 2. React Native
import { View, Text, StyleSheet } from 'react-native'

// 3. Librerías externas
import axios from 'axios'

// 4. Componentes locales
import Header from './components/Header'

// 5. Utils y helpers
import { formatDate } from './utils/date'

// 6. Tipos
import type { User } from './types/User'
```

---

## 🆘 Troubleshooting

### Problemas Comunes

**1. "Command not found: pnpm"**

```bash
# Reinstalar pnpm
npm install -g pnpm
# Reiniciar terminal
```

**2. "Unable to start server"**

```bash
# Verificar puerto 19000 libre
lsof -i :19000
# Matar proceso si es necesario
kill -9 <PID>
```

**3. "Module not found"**

```bash
# Limpiar e reinstalar
rm -rf node_modules pnpm-lock.yaml
pnpm install
pnpm start --clear
```

**4. "TypeScript errors"**

```bash
# Verificar tsconfig.json existe
# Reinstalar tipos:
pnpm add -D @types/react @types/react-native
```

**5. "NativeWind classes not working"**

```bash
# Asegurarse de tener configurado babel
# Verificar que babel.config.js tenga el plugin de nativewind
# Limpiar cache:
pnpm start --clear
```

**6. "className prop not recognized"**

```bash
# Verificar que nativewind-env.d.ts existe
# Reiniciar TypeScript server en VS Code:
# Cmd+Shift+P -> TypeScript: Restart TS Server
```

---

## 📚 Recursos Adicionales

### Documentación Oficial

- [Expo Documentation](https://docs.expo.dev/)
- [React Native Setup](https://reactnative.dev/docs/environment-setup)
- [NativeWind Documentation](https://www.nativewind.dev/)
- [TailwindCSS Documentation](https://tailwindcss.com/docs)
- [pnpm Documentation](https://pnpm.io/)
- [VS Code for React Native](https://code.visualstudio.com/docs/nodejs/reactnative-tutorial)

### Videos Recomendados

- [Setup Expo in 5 Minutes](https://www.youtube.com/watch?v=0-S5a0eXPoc)
- [VS Code Setup for React Native](https://www.youtube.com/watch?v=vr0qNaHhBqg)

### Herramientas Online

- [Expo Snack](https://snack.expo.dev/) - Editor online de React Native
- [React Native Directory](https://reactnative.directory/) - Librerías compatibles

---

## 💡 Ejercicios de Práctica

### 1. Personaliza tu App con Tailwind

Modifica `App.tsx` para:

- Cambiar colores usando clases de Tailwind (`bg-purple-500`, `text-white`)
- Agregar tu nombre con estilo bold
- Añadir un emoji y centrado

Ejemplo:

```tsx
<View className="flex-1 bg-gradient-to-br from-purple-500 to-pink-500 items-center justify-center">
  <Text className="text-4xl font-bold text-white">👋 Hola, [Tu Nombre]!</Text>
</View>
```

### 2. Explora el Developer Menu

- Abre el developer menu
- Prueba "Toggle Inspector"
- Observa el Perf Monitor

### 3. Prueba diferentes clases de Tailwind

Experimenta con:

```tsx
<View className="flex-1 bg-blue-100 p-4">
  <Text className="text-xl font-bold text-blue-900">Bold Text</Text>
  <Text className="text-base text-blue-700 mt-2">Normal Text</Text>
  <Text className="text-sm text-blue-500 italic">Italic Text</Text>
</View>
```

### 3. Experimenta con Logs

Agrega diferentes tipos de logs:

```tsx
console.log('Info normal')
console.warn('Advertencia')
console.error('Error')
console.info('Información adicional')
```

---

**Próximo tema:** [3. Componentes Básicos →](./03-componentes-basicos.md)

---

_Tiempo estimado: 1 hora | Actualizado: Octubre 2025_
