# 📱 Fase 1: Setup y Autenticación

> **Objetivo:** Configurar el proyecto e implementar sistema de autenticación con persistencia.

---

## 🎯 Objetivos de esta Fase

- ✅ Configurar proyecto con TypeScript
- ✅ Crear estructura de carpetas
- ✅ Implementar AuthContext con persistencia
- ✅ Crear pantallas de Login y Register
- ✅ Navegación condicional según estado de auth

**Tiempo estimado:** 1-1.5 horas

---

## 📁 Paso 1: Crear Proyecto y Estructura

```bash
# Crear proyecto
pnpx create-expo-app task-manager-app --template blank-typescript
cd task-manager-app

# Instalar dependencias
pnpm add @react-native-async-storage/async-storage

# Iniciar
pnpm start
```

### Crear estructura de carpetas

```bash
mkdir -p src/{contexts,hooks,types,screens,components,utils}
```

---

## 📝 Paso 2: Definir Tipos de Auth

**Archivo:** `src/types/auth.ts`

```typescript
export interface User {
  id: string
  email: string
  name: string
  createdAt: Date
}

export interface AuthContextType {
  user: User | null
  isLoading: boolean
  isAuthenticated: boolean
  login: (email: string, password: string) => Promise<void>
  register: (name: string, email: string, password: string) => Promise<void>
  logout: () => Promise<void>
}
```

---

## 🔧 Paso 3: Utility para Storage

**Archivo:** `src/utils/storage.ts`

```typescript
import AsyncStorage from '@react-native-async-storage/async-storage'

export const STORAGE_KEYS = {
  USER: '@task_manager_user',
  TOKEN: '@task_manager_token',
  TASKS: '@task_manager_tasks',
  THEME: '@task_manager_theme',
} as const

/**
 * Guardar dato en AsyncStorage
 */
export async function saveData<T>(key: string, data: T): Promise<void> {
  try {
    await AsyncStorage.setItem(key, JSON.stringify(data))
  } catch (error) {
    console.error('Error saving data:', error)
    throw error
  }
}

/**
 * Obtener dato de AsyncStorage
 */
export async function getData<T>(key: string): Promise<T | null> {
  try {
    const data = await AsyncStorage.getItem(key)
    return data ? JSON.parse(data) : null
  } catch (error) {
    console.error('Error getting data:', error)
    return null
  }
}

/**
 * Eliminar dato de AsyncStorage
 */
export async function removeData(key: string): Promise<void> {
  try {
    await AsyncStorage.removeItem(key)
  } catch (error) {
    console.error('Error removing data:', error)
    throw error
  }
}

/**
 * Limpiar todo AsyncStorage
 */
export async function clearAll(): Promise<void> {
  try {
    await AsyncStorage.clear()
  } catch (error) {
    console.error('Error clearing storage:', error)
    throw error
  }
}
```

---

## 🎨 Paso 4: AuthContext

**Archivo:** `src/contexts/AuthContext.tsx`

```typescript
import React, { createContext, useState, useEffect, ReactNode } from 'react'
import { User, AuthContextType } from '../types/auth'
import { STORAGE_KEYS, saveData, getData, removeData } from '../utils/storage'

export const AuthContext = createContext<AuthContextType | undefined>(undefined)

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<User | null>(null)
  const [isLoading, setIsLoading] = useState(true)

  // Cargar usuario al iniciar
  useEffect(() => {
    loadUser()
  }, [])

  async function loadUser() {
    try {
      const storedUser = await getData<User>(STORAGE_KEYS.USER)
      if (storedUser) {
        setUser(storedUser)
      }
    } catch (error) {
      console.error('Error loading user:', error)
    } finally {
      setIsLoading(false)
    }
  }

  async function register(name: string, email: string, password: string) {
    setIsLoading(true)

    try {
      // Validaciones
      if (!name || !email || !password) {
        throw new Error('Todos los campos son requeridos')
      }

      if (password.length < 6) {
        throw new Error('Password debe tener al menos 6 caracteres')
      }

      // Simular registro (en producción: API call)
      await new Promise((resolve) => setTimeout(resolve, 1000))

      const newUser: User = {
        id: Date.now().toString(),
        email,
        name,
        createdAt: new Date(),
      }

      // Guardar en storage
      await saveData(STORAGE_KEYS.USER, newUser)
      await saveData(STORAGE_KEYS.TOKEN, 'fake-token-' + newUser.id)

      setUser(newUser)
    } catch (error) {
      throw error
    } finally {
      setIsLoading(false)
    }
  }

  async function login(email: string, password: string) {
    setIsLoading(true)

    try {
      // Validaciones
      if (!email || !password) {
        throw new Error('Email y password son requeridos')
      }

      // Simular login (en producción: API call)
      await new Promise((resolve) => setTimeout(resolve, 1000))

      // Por ahora, aceptar cualquier login
      const loggedUser: User = {
        id: Date.now().toString(),
        email,
        name: email.split('@')[0],
        createdAt: new Date(),
      }

      // Guardar en storage
      await saveData(STORAGE_KEYS.USER, loggedUser)
      await saveData(STORAGE_KEYS.TOKEN, 'fake-token-' + loggedUser.id)

      setUser(loggedUser)
    } catch (error) {
      throw error
    } finally {
      setIsLoading(false)
    }
  }

  async function logout() {
    try {
      // Limpiar storage (excepto tareas y preferencias)
      await removeData(STORAGE_KEYS.USER)
      await removeData(STORAGE_KEYS.TOKEN)

      setUser(null)
    } catch (error) {
      console.error('Error logging out:', error)
    }
  }

  const value: AuthContextType = {
    user,
    isLoading,
    isAuthenticated: user !== null,
    register,
    login,
    logout,
  }

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}
```

