# Fase 2: Context y State Management (1h autónomo)

> **Implementación del CartContext para gestionar el estado del carrito**

---

## 🎯 Objetivos de esta Fase

- ✅ Crear CartContext con Context API
- ✅ Implementar funciones de agregar/eliminar productos
- ✅ Calcular totales automáticamente
- ✅ Gestionar cantidades de productos
- ✅ Integrar Provider en la app

**Tiempo:** 1 hora trabajo autónomo

---

## 📝 Paso 1: Crear CartContext (45 min)

```typescript
// src/context/CartContext.tsx
import React, {
  createContext,
  useContext,
  useState,
  useEffect,
  ReactNode,
} from 'react'
import type { CartItem, CartState, Product } from '../types'

/**
 * CartContext - Context para gestionar el carrito de compras
 *
 * ¿Para qué?
 * Compartir el estado del carrito entre todas las pantallas
 * sin necesidad de prop drilling
 *
 * ¿Cómo funciona?
 * 1. Mantiene un array de CartItem
 * 2. Calcula totales automáticamente
 * 3. Provee funciones para manipular el carrito
 */

// ============================================
// Context Type Definition
// ============================================

interface CartContextType {
  // Estado
  cart: CartState

  // Acciones
  addToCart: (product: Product, quantity?: number) => void
  removeFromCart: (productId: number) => void
  updateQuantity: (productId: number, quantity: number) => void
  clearCart: () => void

  // Helpers
  isInCart: (productId: number) => boolean
  getItemQuantity: (productId: number) => number
}

// ============================================
// Create Context
// ============================================

const CartContext = createContext<CartContextType | undefined>(undefined)

// ============================================
// Provider Component
// ============================================

interface CartProviderProps {
  children: ReactNode
}

export function CartProvider({ children }: CartProviderProps) {
  const [items, setItems] = useState<CartItem[]>([])
  const [total, setTotal] = useState(0)
  const [itemCount, setItemCount] = useState(0)

  /**
   * Efecto para calcular totales
   * Se ejecuta cada vez que items cambia
   */
  useEffect(() => {
    calculateTotals()
  }, [items])

  /**
   * Calcula el total del carrito y la cantidad de items
   */
  const calculateTotals = () => {
    let newTotal = 0
    let newItemCount = 0

    items.forEach((item) => {
      // Calcular precio con descuento si aplica
      const itemPrice = item.product.discount
        ? item.product.price * (1 - item.product.discount / 100)
        : item.product.price

      newTotal += itemPrice * item.quantity
      newItemCount += item.quantity
    })

    setTotal(newTotal)
    setItemCount(newItemCount)
  }

  /**
   * Agregar producto al carrito
   *
   * ¿Cómo funciona?
   * 1. Busca si el producto ya está en el carrito
   * 2. Si está, incrementa la cantidad
   * 3. Si no está, lo agrega como nuevo item
   */
  const addToCart = (product: Product, quantity: number = 1) => {
    setItems((prevItems) => {
      // Buscar si el producto ya existe
      const existingItem = prevItems.find(
        (item) => item.product.id === product.id
      )

      if (existingItem) {
        // Si existe, actualizar cantidad
        return prevItems.map((item) =>
          item.product.id === product.id
            ? { ...item, quantity: item.quantity + quantity }
            : item
        )
      } else {
        // Si no existe, agregar nuevo
        return [...prevItems, { product, quantity }]
      }
    })
  }

  /**
   * Eliminar producto del carrito
   */
  const removeFromCart = (productId: number) => {
    setItems((prevItems) =>
      prevItems.filter((item) => item.product.id !== productId)
    )
  }

  /**
   * Actualizar cantidad de un producto
   *
   * ¿Qué hace?
   * - Si quantity es 0, elimina el producto
   * - Si quantity > 0, actualiza la cantidad
   */
  const updateQuantity = (productId: number, quantity: number) => {
    if (quantity <= 0) {
      removeFromCart(productId)
      return
    }

    setItems((prevItems) =>
      prevItems.map((item) =>
        item.product.id === productId ? { ...item, quantity } : item
      )
    )
  }

  /**
   * Vaciar el carrito completamente
   */
  const clearCart = () => {
    setItems([])
  }

  /**
   * Verificar si un producto está en el carrito
   */
  const isInCart = (productId: number): boolean => {
    return items.some((item) => item.product.id === productId)
  }

  /**
   * Obtener la cantidad de un producto en el carrito
   */
  const getItemQuantity = (productId: number): number => {
    const item = items.find((item) => item.product.id === productId)
    return item ? item.quantity : 0
  }

  // Valor del contexto
  const value: CartContextType = {
    cart: { items, total, itemCount },
    addToCart,
    removeFromCart,
    updateQuantity,
    clearCart,
    isInCart,
    getItemQuantity,
  }

  return <CartContext.Provider value={value}>{children}</CartContext.Provider>
}

// ============================================
// Custom Hook
// ============================================

/**
 * Hook personalizado para usar el CartContext
 *
 * ¿Para qué?
 * Simplificar el uso del contexto y agregar validación
 *
 * Uso:
 * const { cart, addToCart, removeFromCart } = useCart()
 */
export function useCart() {
  const context = useContext(CartContext)

  if (context === undefined) {
    throw new Error('useCart must be used within a CartProvider')
  }

  return context
}
```

