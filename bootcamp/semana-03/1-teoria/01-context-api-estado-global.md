# 📦 Context API y Estado Global en React Native

> **Aprende a gestionar estado compartido** entre múltiples componentes sin prop drilling usando Context API de React.

---

## 🎯 Objetivos de Aprendizaje

Al finalizar este tema, serás capaz de:

- [ ] **Comprender** qué es el estado global y cuándo usarlo
- [ ] **Identificar** el problema del prop drilling
- [ ] **Crear** contextos con `createContext()`
- [ ] **Implementar** providers para compartir estado
- [ ] **Consumir** contextos con `useContext()`
- [ ] **Diseñar** arquitecturas de estado escalables
- [ ] **Optimizar** re-renders innecesarios

---

## 📚 Índice

1. [¿Qué es el Estado Global?](#qué-es-el-estado-global)
2. [El Problema del Prop Drilling](#el-problema-del-prop-drilling)
3. [Context API: La Solución](#context-api-la-solución)
4. [Creando un Context](#creando-un-context)
5. [Provider Pattern](#provider-pattern)
6. [Consumiendo Contexto](#consumiendo-contexto)
7. [Custom Hooks para Context](#custom-hooks-para-context)
8. [Múltiples Contextos](#múltiples-contextos)
9. [Optimización de Performance](#optimización-de-performance)
10. [Patrones y Mejores Prácticas](#patrones-y-mejores-prácticas)

---

## 🤔 ¿Qué es el Estado Global?

### Definición

**Estado Global** es información que necesita ser **accesible desde múltiples componentes** en diferentes niveles de la jerarquía de tu aplicación.

### Estado Local vs Estado Global

```typescript
// ❌ Estado LOCAL - Solo accesible en este componente
function Counter() {
  const [count, setCount] = useState(0) // Solo Counter puede ver/modificar

  return <Text>{count}</Text>
}

// ✅ Estado GLOBAL - Accesible desde cualquier componente
// AuthContext disponible en toda la app
const user = useAuth() // Cualquier componente puede acceder
```

### ¿Cuándo usar Estado Global?

✅ **Usa Estado Global cuando:**

- Múltiples componentes necesitan el mismo dato
- Datos de autenticación (usuario, token)
- Tema de la aplicación (dark/light mode)
- Idioma/internacionalización
- Carrito de compras en e-commerce
- Configuraciones de usuario
- Datos frecuentemente accedidos

❌ **NO uses Estado Global para:**

- Estado de formularios (usa estado local)
- Valores temporales de UI (modals, tooltips)
- Datos que solo usa un componente
- Estado que cambia muy frecuentemente (puede causar re-renders)

---

## 🚨 El Problema del Prop Drilling

### ¿Qué es Prop Drilling?

**Prop Drilling** es pasar props a través de múltiples niveles de componentes, incluso cuando los componentes intermedios no necesitan esos datos.

### Ejemplo del Problema

```typescript
/**
 * Problema: UserProfile necesita 'user', pero tenemos que
 * pasarlo por App → Home → Header → UserProfile
 *
 * Home y Header NO usan 'user', solo lo pasan
 */

// ❌ Prop Drilling - Código tedioso y frágil
function App() {
  const [user, setUser] = useState({ name: 'Juan', role: 'admin' })

  return <Home user={user} setUser={setUser} />
}

function Home({ user, setUser }) {
  // Home NO usa user, solo lo pasa
  return (
    <View>
      <Header user={user} setUser={setUser} />
      <Content />
    </View>
  )
}

function Header({ user, setUser }) {
  // Header NO usa user, solo lo pasa
  return (
    <View>
      <Logo />
      <UserProfile user={user} setUser={setUser} />
    </View>
  )
}

function UserProfile({ user, setUser }) {
  // Finalmente, aquí SÍ usamos user
  return <Text>{user.name}</Text>
}
```

### Problemas del Prop Drilling

1. **Código repetitivo** - Pasar props innecesariamente
2. **Difícil de mantener** - Cambiar props requiere editar múltiples archivos
3. **Acoplamiento** - Componentes intermedios dependen de props que no usan
4. **Refactoring complejo** - Mover componentes rompe la cadena de props
5. **TypeScript verboso** - Tipos en cada nivel

---

## ✨ Context API: La Solución

### ¿Qué es Context API?

Context API es una **característica de React** que permite compartir datos entre componentes sin pasar props manualmente en cada nivel.

### Analogía

Imagina Context como un **servicio de mensajería**:

- **Provider** = Oficina central de correos (tiene todos los datos)
- **Consumer** = Buzones (componentes que reciben datos)
- **Datos** = Cartas que se envían

Cualquier "buzón" puede recibir cartas sin que tengas que pasar por cada casa intermedia.

### Ventajas

✅ **Elimina prop drilling**
✅ **Código más limpio**
✅ **Fácil de refactorizar**
✅ **Escalable**
✅ **TypeScript-friendly**

---

## 🏗️ Creando un Context

### Paso 1: Crear el Context

```typescript
/**
 * ¿Qué hace?
 * Crea un contexto para compartir datos de autenticación
 *
 * ¿Para qué?
 * Permitir que cualquier componente acceda a información del usuario
 *
 * ¿Cómo funciona?
 * createContext() crea un "contenedor" de datos compartidos
 */

import { createContext } from 'react'

// Definir tipos TypeScript
interface User {
  id: string
  name: string
  email: string
  role: 'admin' | 'user'
}

interface AuthContextType {
  user: User | null
  isAuthenticated: boolean
  login: (email: string, password: string) => Promise<void>
  logout: () => void
  loading: boolean
}

// Crear el contexto con valor inicial undefined
export const AuthContext = createContext<AuthContextType | undefined>(undefined)
```

### Paso 2: Crear el Provider

```typescript
/**
 * ¿Qué hace?
 * Componente que envuelve la app y provee el contexto
 *
 * ¿Para qué?
 * Hacer que los datos de autenticación estén disponibles globalmente
 *
 * ¿Cómo funciona?
 * 1. Mantiene el estado (user, loading)
 * 2. Define funciones (login, logout)
 * 3. Provee todo a través del Provider
 */

import React, { useState, ReactNode } from 'react'

interface AuthProviderProps {
  children: ReactNode
}

export function AuthProvider({ children }: AuthProviderProps) {
  // Estado local del provider
  const [user, setUser] = useState<User | null>(null)
  const [loading, setLoading] = useState(false)

  // Función de login
  const login = async (email: string, password: string) => {
    setLoading(true)
    try {
      // Simular llamada a API
      await new Promise((resolve) => setTimeout(resolve, 1000))

      // Simular usuario autenticado
      const authenticatedUser: User = {
        id: '1',
        name: 'Juan Pérez',
        email,
        role: 'user',
      }

      setUser(authenticatedUser)
    } catch (error) {
      console.error('Login failed:', error)
      throw error
    } finally {
      setLoading(false)
    }
  }

  // Función de logout
  const logout = () => {
    setUser(null)
  }

  // Valor que se compartirá
  const value: AuthContextType = {
    user,
    isAuthenticated: user !== null,
    login,
    logout,
    loading,
  }

  // Provider envuelve a los children
  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}
```

### Paso 3: Envolver la App

```typescript
/**
 * App.tsx
 *
 * ¿Qué hace?
 * Envuelve toda la aplicación con el AuthProvider
 *
 * ¿Para qué?
 * Hacer que el contexto esté disponible en toda la app
 */

import { NavigationContainer } from '@react-navigation/native'
import { AuthProvider } from './contexts/AuthContext'
import { AppNavigator } from './navigation/AppNavigator'

export default function App() {
  return (
    <AuthProvider>
      <NavigationContainer>
        <AppNavigator />
      </NavigationContainer>
    </AuthProvider>
  )
}
```

---

## 🎣 Consumiendo Contexto

### Opción 1: useContext Hook (Recomendado)

```typescript
/**
 * ¿Qué hace?
 * Accede al contexto desde cualquier componente
 *
 * ¿Para qué?
 * Obtener datos del usuario sin prop drilling
 *
 * ¿Cómo funciona?
 * useContext(AuthContext) retorna el valor del Provider más cercano
 */

import { useContext } from 'react'
import { View, Text, Button } from 'react-native'
import { AuthContext } from '../contexts/AuthContext'

export function ProfileScreen() {
  // Consumir el contexto
  const auth = useContext(AuthContext)

  // Validación (en caso de que no haya Provider)
  if (!auth) {
    throw new Error('useContext must be used within AuthProvider')
  }

  const { user, logout, isAuthenticated } = auth

  if (!isAuthenticated) {
    return <Text>No autenticado</Text>
  }

  return (
    <View>
      <Text>Bienvenido, {user?.name}</Text>
      <Text>Email: {user?.email}</Text>
      <Button title="Logout" onPress={logout} />
    </View>
  )
}
```

### Opción 2: Context.Consumer (Menos común)

```typescript
/**
 * Forma antigua de consumir contexto
 * Menos usada, pero válida
 */

import { AuthContext } from '../contexts/AuthContext'

export function ProfileScreen() {
  return (
    <AuthContext.Consumer>
      {(auth) => {
        if (!auth) return null

        return (
          <View>
            <Text>{auth.user?.name}</Text>
          </View>
        )
      }}
    </AuthContext.Consumer>
  )
}
```

---

## 🎨 Custom Hooks para Context

### ¿Por qué Custom Hooks?

Los custom hooks mejoran la experiencia de desarrollo:

1. **Validación automática** - Verifican que se use dentro del Provider
2. **TypeScript mejorado** - Tipos automáticos sin checks manuales
3. **API más limpia** - Código más legible
4. **Reutilización** - Un hook, múltiples componentes

### Implementación

```typescript
/**
 * useAuth.ts
 *
 * ¿Qué hace?
 * Hook personalizado para acceder al AuthContext
 *
 * ¿Para qué?
 * Simplificar el consumo del contexto y agregar validación
 *
 * ¿Cómo funciona?
 * 1. Llama a useContext internamente
 * 2. Valida que se use dentro del Provider
 * 3. Retorna el contexto con tipos seguros
 */

import { useContext } from 'react'
import { AuthContext } from '../contexts/AuthContext'

export function useAuth() {
  const context = useContext(AuthContext)

  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider')
  }

  return context
}
```

### Uso del Custom Hook

```typescript
/**
 * Ahora es mucho más simple y seguro
 */

import { useAuth } from '../hooks/useAuth'

export function ProfileScreen() {
  // ✅ Limpio, simple, type-safe
  const { user, logout, isAuthenticated } = useAuth()

  if (!isAuthenticated) {
    return <Text>No autenticado</Text>
  }

  return (
    <View>
      <Text>Hola, {user.name}</Text>
      <Button title="Logout" onPress={logout} />
    </View>
  )
}
```

---

## 🔀 Múltiples Contextos

### ¿Cuándo usar múltiples contextos?

Separa contextos cuando gestionan **dominios diferentes**:

- **AuthContext** - Autenticación
- **ThemeContext** - Tema (dark/light)
- **LanguageContext** - Idioma
- **CartContext** - Carrito de compras

### Ejemplo: Theme Context

```typescript
/**
 * ThemeContext.tsx
 *
 * Contexto independiente para gestionar el tema
 */

import React, { createContext, useState, useContext, ReactNode } from 'react'

type Theme = 'light' | 'dark'

interface ThemeContextType {
  theme: Theme
  toggleTheme: () => void
  colors: {
    background: string
    text: string
    primary: string
  }
}

const ThemeContext = createContext<ThemeContextType | undefined>(undefined)

export function ThemeProvider({ children }: { children: ReactNode }) {
  const [theme, setTheme] = useState<Theme>('light')

  const toggleTheme = () => {
    setTheme((prev) => (prev === 'light' ? 'dark' : 'light'))
  }

  const colors =
    theme === 'light'
      ? { background: '#ffffff', text: '#000000', primary: '#007AFF' }
      : { background: '#000000', text: '#ffffff', primary: '#0A84FF' }

  const value: ThemeContextType = {
    theme,
    toggleTheme,
    colors,
  }

  return <ThemeContext.Provider value={value}>{children}</ThemeContext.Provider>
}

export function useTheme() {
  const context = useContext(ThemeContext)
  if (context === undefined) {
    throw new Error('useTheme must be used within a ThemeProvider')
  }
  return context
}
```

### Composición de Providers

```typescript
/**
 * App.tsx
 *
 * ¿Qué hace?
 * Envuelve la app con múltiples providers
 *
 * ¿Para qué?
 * Hacer disponibles múltiples contextos
 *
 * ¿Cómo funciona?
 * Providers anidados - el orden generalmente no importa
 */

export default function App() {
  return (
    <AuthProvider>
      <ThemeProvider>
        <LanguageProvider>
          <NavigationContainer>
            <AppNavigator />
          </NavigationContainer>
        </LanguageProvider>
      </ThemeProvider>
    </AuthProvider>
  )
}

// O usando un helper para mayor claridad:
function AppProviders({ children }: { children: ReactNode }) {
  return (
    <AuthProvider>
      <ThemeProvider>
        <LanguageProvider>{children}</LanguageProvider>
      </ThemeProvider>
    </AuthProvider>
  )
}

export default function App() {
  return (
    <AppProviders>
      <NavigationContainer>
        <AppNavigator />
      </NavigationContainer>
    </AppProviders>
  )
}
```

### Consumiendo Múltiples Contextos

```typescript
/**
 * Componente que usa varios contextos
 */

import { useAuth } from '../hooks/useAuth'
import { useTheme } from '../hooks/useTheme'
import { useLanguage } from '../hooks/useLanguage'

export function SettingsScreen() {
  const { user, logout } = useAuth()
  const { theme, toggleTheme, colors } = useTheme()
  const { language, changeLanguage, t } = useLanguage()

  return (
    <View style={{ backgroundColor: colors.background }}>
      <Text style={{ color: colors.text }}>
        {t('welcome')}, {user.name}
      </Text>
      <Button title={t('toggleTheme')} onPress={toggleTheme} />
      <Button title={t('logout')} onPress={logout} />
    </View>
  )
}
```

---

## ⚡ Optimización de Performance

### Problema: Re-renders Innecesarios

```typescript
/**
 * ❌ PROBLEMA
 *
 * Cuando el contexto cambia, TODOS los componentes que lo usan
 * se re-renderizan, incluso si no usan el valor que cambió
 */

interface AppContextType {
  user: User
  theme: Theme
  cart: CartItem[]
  // Si cart cambia, componentes que solo usan 'user' también se re-renderizan
}
```

### Solución 1: Separar Contextos

```typescript
/**
 * ✅ MEJOR
 *
 * Separar en contextos independientes reduce re-renders
 */

// Cada uno en su propio archivo
const UserContext = createContext<User>()
const ThemeContext = createContext<Theme>()
const CartContext = createContext<CartItem[]>()

// Ahora cambios en cart NO afectan componentes que solo usan user
```

### Solución 2: React.memo

```typescript
/**
 * ✅ React.memo previene re-renders si props no cambian
 */

import React, { memo } from 'react'

const ExpensiveComponent = memo(function ExpensiveComponent({
  user,
}: {
  user: User
}) {
  console.log('ExpensiveComponent rendered')

  return (
    <View>
      <Text>{user.name}</Text>
    </View>
  )
})
```

### Solución 3: useMemo y useCallback

```typescript
/**
 * ✅ Memoizar valores y funciones en el Provider
 */

export function AuthProvider({ children }: AuthProviderProps) {
  const [user, setUser] = useState<User | null>(null)

  // ✅ Memoizar funciones con useCallback
  const login = useCallback(async (email: string, password: string) => {
    // ... lógica de login
  }, [])

  const logout = useCallback(() => {
    setUser(null)
  }, [])

  // ✅ Memoizar el valor del contexto
  const value = useMemo(
    () => ({
      user,
      isAuthenticated: user !== null,
      login,
      logout,
    }),
    [user, login, logout]
  )

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}
```

### Solución 4: Context Selector (Avanzado)

```typescript
/**
 * ✅ Permitir suscripciones parciales
 *
 * Usando librería: use-context-selector
 */

import { createContext, useContextSelector } from 'use-context-selector'

const AppContext = createContext({ user, theme, cart })

// Solo se re-renderiza cuando 'user' cambia
function UserProfile() {
  const user = useContextSelector(AppContext, (state) => state.user)
  return <Text>{user.name}</Text>
}

// Solo se re-renderiza cuando 'cart' cambia
function CartBadge() {
  const cartCount = useContextSelector(AppContext, (state) => state.cart.length)
  return <Text>{cartCount}</Text>
}
```

---

## 🎯 Patrones y Mejores Prácticas

### 1. Un Provider por Dominio

```typescript
// ✅ BUENO - Cada dominio separado
<AuthProvider>
  <ThemeProvider>
    <CartProvider>
      <App />
    </CartProvider>
  </ThemeProvider>
</AuthProvider>

// ❌ MALO - Todo en un solo contexto gigante
<AppProvider> {/* user, theme, cart, language, etc. */}
  <App />
</AppProvider>
```

### 2. Custom Hooks Siempre

```typescript
// ✅ BUENO - Custom hook con validación
export function useAuth() {
  const context = useContext(AuthContext)
  if (!context) throw new Error('useAuth must be used within AuthProvider')
  return context
}

// ❌ MALO - useContext directo en componentes
const auth = useContext(AuthContext) // Sin validación, puede ser undefined
```

### 3. TypeScript Estricto

```typescript
// ✅ BUENO - Tipos bien definidos
interface AuthContextType {
  user: User | null
  login: (email: string, password: string) => Promise<void>
  logout: () => void
}

const AuthContext = createContext<AuthContextType | undefined>(undefined)

// ❌ MALO - any o tipos genéricos
const AuthContext = createContext<any>(null)
```

### 4. Valores Iniciales Sensatos

```typescript
// ✅ BUENO - undefined indica "debe usarse con Provider"
const AuthContext = createContext<AuthContextType | undefined>(undefined)

// ⚠️ ACEPTABLE - Valores por defecto
const ThemeContext = createContext<ThemeContextType>({
  theme: 'light',
  toggleTheme: () => {},
  colors: { ... }
})

// ❌ MALO - null sin indicar que puede serlo
const AuthContext = createContext(null) // ❌ TypeScript error
```

### 5. Estructura de Carpetas

```
src/
├── contexts/
│   ├── AuthContext.tsx
│   ├── ThemeContext.tsx
│   ├── CartContext.tsx
│   └── index.ts           # Exporta todos
├── hooks/
│   ├── useAuth.ts
│   ├── useTheme.ts
│   ├── useCart.ts
│   └── index.ts           # Exporta todos
└── providers/
    └── AppProviders.tsx   # Componente que envuelve con todos los providers
```

### 6. Persistencia (Opcional)

```typescript
/**
 * Guardar contexto en AsyncStorage
 */

import AsyncStorage from '@react-native-async-storage/async-storage'

export function AuthProvider({ children }: AuthProviderProps) {
  const [user, setUser] = useState<User | null>(null)

  // Cargar user al iniciar
  useEffect(() => {
    AsyncStorage.getItem('user').then((data) => {
      if (data) setUser(JSON.parse(data))
    })
  }, [])

  // Guardar user cuando cambia
  useEffect(() => {
    if (user) {
      AsyncStorage.setItem('user', JSON.stringify(user))
    } else {
      AsyncStorage.removeItem('user')
    }
  }, [user])

  // ... resto del provider
}
```

---

## 📊 Comparación: Context vs Otras Soluciones

| Aspecto               | Context API  | Redux        | Zustand       | MobX           |
| --------------------- | ------------ | ------------ | ------------- | -------------- |
| **Curva aprendizaje** | Baja         | Alta         | Baja          | Media          |
| **Boilerplate**       | Bajo         | Alto         | Muy bajo      | Bajo           |
| **Performance**       | Media        | Alta         | Alta          | Alta           |
| **DevTools**          | No           | Sí           | Sí            | Sí             |
| **TypeScript**        | Nativo       | Bueno        | Excelente     | Bueno          |
| **Bundle size**       | 0 (nativo)   | ~7KB         | ~1KB          | ~16KB          |
| **Ideal para**        | Apps simples | Apps grandes | Apps medianas | Apps complejas |

**Recomendación para el bootcamp:** Context API es suficiente para la mayoría de casos.

---

## ✅ Checklist de Comprensión

### Nivel Básico

- [ ] Entiendo qué es el estado global
- [ ] Identifico cuándo usar estado local vs global
- [ ] Comprendo el problema del prop drilling
- [ ] Puedo crear un contexto simple con createContext
- [ ] Sé cómo consumir un contexto con useContext

### Nivel Intermedio

- [ ] Implemento providers completos con estado
- [ ] Creo custom hooks para mis contextos
- [ ] Uso múltiples contextos en una app
- [ ] Entiendo la composición de providers
- [ ] Aplico TypeScript a mis contextos

### Nivel Avanzado

- [ ] Optimizo re-renders con useMemo/useCallback
- [ ] Implemento persistencia con AsyncStorage
- [ ] Separo contextos por dominio lógico
- [ ] Uso patrones avanzados (selector pattern)
- [ ] Sé cuándo Context API no es suficiente

---

## 🎓 Resumen

### Conceptos Clave

1. **Estado Global** - Datos compartidos por múltiples componentes
2. **Prop Drilling** - Problema que Context API resuelve
3. **createContext()** - Crea un contexto
4. **Provider** - Componente que provee el contexto
5. **useContext()** - Hook para consumir contexto
6. **Custom Hooks** - Mejora la API de consumo

### Flujo Típico

```
1. Crear Context con createContext()
2. Crear Provider con estado y funciones
3. Envolver App con Provider
4. Crear custom hook (useAuth, useTheme, etc.)
5. Consumir en componentes con el custom hook
```

### Cuándo Usar Context

✅ **Usa Context para:**

- Autenticación
- Tema
- Idioma
- Datos compartidos frecuentemente

❌ **No uses Context para:**

- Estado muy local
- Datos que cambian constantemente
- Aplicaciones muy grandes y complejas (considera Redux/Zustand)

---

## 🔜 Próximo Tema

**[02. AsyncStorage y Persistencia](./02-asyncstorage-persistencia.md)**

Aprenderás a guardar datos localmente en el dispositivo para que persistan entre sesiones.

---

_Teoría 1: Context API y Estado Global - Semana 3_  
_Bootcamp React Native 2025 - EPTI_

**Tiempo estimado:** 35-40 minutos  
**Dificultad:** ⭐⭐⭐ Intermedia
