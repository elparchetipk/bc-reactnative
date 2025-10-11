# 🔐 Práctica 3: Auth con Persistencia

> **Objetivo:** Implementar autenticación con Context API y AsyncStorage para persistir la sesión.

---

## 🎯 Objetivos de Aprendizaje

- ✅ Combinar **Context API + AsyncStorage**
- ✅ Implementar **login/logout** con persistencia
- ✅ Crear **rutas protegidas**
- ✅ Manejar **estados de carga** (loading)

---

## 📚 Requisitos Previos

- [ ] Haber completado las prácticas 1 y 2
- [ ] Comprender Context API y AsyncStorage
- [ ] Instalar AsyncStorage: `pnpm add @react-native-async-storage/async-storage`

---

## 🏗️ Estructura del Proyecto

```
auth-app/
├── App.tsx
└── src/
    ├── contexts/
    │   └── AuthContext.tsx
    ├── screens/
    │   ├── LoginScreen.tsx
    │   └── HomeScreen.tsx
    └── types/
        └── auth.ts
```

---

## 📝 Paso 1: Tipos

**Archivo:** `src/types/auth.ts`

```typescript
export interface User {
  id: string
  email: string
  name: string
}

export interface AuthContextType {
  user: User | null
  isLoading: boolean
  isAuthenticated: boolean
  login: (email: string, password: string) => Promise<void>
  logout: () => Promise<void>
}
```

---

## 🔧 Paso 2: AuthContext con Persistencia

**Archivo:** `src/contexts/AuthContext.tsx`

```typescript
import React, {
  createContext,
  useState,
  useEffect,
  useContext,
  ReactNode,
} from 'react'
import AsyncStorage from '@react-native-async-storage/async-storage'
import { User, AuthContextType } from '../types/auth'

const AuthContext = createContext<AuthContextType | undefined>(undefined)

const STORAGE_KEYS = {
  USER: '@auth_user',
  TOKEN: '@auth_token',
}

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<User | null>(null)
  const [isLoading, setIsLoading] = useState(true)

  // Cargar usuario al iniciar
  useEffect(() => {
    loadStoredUser()
  }, [])

  async function loadStoredUser() {
    try {
      const [storedUser, storedToken] = await Promise.all([
        AsyncStorage.getItem(STORAGE_KEYS.USER),
        AsyncStorage.getItem(STORAGE_KEYS.TOKEN),
      ])

      if (storedUser && storedToken) {
        setUser(JSON.parse(storedUser))
      }
    } catch (error) {
      console.error('Error loading user:', error)
    } finally {
      setIsLoading(false)
    }
  }

  async function login(email: string, password: string) {
    setIsLoading(true)

    try {
      // Simular API call (en producción: llamar API real)
      await new Promise((resolve) => setTimeout(resolve, 1000))

      // Validación simple (en producción: validar con backend)
      if (password !== 'password123') {
        throw new Error('Credenciales inválidas')
      }

      const newUser: User = {
        id: '1',
        email,
        name: email.split('@')[0],
      }

      const token = 'fake-jwt-token-' + Date.now()

      // Guardar en AsyncStorage
      await Promise.all([
        AsyncStorage.setItem(STORAGE_KEYS.USER, JSON.stringify(newUser)),
        AsyncStorage.setItem(STORAGE_KEYS.TOKEN, token),
      ])

      setUser(newUser)
    } catch (error) {
      throw error
    } finally {
      setIsLoading(false)
    }
  }

  async function logout() {
    try {
      // Limpiar AsyncStorage
      await Promise.all([
        AsyncStorage.removeItem(STORAGE_KEYS.USER),
        AsyncStorage.removeItem(STORAGE_KEYS.TOKEN),
      ])

      setUser(null)
    } catch (error) {
      console.error('Error logging out:', error)
    }
  }

  const value: AuthContextType = {
    user,
    isLoading,
    isAuthenticated: user !== null,
    login,
    logout,
  }

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}

// Custom hook
export function useAuth() {
  const context = useContext(AuthContext)
  if (!context) {
    throw new Error('useAuth must be used within AuthProvider')
  }
  return context
}
```

