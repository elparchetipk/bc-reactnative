# 📚 Teoría - Semana 3: Estado y Datos

> **Domina la gestión de estado global y persistencia de datos** en React Native

---

## 🎯 Objetivos de la Semana

Al completar el contenido teórico de esta semana, serás capaz de:

- ✅ **Gestionar estado global** con Context API
- ✅ **Persistir datos localmente** con AsyncStorage
- ✅ **Manejar estado complejo** con useReducer
- ✅ **Crear custom hooks** reutilizables
- ✅ **Componer múltiples contextos** eficientemente
- ✅ **Optimizar rendimiento** de aplicaciones con estado global
- ✅ **Implementar patrones avanzados** de gestión de estado

---

## 📖 Contenido Teórico

### 1. Context API y Estado Global

**📄 [01-context-api-estado-global.md](./01-context-api-estado-global.md)**

**¿Qué aprenderás?**

- Concepto de estado global vs estado local
- El problema del "prop drilling"
- Cómo funciona Context API
- Crear y consumir contextos
- Custom hooks con contextos
- Múltiples contextos en una aplicación
- Optimización de performance

**Conceptos clave:**

- `createContext()`
- `<Provider>` component
- `useContext()` hook
- Custom hooks pattern
- `React.memo()`, `useMemo()`, `useCallback()`

**Tiempo estimado:** 35-40 minutos  
**Dificultad:** ⭐⭐⭐ Intermedio

**Casos de uso:**

- 🔐 Autenticación global
- 🎨 Sistema de temas (light/dark)
- 🌐 Configuración de idioma
- 🛒 Carrito de compras
- 📱 Estado de la aplicación

---

### 2. AsyncStorage y Persistencia

**📄 [02-asyncstorage-persistencia.md](./02-asyncstorage-persistencia.md)**

**¿Qué aprenderás?**

- Qué es AsyncStorage y cuándo usarlo
- Instalación y configuración
- Operaciones básicas (CRUD)
- Almacenar objetos complejos
- Manejo de errores
- Integración con Context API
- Casos de uso comunes
- Alternativas disponibles

**Conceptos clave:**

- `AsyncStorage.setItem()`
- `AsyncStorage.getItem()`
- `AsyncStorage.removeItem()`
- JSON.stringify() / JSON.parse()
- Helper functions genéricos
- Expo SecureStore (para datos sensibles)

**Tiempo estimado:** 35-40 minutos  
**Dificultad:** ⭐⭐ Intermedio

**Casos de uso:**

- 💾 Guardar preferencias de usuario
- 🎨 Persistir tema seleccionado
- 📝 Cache de datos de API
- ✅ Control de onboarding
- ⭐ Sistema de favoritos

---

### 3. useReducer y Estado Complejo

**📄 [03-usereducer-estado-complejo.md](./03-usereducer-estado-complejo.md)**

**¿Qué aprenderás?**

- Qué es useReducer y cuándo usarlo
- Diferencias entre useState y useReducer
- Anatomía de un reducer
- TypeScript con reducers
- Integración con Context API
- Patrones avanzados
- Testing de reducers

**Conceptos clave:**

- `useReducer()` hook
- Reducer functions
- Actions y action types
- Discriminated unions (TypeScript)
- Action creators
- Lazy initialization
- Middleware pattern

**Tiempo estimado:** 30-35 minutos  
**Dificultad:** ⭐⭐⭐ Intermedio-Avanzado

**Casos de uso:**

- 🛒 Gestión de carrito de compras
- 📋 Todo lists complejas
- 📝 Formularios multi-paso
- 🎮 Estado de juegos
- 📊 Filtros y búsqueda avanzada

---

### 4. Custom Hooks Avanzados

**📄 [04-custom-hooks-avanzados.md](./04-custom-hooks-avanzados.md)**

**¿Qué aprenderás?**

- Qué son los custom hooks
- Reglas fundamentales de hooks
- Crear hooks reutilizables
- Hooks para data fetching
- Hooks para formularios
- Hooks para performance
- Hooks específicos de React Native
- Composición de hooks
- Testing de hooks

**Conceptos clave:**

- Convención "use"
- Encapsulación de lógica
- `useCallback()`, `useRef()`
- Composición de hooks
- Patrones reutilizables
- TypeScript generics

**Tiempo estimado:** 40-45 minutos  
**Dificultad:** ⭐⭐⭐ Avanzado

**Hooks incluidos:**

- 🔄 `useToggle` - Toggle simplificado
- 💾 `useLocalStorage` - Persistencia automática
- ⏱️ `useDebounce` - Retrasar actualizaciones
- 🔙 `usePrevious` - Valor anterior
- 🌐 `useFetch` - Data fetching
- 📝 `useForm` - Gestión de formularios
- ⚡ `useThrottle` - Limitar frecuencia
- ⌨️ `useKeyboard` - Estado del teclado
- 📐 `useDimensions` - Dimensiones reactivas

