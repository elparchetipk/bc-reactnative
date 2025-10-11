# 01. Introducción a React Navigation

> **Fundamentos de navegación en React Native**  
> Aprende por qué y cómo implementar navegación profesional en tus apps móviles.

**Duración:** 1 hora (presencial)  
**Modalidad:** Teoría + Demo en vivo

---

## 🎯 Objetivos

Al finalizar esta sesión, podrás:

- ✅ Entender por qué necesitamos navegación en apps móviles
- ✅ Conocer las opciones disponibles (React Navigation vs Expo Router)
- ✅ Instalar y configurar React Navigation correctamente
- ✅ Comprender los conceptos fundamentales: Navigator, Screen, Route
- ✅ Crear tu primera navegación básica

---

## 📱 ¿Por Qué Necesitamos Navegación?

### Problema

En una aplicación móvil real:

- Necesitas **múltiples pantallas** (Home, Perfil, Configuración, etc.)
- Los usuarios deben **moverse entre pantallas** fluidamente
- Debes **mantener el estado** al navegar
- Necesitas **pasar datos** entre pantallas
- Debes **manejar el botón "atrás"** correctamente

### Solución: Sistema de Navegación

Un sistema de navegación profesional te permite:

✅ **Gestionar stack de pantallas** - Como un historial de navegación  
✅ **Transiciones suaves** - Animaciones nativas entre pantallas  
✅ **Headers personalizables** - Con títulos, botones, estilos  
✅ **Pasar parámetros** - De forma type-safe con TypeScript  
✅ **Deep linking** - URLs que abren pantallas específicas  
✅ **State management** - Cada pantalla tiene su propio estado

---

## 🔀 Opciones de Navegación en React Native

### 1. React Navigation (⭐ Recomendado)

**¿Qué es?**
Librería JavaScript pura para navegación en React Native. La más popular y completa.

**Ventajas:**

- ✅ Más popular (30k+ stars en GitHub)
- ✅ Muy flexible y personalizable
- ✅ Excelente documentación
- ✅ Soporta todos los tipos de navegación
- ✅ Funciona con TypeScript perfectamente
- ✅ Gran ecosistema de plugins

**Desventajas:**

- ❌ Configuración inicial manual
- ❌ Más código para setup básico
- ❌ Curva de aprendizaje media

**Cuándo usarlo:**

- Apps grandes y complejas
- Necesitas control total sobre la navegación
- Proyectos con muchas pantallas y flujos

---

### 2. Expo Router

**¿Qué es?**
Sistema de navegación basado en archivos (como Next.js). Parte del ecosistema Expo.

**Ventajas:**

- ✅ File-based routing (estructura de carpetas = rutas)
- ✅ Setup mínimo, configuración automática
- ✅ Deep linking gratuito
- ✅ Perfecto para apps Expo managed
- ✅ Curva de aprendizaje baja

**Desventajas:**

- ❌ Menos flexible que React Navigation
- ❌ Solo funciona con Expo
- ❌ Documentación aún en desarrollo
- ❌ Menor comunidad

**Cuándo usarlo:**

- Apps pequeñas o medianas
- Proyectos 100% con Expo
- Quieres setup rápido
- Vienes de Next.js/Remix

---

### 3. React Native Navigation (alternativa)

**¿Qué es?**
Librería de Wix que usa componentes nativos puros (iOS/Android).

**Ventajas:**

- ✅ Performance nativo (no JS)
- ✅ Look & feel 100% nativo

**Desventajas:**

- ❌ Configuración compleja
- ❌ Requiere linking nativo
- ❌ No compatible con Expo managed
- ❌ Menos flexible

**Cuándo usarlo:**

- Performance crítica
- App con bare workflow
- Experiencia avanzada en React Native

---

## 🎯 En Este Bootcamp: React Navigation

Usaremos **React Navigation 6** porque:

1. ✅ Es el estándar de la industria
2. ✅ Conocimiento transferible a cualquier proyecto RN
3. ✅ Funciona con Expo y bare workflow
4. ✅ Excelente con TypeScript
5. ✅ Prepara para apps reales y complejas

---

## 📦 Instalación de React Navigation

### Paso 1: Instalar el Core

```bash
# Librería principal
pnpm add @react-navigation/native
```

### Paso 2: Instalar Dependencias de Expo