**💡 Puntos clave:**

- Carga automática del usuario al iniciar
- Persistencia con AsyncStorage
- Estado de loading para mejor UX
- Simulación de API (reemplazar con API real en producción)

---

## 📱 Paso 3: LoginScreen

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
} from 'react-native'
import { useAuth } from '../contexts/AuthContext'

export function LoginScreen() {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const { login, isLoading } = useAuth()

  const handleLogin = async () => {
    if (!email || !password) {
      Alert.alert('Error', 'Por favor completa todos los campos')
      return
    }

    try {
      await login(email, password)
    } catch (error) {
      Alert.alert('Error', error.message || 'Error al iniciar sesión')
    }
  }

  return (
    <View style={styles.container}>
      <Text style={styles.title}>🔐 Login</Text>
      <Text style={styles.subtitle}>Bienvenido de vuelta</Text>

      <TextInput
        style={styles.input}
        placeholder="Email"
        value={email}
        onChangeText={setEmail}
        autoCapitalize="none"
        keyboardType="email-address"
      />

      <TextInput
        style={styles.input}
        placeholder="Password"
        value={password}
        onChangeText={setPassword}
        secureTextEntry
      />

      <TouchableOpacity
        style={styles.button}
        onPress={handleLogin}
        disabled={isLoading}
      >
        {isLoading ? (
          <ActivityIndicator color="#fff" />
        ) : (
          <Text style={styles.buttonText}>Iniciar Sesión</Text>
        )}
      </TouchableOpacity>

      <Text style={styles.hint}>
        💡 Usa cualquier email y password: "password123"
      </Text>
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    padding: 24,
    backgroundColor: '#f5f5f5',
  },
  title: {
    fontSize: 32,
    fontWeight: 'bold',
    textAlign: 'center',
    marginBottom: 8,
  },
  subtitle: {
    fontSize: 16,
    textAlign: 'center',
    color: '#666',
    marginBottom: 32,
  },
  input: {
    backgroundColor: '#fff',
    padding: 16,
    borderRadius: 8,
    marginBottom: 16,
    fontSize: 16,
    borderWidth: 1,
    borderColor: '#ddd',
  },
  button: {
    backgroundColor: '#007AFF',
    padding: 16,
    borderRadius: 8,
    alignItems: 'center',
    marginTop: 8,
  },
  buttonText: {
    color: '#fff',
    fontSize: 18,
    fontWeight: '600',
  },
  hint: {
    marginTop: 24,
    textAlign: 'center',
    color: '#666',
    fontSize: 14,
  },
})
```

---

## 🏠 Paso 4: HomeScreen

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
import { useAuth } from '../contexts/AuthContext'

export function HomeScreen() {
  const { user, logout } = useAuth()

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.content}>
        <Text style={styles.welcome}>👋 Hola!</Text>
        <Text style={styles.name}>{user?.name}</Text>
        <Text style={styles.email}>{user?.email}</Text>

        <View style={styles.card}>
          <Text style={styles.cardTitle}>✅ Sesión activa</Text>
          <Text style={styles.cardText}>
            Tu sesión se guardó automáticamente.
            {'\n'}Puedes cerrar la app y seguirás autenticado.
          </Text>
        </View>

        <TouchableOpacity style={styles.logoutButton} onPress={logout}>
          <Text style={styles.logoutText}>Cerrar Sesión</Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  content: {
    flex: 1,
    padding: 24,
    justifyContent: 'center',
  },
  welcome: {
    fontSize: 48,
    textAlign: 'center',
    marginBottom: 16,
  },
  name: {
    fontSize: 28,
    fontWeight: 'bold',
    textAlign: 'center',
    marginBottom: 8,
  },
  email: {
    fontSize: 16,
    color: '#666',
    textAlign: 'center',
    marginBottom: 32,
  },
  card: {
    backgroundColor: '#fff',
    padding: 20,
    borderRadius: 12,
    marginBottom: 32,
    borderLeftWidth: 4,
    borderLeftColor: '#34C759',
  },
  cardTitle: {
    fontSize: 18,
    fontWeight: '600',
    marginBottom: 8,
  },
  cardText: {
    fontSize: 14,
    color: '#666',
    lineHeight: 20,
  },
  logoutButton: {
    backgroundColor: '#FF3B30',
    padding: 16,
    borderRadius: 8,
    alignItems: 'center',
  },
  logoutText: {
    color: '#fff',
    fontSize: 18,
    fontWeight: '600',
  },
})
```

