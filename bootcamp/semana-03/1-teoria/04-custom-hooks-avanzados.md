# 🎣 Custom Hooks Avanzados

> **Aprende a crear hooks reutilizables** para encapsular lógica compleja y mejorar la composición de tu código.

---

## 🎯 Objetivos de Aprendizaje

Al finalizar este tema, serás capaz de:

- [ ] **Comprender** qué son los custom hooks y por qué son útiles
- [ ] **Crear** hooks personalizados reutilizables
- [ ] **Encapsular** lógica compleja en hooks
- [ ] **Componer** múltiples hooks
- [ ] **Optimizar** performance con hooks
- [ ] **Aplicar** patrones avanzados de hooks
- [ ] **Testear** custom hooks

---

## 📚 Índice

1. [¿Qué son los Custom Hooks?](#qué-son-los-custom-hooks)
2. [Reglas de los Hooks](#reglas-de-los-hooks)
3. [Hooks Básicos Útiles](#hooks-básicos-útiles)
4. [Hooks para Data Fetching](#hooks-para-data-fetching)
5. [Hooks para Formularios](#hooks-para-formularios)
6. [Hooks para Performance](#hooks-para-performance)
7. [Hooks para React Native](#hooks-para-react-native)
8. [Composición de Hooks](#composición-de-hooks)
9. [Testing de Custom Hooks](#testing-de-custom-hooks)
10. [Librería de Hooks Útiles](#librería-de-hooks-útiles)

---

## 🤔 ¿Qué son los Custom Hooks?

### Definición

**Custom Hooks** son funciones de JavaScript que usan hooks de React y permiten **extraer y reutilizar lógica con estado** entre componentes.

### Regla de Oro

```typescript
/**
 * ✅ Un custom hook es simplemente una función que:
 *
 * 1. Su nombre empieza con "use" (convención obligatoria)
 * 2. Puede llamar a otros hooks
 * 3. Retorna lo que necesites (valores, funciones, objetos)
 */

function useCustomHook() {
  // Puede usar hooks aquí
  const [state, setState] = useState(...)
  useEffect(() => { ... }, [])

  // Retornar lo que necesites
  return { state, setState }
}
```

### Ventajas

✅ **Reutilización** - Usa la misma lógica en múltiples componentes  
✅ **Separación de concerns** - Componentes más limpios  
✅ **Testeable** - Lógica separada es más fácil de testear  
✅ **Composición** - Combina múltiples hooks  
✅ **Mantenible** - Un lugar para cambiar lógica

### ¿Cuándo crear un Custom Hook?

✅ **Crea un custom hook cuando:**

- La misma lógica se repite en múltiples componentes
- Un componente tiene demasiada lógica compleja
- Necesitas compartir estado/efectos
- Quieres encapsular interacciones con APIs externas

❌ **NO necesitas un custom hook cuando:**

- La lógica es única para un componente
- Es solo una función helper sin estado (usa funciones normales)
- La lógica es muy simple

---

## 📏 Reglas de los Hooks

### Reglas Fundamentales

```typescript
/**
 * 1. Solo llamar hooks en el nivel superior
 *    ❌ NO dentro de loops, condiciones o funciones anidadas
 */

// ❌ MALO
function Component() {
  if (condition) {
    const [state, setState] = useState(0) // ❌ Dentro de condición
  }

  for (let i = 0; i < 10; i++) {
    useEffect(() => {}) // ❌ Dentro de loop
  }
}

// ✅ BUENO
function Component() {
  const [state, setState] = useState(0)

  useEffect(() => {
    if (condition) {
      // Condición DENTRO del hook
    }
  }, [condition])
}

/**
 * 2. Solo llamar hooks desde:
 *    - Componentes de React
 *    - Custom Hooks
 */

// ❌ MALO
function regularFunction() {
  const [state, setState] = useState(0) // ❌ No es componente ni hook
}

// ✅ BUENO
function useCustomHook() {
  const [state, setState] = useState(0) // ✅ Es un custom hook
  return state
}

function Component() {
  const value = useCustomHook() // ✅ Es un componente
}
```

### Convención de Nombres

```typescript
// ✅ BUENO - Empieza con "use"
function useCounter() {}
function useFetch() {}
function useAuth() {}

// ❌ MALO - No empieza con "use"
function counter() {} // React no lo detectará como hook
function fetchData() {}
```

---

## 🔧 Hooks Básicos Útiles

### 1. useToggle - Toggle booleano

```typescript
/**
 * useToggle.ts
 *
 * ¿Qué hace?
 * Simplifica el manejo de valores booleanos on/off
 *
 * ¿Para qué?
 * Modales, sidebars, switches, cualquier toggle
 *
 * ¿Cómo funciona?
 * Encapsula useState con funciones helper
 */

import { useState, useCallback } from 'react'

export function useToggle(initialValue: boolean = false) {
  const [value, setValue] = useState(initialValue)

  // Memoizar funciones con useCallback
  const toggle = useCallback(() => {
    setValue((v) => !v)
  }, [])

  const setTrue = useCallback(() => {
    setValue(true)
  }, [])

  const setFalse = useCallback(() => {
    setValue(false)
  }, [])

  return {
    value,
    toggle,
    setTrue,
    setFalse,
    setValue,
  }
}

// Uso
function ModalExample() {
  const modal = useToggle(false)

  return (
    <>
      <Button title="Open" onPress={modal.setTrue} />
      <Modal visible={modal.value} onClose={modal.setFalse}>
        <Text>Modal Content</Text>
        <Button title="Toggle" onPress={modal.toggle} />
      </Modal>
    </>
  )
}
```

### 2. useLocalStorage - Persistencia automática

```typescript
/**
 * useLocalStorage.ts
 *
 * ¿Qué hace?
 * useState con persistencia automática en AsyncStorage
 *
 * ¿Para qué?
 * Estado que debe persistir entre sesiones
 */

import { useState, useEffect } from 'react'
import AsyncStorage from '@react-native-async-storage/async-storage'

export function useLocalStorage<T>(
  key: string,
  initialValue: T
): [T, (value: T) => void, boolean] {
  const [storedValue, setStoredValue] = useState<T>(initialValue)
  const [isLoading, setIsLoading] = useState(true)

  // Cargar valor inicial de AsyncStorage
  useEffect(() => {
    async function loadValue() {
      try {
        const item = await AsyncStorage.getItem(key)
        if (item !== null) {
          setStoredValue(JSON.parse(item))
        }
      } catch (error) {
        console.error('Error loading from storage:', error)
      } finally {
        setIsLoading(false)
      }
    }

    loadValue()
  }, [key])

  // Función para actualizar valor
  const setValue = async (value: T) => {
    try {
      setStoredValue(value)
      await AsyncStorage.setItem(key, JSON.stringify(value))
    } catch (error) {
      console.error('Error saving to storage:', error)
    }
  }

  return [storedValue, setValue, isLoading]
}

// Uso
function SettingsScreen() {
  const [theme, setTheme, isLoading] = useLocalStorage<'light' | 'dark'>(
    'theme',
    'light'
  )

  if (isLoading) {
    return <ActivityIndicator />
  }

  return (
    <View>
      <Text>Current theme: {theme}</Text>
      <Button
        title="Toggle Theme"
        onPress={() => setTheme(theme === 'light' ? 'dark' : 'light')}
      />
    </View>
  )
}
```

### 3. useDebounce - Retrasar actualizaciones

```typescript
/**
 * useDebounce.ts
 *
 * ¿Qué hace?
 * Retrasa la actualización de un valor
 *
 * ¿Para qué?
 * Búsquedas, validaciones, reducir llamadas a API
 *
 * ¿Cómo funciona?
 * Retorna el valor después de X milisegundos sin cambios
 */

import { useState, useEffect } from 'react'

export function useDebounce<T>(value: T, delay: number = 500): T {
  const [debouncedValue, setDebouncedValue] = useState<T>(value)

  useEffect(() => {
    // Crear timer
    const timer = setTimeout(() => {
      setDebouncedValue(value)
    }, delay)

    // Limpiar timer si value cambia antes del delay
    return () => {
      clearTimeout(timer)
    }
  }, [value, delay])

  return debouncedValue
}

// Uso: Búsqueda con debounce
function SearchScreen() {
  const [searchTerm, setSearchTerm] = useState('')
  const debouncedSearch = useDebounce(searchTerm, 300)
  const [results, setResults] = useState([])

  // Solo buscar cuando debouncedSearch cambia
  useEffect(() => {
    if (debouncedSearch) {
      searchAPI(debouncedSearch).then(setResults)
    }
  }, [debouncedSearch])

  return (
    <View>
      <TextInput
        value={searchTerm}
        onChangeText={setSearchTerm}
        placeholder="Search..."
      />
      <Text>Searching for: {debouncedSearch}</Text>
      <FlatList data={results} ... />
    </View>
  )
}
```

### 4. usePrevious - Valor anterior

```typescript
/**
 * usePrevious.ts
 *
 * ¿Qué hace?
 * Mantiene el valor anterior de una variable
 *
 * ¿Para qué?
 * Comparar valor actual con el anterior
 */

import { useRef, useEffect } from 'react'

export function usePrevious<T>(value: T): T | undefined {
  const ref = useRef<T>()

  useEffect(() => {
    ref.current = value
  }, [value])

  return ref.current
}

// Uso
function Counter() {
  const [count, setCount] = useState(0)
  const prevCount = usePrevious(count)

  return (
    <View>
      <Text>Current: {count}</Text>
      <Text>Previous: {prevCount}</Text>
      <Text>{count > (prevCount || 0) ? '📈 Increased' : '📉 Decreased'}</Text>
      <Button title="+" onPress={() => setCount((c) => c + 1)} />
    </View>
  )
}
```

### 5. useInterval - Interval confiable

```typescript
/**
 * useInterval.ts
 *
 * ¿Qué hace?
 * setInterval pero con hooks (de Dan Abramov)
 *
 * ¿Para qué?
 * Ejecutar código periódicamente
 */

import { useEffect, useRef } from 'react'

export function useInterval(callback: () => void, delay: number | null) {
  const savedCallback = useRef(callback)

  // Actualizar callback ref
  useEffect(() => {
    savedCallback.current = callback
  }, [callback])

  // Configurar interval
  useEffect(() => {
    if (delay === null) return

    const id = setInterval(() => savedCallback.current(), delay)

    return () => clearInterval(id)
  }, [delay])
}

// Uso: Reloj
function Clock() {
  const [time, setTime] = useState(new Date())

  useInterval(() => {
    setTime(new Date())
  }, 1000)

  return <Text>{time.toLocaleTimeString()}</Text>
}
```

---

## 🌐 Hooks para Data Fetching

### 1. useFetch - Fetch con estados

```typescript
/**
 * useFetch.ts
 *
 * ¿Qué hace?
 * Simplifica el fetch de datos con estados de loading/error
 *
 * ¿Para qué?
 * Cualquier llamada a API
 */

import { useState, useEffect } from 'react'

interface UseFetchResult<T> {
  data: T | null
  loading: boolean
  error: Error | null
  refetch: () => void
}

export function useFetch<T>(url: string): UseFetchResult<T> {
  const [data, setData] = useState<T | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<Error | null>(null)
  const [refetchIndex, setRefetchIndex] = useState(0)

  useEffect(() => {
    let isMounted = true

    async function fetchData() {
      setLoading(true)
      setError(null)

      try {
        const response = await fetch(url)

        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`)
        }

        const json = await response.json()

        if (isMounted) {
          setData(json)
        }
      } catch (err) {
        if (isMounted) {
          setError(err as Error)
        }
      } finally {
        if (isMounted) {
          setLoading(false)
        }
      }
    }

    fetchData()

    return () => {
      isMounted = false
    }
  }, [url, refetchIndex])

  const refetch = () => {
    setRefetchIndex(prev => prev + 1)
  }

  return { data, loading, error, refetch }
}

// Uso
function ProductsList() {
  const { data, loading, error, refetch } = useFetch<Product[]>(
    'https://api.example.com/products'
  )

  if (loading) return <ActivityIndicator />
  if (error) return <Text>Error: {error.message}</Text>

  return (
    <>
      <FlatList data={data} renderItem={({ item }) => ...} />
      <Button title="Refresh" onPress={refetch} />
    </>
  )
}
```

### 2. useAPI - Fetch avanzado con cache

```typescript
/**
 * useAPI.ts
 *
 * ¿Qué hace?
 * Fetch con cache, reintento, y más funcionalidades
 */

import { useState, useEffect, useRef } from 'react'

interface UseAPIOptions {
  cache?: boolean
  retries?: number
  retryDelay?: number
}

interface UseAPIResult<T> {
  data: T | null
  loading: boolean
  error: Error | null
  refetch: () => Promise<void>
}

// Cache global simple
const cache = new Map<string, any>()

export function useAPI<T>(
  url: string,
  options: UseAPIOptions = {}
): UseAPIResult<T> {
  const { cache: enableCache = true, retries = 3, retryDelay = 1000 } = options

  const [data, setData] = useState<T | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<Error | null>(null)
  const mountedRef = useRef(true)

  async function fetchData() {
    // Verificar cache
    if (enableCache && cache.has(url)) {
      setData(cache.get(url))
      setLoading(false)
      return
    }

    setLoading(true)
    setError(null)

    let lastError: Error | null = null

    // Intentar con retries
    for (let attempt = 0; attempt < retries; attempt++) {
      try {
        const response = await fetch(url)

        if (!response.ok) {
          throw new Error(`HTTP ${response.status}: ${response.statusText}`)
        }

        const json = await response.json()

        if (!mountedRef.current) return

        // Guardar en cache
        if (enableCache) {
          cache.set(url, json)
        }

        setData(json)
        setLoading(false)
        return
      } catch (err) {
        lastError = err as Error

        // Esperar antes del siguiente intento
        if (attempt < retries - 1) {
          await new Promise((resolve) => setTimeout(resolve, retryDelay))
        }
      }
    }

    // Todos los intentos fallaron
    if (mountedRef.current) {
      setError(lastError)
      setLoading(false)
    }
  }

  useEffect(() => {
    fetchData()

    return () => {
      mountedRef.current = false
    }
  }, [url])

  return {
    data,
    loading,
    error,
    refetch: fetchData,
  }
}

// Uso
function ProductDetail({ productId }: { productId: string }) {
  const { data, loading, error, refetch } = useAPI<Product>(
    `https://api.example.com/products/${productId}`,
    { cache: true, retries: 3 }
  )

  if (loading) return <ActivityIndicator />
  if (error) return <ErrorView error={error} onRetry={refetch} />
  if (!data) return <Text>No data</Text>

  return <ProductView product={data} />
}
```

---

## 📝 Hooks para Formularios

### useForm - Gestión de formularios

```typescript
/**
 * useForm.ts
 *
 * ¿Qué hace?
 * Simplifica el manejo de formularios complejos
 *
 * ¿Para qué?
 * Formularios con validación, errores, submit
 */

import { useState, useCallback } from 'react'

interface UseFormOptions<T> {
  initialValues: T
  validate?: (values: T) => Partial<Record<keyof T, string>>
  onSubmit: (values: T) => void | Promise<void>
}

interface UseFormResult<T> {
  values: T
  errors: Partial<Record<keyof T, string>>
  touched: Partial<Record<keyof T, boolean>>
  isSubmitting: boolean
  handleChange: (field: keyof T) => (value: any) => void
  handleBlur: (field: keyof T) => () => void
  handleSubmit: () => Promise<void>
  resetForm: () => void
  setFieldValue: (field: keyof T, value: any) => void
  setFieldError: (field: keyof T, error: string) => void
}

export function useForm<T extends Record<string, any>>(
  options: UseFormOptions<T>
): UseFormResult<T> {
  const { initialValues, validate, onSubmit } = options

  const [values, setValues] = useState<T>(initialValues)
  const [errors, setErrors] = useState<Partial<Record<keyof T, string>>>({})
  const [touched, setTouched] = useState<Partial<Record<keyof T, boolean>>>({})
  const [isSubmitting, setIsSubmitting] = useState(false)

  // Cambiar valor de campo
  const handleChange = useCallback(
    (field: keyof T) => {
      return (value: any) => {
        setValues((prev) => ({ ...prev, [field]: value }))

        // Limpiar error al cambiar
        if (errors[field]) {
          setErrors((prev) => ({ ...prev, [field]: undefined }))
        }
      }
    },
    [errors]
  )

  // Marcar campo como touched
  const handleBlur = useCallback(
    (field: keyof T) => {
      return () => {
        setTouched((prev) => ({ ...prev, [field]: true }))

        // Validar al salir del campo
        if (validate) {
          const validationErrors = validate(values)
          if (validationErrors[field]) {
            setErrors((prev) => ({ ...prev, [field]: validationErrors[field] }))
          }
        }
      }
    },
    [values, validate]
  )

  // Submit formulario
  const handleSubmit = useCallback(async () => {
    // Validar todos los campos
    if (validate) {
      const validationErrors = validate(values)
      setErrors(validationErrors)

      if (Object.keys(validationErrors).length > 0) {
        return
      }
    }

    setIsSubmitting(true)

    try {
      await onSubmit(values)
    } catch (error) {
      console.error('Form submit error:', error)
    } finally {
      setIsSubmitting(false)
    }
  }, [values, validate, onSubmit])

  // Resetear formulario
  const resetForm = useCallback(() => {
    setValues(initialValues)
    setErrors({})
    setTouched({})
    setIsSubmitting(false)
  }, [initialValues])

  // Setters individuales
  const setFieldValue = useCallback((field: keyof T, value: any) => {
    setValues((prev) => ({ ...prev, [field]: value }))
  }, [])

  const setFieldError = useCallback((field: keyof T, error: string) => {
    setErrors((prev) => ({ ...prev, [field]: error }))
  }, [])

  return {
    values,
    errors,
    touched,
    isSubmitting,
    handleChange,
    handleBlur,
    handleSubmit,
    resetForm,
    setFieldValue,
    setFieldError,
  }
}

// Uso
interface LoginFormValues {
  email: string
  password: string
}

function LoginScreen() {
  const form = useForm<LoginFormValues>({
    initialValues: {
      email: '',
      password: '',
    },
    validate: (values) => {
      const errors: Partial<Record<keyof LoginFormValues, string>> = {}

      if (!values.email) {
        errors.email = 'Email es requerido'
      } else if (!/\S+@\S+\.\S+/.test(values.email)) {
        errors.email = 'Email inválido'
      }

      if (!values.password) {
        errors.password = 'Password es requerido'
      } else if (values.password.length < 6) {
        errors.password = 'Password debe tener al menos 6 caracteres'
      }

      return errors
    },
    onSubmit: async (values) => {
      console.log('Submitting:', values)
      // Llamar API de login
      await loginAPI(values.email, values.password)
    },
  })

  return (
    <View>
      <TextInput
        value={form.values.email}
        onChangeText={form.handleChange('email')}
        onBlur={form.handleBlur('email')}
        placeholder="Email"
        autoCapitalize="none"
      />
      {form.touched.email && form.errors.email && (
        <Text style={{ color: 'red' }}>{form.errors.email}</Text>
      )}

      <TextInput
        value={form.values.password}
        onChangeText={form.handleChange('password')}
        onBlur={form.handleBlur('password')}
        placeholder="Password"
        secureTextEntry
      />
      {form.touched.password && form.errors.password && (
        <Text style={{ color: 'red' }}>{form.errors.password}</Text>
      )}

      <Button
        title={form.isSubmitting ? 'Logging in...' : 'Login'}
        onPress={form.handleSubmit}
        disabled={form.isSubmitting}
      />
    </View>
  )
}
```

---

## ⚡ Hooks para Performance

### useThrottle - Limitar frecuencia

```typescript
/**
 * useThrottle.ts
 *
 * ¿Qué hace?
 * Limita cuántas veces se ejecuta una función
 *
 * ¿Para qué?
 * Scroll, resize, eventos frecuentes
 */

import { useRef, useCallback } from 'react'

export function useThrottle<T extends (...args: any[]) => any>(
  callback: T,
  delay: number
): T {
  const lastRan = useRef(Date.now())

  return useCallback(
    (...args: Parameters<T>) => {
      const now = Date.now()

      if (now - lastRan.current >= delay) {
        callback(...args)
        lastRan.current = now
      }
    },
    [callback, delay]
  ) as T
}

// Uso: Scroll infinito
function InfiniteScrollList() {
  const loadMore = useThrottle(() => {
    console.log('Loading more items...')
    // Fetch más items
  }, 1000) // Máximo 1 vez por segundo

  return (
    <FlatList
      data={items}
      onEndReached={loadMore}
      onEndReachedThreshold={0.5}
    />
  )
}
```

### useMemoCompare - Memoización custom

```typescript
/**
 * useMemoCompare.ts
 *
 * ¿Qué hace?
 * useMemo con función de comparación personalizada
 *
 * ¿Para qué?
 * Comparaciones complejas de dependencias
 */

import { useRef, useEffect } from 'react'

export function useMemoCompare<T>(
  value: T,
  compare: (prev: T | undefined, next: T) => boolean
): T {
  const ref = useRef<T>()

  if (!ref.current || !compare(ref.current, value)) {
    ref.current = value
  }

  return ref.current
}

// Uso: Comparar arrays por contenido, no por referencia
function UserList({ userIds }: { userIds: string[] }) {
  // Solo re-fetch si los IDs realmente cambiaron
  const memoizedIds = useMemoCompare(userIds, (prev, next) => {
    if (!prev) return false
    if (prev.length !== next.length) return false
    return prev.every((id, i) => id === next[i])
  })

  useEffect(() => {
    fetchUsers(memoizedIds)
  }, [memoizedIds])

  return <View>...</View>
}
```

---

## 📱 Hooks para React Native

### useKeyboard - Estado del teclado

```typescript
/**
 * useKeyboard.ts
 *
 * ¿Qué hace?
 * Detecta si el teclado está visible
 *
 * ¿Para qué?
 * Ajustar UI cuando aparece el teclado
 */

import { useEffect, useState } from 'react'
import { Keyboard, KeyboardEvent } from 'react-native'

export function useKeyboard() {
  const [isVisible, setIsVisible] = useState(false)
  const [keyboardHeight, setKeyboardHeight] = useState(0)

  useEffect(() => {
    const showListener = Keyboard.addListener(
      'keyboardDidShow',
      (e: KeyboardEvent) => {
        setIsVisible(true)
        setKeyboardHeight(e.endCoordinates.height)
      }
    )

    const hideListener = Keyboard.addListener('keyboardDidHide', () => {
      setIsVisible(false)
      setKeyboardHeight(0)
    })

    return () => {
      showListener.remove()
      hideListener.remove()
    }
  }, [])

  return { isVisible, keyboardHeight }
}

// Uso
function ChatScreen() {
  const { isVisible, keyboardHeight } = useKeyboard()

  return (
    <View style={{ marginBottom: isVisible ? keyboardHeight : 0 }}>
      <MessageList />
      <MessageInput />
    </View>
  )
}
```

### useDimensions - Dimensiones de pantalla

```typescript
/**
 * useDimensions.ts
 *
 * ¿Qué hace?
 * Hook reactivo para dimensiones de pantalla
 *
 * ¿Para qué?
 * Responsive design, rotación
 */

import { useState, useEffect } from 'react'
import { Dimensions, ScaledSize } from 'react-native'

export function useDimensions() {
  const [dimensions, setDimensions] = useState({
    window: Dimensions.get('window'),
    screen: Dimensions.get('screen'),
  })

  useEffect(() => {
    const subscription = Dimensions.addEventListener(
      'change',
      ({ window, screen }) => {
        setDimensions({ window, screen })
      }
    )

    return () => subscription?.remove()
  }, [])

  return dimensions
}

// Uso
function ResponsiveLayout() {
  const { window } = useDimensions()
  const isLandscape = window.width > window.height

  return (
    <View style={{ flexDirection: isLandscape ? 'row' : 'column' }}>
      <Sidebar />
      <Content />
    </View>
  )
}
```

### useOrientation - Orientación del dispositivo

```typescript
/**
 * useOrientation.ts
 *
 * ¿Qué hace?
 * Detecta orientación portrait/landscape
 */

import { useDimensions } from './useDimensions'

type Orientation = 'portrait' | 'landscape'

export function useOrientation(): Orientation {
  const { window } = useDimensions()
  return window.height >= window.width ? 'portrait' : 'landscape'
}

// Uso
function VideoPlayer() {
  const orientation = useOrientation()

  return (
    <View style={{
      height: orientation === 'landscape' ? '100%' : 300,
    }}>
      <Video source={...} />
    </View>
  )
}
```

---

## 🔗 Composición de Hooks

### Ejemplo: useAuth completo

```typescript
/**
 * useAuth.ts
 *
 * Hook complejo que compone múltiples hooks
 */

import { useContext } from 'react'
import { AuthContext } from '../contexts/AuthContext'
import { useLocalStorage } from './useLocalStorage'
import { useFetch } from './useFetch'

export function useAuth() {
  const context = useContext(AuthContext)

  if (!context) {
    throw new Error('useAuth must be used within AuthProvider')
  }

  return context
}

// AuthProvider que usa múltiples hooks
export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser, isLoading] = useLocalStorage<User | null>('user', null)
  const [token, setToken] = useLocalStorage<string | null>('token', null)

  async function login(email: string, password: string) {
    const response = await fetch('/api/login', {
      method: 'POST',
      body: JSON.stringify({ email, password }),
    })

    const data = await response.json()
    setUser(data.user)
    setToken(data.token)
  }

  async function logout() {
    setUser(null)
    setToken(null)
  }

  const value = {
    user,
    token,
    isAuthenticated: user !== null,
    isLoading,
    login,
    logout,
  }

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}
```

---

## 🧪 Testing de Custom Hooks

### Con @testing-library/react-hooks

```typescript
/**
 * useCounter.test.ts
 *
 * Testear custom hooks sin componentes
 */

import { renderHook, act } from '@testing-library/react-hooks'
import { useCounter } from './useCounter'

describe('useCounter', () => {
  it('should initialize with 0', () => {
    const { result } = renderHook(() => useCounter())

    expect(result.current.count).toBe(0)
  })

  it('should increment', () => {
    const { result } = renderHook(() => useCounter())

    act(() => {
      result.current.increment()
    })

    expect(result.current.count).toBe(1)
  })

  it('should decrement', () => {
    const { result } = renderHook(() => useCounter())

    act(() => {
      result.current.decrement()
    })

    expect(result.current.count).toBe(-1)
  })

  it('should reset', () => {
    const { result } = renderHook(() => useCounter())

    act(() => {
      result.current.increment()
      result.current.increment()
      result.current.reset()
    })

    expect(result.current.count).toBe(0)
  })
})
```

---

## 📚 Librería de Hooks Útiles

### Hooks Recomendados del Ecosistema

1. **react-use** - Colección masiva de hooks
2. **@react-native-community/hooks** - Hooks específicos de RN
3. **@tanstack/react-query** - Data fetching avanzado
4. **usehooks-ts** - Hooks TypeScript-first

### Ejemplo: Instalar y usar

```bash
pnpm add react-use
```

```typescript
import { useToggle, useDebounce, useInterval } from 'react-use'

function Component() {
  const [on, toggle] = useToggle(false)
  // ... usar directamente
}
```

---

## ✅ Checklist de Comprensión

### Nivel Básico

- [ ] Entiendo qué son los custom hooks
- [ ] Sé crear hooks simples
- [ ] Conozco las reglas de los hooks
- [ ] Puedo usar useState y useEffect en hooks
- [ ] Extraigo lógica repetida a hooks

### Nivel Intermedio

- [ ] Creo hooks reutilizables complejos
- [ ] Uso useCallback y useMemo correctamente
- [ ] Compongo múltiples hooks
- [ ] Tipado TypeScript de hooks
- [ ] Manejo side effects en hooks

### Nivel Avanzado

- [ ] Creo hooks con performance óptima
- [ ] Testeo custom hooks
- [ ] Implemento patrones avanzados
- [ ] Publico hooks reutilizables
- [ ] Debugging de hooks complejos

---

## 🎓 Resumen

### Conceptos Clave

1. **Custom Hooks** - Funciones que empiezan con "use"
2. **Reutilización** - Extraer lógica compartida
3. **Composición** - Combinar múltiples hooks
4. **Reglas** - Solo en nivel superior, solo en componentes/hooks
5. **TypeScript** - Tipos genéricos para flexibilidad

### Patrones Útiles

- **useToggle** - Booleanos on/off
- **useDebounce** - Retrasar cambios
- **useFetch** - Data fetching
- **useForm** - Formularios
- **useLocalStorage** - Persistencia

### Cuándo Crear

✅ Lógica repetida en múltiples componentes  
✅ Componente muy complejo  
✅ Interacción con APIs externas  
✅ Side effects reutilizables

---

## 🔜 Próximo Tema

**[README.md de Teoría](./README.md)**

Índice completo de todos los temas teóricos de la semana.

---

_Teoría 4: Custom Hooks Avanzados - Semana 3_  
_Bootcamp React Native 2025 - EPTI_

**Tiempo estimado:** 40-45 minutos  
**Dificultad:** ⭐⭐⭐ Avanzada