---

## 🪝 Paso 5: Custom Hook useAuth

**Archivo:** `src/hooks/useAuth.ts`

```typescript
import { useContext } from 'react'
import { AuthContext } from '../contexts/AuthContext'

export function useAuth() {
  const context = useContext(AuthContext)

  if (!context) {
    throw new Error('useAuth must be used within AuthProvider')
  }

  return context
}
```

---

## 📱 Paso 6: LoginScreen

**Archivo:** `src/screens/LoginScreen.tsx`

```typescript
import React, { useState } from 'react'
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  StyleSheet,
  Alert,
  ActivityIndicator,
  KeyboardAvoidingView,
  Platform,
} from 'react-native'
import { useAuth } from '../hooks/useAuth'

interface LoginScreenProps {
  onSwitchToRegister: () => void
}

export function LoginScreen({ onSwitchToRegister }: LoginScreenProps) {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const { login, isLoading } = useAuth()

  const handleLogin = async () => {
    try {
      await login(email, password)
    } catch (error: any) {
      Alert.alert('Error', error.message)
    }
  }

  return (
    <KeyboardAvoidingView
      behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
      style={styles.container}
    >
      <View style={styles.content}>
        <Text style={styles.title}>✅ Task Manager</Text>
        <Text style={styles.subtitle}>Inicia sesión para continuar</Text>

        <TextInput
          style={styles.input}
          placeholder="Email"
          value={email}
          onChangeText={setEmail}
          autoCapitalize="none"
          keyboardType="email-address"
          editable={!isLoading}
        />

        <TextInput
          style={styles.input}
          placeholder="Password"
          value={password}
          onChangeText={setPassword}
          secureTextEntry
          editable={!isLoading}
        />

        <TouchableOpacity
          style={[styles.button, isLoading && styles.buttonDisabled]}
          onPress={handleLogin}
          disabled={isLoading}
        >
          {isLoading ? (
            <ActivityIndicator color="#fff" />
          ) : (
            <Text style={styles.buttonText}>Iniciar Sesión</Text>
          )}
        </TouchableOpacity>

        <TouchableOpacity
          style={styles.linkButton}
          onPress={onSwitchToRegister}
          disabled={isLoading}
        >
          <Text style={styles.linkText}>
            ¿No tienes cuenta? <Text style={styles.linkBold}>Regístrate</Text>
          </Text>
        </TouchableOpacity>
      </View>
    </KeyboardAvoidingView>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  content: {
    flex: 1,
    justifyContent: 'center',
    padding: 24,
  },
  title: {
    fontSize: 36,
    fontWeight: 'bold',
    textAlign: 'center',
    marginBottom: 8,
    color: '#007AFF',
  },
  subtitle: {
    fontSize: 16,
    textAlign: 'center',
    color: '#666',
    marginBottom: 40,
  },
  input: {
    backgroundColor: '#fff',
    padding: 16,
    borderRadius: 12,
    marginBottom: 16,
    fontSize: 16,
    borderWidth: 1,
    borderColor: '#e0e0e0',
  },
  button: {
    backgroundColor: '#007AFF',
    padding: 16,
    borderRadius: 12,
    alignItems: 'center',
    marginTop: 8,
  },
  buttonDisabled: {
    opacity: 0.6,
  },
  buttonText: {
    color: '#fff',
    fontSize: 18,
    fontWeight: '600',
  },
  linkButton: {
    marginTop: 24,
    alignItems: 'center',
  },
  linkText: {
    fontSize: 14,
    color: '#666',
  },
  linkBold: {
    fontWeight: '600',
    color: '#007AFF',
  },
})
```