---

## 🗺️ Ruta de Aprendizaje Recomendada

### Orden Sugerido

```
┌─────────────────────────────────────────────────────────┐
│  1. Context API y Estado Global                         │
│     ↓                                                    │
│  2. AsyncStorage y Persistencia                         │
│     ↓                                                    │
│  3. useReducer y Estado Complejo                        │
│     ↓                                                    │
│  4. Custom Hooks Avanzados                              │
└─────────────────────────────────────────────────────────┘
```

### Conexiones entre Temas

**Context API ←→ AsyncStorage**

- Context proporciona estado global en memoria
- AsyncStorage persiste ese estado entre sesiones
- Combinación perfecta para auth, configuración, etc.

**Context API ←→ useReducer**

- useReducer gestiona lógica compleja de estado
- Context distribuye ese estado globalmente
- Patrón Context + Reducer muy común

**Custom Hooks ←→ Todo lo anterior**

- Custom hooks encapsulan y reutilizan toda la lógica
- Combinan Context, AsyncStorage, useReducer
- Crean APIs limpias y reutilizables

---

## 💡 Consejos de Estudio

### Para el Contenido Teórico

1. **Lee secuencialmente** - Cada tema se construye sobre el anterior
2. **Prueba los ejemplos** - Copia y ejecuta el código en tu editor
3. **Experimenta** - Modifica los ejemplos para entender mejor
4. **Toma notas** - Anota conceptos clave y dudas
5. **Consulta el glosario** - Términos técnicos en la carpeta `5-glosario/`

### Técnicas de Aprendizaje

📖 **Lectura activa**

- Subraya conceptos importantes
- Anota ejemplos que te confundan
- Relaciona con conocimientos previos

💻 **Práctica inmediata**

- Crea un proyecto de prueba
- Implementa cada patrón
- Combina técnicas

🔄 **Repaso espaciado**

- Revisa conceptos al día siguiente
- Repasa antes de las prácticas
- Enseña a alguien más (mejor método)

---

## 🔗 Integración de Conceptos

### Patrón: Auth Context con Persistencia

Ejemplo de cómo se integran **todos los conceptos** de la semana:

```typescript
/**
 * Integración completa:
 * - Context API para estado global
 * - AsyncStorage para persistencia
 * - useReducer para lógica compleja
 * - Custom hook para API limpia
 */

// 1. Reducer para lógica compleja (Tema 3)
type AuthState = {
  user: User | null
  token: string | null
  isLoading: boolean
  error: string | null
}

type AuthAction =
  | { type: 'LOGIN_SUCCESS'; payload: { user: User; token: string } }
  | { type: 'LOGOUT' }
  | { type: 'SET_LOADING'; payload: boolean }
  | { type: 'SET_ERROR'; payload: string }

function authReducer(state: AuthState, action: AuthAction): AuthState {
  switch (action.type) {
    case 'LOGIN_SUCCESS':
      return {
        ...state,
        user: action.payload.user,
        token: action.payload.token,
        isLoading: false,
        error: null,
      }
    case 'LOGOUT':
      return {
        ...state,
        user: null,
        token: null,
      }
    case 'SET_LOADING':
      return { ...state, isLoading: action.payload }
    case 'SET_ERROR':
      return { ...state, error: action.payload, isLoading: false }
    default:
      return state
  }
}

// 2. Context para estado global (Tema 1)
const AuthContext = createContext<AuthContextType | undefined>(undefined)

export function AuthProvider({ children }: { children: ReactNode }) {
  const [state, dispatch] = useReducer(authReducer, {
    user: null,
    token: null,
    isLoading: true,
    error: null,
  })

  // 3. AsyncStorage para persistencia (Tema 2)
  useEffect(() => {
    async function loadStoredAuth() {
      const storedUser = await AsyncStorage.getItem('user')
      const storedToken = await AsyncStorage.getItem('token')

      if (storedUser && storedToken) {
        dispatch({
          type: 'LOGIN_SUCCESS',
          payload: {
            user: JSON.parse(storedUser),
            token: storedToken,
          },
        })
      } else {
        dispatch({ type: 'SET_LOADING', payload: false })
      }
    }

    loadStoredAuth()
  }, [])

  async function login(email: string, password: string) {
    dispatch({ type: 'SET_LOADING', payload: true })

    try {
      const response = await loginAPI(email, password)

      // Persistir
      await AsyncStorage.setItem('user', JSON.stringify(response.user))
      await AsyncStorage.setItem('token', response.token)

      dispatch({
        type: 'LOGIN_SUCCESS',
        payload: response,
      })
    } catch (error) {
      dispatch({ type: 'SET_ERROR', payload: error.message })
    }
  }

  async function logout() {
    await AsyncStorage.removeItem('user')
    await AsyncStorage.removeItem('token')
    dispatch({ type: 'LOGOUT' })
  }

  const value = {
    ...state,
    login,
    logout,
  }

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}

// 4. Custom hook para API limpia (Tema 4)
export function useAuth() {
  const context = useContext(AuthContext)

  if (!context) {
    throw new Error('useAuth must be used within AuthProvider')
  }

  return context
}

// Uso en componentes - API súper limpia
function LoginScreen() {
  const { login, isLoading, error } = useAuth()

  // Usar...
}
```