---

## 📝 Paso 2: Integrar Provider en App (15 min)

```typescript
// App.tsx
import React from 'react'
import { NavigationContainer } from '@react-navigation/native'
import { CartProvider } from './src/context/CartContext'

/**
 * App Principal
 *
 * ¿Qué hace?
 * Envuelve la navegación con el CartProvider para que
 * todas las pantallas tengan acceso al estado del carrito
 *
 * Orden importante:
 * CartProvider debe estar por ENCIMA del NavigationContainer
 * para que el badge del tab pueda acceder al estado
 */

export default function App() {
  return (
    <CartProvider>
      <NavigationContainer>
        {/* Los navegadores se agregarán aquí en Fase 7 */}
        <Text>E-Commerce App</Text>
      </NavigationContainer>
    </CartProvider>
  )
}
```

---

## 🧪 Paso 3: Utilidades de Formateo (Opcional)

```typescript
// src/utils/formatters.ts

/**
 * Utilidades para formateo de datos
 */

/**
 * Formatear precio a moneda
 *
 * @param price - Precio numérico
 * @returns String formateado como moneda (ej: "$99.99")
 */
export function formatPrice(price: number): string {
  return `$${price.toFixed(2)}`
}

/**
 * Calcular precio con descuento
 *
 * @param price - Precio original
 * @param discount - Porcentaje de descuento
 * @returns Precio final con descuento aplicado
 */
export function calculateDiscountedPrice(
  price: number,
  discount?: number
): number {
  if (!discount) return price
  return price * (1 - discount / 100)
}

/**
 * Formatear fecha
 *
 * @param dateString - String de fecha ISO
 * @returns Fecha formateada (ej: "15 Jan 2025")
 */
export function formatDate(dateString: string): string {
  const date = new Date(dateString)
  const options: Intl.DateTimeFormatOptions = {
    day: 'numeric',
    month: 'short',
    year: 'numeric',
  }
  return date.toLocaleDateString('en-US', options)
}

/**
 * Calcular ahorro por descuento
 *
 * @param price - Precio original
 * @param discount - Porcentaje de descuento
 * @returns Cantidad ahorrada
 */
export function calculateSavings(price: number, discount?: number): number {
  if (!discount) return 0
  return price * (discount / 100)
}

/**
 * Obtener badge de estado del pedido
 *
 * @param status - Estado del pedido
 * @returns Objeto con color y texto para UI
 */
export function getOrderStatusBadge(
  status: 'pending' | 'processing' | 'shipped' | 'delivered' | 'cancelled'
): { color: string; text: string; bgColor: string } {
  const badges = {
    pending: {
      color: '#f59e0b',
      text: 'Pendiente',
      bgColor: '#fef3c7',
    },
    processing: {
      color: '#3b82f6',
      text: 'Procesando',
      bgColor: '#dbeafe',
    },
    shipped: {
      color: '#8b5cf6',
      text: 'Enviado',
      bgColor: '#ede9fe',
    },
    delivered: {
      color: '#10b981',
      text: 'Entregado',
      bgColor: '#d1fae5',
    },
    cancelled: {
      color: '#ef4444',
      text: 'Cancelado',
      bgColor: '#fee2e2',
    },
  }

  return badges[status]
}
```

---

## 🧪 Paso 4: Testing del Context (Conceptual)

Para verificar que el Context funciona correctamente, puedes crear un componente de prueba:

```typescript
// src/components/CartTest.tsx (SOLO PARA PRUEBAS)
import React from 'react'
import { View, Text, Button } from 'react-native'
import { useCart } from '../context/CartContext'
import { PRODUCTS } from '../data/products'

/**
 * Componente de prueba para el CartContext
 *
 * SOLO PARA DESARROLLO - Eliminar en producción
 */

export function CartTest() {
  const { cart, addToCart, removeFromCart, clearCart } = useCart()

  const testProduct = PRODUCTS[0] // iPhone 15 Pro

  return (
    <View style={{ padding: 20 }}>
      <Text style={{ fontSize: 20, fontWeight: 'bold', marginBottom: 10 }}>
        Cart Test
      </Text>

      <Text>Items en carrito: {cart.itemCount}</Text>
      <Text>Total: ${cart.total.toFixed(2)}</Text>

      <View style={{ marginTop: 20, gap: 10 }}>
        <Button title="Agregar iPhone" onPress={() => addToCart(testProduct)} />

        <Button
          title="Eliminar iPhone"
          onPress={() => removeFromCart(testProduct.id)}
          color="#ef4444"
        />

        <Button title="Vaciar Carrito" onPress={clearCart} color="#f59e0b" />
      </View>

      <View style={{ marginTop: 20 }}>
        <Text style={{ fontWeight: 'bold' }}>Items:</Text>
        {cart.items.map((item) => (
          <Text key={item.product.id}>
            {item.product.name} x{item.quantity}
          </Text>
        ))}
      </View>
    </View>
  )
}
```

