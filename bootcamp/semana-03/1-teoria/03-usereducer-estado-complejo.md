# 🔄 useReducer y Gestión de Estado Complejo

> **Aprende a gestionar estado complejo** con useReducer cuando useState ya no es suficiente.

---

## 🎯 Objetivos de Aprendizaje

Al finalizar este tema, serás capaz de:

- [ ] **Comprender** cuándo usar useReducer vs useState
- [ ] **Implementar** reducers para lógica compleja
- [ ] **Definir** actions y action creators
- [ ] **Tipar** reducers con TypeScript
- [ ] **Combinar** useReducer con Context API
- [ ] **Aplicar** patrones Redux-like sin Redux

---

## 📚 Índice

1. [¿Qué es useReducer?](#qué-es-usereducer)
2. [useState vs useReducer](#usestate-vs-usereducer)
3. [Anatomía de un Reducer](#anatomía-de-un-reducer)
4. [Implementación Básica](#implementación-básica)
5. [TypeScript con useReducer](#typescript-con-usereducer)
6. [useReducer + Context API](#usereducer--context-api)
7. [Patrones Avanzados](#patrones-avanzados)
8. [Mejores Prácticas](#mejores-prácticas)

---

## 🤔 ¿Qué es useReducer?

### Definición

**useReducer** es un hook de React para gestionar estado complejo mediante un patrón **reducer**, similar a Redux pero sin la librería.

### Analogía

Piensa en useReducer como un **cajero de banco**:

- **Estado (state)** = Saldo de tu cuenta
- **Acción (action)** = Tipo de transacción (depositar, retirar)
- **Reducer** = Cajero que procesa la transacción
- **dispatch** = Solicitar una transacción al cajero

### Conceptos Clave

```typescript
/**
 * useReducer(reducer, initialState)
 * 
 * reducer: función pura que recibe (state, action) y retorna nuevo state
 * initialState: estado inicial
 * 
 * Retorna: [state, dispatch]
 * state: estado actual
 * dispatch: función para enviar acciones
 */

const [state, dispatch] = useReducer(reducer, initialState)
```

---

## ⚖️ useState vs useReducer

### ¿Cuándo usar cada uno?

#### Usa useState cuando:

✅ Estado simple (string, number, boolean)
✅ Pocas actualizaciones de estado
✅ Sin lógica compleja
✅ Estado independiente

```typescript
// ✅ BUENO para useState
const [count, setCount] = useState(0)
const [name, setName] = useState('')
const [isOpen, setIsOpen] = useState(false)
```

#### Usa useReducer cuando:

✅ Estado complejo (objetos anidados)
✅ Múltiples sub-valores relacionados
✅ Lógica de actualización compleja
✅ Transiciones de estado predecibles
✅ Estado que necesita ser testeable

```typescript
// ✅ BUENO para useReducer
interface CartState {
  items: CartItem[]
  total: number
  discount: number
  loading: boolean
  error: string | null
}
```

### Comparación Directa

```typescript
/**
 * Mismo componente con useState vs useReducer
 */

// ❌ useState - Código repetitivo y propenso a errores
function CartWithState() {
  const [items, setItems] = useState<CartItem[]>([])
  const [total, setTotal] = useState(0)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  
  const addItem = (item: CartItem) => {
    setLoading(true)
    setItems(prev => [...prev, item])
    setTotal(prev => prev + item.price)
    setLoading(false)
  }
  
  const removeItem = (id: string) => {
    setLoading(true)
    setItems(prev => prev.filter(i => i.id !== id))
    const item = items.find(i => i.id === id)
    if (item) setTotal(prev => prev - item.price)
    setLoading(false)
  }
  
  const clearCart = () => {
    setItems([])
    setTotal(0)
    setError(null)
  }
  
  // ... más funciones
}

// ✅ useReducer - Lógica centralizada y predecible
function CartWithReducer() {
  const [state, dispatch] = useReducer(cartReducer, initialState)
  
  const addItem = (item: CartItem) => {
    dispatch({ type: 'ADD_ITEM', payload: item })
  }
  
  const removeItem = (id: string) => {
    dispatch({ type: 'REMOVE_ITEM', payload: id })
  }
  
  const clearCart = () => {
    dispatch({ type: 'CLEAR_CART' })
  }
  
  // Lógica compleja en el reducer, componente limpio
}
```

---

## 🏗️ Anatomía de un Reducer

### Estructura Básica

```typescript
/**
 * Reducer: función pura que define cómo el estado cambia
 * 
 * ¿Qué hace?
 * Toma el estado actual y una acción, retorna nuevo estado
 * 
 * ¿Para qué?
 * Centralizar toda la lógica de actualización de estado
 * 
 * ¿Cómo funciona?
 * Switch/case sobre action.type, retorna nuevo objeto de estado
 */

function reducer(state: State, action: Action): State {
  switch (action.type) {
    case 'ACTION_TYPE_1':
      return { ...state, /* cambios */ }
    
    case 'ACTION_TYPE_2':
      return { ...state, /* cambios */ }
    
    default:
      return state // Importante: retornar state sin cambios
  }
}
```

### Componentes

#### 1. Estado (State)

```typescript
// Tipo del estado
interface CartState {
  items: CartItem[]
  total: number
  itemCount: number
  loading: boolean
  error: string | null
}

// Estado inicial
const initialState: CartState = {
  items: [],
  total: 0,
  itemCount: 0,
  loading: false,
  error: null,
}
```

#### 2. Acciones (Actions)

```typescript
// Tipos de acciones
type CartAction =
  | { type: 'ADD_ITEM'; payload: CartItem }
  | { type: 'REMOVE_ITEM'; payload: string }
  | { type: 'UPDATE_QUANTITY'; payload: { id: string; quantity: number } }
  | { type: 'CLEAR_CART' }
  | { type: 'SET_LOADING'; payload: boolean }
  | { type: 'SET_ERROR'; payload: string }
```

#### 3. Reducer Function

```typescript
function cartReducer(state: CartState, action: CartAction): CartState {
  switch (action.type) {
    case 'ADD_ITEM':
      const newItem = action.payload
      return {
        ...state,
        items: [...state.items, newItem],
        total: state.total + newItem.price * newItem.quantity,
        itemCount: state.itemCount + newItem.quantity,
      }
    
    case 'REMOVE_ITEM':
      const itemToRemove = state.items.find(i => i.id === action.payload)
      if (!itemToRemove) return state
      
      return {
        ...state,
        items: state.items.filter(i => i.id !== action.payload),
        total: state.total - (itemToRemove.price * itemToRemove.quantity),
        itemCount: state.itemCount - itemToRemove.quantity,
      }
    
    case 'UPDATE_QUANTITY':
      const { id, quantity } = action.payload
      const item = state.items.find(i => i.id === id)
      if (!item) return state
      
      const quantityDiff = quantity - item.quantity
      
      return {
        ...state,
        items: state.items.map(i =>
          i.id === id ? { ...i, quantity } : i
        ),
        total: state.total + (item.price * quantityDiff),
        itemCount: state.itemCount + quantityDiff,
      }
    
    case 'CLEAR_CART':
      return initialState
    
    case 'SET_LOADING':
      return { ...state, loading: action.payload }
    
    case 'SET_ERROR':
      return { ...state, error: action.payload, loading: false }
    
    default:
      return state
  }
}
```

---

## 💻 Implementación Básica

### Ejemplo Completo: Counter con Reducer

```typescript
/**
 * CounterReducer.tsx
 * 
 * Ejemplo simple de useReducer
 */

import { useReducer } from 'react'
import { View, Text, Button } from 'react-native'

// 1. Definir tipos
interface CounterState {
  count: number
  history: number[]
}

type CounterAction =
  | { type: 'INCREMENT' }
  | { type: 'DECREMENT' }
  | { type: 'RESET' }
  | { type: 'SET'; payload: number }

// 2. Estado inicial
const initialState: CounterState = {
  count: 0,
  history: [0],
}

// 3. Reducer
function counterReducer(state: CounterState, action: CounterAction): CounterState {
  switch (action.type) {
    case 'INCREMENT':
      const newCountInc = state.count + 1
      return {
        count: newCountInc,
        history: [...state.history, newCountInc],
      }
    
    case 'DECREMENT':
      const newCountDec = state.count - 1
      return {
        count: newCountDec,
        history: [...state.history, newCountDec],
      }
    
    case 'RESET':
      return initialState
    
    case 'SET':
      return {
        count: action.payload,
        history: [...state.history, action.payload],
      }
    
    default:
      return state
  }
}

// 4. Componente
export function CounterScreen() {
  const [state, dispatch] = useReducer(counterReducer, initialState)
  
  return (
    <View>
      <Text>Count: {state.count}</Text>
      <Text>History: {state.history.join(', ')}</Text>
      
      <Button
        title="Increment"
        onPress={() => dispatch({ type: 'INCREMENT' })}
      />
      <Button
        title="Decrement"
        onPress={() => dispatch({ type: 'DECREMENT' })}
      />
      <Button
        title="Reset"
        onPress={() => dispatch({ type: 'RESET' })}
      />
      <Button
        title="Set to 10"
        onPress={() => dispatch({ type: 'SET', payload: 10 })}
      />
    </View>
  )
}
```

---

## 📘 TypeScript con useReducer

### Pattern: Discriminated Unions

```typescript
/**
 * ✅ BUENO - TypeScript infiere payload automáticamente
 */

// Acciones con discriminated union
type TodoAction =
  | { type: 'ADD_TODO'; payload: { text: string } }
  | { type: 'TOGGLE_TODO'; payload: { id: string } }
  | { type: 'DELETE_TODO'; payload: { id: string } }
  | { type: 'CLEAR_COMPLETED' }

function todoReducer(state: TodoState, action: TodoAction): TodoState {
  switch (action.type) {
    case 'ADD_TODO':
      // TypeScript sabe que action.payload tiene { text: string }
      return {
        ...state,
        todos: [...state.todos, {
          id: Date.now().toString(),
          text: action.payload.text, // ✅ Autocompletado!
          completed: false,
        }],
      }
    
    case 'TOGGLE_TODO':
      // TypeScript sabe que action.payload tiene { id: string }
      return {
        ...state,
        todos: state.todos.map(todo =>
          todo.id === action.payload.id // ✅ Autocompletado!
            ? { ...todo, completed: !todo.completed }
            : todo
        ),
      }
    
    case 'CLEAR_COMPLETED':
      // TypeScript sabe que NO hay payload
      return {
        ...state,
        todos: state.todos.filter(todo => !todo.completed),
      }
    
    default:
      return state
  }
}
```

### Action Creators (Opcional pero Recomendado)

```typescript
/**
 * ✅ Action creators para mejor DX
 */

// Funciones helper que crean acciones
const todoActions = {
  addTodo: (text: string): TodoAction => ({
    type: 'ADD_TODO',
    payload: { text },
  }),
  
  toggleTodo: (id: string): TodoAction => ({
    type: 'TOGGLE_TODO',
    payload: { id },
  }),
  
  deleteTodo: (id: string): TodoAction => ({
    type: 'DELETE_TODO',
    payload: { id },
  }),
  
  clearCompleted: (): TodoAction => ({
    type: 'CLEAR_COMPLETED',
  }),
}

// Uso en componente
function TodoList() {
  const [state, dispatch] = useReducer(todoReducer, initialState)
  
  const handleAdd = () => {
    // ✅ Más limpio y menos propenso a errores
    dispatch(todoActions.addTodo('New task'))
    
    // vs
    // dispatch({ type: 'ADD_TODO', payload: { text: 'New task' } })
  }
  
  // ...
}
```

---

## 🔗 useReducer + Context API

### Pattern: Global State Management

```typescript
/**
 * CartContext.tsx
 * 
 * ¿Qué hace?
 * Context con useReducer para estado global complejo
 * 
 * ¿Para qué?
 * Carrito de compras accesible desde toda la app
 * 
 * ¿Cómo funciona?
 * 1. useReducer gestiona el estado
 * 2. Context lo hace global
 * 3. Custom hook lo hace fácil de usar
 */

import React, { createContext, useContext, useReducer, ReactNode } from 'react'

// ===== TYPES =====
interface CartItem {
  id: string
  name: string
  price: number
  quantity: number
  image?: string
}

interface CartState {
  items: CartItem[]
  total: number
  itemCount: number
}

type CartAction =
  | { type: 'ADD_ITEM'; payload: CartItem }
  | { type: 'REMOVE_ITEM'; payload: string }
  | { type: 'UPDATE_QUANTITY'; payload: { id: string; quantity: number } }
  | { type: 'CLEAR_CART' }

interface CartContextType {
  state: CartState
  dispatch: React.Dispatch<CartAction>
  // Helper functions (opcional)
  addItem: (item: CartItem) => void
  removeItem: (id: string) => void
  updateQuantity: (id: string, quantity: number) => void
  clearCart: () => void
}

// ===== REDUCER =====
const initialState: CartState = {
  items: [],
  total: 0,
  itemCount: 0,
}

function cartReducer(state: CartState, action: CartAction): CartState {
  switch (action.type) {
    case 'ADD_ITEM': {
      const existingItem = state.items.find(i => i.id === action.payload.id)
      
      if (existingItem) {
        // Item ya existe, incrementar cantidad
        return {
          ...state,
          items: state.items.map(i =>
            i.id === action.payload.id
              ? { ...i, quantity: i.quantity + action.payload.quantity }
              : i
          ),
          total: state.total + (action.payload.price * action.payload.quantity),
          itemCount: state.itemCount + action.payload.quantity,
        }
      }
      
      // Item nuevo
      return {
        ...state,
        items: [...state.items, action.payload],
        total: state.total + (action.payload.price * action.payload.quantity),
        itemCount: state.itemCount + action.payload.quantity,
      }
    }
    
    case 'REMOVE_ITEM': {
      const item = state.items.find(i => i.id === action.payload)
      if (!item) return state
      
      return {
        ...state,
        items: state.items.filter(i => i.id !== action.payload),
        total: state.total - (item.price * item.quantity),
        itemCount: state.itemCount - item.quantity,
      }
    }
    
    case 'UPDATE_QUANTITY': {
      const item = state.items.find(i => i.id === action.payload.id)
      if (!item) return state
      
      const quantityDiff = action.payload.quantity - item.quantity
      
      return {
        ...state,
        items: state.items.map(i =>
          i.id === action.payload.id
            ? { ...i, quantity: action.payload.quantity }
            : i
        ),
        total: state.total + (item.price * quantityDiff),
        itemCount: state.itemCount + quantityDiff,
      }
    }
    
    case 'CLEAR_CART':
      return initialState
    
    default:
      return state
  }
}

// ===== CONTEXT =====
const CartContext = createContext<CartContextType | undefined>(undefined)

// ===== PROVIDER =====
export function CartProvider({ children }: { children: ReactNode }) {
  const [state, dispatch] = useReducer(cartReducer, initialState)
  
  // Helper functions (opcional pero conveniente)
  const addItem = (item: CartItem) => {
    dispatch({ type: 'ADD_ITEM', payload: item })
  }
  
  const removeItem = (id: string) => {
    dispatch({ type: 'REMOVE_ITEM', payload: id })
  }
  
  const updateQuantity = (id: string, quantity: number) => {
    dispatch({ type: 'UPDATE_QUANTITY', payload: { id, quantity } })
  }
  
  const clearCart = () => {
    dispatch({ type: 'CLEAR_CART' })
  }
  
  const value: CartContextType = {
    state,
    dispatch,
    addItem,
    removeItem,
    updateQuantity,
    clearCart,
  }
  
  return (
    <CartContext.Provider value={value}>
      {children}
    </CartContext.Provider>
  )
}

// ===== CUSTOM HOOK =====
export function useCart() {
  const context = useContext(CartContext)
  if (context === undefined) {
    throw new Error('useCart must be used within CartProvider')
  }
  return context
}
```

### Uso en Componentes

```typescript
/**
 * ProductDetailScreen.tsx
 */

import { useCart } from '../contexts/CartContext'

export function ProductDetailScreen({ product }: { product: Product }) {
  const { addItem, state } = useCart()
  
  const handleAddToCart = () => {
    addItem({
      id: product.id,
      name: product.name,
      price: product.price,
      quantity: 1,
      image: product.image,
    })
  }
  
  return (
    <View>
      <Text>{product.name}</Text>
      <Text>${product.price}</Text>
      <Button title="Add to Cart" onPress={handleAddToCart} />
      <Text>Cart: {state.itemCount} items</Text>
    </View>
  )
}

/**
 * CartScreen.tsx
 */

export function CartScreen() {
  const { state, removeItem, updateQuantity, clearCart } = useCart()
  
  return (
    <View>
      <Text>Total: ${state.total.toFixed(2)}</Text>
      <Text>{state.itemCount} items</Text>
      
      {state.items.map(item => (
        <View key={item.id}>
          <Text>{item.name}</Text>
          <Text>${item.price} x {item.quantity}</Text>
          <Button
            title="+"
            onPress={() => updateQuantity(item.id, item.quantity + 1)}
          />
          <Button
            title="-"
            onPress={() => updateQuantity(item.id, item.quantity - 1)}
          />
          <Button title="Remove" onPress={() => removeItem(item.id)} />
        </View>
      ))}
      
      <Button title="Clear Cart" onPress={clearCart} />
    </View>
  )
}
```

---

## 🎨 Patrones Avanzados

### 1. Lazy Initialization

```typescript
/**
 * ✅ Init function para cálculos costosos
 */

function init(initialCount: number): CounterState {
  // Cálculo costoso ejecutado solo una vez
  console.log('Initializing state...')
  return {
    count: initialCount,
    history: [initialCount],
  }
}

// Tercer parámetro: función de inicialización
const [state, dispatch] = useReducer(reducer, 10, init)
```

### 2. Middleware Pattern

```typescript
/**
 * ✅ Logger middleware para debugging
 */

function useReducerWithLogger<S, A>(
  reducer: React.Reducer<S, A>,
  initialState: S
): [S, React.Dispatch<A>] {
  const [state, dispatch] = useReducer(reducer, initialState)
  
  const dispatchWithLogger = (action: A) => {
    console.log('Previous State:', state)
    console.log('Action:', action)
    dispatch(action)
    // Estado nuevo se verá en el siguiente render
  }
  
  return [state, dispatchWithLogger as React.Dispatch<A>]
}

// Uso
const [state, dispatch] = useReducerWithLogger(cartReducer, initialState)
```

### 3. Async Actions

```typescript
/**
 * ✅ Manejar acciones asíncronas
 */

function useTodos() {
  const [state, dispatch] = useReducer(todoReducer, initialState)
  
  async function fetchTodos() {
    dispatch({ type: 'SET_LOADING', payload: true })
    
    try {
      const response = await fetch('https://api.example.com/todos')
      const todos = await response.json()
      
      dispatch({ type: 'SET_TODOS', payload: todos })
    } catch (error) {
      dispatch({
        type: 'SET_ERROR',
        payload: error.message,
      })
    }
  }
  
  return { state, dispatch, fetchTodos }
}
```

---

## ✅ Mejores Prácticas

### 1. Inmutabilidad

```typescript
// ✅ BUENO - Crear nuevo objeto
case 'UPDATE_USER':
  return {
    ...state,
    user: {
      ...state.user,
      name: action.payload.name,
    },
  }

// ❌ MALO - Mutar estado
case 'UPDATE_USER':
  state.user.name = action.payload.name // ❌ Mutación!
  return state
```

### 2. Constantes para Action Types

```typescript
// ✅ BUENO - Constantes evitan typos
const ActionTypes = {
  ADD_ITEM: 'ADD_ITEM',
  REMOVE_ITEM: 'REMOVE_ITEM',
} as const

dispatch({ type: ActionTypes.ADD_ITEM, payload: item })

// ❌ MALO - Strings sueltos
dispatch({ type: 'ADD_ITEM', payload: item }) // Typo: 'AD_ITEM'
```

### 3. Separar Reducer en Archivo

```typescript
// reducers/cartReducer.ts
export { cartReducer, initialState }
export type { CartState, CartAction }

// contexts/CartContext.tsx
import { cartReducer, initialState } from '../reducers/cartReducer'
```

### 4. Testing

```typescript
/**
 * ✅ Reducers son fáciles de testear (funciones puras)
 */

describe('cartReducer', () => {
  it('should add item to cart', () => {
    const state = initialState
    const action = {
      type: 'ADD_ITEM' as const,
      payload: { id: '1', name: 'Product', price: 10, quantity: 1 },
    }
    
    const newState = cartReducer(state, action)
    
    expect(newState.items).toHaveLength(1)
    expect(newState.total).toBe(10)
  })
})
```

---

## 📊 useReducer vs Redux

| Aspecto                | useReducer      | Redux           |
| ---------------------- | --------------- | --------------- |
| **Setup**              | Mínimo          | Complejo        |
| **Boilerplate**        | Bajo            | Alto            |
| **DevTools**           | No (sin librería)| Sí             |
| **Middleware**         | Manual          | Integrado       |
| **Time Travel Debug**  | No              | Sí              |
| **Performance**        | Buena           | Excelente       |
| **Curva aprendizaje**  | Baja            | Alta            |
| **Ideal para**         | Apps medianas   | Apps grandes    |

**Recomendación:** Empezar con useReducer, migrar a Redux si creces mucho.

---

## ✅ Checklist de Comprensión

### Nivel Básico
- [ ] Entiendo qué es useReducer
- [ ] Sé cuándo usar useReducer vs useState
- [ ] Puedo crear un reducer básico
- [ ] Entiendo qué son actions y dispatch
- [ ] Manejo inmutabilidad en reducers

### Nivel Intermedio
- [ ] Implemento reducers con TypeScript
- [ ] Combino useReducer con Context API
- [ ] Creo action creators
- [ ] Manejo estado complejo con múltiples campos
- [ ] Aplico patrones de separación de concerns

### Nivel Avanzado
- [ ] Implemento lazy initialization
- [ ] Creo middleware personalizado
- [ ] Manejo acciones asíncronas
- [ ] Testeo reducers
- [ ] Sé cuándo migrar a Redux

---

## 🎓 Resumen

### Conceptos Clave

1. **useReducer** - Hook para estado complejo
2. **Reducer** - Función pura (state, action) => newState
3. **Actions** - Objetos con type y payload
4. **dispatch** - Función para enviar acciones
5. **Inmutabilidad** - Siempre retornar nuevo objeto

### Cuándo Usar

✅ Estado complejo con múltiples sub-valores  
✅ Lógica de actualización compleja  
✅ Estado que necesita ser testeable  
✅ Transiciones predecibles  

❌ Estado simple (usar useState)  
❌ Apps muy grandes (considerar Redux)  

---

## 🔜 Próximo Tema

**[04. Custom Hooks Avanzados](./04-custom-hooks-avanzados.md)**

Aprenderás a crear tus propios hooks reutilizables para encapsular lógica compleja.

---

_Teoría 3: useReducer y Estado Complejo - Semana 3_  
_Bootcamp React Native 2025 - EPTI_

**Tiempo estimado:** 30-35 minutos  
**Dificultad:** ⭐⭐⭐ Intermedia-Avanzada