---

## 📝 Paso 7: RegisterScreen

**Archivo:** `src/screens/RegisterScreen.tsx`

```typescript
import React, { useState } from 'react'
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  StyleSheet,
  Alert,
  ActivityIndicator,
  KeyboardAvoidingView,
  Platform,
} from 'react-native'
import { useAuth } from '../hooks/useAuth'

interface RegisterScreenProps {
  onSwitchToLogin: () => void
}

export function RegisterScreen({ onSwitchToLogin }: RegisterScreenProps) {
  const [name, setName] = useState('')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const { register, isLoading } = useAuth()

  const handleRegister = async () => {
    try {
      await register(name, email, password)
    } catch (error: any) {
      Alert.alert('Error', error.message)
    }
  }

  return (
    <KeyboardAvoidingView
      behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
      style={styles.container}
    >
      <View style={styles.content}>
        <Text style={styles.title}>✨ Crear Cuenta</Text>
        <Text style={styles.subtitle}>Regístrate para comenzar</Text>

        <TextInput
          style={styles.input}
          placeholder="Nombre"
          value={name}
          onChangeText={setName}
          editable={!isLoading}
        />

        <TextInput
          style={styles.input}
          placeholder="Email"
          value={email}
          onChangeText={setEmail}
          autoCapitalize="none"
          keyboardType="email-address"
          editable={!isLoading}
        />

        <TextInput
          style={styles.input}
          placeholder="Password (mínimo 6 caracteres)"
          value={password}
          onChangeText={setPassword}
          secureTextEntry
          editable={!isLoading}
        />

        <TouchableOpacity
          style={[styles.button, isLoading && styles.buttonDisabled]}
          onPress={handleRegister}
          disabled={isLoading}
        >
          {isLoading ? (
            <ActivityIndicator color="#fff" />
          ) : (
            <Text style={styles.buttonText}>Crear Cuenta</Text>
          )}
        </TouchableOpacity>

        <TouchableOpacity
          style={styles.linkButton}
          onPress={onSwitchToLogin}
          disabled={isLoading}
        >
          <Text style={styles.linkText}>
            ¿Ya tienes cuenta?{' '}
            <Text style={styles.linkBold}>Inicia sesión</Text>
          </Text>
        </TouchableOpacity>
      </View>
    </KeyboardAvoidingView>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  content: {
    flex: 1,
    justifyContent: 'center',
    padding: 24,
  },
  title: {
    fontSize: 36,
    fontWeight: 'bold',
    textAlign: 'center',
    marginBottom: 8,
    color: '#007AFF',
  },
  subtitle: {
    fontSize: 16,
    textAlign: 'center',
    color: '#666',
    marginBottom: 40,
  },
  input: {
    backgroundColor: '#fff',
    padding: 16,
    borderRadius: 12,
    marginBottom: 16,
    fontSize: 16,
    borderWidth: 1,
    borderColor: '#e0e0e0',
  },
  button: {
    backgroundColor: '#007AFF',
    padding: 16,
    borderRadius: 12,
    alignItems: 'center',
    marginTop: 8,
  },
  buttonDisabled: {
    opacity: 0.6,
  },
  buttonText: {
    color: '#fff',
    fontSize: 18,
    fontWeight: '600',
  },
  linkButton: {
    marginTop: 24,
    alignItems: 'center',
  },
  linkText: {
    fontSize: 14,
    color: '#666',
  },
  linkBold: {
    fontWeight: '600',
    color: '#007AFF',
  },
})
```

---

## 🏠 Paso 8: HomeScreen (Temporal)

**Archivo:** `src/screens/HomeScreen.tsx`

