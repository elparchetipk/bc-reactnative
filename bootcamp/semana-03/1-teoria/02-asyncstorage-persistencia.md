# 💾 AsyncStorage y Persistencia de Datos

> **Aprende a guardar datos localmente** en el dispositivo para que persistan entre sesiones de la aplicación.

---

## 🎯 Objetivos de Aprendizaje

Al finalizar este tema, serás capaz de:

- [ ] **Comprender** qué es AsyncStorage y cuándo usarlo
- [ ] **Guardar** datos simples y complejos localmente
- [ ] **Recuperar** datos almacenados
- [ ] **Eliminar** datos cuando sea necesario
- [ ] **Integrar** AsyncStorage con Context API
- [ ] **Manejar errores** en operaciones asíncronas
- [ ] **Optimizar** el rendimiento del almacenamiento

---

## 📚 Índice

1. [¿Qué es AsyncStorage?](#qué-es-asyncstorage)
2. [Instalación y Configuración](#instalación-y-configuración)
3. [Operaciones Básicas](#operaciones-básicas)
4. [Almacenar Datos Complejos](#almacenar-datos-complejos)
5. [Manejo de Errores](#manejo-de-errores)
6. [Integración con Context API](#integración-con-context-api)
7. [Casos de Uso Comunes](#casos-de-uso-comunes)
8. [Alternativas a AsyncStorage](#alternativas-a-asyncstorage)
9. [Mejores Prácticas](#mejores-prácticas)
10. [Troubleshooting](#troubleshooting)

---

## 📦 ¿Qué es AsyncStorage?

### Definición

**AsyncStorage** es un sistema de **almacenamiento persistente, no encriptado, asíncrono y basado en clave-valor** para React Native.

### Analogía

Piensa en AsyncStorage como un **archivero digital**:

- **Clave (key)** = Etiqueta del cajón
- **Valor (value)** = Documento guardado
- **Persistente** = Los documentos permanecen aunque cierres el archivero
- **Asíncrono** = Toma tiempo abrir/cerrar cajones

### Características

✅ **Persistente** - Datos sobreviven al cierre de la app
✅ **Asíncrono** - No bloquea la UI
✅ **Simple** - API minimalista
✅ **Multiplataforma** - iOS y Android
✅ **Sin límite de tamaño estricto** - Pero depende del dispositivo

❌ **NO encriptado** - No guardar datos sensibles sin encriptar
❌ **NO relacional** - Solo key-value, no SQL
❌ **NO sincronizado** - Solo local, no entre dispositivos

### ¿Cuándo usar AsyncStorage?

✅ **Usa AsyncStorage para:**

- Preferencias de usuario (tema, idioma)
- Tokens de autenticación
- Cache de datos de API
- Onboarding flags
- Datos de sesión
- Favoritos del usuario
- Configuraciones de la app

❌ **NO uses AsyncStorage para:**

- Contraseñas en texto plano (usa Expo SecureStore)
- Datos muy grandes (>10MB) (usa sistema de archivos)
- Datos sensibles sin encriptar
- Bases de datos complejas (usa SQLite)
- Datos que necesitan sincronización en tiempo real

---

## 🔧 Instalación y Configuración

### Instalación

````bash
# Con pnpm (recomendado en el bootcamp)
pnpm add @react-native-async-storage/async-storage

```bash
# Con pnpm (recomendado - 3x más rápido)
pnpm add @react-native-async-storage/async-storage

# O con npm (no recomendado en este bootcamp)
npm install @react-native-async-storage/async-storage
````

# Con yarn

yarn add @react-native-async-storage/async-storage

````

### Configuración para Expo (Automática)

Si usas **Expo**, la configuración es automática. No necesitas pasos adicionales.

### Verificar Instalación

```typescript
/**
 * TestAsyncStorage.tsx
 *
 * Componente simple para verificar que AsyncStorage funciona
 */

import { useEffect } from 'react'
import AsyncStorage from '@react-native-async-storage/async-storage'

export function TestAsyncStorage() {
  useEffect(() => {
    async function test() {
      try {
        // Guardar
        await AsyncStorage.setItem('test_key', 'test_value')

        // Leer
        const value = await AsyncStorage.getItem('test_key')
        console.log('AsyncStorage funciona! Valor:', value)

        // Limpiar
        await AsyncStorage.removeItem('test_key')
      } catch (error) {
        console.error('AsyncStorage NO funciona:', error)
      }
    }

    test()
  }, [])

  return null
}
````

---

## 🎯 Operaciones Básicas

### 1. Guardar un Valor (setItem)

```typescript
/**
 * ¿Qué hace?
 * Guarda un par clave-valor en AsyncStorage
 *
 * ¿Para qué?
 * Persistir datos simples como strings
 *
 * ¿Cómo funciona?
 * Crea o actualiza una entrada en el almacenamiento
 */

import AsyncStorage from '@react-native-async-storage/async-storage'

// Ejemplo básico
async function saveUsername(username: string) {
  try {
    await AsyncStorage.setItem('username', username)
    console.log('Username guardado exitosamente')
  } catch (error) {
    console.error('Error al guardar username:', error)
  }
}

// Uso
saveUsername('juan_perez')
```

### 2. Leer un Valor (getItem)

```typescript
/**
 * ¿Qué hace?
 * Recupera un valor guardado usando su clave
 *
 * ¿Para qué?
 * Obtener datos guardados previamente
 *
 * ¿Cómo funciona?
 * Retorna el valor o null si no existe
 */

async function getUsername(): Promise<string | null> {
  try {
    const username = await AsyncStorage.getItem('username')

    if (username !== null) {
      console.log('Username encontrado:', username)
      return username
    } else {
      console.log('No hay username guardado')
      return null
    }
  } catch (error) {
    console.error('Error al leer username:', error)
    return null
  }
}

// Uso
const username = await getUsername()
```

### 3. Eliminar un Valor (removeItem)

```typescript
/**
 * ¿Qué hace?
 * Elimina una entrada de AsyncStorage
 *
 * ¿Para qué?
 * Borrar datos que ya no se necesitan (ej: logout)
 *
 * ¿Cómo funciona?
 * Elimina la clave y su valor del almacenamiento
 */

async function deleteUsername() {
  try {
    await AsyncStorage.removeItem('username')
    console.log('Username eliminado exitosamente')
  } catch (error) {
    console.error('Error al eliminar username:', error)
  }
}

// Uso
await deleteUsername()
```

### 4. Limpiar Todo (clear)

```typescript
/**
 * ¿Qué hace?
 * Elimina TODOS los datos de AsyncStorage
 *
 * ¿Para qué?
 * Reset completo de la app (cuidado, es destructivo)
 *
 * ¿Cómo funciona?
 * Borra todas las claves y valores
 */

async function clearAllData() {
  try {
    await AsyncStorage.clear()
    console.log('Todos los datos eliminados')
  } catch (error) {
    console.error('Error al limpiar AsyncStorage:', error)
  }
}

// ⚠️ CUIDADO: Esto borra TODO
await clearAllData()
```

### 5. Obtener Todas las Claves (getAllKeys)

```typescript
/**
 * ¿Qué hace?
 * Retorna un array con todas las claves guardadas
 *
 * ¿Para qué?
 * Ver qué datos están almacenados (útil para debug)
 *
 * ¿Cómo funciona?
 * Lee el índice de claves del almacenamiento
 */

async function listAllKeys() {
  try {
    const keys = await AsyncStorage.getAllKeys()
    console.log('Claves almacenadas:', keys)
    // ['username', 'theme', 'language', ...]
    return keys
  } catch (error) {
    console.error('Error al obtener claves:', error)
    return []
  }
}
```

### 6. Operaciones Múltiples (multiGet, multiSet, multiRemove)

```typescript
/**
 * Operaciones en lote para mejor performance
 */

// Guardar múltiples valores a la vez
async function saveMultiple() {
  try {
    await AsyncStorage.multiSet([
      ['username', 'juan'],
      ['email', 'juan@example.com'],
      ['theme', 'dark'],
    ])
    console.log('Múltiples valores guardados')
  } catch (error) {
    console.error('Error:', error)
  }
}

// Leer múltiples valores a la vez
async function getMultiple() {
  try {
    const values = await AsyncStorage.multiGet(['username', 'email', 'theme'])
    console.log('Valores:', values)
    // [['username', 'juan'], ['email', 'juan@example.com'], ['theme', 'dark']]
    return values
  } catch (error) {
    console.error('Error:', error)
    return []
  }
}

// Eliminar múltiples valores
async function removeMultiple() {
  try {
    await AsyncStorage.multiRemove(['username', 'email'])
    console.log('Múltiples valores eliminados')
  } catch (error) {
    console.error('Error:', error)
  }
}
```

---

## 🗂️ Almacenar Datos Complejos

### Problema: AsyncStorage Solo Acepta Strings

AsyncStorage **solo guarda strings**. Para guardar objetos, arrays, números, etc., necesitamos **serializar** (convertir a string) y **deserializar** (convertir de string).

### Solución: JSON.stringify y JSON.parse

```typescript
/**
 * ¿Qué hace?
 * Guarda y recupera objetos complejos
 *
 * ¿Para qué?
 * Almacenar datos estructurados (objetos, arrays)
 *
 * ¿Cómo funciona?
 * JSON.stringify() convierte objeto → string
 * JSON.parse() convierte string → objeto
 */

// Definir tipo
interface User {
  id: string
  name: string
  email: string
  preferences: {
    theme: 'light' | 'dark'
    notifications: boolean
  }
}

// Guardar objeto
async function saveUser(user: User) {
  try {
    const jsonValue = JSON.stringify(user)
    await AsyncStorage.setItem('user', jsonValue)
    console.log('Usuario guardado:', user)
  } catch (error) {
    console.error('Error al guardar usuario:', error)
  }
}

// Recuperar objeto
async function getUser(): Promise<User | null> {
  try {
    const jsonValue = await AsyncStorage.getItem('user')

    if (jsonValue === null) {
      return null
    }

    const user: User = JSON.parse(jsonValue)
    console.log('Usuario recuperado:', user)
    return user
  } catch (error) {
    console.error('Error al recuperar usuario:', error)
    return null
  }
}

// Uso
const user: User = {
  id: '1',
  name: 'Juan Pérez',
  email: 'juan@example.com',
  preferences: {
    theme: 'dark',
    notifications: true,
  },
}

await saveUser(user)
const retrievedUser = await getUser()
```

### Helper Functions Reutilizables

```typescript
/**
 * storage.ts
 *
 * Funciones helper para simplificar el uso de AsyncStorage
 */

import AsyncStorage from '@react-native-async-storage/async-storage'

/**
 * Guardar cualquier tipo de dato
 */
export async function storeData<T>(key: string, value: T): Promise<void> {
  try {
    const jsonValue = JSON.stringify(value)
    await AsyncStorage.setItem(key, jsonValue)
  } catch (error) {
    console.error(`Error storing data for key "${key}":`, error)
    throw error
  }
}

/**
 * Recuperar cualquier tipo de dato
 */
export async function getData<T>(key: string): Promise<T | null> {
  try {
    const jsonValue = await AsyncStorage.getItem(key)
    return jsonValue != null ? JSON.parse(jsonValue) : null
  } catch (error) {
    console.error(`Error getting data for key "${key}":`, error)
    return null
  }
}

/**
 * Eliminar dato
 */
export async function removeData(key: string): Promise<void> {
  try {
    await AsyncStorage.removeItem(key)
  } catch (error) {
    console.error(`Error removing data for key "${key}":`, error)
    throw error
  }
}

/**
 * Limpiar todo
 */
export async function clearAll(): Promise<void> {
  try {
    await AsyncStorage.clear()
  } catch (error) {
    console.error('Error clearing AsyncStorage:', error)
    throw error
  }
}
```

### Uso de Helpers

```typescript
import { storeData, getData, removeData } from '../utils/storage'

// Guardar
await storeData('user', { name: 'Juan', age: 25 })
await storeData('settings', { theme: 'dark', notifications: true })

// Recuperar con tipos
const user = await getData<{ name: string; age: number }>('user')
const settings = await getData<{ theme: string; notifications: boolean }>(
  'settings'
)

// Eliminar
await removeData('user')
```

---

## 🚨 Manejo de Errores

### Try-Catch Siempre

```typescript
/**
 * ✅ BUENO - Manejo de errores adecuado
 */
async function saveUserSafely(user: User) {
  try {
    await storeData('user', user)
    return { success: true }
  } catch (error) {
    console.error('Failed to save user:', error)
    return { success: false, error }
  }
}

/**
 * ❌ MALO - Sin manejo de errores
 */
async function saveUserUnsafe(user: User) {
  await storeData('user', user) // ❌ Puede crashear la app
}
```

### Validación de Datos

```typescript
/**
 * ✅ Validar datos antes de guardar
 */
async function saveUserWithValidation(user: User) {
  // Validar que el usuario tenga los campos requeridos
  if (!user.id || !user.name || !user.email) {
    throw new Error('User data incomplete')
  }

  // Validar formato de email
  if (!user.email.includes('@')) {
    throw new Error('Invalid email format')
  }

  try {
    await storeData('user', user)
    return { success: true }
  } catch (error) {
    console.error('Failed to save user:', error)
    return { success: false, error }
  }
}
```

### Manejo de Datos Corruptos

```typescript
/**
 * ✅ Manejo de JSON inválido
 */
async function getUserSafely(): Promise<User | null> {
  try {
    const jsonValue = await AsyncStorage.getItem('user')

    if (jsonValue === null) {
      return null
    }

    // Intentar parsear
    const user: User = JSON.parse(jsonValue)

    // Validar estructura
    if (!user.id || !user.name) {
      console.warn('User data corrupted, clearing...')
      await AsyncStorage.removeItem('user')
      return null
    }

    return user
  } catch (error) {
    console.error('Error parsing user data:', error)
    // Datos corruptos, limpiar
    await AsyncStorage.removeItem('user')
    return null
  }
}
```

---

## 🔗 Integración con Context API

### Ejemplo Completo: AuthContext con Persistencia

```typescript
/**
 * AuthContext.tsx
 *
 * ¿Qué hace?
 * Context de autenticación con persistencia automática
 *
 * ¿Para qué?
 * Mantener sesión del usuario entre reinicios de la app
 *
 * ¿Cómo funciona?
 * 1. Al iniciar, carga user de AsyncStorage
 * 2. Al cambiar user, guarda en AsyncStorage
 * 3. Al logout, elimina de AsyncStorage
 */

import React, {
  createContext,
  useState,
  useEffect,
  useContext,
  ReactNode,
} from 'react'
import AsyncStorage from '@react-native-async-storage/async-storage'

// Tipos
interface User {
  id: string
  name: string
  email: string
  token: string
}

interface AuthContextType {
  user: User | null
  isAuthenticated: boolean
  isLoading: boolean
  login: (email: string, password: string) => Promise<void>
  logout: () => Promise<void>
}

// Claves de storage
const STORAGE_KEYS = {
  USER: '@auth:user',
  TOKEN: '@auth:token',
}

// Crear contexto
const AuthContext = createContext<AuthContextType | undefined>(undefined)

// Provider
export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<User | null>(null)
  const [isLoading, setIsLoading] = useState(true)

  // Cargar usuario al iniciar
  useEffect(() => {
    loadStoredUser()
  }, [])

  /**
   * Cargar usuario guardado de AsyncStorage
   */
  async function loadStoredUser() {
    try {
      const jsonValue = await AsyncStorage.getItem(STORAGE_KEYS.USER)

      if (jsonValue !== null) {
        const storedUser: User = JSON.parse(jsonValue)
        setUser(storedUser)
        console.log('Usuario cargado desde storage')
      }
    } catch (error) {
      console.error('Error loading stored user:', error)
    } finally {
      setIsLoading(false)
    }
  }

  /**
   * Login - Autentica y guarda en storage
   */
  async function login(email: string, password: string) {
    setIsLoading(true)

    try {
      // Simular llamada a API
      await new Promise((resolve) => setTimeout(resolve, 1000))

      // Usuario autenticado (simulado)
      const authenticatedUser: User = {
        id: '1',
        name: 'Juan Pérez',
        email,
        token: 'fake-jwt-token-' + Date.now(),
      }

      // Guardar en estado
      setUser(authenticatedUser)

      // Guardar en AsyncStorage
      await AsyncStorage.setItem(
        STORAGE_KEYS.USER,
        JSON.stringify(authenticatedUser)
      )

      console.log('Login exitoso y guardado')
    } catch (error) {
      console.error('Login failed:', error)
      throw error
    } finally {
      setIsLoading(false)
    }
  }

  /**
   * Logout - Limpia estado y storage
   */
  async function logout() {
    try {
      // Limpiar estado
      setUser(null)

      // Eliminar de AsyncStorage
      await AsyncStorage.multiRemove([STORAGE_KEYS.USER, STORAGE_KEYS.TOKEN])

      console.log('Logout exitoso')
    } catch (error) {
      console.error('Logout failed:', error)
      throw error
    }
  }

  const value: AuthContextType = {
    user,
    isAuthenticated: user !== null,
    isLoading,
    login,
    logout,
  }

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}

// Custom hook
export function useAuth() {
  const context = useContext(AuthContext)
  if (context === undefined) {
    throw new Error('useAuth must be used within AuthProvider')
  }
  return context
}
```

### Uso en Componente

```typescript
/**
 * LoginScreen.tsx
 *
 * Pantalla de login con persistencia automática
 */

import { useState } from 'react'
import { View, TextInput, Button, Text, ActivityIndicator } from 'react-native'
import { useAuth } from '../contexts/AuthContext'

export function LoginScreen() {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState('')

  const { login, isLoading } = useAuth()

  async function handleLogin() {
    try {
      setError('')
      await login(email, password)
      // Navegación automática manejada por App.tsx
    } catch (err) {
      setError('Login failed. Please try again.')
    }
  }

  if (isLoading) {
    return <ActivityIndicator size="large" />
  }

  return (
    <View>
      <TextInput
        placeholder="Email"
        value={email}
        onChangeText={setEmail}
        autoCapitalize="none"
      />
      <TextInput
        placeholder="Password"
        value={password}
        onChangeText={setPassword}
        secureTextEntry
      />
      {error ? <Text style={{ color: 'red' }}>{error}</Text> : null}
      <Button title="Login" onPress={handleLogin} />
    </View>
  )
}
```

---

## 💡 Casos de Uso Comunes

### 1. Guardar Tema (Dark/Light Mode)

```typescript
/**
 * ThemeContext con persistencia
 */

type Theme = 'light' | 'dark'

export function ThemeProvider({ children }: { children: ReactNode }) {
  const [theme, setTheme] = useState<Theme>('light')

  // Cargar tema guardado
  useEffect(() => {
    AsyncStorage.getItem('theme').then((stored) => {
      if (stored === 'light' || stored === 'dark') {
        setTheme(stored)
      }
    })
  }, [])

  // Guardar tema cuando cambia
  const toggleTheme = async () => {
    const newTheme = theme === 'light' ? 'dark' : 'light'
    setTheme(newTheme)
    await AsyncStorage.setItem('theme', newTheme)
  }

  return (
    <ThemeContext.Provider value={{ theme, toggleTheme }}>
      {children}
    </ThemeContext.Provider>
  )
}
```

### 2. Cache de Datos de API

```typescript
/**
 * Cache simple para reducir llamadas a API
 */

interface CacheEntry<T> {
  data: T
  timestamp: number
}

const CACHE_DURATION = 5 * 60 * 1000 // 5 minutos

async function fetchWithCache<T>(
  key: string,
  fetcher: () => Promise<T>
): Promise<T> {
  try {
    // Intentar obtener de cache
    const cached = await AsyncStorage.getItem(`cache:${key}`)

    if (cached) {
      const entry: CacheEntry<T> = JSON.parse(cached)
      const age = Date.now() - entry.timestamp

      // Si el cache es reciente, usar
      if (age < CACHE_DURATION) {
        console.log('Cache hit:', key)
        return entry.data
      }
    }

    // Cache miss o expirado, fetch nuevo
    console.log('Cache miss:', key)
    const data = await fetcher()

    // Guardar en cache
    const entry: CacheEntry<T> = {
      data,
      timestamp: Date.now(),
    }
    await AsyncStorage.setItem(`cache:${key}`, JSON.stringify(entry))

    return data
  } catch (error) {
    console.error('Cache error:', error)
    // Fallback: fetch directo
    return fetcher()
  }
}

// Uso
const products = await fetchWithCache('products', async () => {
  const response = await fetch('https://api.example.com/products')
  return response.json()
})
```

### 3. Onboarding Flag

```typescript
/**
 * Mostrar onboarding solo la primera vez
 */

async function hasCompletedOnboarding(): Promise<boolean> {
  try {
    const value = await AsyncStorage.getItem('onboarding_completed')
    return value === 'true'
  } catch (error) {
    return false
  }
}

async function markOnboardingComplete() {
  await AsyncStorage.setItem('onboarding_completed', 'true')
}

// En App.tsx
export default function App() {
  const [showOnboarding, setShowOnboarding] = useState(false)

  useEffect(() => {
    hasCompletedOnboarding().then((completed) => {
      setShowOnboarding(!completed)
    })
  }, [])

  if (showOnboarding) {
    return (
      <OnboardingScreen
        onComplete={() => {
          markOnboardingComplete()
          setShowOnboarding(false)
        }}
      />
    )
  }

  return <MainApp />
}
```

### 4. Favoritos del Usuario

```typescript
/**
 * Sistema de favoritos persistente
 */

async function getFavorites(): Promise<string[]> {
  try {
    const json = await AsyncStorage.getItem('favorites')
    return json ? JSON.parse(json) : []
  } catch (error) {
    return []
  }
}

async function addFavorite(itemId: string) {
  const favorites = await getFavorites()
  if (!favorites.includes(itemId)) {
    favorites.push(itemId)
    await AsyncStorage.setItem('favorites', JSON.stringify(favorites))
  }
}

async function removeFavorite(itemId: string) {
  const favorites = await getFavorites()
  const updated = favorites.filter((id) => id !== itemId)
  await AsyncStorage.setItem('favorites', JSON.stringify(updated))
}

async function isFavorite(itemId: string): Promise<boolean> {
  const favorites = await getFavorites()
  return favorites.includes(itemId)
}
```

---

## 🔄 Alternativas a AsyncStorage

### Comparación de Opciones

| Solución               | Uso                        | Encriptado | Tamaño    | Sincronización     |
| ---------------------- | -------------------------- | ---------- | --------- | ------------------ |
| **AsyncStorage**       | Preferencias, cache simple | ❌ No      | <10MB     | ❌ No              |
| **Expo SecureStore**   | Tokens, contraseñas        | ✅ Sí      | Pequeño   | ❌ No              |
| **SQLite**             | Bases de datos complejas   | ❌ No      | Grande    | ❌ No              |
| **Realm**              | Bases de datos móviles     | ✅ Sí      | Grande    | ✅ Sí (Realm Sync) |
| **MMKV**               | High-performance key-value | ✅ Sí      | Medio     | ❌ No              |
| **Firebase Firestore** | Datos en la nube           | ✅ Sí      | Ilimitado | ✅ Sí              |

### Expo SecureStore (Para Datos Sensibles)

```typescript
/**
 * Para tokens y contraseñas, usar SecureStore
 */

import * as SecureStore from 'expo-secure-store'

// Guardar token de forma segura
async function saveToken(token: string) {
  await SecureStore.setItemAsync('auth_token', token)
}

// Recuperar token
async function getToken(): Promise<string | null> {
  return await SecureStore.getItemAsync('auth_token')
}

// Eliminar token
async function deleteToken() {
  await SecureStore.deleteItemAsync('auth_token')
}
```

---

## ✅ Mejores Prácticas

### 1. Usar Constantes para Claves

```typescript
// ✅ BUENO - Constantes centralizadas
const STORAGE_KEYS = {
  USER: '@app:user',
  THEME: '@app:theme',
  LANGUAGE: '@app:language',
  TOKEN: '@app:token',
} as const

await AsyncStorage.setItem(STORAGE_KEYS.USER, data)

// ❌ MALO - Strings hardcodeados
await AsyncStorage.setItem('user', data)
await AsyncStorage.setItem('usr', data) // Typo!
```

### 2. Prefijos para Organizar

```typescript
// ✅ Usar prefijos para agrupar
const KEYS = {
  // Auth
  AUTH_USER: '@auth:user',
  AUTH_TOKEN: '@auth:token',

  // Settings
  SETTINGS_THEME: '@settings:theme',
  SETTINGS_LANG: '@settings:language',

  // Cache
  CACHE_PRODUCTS: '@cache:products',
  CACHE_CATEGORIES: '@cache:categories',
}
```

### 3. Helpers Tipados

```typescript
// ✅ Helpers con TypeScript genérico
async function storeData<T>(key: string, value: T): Promise<void> {
  const json = JSON.stringify(value)
  await AsyncStorage.setItem(key, json)
}

async function getData<T>(key: string, defaultValue: T): Promise<T> {
  const json = await AsyncStorage.getItem(key)
  return json ? JSON.parse(json) : defaultValue
}
```

### 4. No Bloquear el Render Inicial

```typescript
// ✅ BUENO - Cargar async sin bloquear
export function App() {
  const [user, setUser] = useState<User | null>(null)
  const [isReady, setIsReady] = useState(false)

  useEffect(() => {
    loadUser().then((u) => {
      setUser(u)
      setIsReady(true)
    })
  }, [])

  if (!isReady) {
    return <SplashScreen />
  }

  return user ? <AuthenticatedApp /> : <LoginScreen />
}

// ❌ MALO - Await en el render
export function App() {
  const user = await loadUser() // ❌ No se puede usar await así
  return <AppContent user={user} />
}
```

### 5. Limpiar en Logout

```typescript
// ✅ BUENO - Limpiar datos de sesión al logout
async function logout() {
  await AsyncStorage.multiRemove([
    '@auth:user',
    '@auth:token',
    '@cache:user_data',
  ])
}

// ⚠️ CUIDADO - No limpiar preferencias
// Al logout NO eliminar: theme, language, etc.
```

---

## 🐛 Troubleshooting

### Error: "Cannot read property 'setItem' of undefined"

**Causa:** AsyncStorage no instalado o no importado correctamente

```typescript
// ✅ Importación correcta
import AsyncStorage from '@react-native-async-storage/async-storage'

// ❌ Importación incorrecta
import { AsyncStorage } from 'react-native' // Deprecated!
```

### Error: "JSON Parse error"

**Causa:** Datos corruptos o no son JSON válido

```typescript
// ✅ Solución: Try-catch y validación
async function loadUser() {
  try {
    const json = await AsyncStorage.getItem('user')
    if (!json) return null

    const user = JSON.parse(json)

    // Validar estructura
    if (!user.id || !user.name) {
      throw new Error('Invalid user data')
    }

    return user
  } catch (error) {
    console.error('Error loading user:', error)
    // Limpiar datos corruptos
    await AsyncStorage.removeItem('user')
    return null
  }
}
```

### Performance Lenta

**Causa:** Guardar/leer datos muy grandes

```typescript
// ✅ Solución 1: Comprimir datos
import { compress, decompress } from 'lz-string'

async function saveLargeData(data: any) {
  const json = JSON.stringify(data)
  const compressed = compress(json)
  await AsyncStorage.setItem('large_data', compressed)
}

// ✅ Solución 2: Dividir en chunks
async function saveLargeArray(items: any[]) {
  const chunkSize = 100
  for (let i = 0; i < items.length; i += chunkSize) {
    const chunk = items.slice(i, i + chunkSize)
    await AsyncStorage.setItem(`items_chunk_${i}`, JSON.stringify(chunk))
  }
}
```

---

## ✅ Checklist de Comprensión

### Nivel Básico

- [ ] Entiendo qué es AsyncStorage
- [ ] Puedo guardar y leer strings simples
- [ ] Sé usar setItem, getItem, removeItem
- [ ] Comprendo que AsyncStorage es asíncrono
- [ ] Manejo errores con try-catch

### Nivel Intermedio

- [ ] Guardo objetos complejos con JSON.stringify/parse
- [ ] Integro AsyncStorage con Context API
- [ ] Implemento persistencia de sesión
- [ ] Uso helpers reutilizables
- [ ] Comprendo cuándo NO usar AsyncStorage

### Nivel Avanzado

- [ ] Implemento cache con expiración
- [ ] Optimizo performance con operaciones en lote
- [ ] Valido y limpio datos corruptos
- [ ] Conozco alternativas (SecureStore, SQLite)
- [ ] Implemento migraciones de datos

---

## 🎓 Resumen

### Conceptos Clave

1. **AsyncStorage** - Almacenamiento persistente key-value
2. **Asíncrono** - Usar async/await siempre
3. **Solo Strings** - Serializar objetos con JSON
4. **No Encriptado** - Usar SecureStore para datos sensibles
5. **Persistente** - Sobrevive al cierre de la app

### API Principal

```typescript
// Guardar
await AsyncStorage.setItem(key, value)

// Leer
const value = await AsyncStorage.getItem(key)

// Eliminar
await AsyncStorage.removeItem(key)

// Limpiar todo
await AsyncStorage.clear()
```

### Cuándo Usar

✅ Preferencias de usuario  
✅ Cache simple  
✅ Flags de onboarding  
✅ Favoritos

❌ Contraseñas (usar SecureStore)  
❌ Datos muy grandes (usar SQLite)  
❌ Sincronización en tiempo real (usar Firebase)

---

## 🔜 Próximo Tema

**[03. useReducer y Estado Complejo](./03-usereducer-estado-complejo.md)**

Aprenderás a gestionar estado complejo con useReducer para lógica más estructurada.

---

_Teoría 2: AsyncStorage y Persistencia - Semana 3_  
_Bootcamp React Native 2025 - EPTI_

**Tiempo estimado:** 35-40 minutos  
**Dificultad:** ⭐⭐ Intermedia