---

## 🚀 Paso 5: App.tsx

```typescript
import React from 'react'
import { ActivityIndicator, View, StyleSheet } from 'react-native'
import { AuthProvider, useAuth } from './src/contexts/AuthContext'
import { LoginScreen } from './src/screens/LoginScreen'
import { HomeScreen } from './src/screens/HomeScreen'

function AppContent() {
  const { isAuthenticated, isLoading } = useAuth()

  if (isLoading) {
    return (
      <View style={styles.loading}>
        <ActivityIndicator size="large" color="#007AFF" />
      </View>
    )
  }

  return isAuthenticated ? <HomeScreen /> : <LoginScreen />
}

export default function App() {
  return (
    <AuthProvider>
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

**💡 Navegación condicional:**

- Muestra `LoginScreen` si no está autenticado
- Muestra `HomeScreen` si está autenticado
- Muestra loading mientras verifica la sesión

---

## ✅ Probar la Aplicación

```bash
pnpm start
```

### Flujo de prueba:

1. **Primera vez:**

   - [ ] Ingresa cualquier email
   - [ ] Password: `password123`
   - [ ] Verifica que entras a HomeScreen

2. **Persistencia:**

   - [ ] Cierra la app completamente
   - [ ] Vuelve a abrirla
   - [ ] ✅ Deberías seguir autenticado

3. **Logout:**
   - [ ] Toca "Cerrar Sesión"
   - [ ] Verifica que vuelves a LoginScreen
   - [ ] Cierra y abre la app
   - [ ] ✅ Deberías ver LoginScreen

---

## 🎯 Desafíos Adicionales

### 1. Token Expiration

Implementa expiración de tokens:

```typescript
const tokenData = {
  token: 'jwt-token',
  expiresAt: Date.now() + 24 * 60 * 60 * 1000, // 24 horas
}
```

### 2. Refresh Token

Implementa renovación automática de tokens

### 3. Biometric Auth

Integra autenticación biométrica con expo-local-authentication

---

## 📊 Criterios de Evaluación

| Criterio                 | Puntos     |
| ------------------------ | ---------- |
| Context implementado     | 4 pts      |
| AsyncStorage funcionando | 4 pts      |
| Login/Logout funcional   | 4 pts      |
| Persistencia correcta    | 4 pts      |
| Estados de loading       | 2 pts      |
| UI limpia                | 2 pts      |
| **TOTAL**                | **20 pts** |

---

## 💡 Conceptos Clave

- ✅ **Context API** para estado global
- ✅ **AsyncStorage** para persistencia
- ✅ **Loading states** para mejor UX
- ✅ **Protected routes** con navegación condicional
- ✅ **useEffect** para cargar datos al iniciar

---

## 🔜 Siguiente Paso

**[README de Prácticas](./README.md)**

Revisa el resumen de las 3 prácticas completadas.

---

_Práctica 3: Auth con Persistencia - Semana 3_  
_Bootcamp React Native 2025 - EPTI_

**Tiempo estimado:** 1-1.5 horas  
**Dificultad:** ⭐⭐ Intermedio