```bash
# Si usas Expo (nuestro caso)
pnpm add react-native-screens react-native-safe-area-context
```

**¿Qué hacen estas librerías?**

- **`react-native-screens`**: Optimiza performance usando pantallas nativas
- **`react-native-safe-area-context`**: Maneja áreas seguras (notch, status bar, etc.)

### Paso 3: Instalar Navegadores

Dependiendo de tus necesidades, instala uno o más:

```bash
# Stack Navigator (navegación básica push/pop)
pnpm add @react-navigation/native-stack

# Bottom Tab Navigator (pestañas inferiores)
pnpm add @react-navigation/bottom-tabs

# Drawer Navigator (menú lateral deslizable)
pnpm add @react-navigation/drawer
pnpm add react-native-gesture-handler react-native-reanimated
```

---

## 🔧 Configuración Inicial

### 1. Configurar Babel (para Drawer)

Si usas Drawer Navigator, debes configurar `react-native-reanimated`:

```javascript
// babel.config.js
module.exports = function (api) {
  api.cache(true)
  return {
    presets: ['babel-preset-expo'],
    plugins: [
      'nativewind/babel',
      'react-native-reanimated/plugin', // ← IMPORTANTE: Al final
    ],
  }
}
```

⚠️ **IMPORTANTE:** `react-native-reanimated/plugin` debe ser el **último plugin**.

### 2. Reiniciar Metro con Caché Limpio

```bash
# Después de cambiar babel.config.js
pnpm start --clear
```

---

## 📚 Conceptos Fundamentales

### 1. NavigationContainer

**¿Qué es?**
Contenedor raíz que gestiona el estado de navegación de toda la app.

**¿Dónde va?**
En el componente raíz de tu aplicación (App.tsx o \_layout.tsx).

**Ejemplo:**

```typescript
import { NavigationContainer } from '@react-navigation/native'

export default function App() {
  return <NavigationContainer>{/* Tu navegador va aquí */}</NavigationContainer>
}
```

**Reglas:**

- ✅ Solo uno por app
- ✅ Envuelve toda la navegación
- ✅ Debe estar lo más arriba posible

---

### 2. Navigator

**¿Qué es?**
Define el **tipo** de navegación (Stack, Tab, Drawer, etc.).

**Tipos principales:**

| Tipo       | Cuándo Usarlo                   | Ejemplo                          |
| ---------- | ------------------------------- | -------------------------------- |
| **Stack**  | Navegación lineal (A → B → C)   | Detalle de producto, formularios |
| **Tab**    | Secciones principales de la app | Home, Buscar, Perfil             |
| **Drawer** | Menú lateral con opciones       | Ajustes, About, Ayuda            |

**Ejemplo de Stack Navigator:**

```typescript
import { createNativeStackNavigator } from '@react-navigation/native-stack'

const Stack = createNativeStackNavigator()

function AppNavigator() {
  return (
    <Stack.Navigator>
      <Stack.Screen name="Home" component={HomeScreen} />
      <Stack.Screen name="Details" component={DetailsScreen} />
    </Stack.Navigator>
  )
}
```

---

### 3. Screen

**¿Qué es?**
Cada pantalla individual de tu app.

**Props principales:**

```typescript
<Stack.Screen
  name="Home" // Nombre único (para navegar)
  component={HomeScreen} // Componente React
  options={{
    // Opciones de configuración
    title: 'Inicio',
    headerShown: true,
  }}
/>
```

---

### 4. Navigation Prop

**¿Qué es?**
Objeto que cada pantalla recibe automáticamente para controlar la navegación.

**Métodos principales:**

```typescript
// En tu componente Screen
function HomeScreen({ navigation }) {
  // Navegar a otra pantalla
  navigation.navigate('Details')

  // Navegar con parámetros
  navigation.navigate('Details', { itemId: 42, title: 'Producto A' })

  // Volver atrás
  navigation.goBack()

  // Ir al inicio del stack
  navigation.popToTop()

  // Reemplazar pantalla actual
  navigation.replace('Login')

  // Resetear el stack completo
  navigation.reset({
    index: 0,
    routes: [{ name: 'Home' }],
  })
}
```

---

### 5. Route Prop

**¿Qué es?**
Objeto que contiene información sobre la pantalla actual, incluyendo parámetros.

**Ejemplo:**