Para probarlo temporalmente en App.tsx:

```typescript
// App.tsx (versión de prueba)
import { CartTest } from './src/components/CartTest'

export default function App() {
  return (
    <CartProvider>
      <CartTest />
    </CartProvider>
  )
}
```

**Recuerda eliminar este componente de prueba después de verificar que funciona.**

---

## 📚 Conceptos Clave

### Context API

**¿Qué es?**
Una forma de compartir datos entre componentes sin pasar props manualmente en cada nivel (prop drilling).

**¿Cuándo usarlo?**

- Estado global (tema, autenticación, carrito)
- Datos que muchos componentes necesitan
- Evitar prop drilling profundo

**¿Cómo funciona?**

1. **createContext**: Crea el contexto
2. **Provider**: Componente que provee el valor
3. **useContext**: Hook para consumir el valor

### Custom Hooks

**¿Por qué crear `useCart()`?**

- Encapsula la lógica del contexto
- Agrega validación (error si se usa fuera del Provider)
- Simplifica el uso en componentes
- Mejor DX (Developer Experience)

### State Derivado

**¿Qué es?**
Estado que se calcula a partir de otro estado (total, itemCount).

**¿Por qué usar useEffect?**
Para recalcular automáticamente cuando items cambia.

---

## ✅ Verificación de la Fase 2

### Checklist:

- [ ] `CartContext.tsx` creado con todas las funciones
- [ ] `CartProvider` envuelve `NavigationContainer` en App.tsx
- [ ] `useCart` hook funciona correctamente
- [ ] Funciones del carrito implementadas:
  - [ ] addToCart
  - [ ] removeFromCart
  - [ ] updateQuantity
  - [ ] clearCart
  - [ ] isInCart
  - [ ] getItemQuantity
- [ ] Totales se calculan automáticamente
- [ ] TypeScript sin errores
- [ ] (Opcional) Utilidades de formateo creadas

### Pruebas Manuales:

```typescript
// En cualquier pantalla, ahora puedes usar:
const { cart, addToCart } = useCart()

// Agregar producto
addToCart(PRODUCTS[0], 2) // Agrega 2 iPhones

// Ver estado
console.log(cart.itemCount) // 2
console.log(cart.total) // 1998 (sin descuento)

// Eliminar producto
removeFromCart(1)

// Verificar
console.log(cart.itemCount) // 0
```

---

## 💡 Tips y Buenas Prácticas

### 1. Manejo de Errores

```typescript
// Siempre validar en funciones críticas
const addToCart = (product: Product, quantity: number = 1) => {
  if (!product || !product.id) {
    console.error('Invalid product')
    return
  }

  if (quantity < 1) {
    console.error('Quantity must be at least 1')
    return
  }

  // ... resto del código
}
```

### 2. Performance

```typescript
// Usar callbacks para evitar closures innecesarias
const addToCart = useCallback((product: Product, quantity: number = 1) => {
  setItems((prevItems) => {
    // ...
  })
}, []) // No dependencies
```

### 3. Persistencia (Opcional - Avanzado)

```typescript
import AsyncStorage from '@react-native-async-storage/async-storage'

// Guardar carrito
useEffect(() => {
  AsyncStorage.setItem('cart', JSON.stringify(items))
}, [items])

// Cargar carrito al iniciar
useEffect(() => {
  AsyncStorage.getItem('cart').then((data) => {
    if (data) {
      setItems(JSON.parse(data))
    }
  })
}, [])
```

---

## 🐛 Troubleshooting

### Error: "useCart must be used within a CartProvider"

**Causa:** Intentas usar `useCart()` fuera del `<CartProvider>`

**Solución:**

```typescript
// ✅ Correcto
<CartProvider>
  <NavigationContainer>
    <YourScreens />
  </NavigationContainer>
</CartProvider>

// ❌ Incorrecto
<NavigationContainer>
  <CartProvider>
    <YourScreens />
  </CartProvider>
</NavigationContainer>
```

### Los totales no se actualizan

**Causa:** Olvidaste el `useEffect` para calcular totales

**Solución:**

```typescript
useEffect(() => {
  calculateTotals()
}, [items]) // ← Dependencia importante
```

### State no se actualiza inmediatamente

**Causa:** `setState` es asíncrono

**Solución:**

```typescript
// ❌ Incorrecto
addToCart(product)
console.log(cart.items) // Todavía vacío

// ✅ Correcto
addToCart(product)
// Espera al siguiente render o usa useEffect
```

---

## 🔜 Siguiente Fase

**[Fase 3: Componentes Reutilizables →](./FASE-03-COMPONENTES.md)**

Crearemos los componentes UI que se usan en múltiples pantallas.

---

_Fase 2 completada ✅_  
_Proyecto E-Commerce - Semana 2_