Este ejemplo muestra cómo **todos los temas se conectan** en una aplicación real.

---

## 📊 Matriz de Conceptos

| Concepto            | Tema 1        | Tema 2       | Tema 3       | Tema 4       |
| ------------------- | ------------- | ------------ | ------------ | ------------ |
| **Estado Global**   | ✅ Principal  | -            | ✅ Combina   | ✅ Encapsula |
| **Persistencia**    | -             | ✅ Principal | -            | ✅ Encapsula |
| **Lógica Compleja** | -             | -            | ✅ Principal | ✅ Encapsula |
| **Reutilización**   | ⚠️ Limitada   | -            | -            | ✅ Máxima    |
| **Performance**     | ✅ Importante | -            | -            | ✅ Optimiza  |
| **Testing**         | ⚠️ Medio      | ✅ Fácil     | ✅ Fácil     | ✅ Fácil     |

**Leyenda:**

- ✅ Cubierto extensamente
- ⚠️ Consideraciones importantes
- - No aplica directamente

---

## 🎓 Evaluación de Comprensión

Después de estudiar todos los temas teóricos, deberías poder:

### Preguntas de Verificación

1. **¿Cuándo usar Context API vs prop drilling?**

   - Respuesta esperada: Context cuando múltiples niveles de componentes necesitan acceso al mismo estado

2. **¿Cuándo usar AsyncStorage vs SecureStore?**

   - Respuesta esperada: SecureStore para datos sensibles (tokens, passwords), AsyncStorage para preferencias

3. **¿Cuándo usar useReducer vs useState?**

   - Respuesta esperada: useReducer para estado complejo con múltiples valores relacionados y lógica compleja

4. **¿Qué hace que una función sea un "hook"?**

   - Respuesta esperada: Empieza con "use" y puede llamar otros hooks

5. **¿Cómo optimizar re-renders en Context?**
   - Respuesta esperada: Separar contextos, usar React.memo, useMemo, useCallback

### Ejercicio de Integración

**Reto:** Crea un sistema de carrito de compras que:

- Use Context API para estado global
- Persista el carrito con AsyncStorage
- Maneje acciones con useReducer
- Encapsule todo en un `useCart()` hook

Si puedes completar este ejercicio, has dominado todos los conceptos teóricos.

---

## 🔜 Siguiente Paso

Una vez que hayas estudiado toda la teoría:

**➡️ [Prácticas](../2-practicas/README.md)**

Las prácticas te permitirán aplicar todos estos conceptos en ejercicios guiados paso a paso.

---

## 📚 Recursos Adicionales

### Documentación Oficial

- [React Context](https://react.dev/reference/react/useContext)
- [React useReducer](https://react.dev/reference/react/useReducer)
- [AsyncStorage Docs](https://react-native-async-storage.github.io/async-storage/)
- [React Hooks](https://react.dev/reference/react)

### Material Complementario

- **eBooks:** [../4-recursos/ebooks-free/](../4-recursos/ebooks-free/)
- **Videos:** [../4-recursos/videografia/](../4-recursos/videografia/)
- **Artículos:** [../4-recursos/webgrafia/](../4-recursos/webgrafia/)

### Glosario

- **Términos técnicos:** [../5-glosario/](../5-glosario/)

---

## ⏱️ Tiempo Total Estimado

| Documento         | Tiempo         |
| ----------------- | -------------- |
| 01 - Context API  | 35-40 min      |
| 02 - AsyncStorage | 35-40 min      |
| 03 - useReducer   | 30-35 min      |
| 04 - Custom Hooks | 40-45 min      |
| **TOTAL**         | **~2.5 horas** |

**Recomendación:** Distribuye el estudio en 2-3 sesiones para mejor retención.

---

## 💪 ¡Adelante!

El dominio de estos conceptos es **fundamental** para crear aplicaciones React Native profesionales. Tómate tu tiempo, experimenta con los ejemplos, y no dudes en consultar el glosario o los recursos adicionales.

**Recuerda:**

- 🧠 La teoría es la base
- 💻 La práctica consolida
- 🚀 El proyecto integra todo

---

_Teoría - Semana 3: Estado y Datos_  
_Bootcamp React Native 2025 - EPTI_

**Total:** 4 documentos teóricos | ~3,200 líneas de contenido  
**Nivel:** Intermedio-Avanzado ⭐⭐⭐