```typescript
function DetailsScreen({ route }) {
  // Acceder a parámetros
  const { itemId, title } = route.params

  return (
    <View>
      <Text>Item ID: {itemId}</Text>
      <Text>Title: {title}</Text>
    </View>
  )
}
```

---

## 💻 Primera Navegación: Ejemplo Completo

Vamos a crear una app simple con 2 pantallas:

### Estructura de Archivos

```
src/
├── navigation/
│   └── AppNavigator.tsx    # Configuración de navegación
├── screens/
│   ├── HomeScreen.tsx      # Pantalla principal
│   └── DetailsScreen.tsx   # Pantalla de detalle
└── App.tsx                 # Punto de entrada
```

### 1. Crear HomeScreen

```typescript
// src/screens/HomeScreen.tsx
import React from 'react'
import { View, Text, Button } from 'react-native'

/**
 * HomeScreen - Pantalla principal
 *
 * ¿Qué hace?
 * Muestra un botón para navegar a la pantalla de detalles
 *
 * ¿Para qué?
 * Demostrar navegación básica entre pantallas
 */
export function HomeScreen({ navigation }: any) {
  return (
    <View className="flex-1 justify-center items-center bg-white">
      <Text className="text-2xl font-bold mb-4">Pantalla Principal</Text>

      <Button
        title="Ir a Detalles"
        onPress={() => navigation.navigate('Details')}
      />
    </View>
  )
}
```

### 2. Crear DetailsScreen

```typescript
// src/screens/DetailsScreen.tsx
import React from 'react'
import { View, Text, Button } from 'react-native'

/**
 * DetailsScreen - Pantalla de detalle
 *
 * ¿Qué hace?
 * Muestra información de detalle y permite volver atrás
 */
export function DetailsScreen({ navigation }: any) {
  return (
    <View className="flex-1 justify-center items-center bg-gray-50">
      <Text className="text-2xl font-bold mb-4">Pantalla de Detalles</Text>

      <Button title="Volver" onPress={() => navigation.goBack()} />
    </View>
  )
}
```

### 3. Configurar Navigator

```typescript
// src/navigation/AppNavigator.tsx
import React from 'react'
import { createNativeStackNavigator } from '@react-navigation/native-stack'
import { HomeScreen } from '../screens/HomeScreen'
import { DetailsScreen } from '../screens/DetailsScreen'

/**
 * Stack Navigator Principal
 *
 * ¿Qué hace?
 * Define las pantallas de la app y cómo se navega entre ellas
 *
 * ¿Cómo funciona?
 * Crea un stack (pila) de pantallas donde puedes hacer push/pop
 */

const Stack = createNativeStackNavigator()

export function AppNavigator() {
  return (
    <Stack.Navigator
      initialRouteName="Home"
      screenOptions={{
        headerStyle: {
          backgroundColor: '#3b82f6', // bg-blue-500
        },
        headerTintColor: '#fff',
        headerTitleStyle: {
          fontWeight: 'bold',
        },
      }}
    >
      <Stack.Screen
        name="Home"
        component={HomeScreen}
        options={{
          title: 'Inicio',
        }}
      />

      <Stack.Screen
        name="Details"
        component={DetailsScreen}
        options={{
          title: 'Detalles',
        }}
      />
    </Stack.Navigator>
  )
}
```

### 4. Integrar en App.tsx

```typescript
// App.tsx
import React from 'react'
import { NavigationContainer } from '@react-navigation/native'
import { AppNavigator } from './src/navigation/AppNavigator'

/**
 * App Principal
 *
 * ¿Qué hace?
 * Punto de entrada de la aplicación con navegación configurada
 */
export default function App() {
  return (
    <NavigationContainer>
      <AppNavigator />
    </NavigationContainer>
  )
}
```

---

## ✅ Demo en Vivo

Durante la clase, el instructor demostrará:

1. ✅ Instalar dependencias desde cero
2. ✅ Configurar babel.config.js
3. ✅ Crear las pantallas Home y Details
4. ✅ Configurar Stack Navigator
5. ✅ Ejecutar en Expo Go
6. ✅ Navegar entre pantallas
7. ✅ Ver animaciones nativas
8. ✅ Usar DevTools para debug

---

## 🔍 Debugging de Navegación

### Ver el Estado de Navegación

```typescript
import { useNavigationState } from '@react-navigation/native'

function DebugNavigationState() {
  const state = useNavigationState((state) => state)
  console.log('Navigation State:', state)
  return null
}
```

