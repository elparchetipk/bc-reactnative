# 02. Setup y Componentes Básicos

**Duración:** 2.5 horas (PRESENCIAL)  
**Modalidad:** Hands-on (hacer juntos)  
**Objetivo:** Configurar entorno, crear primer proyecto y conocer componentes básicos

---

## 🎯 Objetivos de Aprendizaje

Al finalizar este módulo presencial, serás capaz de:

- ✅ Configurar un entorno de desarrollo completo
- ✅ Crear y ejecutar un proyecto Expo
- ✅ Usar los 7 componentes básicos de React Native
- ✅ Aplicar estilos con TailwindCSS (NativeWind)
- ✅ Crear layouts básicos con Flexbox

---

## PARTE 1: Configuración del Entorno (60 minutos)

### 📋 Prerequisitos

Antes de comenzar, necesitas tener instalado:

**Obligatorio:**

- ✅ **Node.js 22.20+** (nunca menor) - [Descargar](https://nodejs.org/)
- ✅ **pnpm 9.x** - Gestor de paquetes
- ✅ **VS Code** - Editor de código
- ✅ **Git** - Control de versiones

**En tu dispositivo móvil:**

- ✅ **Expo Go** - App para ver tu proyecto en el celular
  - [iOS App Store](https://apps.apple.com/app/expo-go/id982107779)
  - [Android Play Store](https://play.google.com/store/apps/details?id=host.exp.exponent)

---

### Paso 1: Verificar Instalaciones (10 min)

Abre la terminal y verifica las versiones:

```bash
# Verificar Node.js (debe ser 22.20 o superior)
node --version
# Resultado esperado: v22.20.0 o mayor

# Verificar pnpm
pnpm --version
# Resultado esperado: 9.x.x

# Si no tienes pnpm instalado:
npm install -g pnpm

# Verificar Git
git --version
```

**⚠️ IMPORTANTE:** Si Node.js es menor a 22.20, actualiza AHORA:

```bash
# Descargar e instalar desde: https://nodejs.org/
# O usar nvm (Node Version Manager):
nvm install 22
nvm use 22
```

---

### Paso 2: Configurar VS Code (10 min)

#### Extensiones Obligatorias

Instala estas extensiones en VS Code:

1. **ES7+ React/Redux/React-Native snippets**

   - ID: `dsznajder.es7-react-js-snippets`
   - Para: Snippets de React Native

2. **Prettier - Code formatter**

   - ID: `esbenp.prettier-vscode`
   - Para: Formateo automático

3. **ESLint**

   - ID: `dbaeumer.vscode-eslint`
   - Para: Detectar errores

4. **Tailwind CSS IntelliSense**

   - ID: `bradlc.vscode-tailwindcss`
   - Para: Autocompletado de Tailwind

5. **React Native Tools**
   - ID: `msjsdiag.vscode-react-native`
   - Para: Debugging

**Instalar desde terminal:**

```bash
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension esbenp.prettier-vscode
code --install-extension dbaeumer.vscode-eslint
code --install-extension bradlc.vscode-tailwindcss
code --install-extension msjsdiag.vscode-react-native
```

#### Configuración de VS Code

Crear archivo `.vscode/settings.json` en la raíz de tus proyectos:

```json
{
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": "explicit"
  },
  "tailwindCSS.experimental.classRegex": [
    ["className\\s*=\\s*['\"]([^'\"]*)['\"]"]
  ]
}
```

---

### Paso 3: Crear Primer Proyecto (20 min)

#### 3.1 Crear Proyecto con Expo

```bash
# Crear proyecto (TODOS JUNTOS en clase)
npx create-expo-app@latest mi-primera-app --template blank-typescript

# Entrar al directorio
cd mi-primera-app

# Ver estructura de archivos
ls -la
```

**Estructura del proyecto:**

```
mi-primera-app/
├── app/                # Carpeta principal (Expo Router)
├── assets/             # Imágenes, fuentes, etc.
├── node_modules/       # Dependencias (NO tocar)
├── .gitignore          # Archivos ignorados por Git
├── app.json            # Configuración de Expo
├── package.json        # Dependencias del proyecto
├── tsconfig.json       # Configuración de TypeScript
└── README.md           # Documentación
```

#### 3.2 Instalar Dependencias Adicionales

```bash
# Instalar NativeWind (TailwindCSS para React Native)
pnpm add nativewind
pnpm add -D tailwindcss

# Inicializar Tailwind
npx tailwindcss init
```

#### 3.3 Configurar NativeWind

**Editar `tailwind.config.js`:**

```js
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './App.{js,jsx,ts,tsx}',
    './app/**/*.{js,jsx,ts,tsx}',
    './components/**/*.{js,jsx,ts,tsx}',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
```

**Editar `babel.config.js`:**

```js
module.exports = function (api) {
  api.cache(true)
  return {
    presets: ['babel-preset-expo'],
    plugins: ['nativewind/babel'],
  }
}
```

**Crear `nativewind-env.d.ts` en la raíz:**

```typescript
/// <reference types="nativewind/types" />
```

#### 3.4 Ejecutar el Proyecto

```bash
# Iniciar servidor de desarrollo
pnpm start

# Opciones disponibles:
# - Presiona 'a' para abrir en Android
# - Presiona 'i' para abrir en iOS
# - Escanea el QR con Expo Go en tu celular
```

**🎯 TODOS en clase:** Escanear QR y ver la app en sus celulares.

---

### Paso 4: Primer Código - "Hola Mundo" (20 min)

**Editar `App.tsx`:**

```tsx
import { View, Text } from 'react-native'

export default function App() {
  return (
    <View className="flex-1 items-center justify-center bg-blue-500">
      <Text className="text-white text-4xl font-bold">¡Hola Mundo!</Text>
      <Text className="text-white text-lg mt-4">
        Mi primera app con React Native
      </Text>
    </View>
  )
}
```

**Guardar el archivo y ver cambios instantáneos en el celular (Fast Refresh).**

---

## PARTE 2: Componentes Básicos (90 minutos)

### 📦 Los 7 Componentes Fundamentales

React Native tiene componentes nativos que se mapean directamente a componentes del sistema operativo:

| Componente React Native | iOS          | Android    |
| ----------------------- | ------------ | ---------- |
| `<View>`                | UIView       | ViewGroup  |
| `<Text>`                | UILabel      | TextView   |
| `<Image>`               | UIImageView  | ImageView  |
| `<ScrollView>`          | UIScrollView | ScrollView |
| `<TextInput>`           | UITextField  | EditText   |

---

### 1. View - El Contenedor Universal

**¿Qué hace?**
`View` es el bloque de construcción más básico. Es como un `<div>` en HTML.

**¿Para qué sirve?**

- Contenedor para otros componentes
- Aplicar estilos y layouts
- Agrupar elementos relacionados

**Ejemplo en vivo:**

```tsx
import { View } from 'react-native'

// View básico
<View className="bg-red-500 p-5">
  {/* Contenido aquí */}
</View>

// View con estilos inline (también funciona)
<View style={{ backgroundColor: 'blue', padding: 20 }}>
  {/* Contenido */}
</View>

// Anidación de Views
<View className="flex-1 bg-gray-100">
  <View className="bg-white p-4 m-3 rounded-lg">
    <View className="h-20 bg-blue-500 rounded"></View>
  </View>
</View>
```

**Props importantes:**

- `className` / `style` - Estilos
- `onLayout` - Detectar cambios de tamaño
- `pointerEvents` - Controlar eventos táctiles

---

### 2. Text - Para Mostrar Texto

**¿Qué hace?**
`Text` muestra texto. TODO el texto debe estar dentro de un componente `<Text>`.

**❌ ESTO NO FUNCIONA:**

```tsx
<View>
  Hola Mundo{' '}
  {/* ERROR: Text strings must be rendered within a <Text> component */}
</View>
```

**✅ ESTO SÍ:**

```tsx
<View>
  <Text>Hola Mundo</Text>
</View>
```

**Ejemplo en vivo:**

```tsx
import { Text } from 'react-native'

// Estilos con Tailwind
<Text className="text-2xl font-bold text-blue-600">
  Título Grande
</Text>

<Text className="text-base text-gray-700">
  Texto normal de contenido
</Text>

<Text className="text-sm text-gray-500 italic">
  Texto pequeño en cursiva
</Text>

// Text anidado (hereda estilos)
<Text className="text-lg font-bold">
  Esto es <Text className="text-red-500">rojo</Text> y esto es normal
</Text>

// Número de líneas limitado
<Text numberOfLines={2} className="text-base">
  Este es un texto muy largo que se cortará después de 2 líneas...
</Text>
```

**Props importantes:**

- `numberOfLines` - Limitar líneas de texto
- `ellipsizeMode` - Cómo mostrar "..." (tail, head, middle)
- `onPress` - Hacer texto clickeable
- `selectable` - Permitir seleccionar/copiar texto

---

### 3. Image - Para Mostrar Imágenes

**¿Qué hace?**
`Image` muestra imágenes de diferentes fuentes.

**Tipos de imágenes:**

1. **Red (URL):** `{ uri: 'https://...' }`
2. **Local:** `require('./imagen.png')`
3. **Base64:** `{ uri: 'data:image/png;base64,...' }`

**Ejemplo en vivo:**

```tsx
import { Image } from 'react-native'

// Imagen desde URL
<Image
  source={{ uri: 'https://picsum.photos/300/200' }}
  className="w-full h-48 rounded-lg"
  resizeMode="cover"
/>

// Imagen local
<Image
  source={require('./assets/logo.png')}
  className="w-32 h-32"
/>

// Avatar circular
<Image
  source={{ uri: 'https://i.pravatar.cc/150' }}
  className="w-20 h-20 rounded-full"
/>
```

**Props importantes:**

- `source` - Fuente de la imagen (requerido)
- `resizeMode` - Cómo ajustar: `cover`, `contain`, `stretch`, `center`
- `className` / `style` - Dimensiones y estilos
- `onLoad` - Callback cuando carga
- `onError` - Callback si falla

---

### 4. ScrollView - Para Contenido Scrollable

**¿Qué hace?**
`ScrollView` permite hacer scroll cuando el contenido es más grande que la pantalla.

**¿Cuándo usar?**

- Formularios largos
- Contenido que puede exceder altura de pantalla
- Listas pequeñas (< 20 items)

**⚠️ Para listas largas (100+ items):** Usar `FlatList` (lo veremos en semana 2).

**Ejemplo en vivo:**

```tsx
import { ScrollView, View, Text } from 'react-native'

;<ScrollView className="flex-1 bg-gray-50">
  <View className="p-5">
    {/* Contenido largo */}
    {[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((item) => (
      <View key={item} className="bg-white p-5 mb-3 rounded-lg">
        <Text className="text-lg font-bold">Item {item}</Text>
        <Text className="text-gray-600">Descripción del item</Text>
      </View>
    ))}
  </View>
</ScrollView>
```

**Props importantes:**

- `horizontal` - Scroll horizontal en lugar de vertical
- `showsVerticalScrollIndicator` - Mostrar/ocultar barra de scroll
- `contentContainerStyle` - Estilos del contenido interno
- `refreshControl` - Pull-to-refresh
- `onScroll` - Detectar scroll

---

### 5. TextInput - Para Inputs de Texto

**¿Qué hace?**
`TextInput` permite al usuario ingresar texto.

**Ejemplo en vivo:**

```tsx
import { TextInput, View, Text } from 'react-native'
import { useState } from 'react'

export default function App() {
  const [text, setText] = useState('')

  return (
    <View className="flex-1 p-5 justify-center bg-white">
      <Text className="text-xl font-bold mb-3">Ingresa tu nombre:</Text>

      <TextInput
        value={text}
        onChangeText={setText}
        placeholder="Escribe aquí..."
        className="border border-gray-300 rounded-lg px-4 py-3 text-base"
      />

      <Text className="text-gray-600 mt-3">
        Escribiste: {text || '(vacío)'}
      </Text>
    </View>
  )
}
```

**Tipos de teclado:**

```tsx
// Teclado de email
<TextInput keyboardType="email-address" />

// Teclado numérico
<TextInput keyboardType="numeric" />

// Teclado de teléfono
<TextInput keyboardType="phone-pad" />

// Teclado de URL
<TextInput keyboardType="url" />

// Input de contraseña
<TextInput secureTextEntry />
```

**Props importantes:**

- `value` - Valor controlado
- `onChangeText` - Callback al cambiar texto
- `placeholder` - Texto de ayuda
- `keyboardType` - Tipo de teclado
- `secureTextEntry` - Ocultar texto (contraseñas)
- `multiline` - Permitir múltiples líneas
- `autoCapitalize` - Capitalización automática
- `autoCorrect` - Autocorrección

---

### 6. Button - Botón Básico

**¿Qué hace?**
`Button` es un botón simple nativo. **Muy limitado en personalización.**

**⚠️ En producción:** Mejor usar `TouchableOpacity` con estilos personalizados.

```tsx
import { Button, Alert } from 'react-native'

;<Button
  title="Presionar"
  onPress={() => Alert.alert('¡Botón presionado!')}
  color="#3b82f6"
/>
```

---

### 7. TouchableOpacity - Botón Personalizable

**¿Qué hace?**
`TouchableOpacity` hace que cualquier componente sea presionable con efecto de opacidad.

**¿Por qué usarlo?**

- Totalmente personalizable
- Efecto visual al presionar (baja opacidad)
- Puedes poner cualquier contenido dentro

**Ejemplo en vivo:**

```tsx
import { TouchableOpacity, Text, View } from 'react-native'

// Botón básico
<TouchableOpacity
  onPress={() => console.log('Presionado')}
  activeOpacity={0.7}
  className="bg-blue-600 px-6 py-3 rounded-lg"
>
  <Text className="text-white text-center font-bold">
    Presionar
  </Text>
</TouchableOpacity>

// Botón con icono y texto
<TouchableOpacity
  className="bg-green-500 px-6 py-4 rounded-full flex-row items-center"
  onPress={() => {}}
>
  <Text className="text-2xl mr-2">✓</Text>
  <Text className="text-white font-bold text-lg">Confirmar</Text>
</TouchableOpacity>

// Card presionable
<TouchableOpacity
  className="bg-white p-5 rounded-xl shadow-md m-3"
  onPress={() => {}}
>
  <Text className="text-xl font-bold mb-2">Título</Text>
  <Text className="text-gray-600">Descripción de la card</Text>
</TouchableOpacity>
```

---

## PARTE 3: Layouts con Flexbox (40 minutos)

### 🧩 Flexbox en React Native

**TODO en React Native usa Flexbox por defecto.**

No existe `display: block` ni `display: inline`. Solo `display: flex`.

#### Ejes en Flexbox

```
Eje Principal (Main Axis) - flex-direction
────────────────────────────>
│  ┌────┐  ┌────┐  ┌────┐
│  │ 1  │  │ 2  │  │ 3  │
↓  └────┘  └────┘  └────┘
Eje Cruzado (Cross Axis)
```

### Propiedades Básicas

#### 1. flex-direction (dirección del layout)

```tsx
// Vertical (por defecto en RN)
<View className="flex-col">
  <View className="h-20 bg-red-500" />
  <View className="h-20 bg-blue-500" />
  <View className="h-20 bg-green-500" />
</View>

// Horizontal
<View className="flex-row">
  <View className="w-20 h-20 bg-red-500" />
  <View className="w-20 h-20 bg-blue-500" />
  <View className="w-20 h-20 bg-green-500" />
</View>
```

#### 2. justify-content (alineación en eje principal)

```tsx
// Al inicio
<View className="flex-row justify-start">
  {/* Elementos al inicio (izquierda en row) */}
</View>

// Al centro
<View className="flex-row justify-center">
  {/* Elementos al centro */}
</View>

// Al final
<View className="flex-row justify-end">
  {/* Elementos al final (derecha en row) */}
</View>

// Espacio entre
<View className="flex-row justify-between">
  {/* Espacio igual entre elementos */}
</View>
```

#### 3. align-items (alineación en eje cruzado)

```tsx
// Arriba
<View className="flex-row items-start h-40">
  {/* Elementos alineados arriba */}
</View>

// Centro
<View className="flex-row items-center h-40">
  {/* Elementos alineados al centro verticalmente */}
</View>

// Abajo
<View className="flex-row items-end h-40">
  {/* Elementos alineados abajo */}
</View>
```

#### 4. flex (distribución proporcional)

```tsx
<View className="flex-row h-20">
  <View className="flex-1 bg-red-500" />    {/* 1/3 del espacio */}
  <View className="flex-1 bg-blue-500" />   {/* 1/3 del espacio */}
  <View className="flex-1 bg-green-500" />  {/* 1/3 del espacio */}
</View>

<View className="flex-row h-20">
  <View className="flex-1 bg-red-500" />    {/* 1/6 del espacio */}
  <View className="flex-2 bg-blue-500" />   {/* 2/6 del espacio */}
  <View className="flex-3 bg-green-500" />  {/* 3/6 del espacio */}
</View>
```

---

## 🎯 Ejercicio Práctico en Clase (30 min)

### Crear una Card de Perfil

**Objetivo:** Aplicar TODO lo aprendido en un componente real.

```tsx
import { View, Text, Image, TouchableOpacity, ScrollView } from 'react-native'
import { SafeAreaView } from 'react-native-safe-area-context'

export default function App() {
  return (
    <SafeAreaView className="flex-1 bg-gray-50">
      <ScrollView>
        {/* Header con avatar */}
        <View className="bg-blue-600 h-48 items-center justify-end pb-16">
          <Text className="text-white text-2xl font-bold">Mi Perfil</Text>
        </View>

        {/* Avatar superpuesto */}
        <View className="items-center -mt-16">
          <Image
            source={{ uri: 'https://i.pravatar.cc/150?img=12' }}
            className="w-32 h-32 rounded-full border-4 border-white"
          />
        </View>

        {/* Información */}
        <View className="items-center mt-4 px-5">
          <Text className="text-3xl font-bold text-gray-900">Juan Pérez</Text>
          <Text className="text-lg text-gray-600 mt-1">
            Desarrollador Mobile
          </Text>
        </View>

        {/* Datos de contacto */}
        <View className="mx-5 mt-6 bg-white rounded-xl p-5">
          <View className="flex-row items-center mb-4">
            <Text className="text-2xl mr-3">📧</Text>
            <View className="flex-1">
              <Text className="text-sm text-gray-500">Email</Text>
              <Text className="text-base text-gray-900 font-medium">
                juan@email.com
              </Text>
            </View>
          </View>

          <View className="h-px bg-gray-200 mb-4" />

          <View className="flex-row items-center">
            <Text className="text-2xl mr-3">📱</Text>
            <View className="flex-1">
              <Text className="text-sm text-gray-500">Teléfono</Text>
              <Text className="text-base text-gray-900 font-medium">
                +52 555 1234
              </Text>
            </View>
          </View>
        </View>

        {/* Botones de acción */}
        <View className="flex-row gap-3 px-5 mt-6 mb-8">
          <TouchableOpacity className="flex-1 bg-blue-600 py-4 rounded-lg">
            <Text className="text-white text-center font-bold">
              Editar Perfil
            </Text>
          </TouchableOpacity>

          <TouchableOpacity className="flex-1 bg-gray-200 py-4 rounded-lg">
            <Text className="text-gray-900 text-center font-bold">
              Compartir
            </Text>
          </TouchableOpacity>
        </View>
      </ScrollView>
    </SafeAreaView>
  )
}
```

**TODOS en clase:** Implementar este código y personalizarlo.

---

## ✅ Checklist de Verificación

Al finalizar esta sesión presencial deberías:

- [ ] Tener Node.js 22.20+ instalado y verificado
- [ ] Tener VS Code configurado con extensiones
- [ ] Haber creado tu primer proyecto Expo
- [ ] Ver tu app funcionando en Expo Go
- [ ] Entender los 7 componentes básicos
- [ ] Poder usar View, Text, Image
- [ ] Poder usar TextInput y TouchableOpacity
- [ ] Comprender Flexbox básico
- [ ] Haber completado el ejercicio de la Card

---

## 📚 Trabajo Autónomo (30-45 minutos recomendados)

### Para reforzar lo aprendido:

1. **Personaliza la Card de Perfil:**

   - Cambia colores
   - Agrega más información (ubicación, bio)
   - Experimenta con diferentes layouts

2. **Crea una segunda pantalla:**

   - Card de producto con imagen
   - Botón de "Agregar al carrito"
   - Usa todos los componentes aprendidos

3. **Revisa documentación oficial:**
   - [React Native Core Components](https://reactnative.dev/docs/components-and-apis)
   - [Flexbox Guide](https://reactnative.dev/docs/flexbox)
   - [NativeWind Docs](https://www.nativewind.dev/)

---

## 🔗 Próximo Módulo

**Siguiente clase:**  
[03. Estado y Eventos](./03-estado-y-eventos.md) - Aprenderemos a hacer las apps interactivas con estado y manejo de eventos.

---

**Tiempo presencial:** 2.5 horas ✓  
**Tiempo autónomo recomendado:** ~30-45 minutos