```typescript
import React from 'react'
import {
  View,
  Text,
  TouchableOpacity,
  StyleSheet,
  SafeAreaView,
} from 'react-native'
import { useAuth } from '../hooks/useAuth'

export function HomeScreen() {
  const { user, logout } = useAuth()

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.header}>
        <Text style={styles.welcome}>👋 Hola, {user?.name}!</Text>
        <TouchableOpacity style={styles.logoutButton} onPress={logout}>
          <Text style={styles.logoutText}>Salir</Text>
        </TouchableOpacity>
      </View>

      <View style={styles.content}>
        <Text style={styles.title}>✅ Task Manager</Text>
        <Text style={styles.subtitle}>
          Fase 1 completa: Autenticación funcionando
        </Text>
        <Text style={styles.info}>
          En la siguiente fase implementaremos{'\n'}
          la gestión de tareas con useReducer
        </Text>
      </View>
    </SafeAreaView>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: 16,
    backgroundColor: '#fff',
    borderBottomWidth: 1,
    borderBottomColor: '#e0e0e0',
  },
  welcome: {
    fontSize: 18,
    fontWeight: '600',
  },
  logoutButton: {
    paddingHorizontal: 16,
    paddingVertical: 8,
    backgroundColor: '#FF3B30',
    borderRadius: 8,
  },
  logoutText: {
    color: '#fff',
    fontWeight: '600',
  },
  content: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 24,
  },
  title: {
    fontSize: 48,
    marginBottom: 16,
  },
  subtitle: {
    fontSize: 20,
    fontWeight: '600',
    textAlign: 'center',
    marginBottom: 24,
    color: '#34C759',
  },
  info: {
    fontSize: 16,
    color: '#666',
    textAlign: 'center',
    lineHeight: 24,
  },
})
```

---

## 🚀 Paso 9: App.tsx Principal

**Archivo:** `App.tsx`

```typescript
import React, { useState } from 'react'
import { ActivityIndicator, View, StyleSheet, StatusBar } from 'react-native'
import { AuthProvider, useAuth } from './src/contexts/AuthContext'
import { LoginScreen } from './src/screens/LoginScreen'
import { RegisterScreen } from './src/screens/RegisterScreen'
import { HomeScreen } from './src/screens/HomeScreen'

function AppContent() {
  const { isAuthenticated, isLoading } = useAuth()
  const [showRegister, setShowRegister] = useState(false)

  if (isLoading) {
    return (
      <View style={styles.loading}>
        <ActivityIndicator size="large" color="#007AFF" />
      </View>
    )
  }

  if (!isAuthenticated) {
    return showRegister ? (
      <RegisterScreen onSwitchToLogin={() => setShowRegister(false)} />
    ) : (
      <LoginScreen onSwitchToRegister={() => setShowRegister(true)} />
    )
  }

  return <HomeScreen />
}

export default function App() {
  return (
    <AuthProvider>
      <StatusBar barStyle="dark-content" />
      <AppContent />
    </AuthProvider>
  )
}

const styles = StyleSheet.create({
  loading: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#f5f5f5',
  },
})
```

---

## ✅ Paso 10: Probar la Fase 1

```bash
pnpm start
```

### Verificaciones:

1. **Registro:**

   - [ ] Crear cuenta con nombre, email, password
   - [ ] Validación de campos funciona
   - [ ] Redirecciona a HomeScreen

2. **Persistencia:**

   - [ ] Cerrar la app completamente
   - [ ] Reabrir
   - [ ] Deberías seguir autenticado

3. **Logout:**

   - [ ] Cerrar sesión funciona
   - [ ] Vuelve a LoginScreen
   - [ ] Datos se borran correctamente

4. **Login:**
   - [ ] Hacer login con credenciales
   - [ ] Entrar a HomeScreen

---

## 📊 Checklist de Fase 1

- [ ] Proyecto creado y configurado
- [ ] Estructura de carpetas completa
- [ ] Tipos TypeScript definidos
- [ ] Utility storage implementado
- [ ] AuthContext funcionando
- [ ] Custom hook useAuth creado
- [ ] LoginScreen operativo
- [ ] RegisterScreen operativo
- [ ] HomeScreen básico
- [ ] Navegación condicional funciona
- [ ] Persistencia con AsyncStorage probada
- [ ] Loading states implementados
- [ ] Validaciones de inputs
- [ ] Sin errores de TypeScript

---

## 🎓 Conceptos Aplicados

✅ **Context API** - AuthContext para estado global  
✅ **AsyncStorage** - Persistencia de usuario  
✅ **Custom Hooks** - useAuth para API limpia  
✅ **TypeScript** - Tipado completo  
✅ **useState/useEffect** - Gestión de estado y efectos  
✅ **Navegación condicional** - Login/Home según auth

---

## 🔜 Siguiente Fase

**➡️ [Fase 2: Task Context y CRUD Básico](./FASE-2-TASK-CONTEXT.md)**

Implementarás la gestión de tareas con useReducer.

---

_Fase 1: Setup y Autenticación - Proyecto Integrador_  
_Semana 3 - Bootcamp React Native 2025 - EPTI_