### Logs Automáticos

```typescript
<NavigationContainer
  onStateChange={(state) => {
    console.log('Navigation changed:', state)
  }}
>
  {/* ... */}
</NavigationContainer>
```

---

## 💡 Mejores Prácticas

### 1. Organización de Archivos

```
src/
├── navigation/
│   ├── types.ts            # Tipos de TypeScript
│   ├── AppNavigator.tsx    # Navigator principal
│   └── index.ts            # Exports
├── screens/
│   ├── home/
│   │   └── HomeScreen.tsx
│   └── details/
│       └── DetailsScreen.tsx
```

### 2. Usar TypeScript (Recomendado)

```typescript
// navigation/types.ts
export type RootStackParamList = {
  Home: undefined // Sin parámetros
  Details: { itemId: number } // Con parámetros
  Profile: { userId: string }
}

// Usar en Navigator
const Stack = createNativeStackNavigator<RootStackParamList>()

// Usar en Screen
type DetailsScreenProps = NativeStackScreenProps<RootStackParamList, 'Details'>

function DetailsScreen({ route, navigation }: DetailsScreenProps) {
  const { itemId } = route.params // ← Autocompletado + type-safe
  // ...
}
```

### 3. Separar Configuración

```typescript
// navigation/screenOptions.ts
export const defaultScreenOptions = {
  headerStyle: {
    backgroundColor: '#3b82f6',
  },
  headerTintColor: '#fff',
  headerTitleStyle: {
    fontWeight: 'bold',
  },
}

// Usar en Navigator
<Stack.Navigator screenOptions={defaultScreenOptions}>
```

---

## 🚨 Errores Comunes

### 1. Olvidar NavigationContainer

❌ **Error:**

```
Couldn't find a navigation object
```

✅ **Solución:**
Envuelve tu Navigator con `<NavigationContainer>`

### 2. Plugin de Reanimated Mal Configurado

❌ **Error:**

```
Reanimated 2 failed to create a worklet
```

✅ **Solución:**

- Agregar `'react-native-reanimated/plugin'` al final de `babel.config.js`
- Ejecutar `pnpm start --clear`

### 3. Nombres de Pantalla Incorrectos

❌ **Error:**

```typescript
navigation.navigate('detail') // minúscula
```

✅ **Solución:**

```typescript
navigation.navigate('Details') // Como lo definiste en Screen
```

---

## 📖 Recursos Adicionales

### Documentación Oficial:

- [React Navigation Getting Started](https://reactnavigation.org/docs/getting-started)
- [Hello React Navigation](https://reactnavigation.org/docs/hello-react-navigation)

### Videos:

- [React Navigation 6 Tutorial](https://www.youtube.com/watch?v=nQVCkqvU1uE)

### Ejemplos:

- [React Navigation Examples](https://github.com/react-navigation/react-navigation/tree/main/example)

---

## ✍️ Ejercicio Práctico (En Clase)

**Objetivo:** Crear una app con 3 pantallas conectadas.

### Requisitos:

1. HomeScreen → Lista de productos (hardcoded)
2. ProductScreen → Detalle de un producto
3. CartScreen → Carrito de compras

### Funcionalidad:

- En HomeScreen, al tocar un producto → navegar a ProductScreen
- En ProductScreen, botón "Agregar al Carrito" → navegar a CartScreen
- En CartScreen, mostrar mensaje de éxito

**Tiempo:** 20 minutos  
**Trabajo:** En parejas

---

## 🎯 Resumen

Hoy aprendiste:

✅ Por qué necesitamos navegación en apps móviles  
✅ Diferencias entre React Navigation y Expo Router  
✅ Cómo instalar y configurar React Navigation  
✅ Conceptos clave: Navigator, Screen, Route, Navigation Prop  
✅ Crear tu primera navegación Stack básica  
✅ Navegar entre pantallas con `navigate()` y `goBack()`  
✅ Configurar headers y estilos globales  
✅ Debugging básico de navegación

---

## 🔜 Próxima Clase

**Tema:** Stack Navigator en Profundidad

Aprenderás:

- Pasar parámetros complejos entre pantallas
- Headers dinámicos y personalizados
- Modales y pantallas especiales
- Gestos y animaciones
- Deep linking

---

_Introducción a React Navigation - Semana 2_  
_Bootcamp React Native 2025_
