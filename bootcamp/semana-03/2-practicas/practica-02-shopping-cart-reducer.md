# 🛒 Práctica 2: Shopping Cart con useReducer

> **Objetivo:** Implementar un carrito de compras usando `useReducer` para manejar estado complejo.

---

## 🎯 Objetivos de Aprendizaje

Al completar esta práctica, habrás:

- ✅ Usado **useReducer** para estado complejo
- ✅ Creado **actions** y un **reducer function**
- ✅ Implementado operaciones de carrito (agregar, remover, actualizar cantidad)
- ✅ Calculado valores derivados (total, cantidad de items)
- ✅ Aplicado **TypeScript** con discriminated unions

---

## 📚 Requisitos Previos

- [ ] Haber leído [03-usereducer-estado-complejo.md](../1-teoria/03-usereducer-estado-complejo.md)
- [ ] Comprender la diferencia entre useState y useReducer
- [ ] Entender la estructura de actions y reducers

---

## 🏗️ Estructura del Proyecto

```
shopping-cart-app/
├── App.tsx
└── src/
    ├── types/
    │   └── cart.ts           # Tipos TypeScript
    ├── reducers/
    │   └── cartReducer.ts    # Reducer del carrito
    ├── components/
    │   ├── ProductCard.tsx   # Card de producto
    │   └── CartItem.tsx      # Item en el carrito
    └── screens/
        └── ShopScreen.tsx    # Pantalla principal
```

---

## 📝 Paso 1: Definir Tipos

**Archivo:** `src/types/cart.ts`

```typescript
export interface Product {
  id: string
  name: string
  price: number
  image: string
}

export interface CartItem {
  product: Product
  quantity: number
}

export interface CartState {
  items: CartItem[]
  total: number
}

// Actions con discriminated unions
export type CartAction =
  | { type: 'ADD_ITEM'; payload: Product }
  | { type: 'REMOVE_ITEM'; payload: string } // id del producto
  | { type: 'UPDATE_QUANTITY'; payload: { id: string; quantity: number } }
  | { type: 'CLEAR_CART' }
```

---

## 🔧 Paso 2: Crear el Reducer

**Archivo:** `src/reducers/cartReducer.ts`

```typescript
import { CartState, CartAction } from '../types/cart'

// Estado inicial
export const initialCartState: CartState = {
  items: [],
  total: 0,
}

// Función helper para calcular total
function calculateTotal(items: CartItem[]): number {
  return items.reduce((sum, item) => sum + item.product.price * item.quantity, 0)
}

// Reducer
export function cartReducer(state: CartState, action: CartAction): CartState {
  switch (action.type) {
    case 'ADD_ITEM': {
      const existingIndex = state.items.findIndex(
        item => item.product.id === action.payload.id
      )
      
      let newItems
      if (existingIndex >= 0) {
        // Incrementar cantidad si ya existe
        newItems = [...state.items]
        newItems[existingIndex] = {
          ...newItems[existingIndex],
          quantity: newItems[existingIndex].quantity + 1,
        }
      } else {
        // Agregar nuevo item
        newItems = [...state.items, { product: action.payload, quantity: 1 }]
      }
      
      return {
        items: newItems,
        total: calculateTotal(newItems),
      }
    }
    
    case 'REMOVE_ITEM': {
      const newItems = state.items.filter(item => item.product.id !== action.payload)
      return {
        items: newItems,
        total: calculateTotal(newItems),
      }
    }
    
    case 'UPDATE_QUANTITY': {
      const newItems = state.items.map(item =>
        item.product.id === action.payload.id
          ? { ...item, quantity: action.payload.quantity }
          : item
      )
      return {
        items: newItems,
        total: calculateTotal(newItems),
      }
    }
    
    case 'CLEAR_CART': {
      return initialCartState
    }
    
    default:
      return state
  }
}
```

**💡 Puntos clave:**
- Cada case retorna un **nuevo estado** (inmutabilidad)
- Lógica compleja centralizada en el reducer
- TypeScript asegura que todos los cases están cubiertos

---

## 🎨 Paso 3: Componente ProductCard

**Archivo:** `src/components/ProductCard.tsx`

```typescript
import React from 'react'
import { View, Text, Image, TouchableOpacity, StyleSheet } from 'react-native'
import { Product } from '../types/cart'

interface ProductCardProps {
  product: Product
  onAdd: (product: Product) => void
}

export function ProductCard({ product, onAdd }: ProductCardProps) {
  return (
    <View style={styles.card}>
      <Image source={{ uri: product.image }} style={styles.image} />
      <Text style={styles.name}>{product.name}</Text>
      <Text style={styles.price}>${product.price.toFixed(2)}</Text>
      <TouchableOpacity style={styles.button} onPress={() => onAdd(product)}>
        <Text style={styles.buttonText}>Agregar al carrito</Text>
      </TouchableOpacity>
    </View>
  )
}

const styles = StyleSheet.create({
  card: {
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 16,
    margin: 8,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  image: {
    width: 120,
    height: 120,
    borderRadius: 8,
    marginBottom: 12,
  },
  name: {
    fontSize: 16,
    fontWeight: '600',
    marginBottom: 4,
    textAlign: 'center',
  },
  price: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#007AFF',
    marginBottom: 12,
  },
  button: {
    backgroundColor: '#007AFF',
    paddingHorizontal: 20,
    paddingVertical: 10,
    borderRadius: 8,
  },
  buttonText: {
    color: '#fff',
    fontWeight: '600',
  },
})
```

---

## 🛍️ Paso 4: Componente CartItem

**Archivo:** `src/components/CartItem.tsx`

```typescript
import React from 'react'
import { View, Text, Image, TouchableOpacity, StyleSheet } from 'react-native'
import { CartItem as CartItemType } from '../types/cart'

interface CartItemProps {
  item: CartItemType
  onUpdateQuantity: (id: string, quantity: number) => void
  onRemove: (id: string) => void
}

export function CartItem({ item, onUpdateQuantity, onRemove }: CartItemProps) {
  const subtotal = item.product.price * item.quantity
  
  return (
    <View style={styles.container}>
      <Image source={{ uri: item.product.image }} style={styles.image} />
      
      <View style={styles.details}>
        <Text style={styles.name}>{item.product.name}</Text>
        <Text style={styles.price}>${item.product.price.toFixed(2)}</Text>
        
        {/* Controles de cantidad */}
        <View style={styles.quantity}>
          <TouchableOpacity
            style={styles.quantityButton}
            onPress={() => onUpdateQuantity(item.product.id, item.quantity - 1)}
            disabled={item.quantity <= 1}
          >
            <Text style={styles.quantityButtonText}>-</Text>
          </TouchableOpacity>
          
          <Text style={styles.quantityText}>{item.quantity}</Text>
          
          <TouchableOpacity
            style={styles.quantityButton}
            onPress={() => onUpdateQuantity(item.product.id, item.quantity + 1)}
          >
            <Text style={styles.quantityButtonText}>+</Text>
          </TouchableOpacity>
        </View>
        
        <Text style={styles.subtotal}>Subtotal: ${subtotal.toFixed(2)}</Text>
      </View>
      
      <TouchableOpacity
        style={styles.removeButton}
        onPress={() => onRemove(item.product.id)}
      >
        <Text style={styles.removeText}>🗑️</Text>
      </TouchableOpacity>
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    backgroundColor: '#fff',
    padding: 12,
    marginBottom: 8,
    borderRadius: 8,
  },
  image: {
    width: 80,
    height: 80,
    borderRadius: 8,
  },
  details: {
    flex: 1,
    marginLeft: 12,
    justifyContent: 'space-between',
  },
  name: {
    fontSize: 16,
    fontWeight: '600',
  },
  price: {
    fontSize: 14,
    color: '#666',
  },
  quantity: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  quantityButton: {
    width: 28,
    height: 28,
    borderRadius: 14,
    backgroundColor: '#007AFF',
    justifyContent: 'center',
    alignItems: 'center',
  },
  quantityButtonText: {
    color: '#fff',
    fontSize: 18,
    fontWeight: 'bold',
  },
  quantityText: {
    marginHorizontal: 12,
    fontSize: 16,
    fontWeight: '600',
  },
  subtotal: {
    fontSize: 14,
    fontWeight: '600',
    color: '#007AFF',
  },
  removeButton: {
    padding: 8,
  },
  removeText: {
    fontSize: 24,
  },
})
```

---

## 📱 Paso 5: Pantalla Principal

**Archivo:** `src/screens/ShopScreen.tsx`

```typescript
import React, { useReducer } from 'react'
import {
  View,
  Text,
  FlatList,
  TouchableOpacity,
  StyleSheet,
  SafeAreaView,
} from 'react-native'
import { cartReducer, initialCartState } from '../reducers/cartReducer'
import { ProductCard } from '../components/ProductCard'
import { CartItem } from '../components/CartItem'
import { Product } from '../types/cart'

// Productos de ejemplo
const PRODUCTS: Product[] = [
  {
    id: '1',
    name: 'Laptop',
    price: 999.99,
    image: 'https://picsum.photos/200/200?random=1',
  },
  {
    id: '2',
    name: 'Mouse',
    price: 29.99,
    image: 'https://picsum.photos/200/200?random=2',
  },
  {
    id: '3',
    name: 'Teclado',
    price: 79.99,
    image: 'https://picsum.photos/200/200?random=3',
  },
  {
    id: '4',
    name: 'Monitor',
    price: 299.99,
    image: 'https://picsum.photos/200/200?random=4',
  },
]

export function ShopScreen() {
  const [cart, dispatch] = useReducer(cartReducer, initialCartState)
  
  const handleAddToCart = (product: Product) => {
    dispatch({ type: 'ADD_ITEM', payload: product })
  }
  
  const handleUpdateQuantity = (id: string, quantity: number) => {
    if (quantity <= 0) {
      dispatch({ type: 'REMOVE_ITEM', payload: id })
    } else {
      dispatch({ type: 'UPDATE_QUANTITY', payload: { id, quantity } })
    }
  }
  
  const handleRemoveItem = (id: string) => {
    dispatch({ type: 'REMOVE_ITEM', payload: id })
  }
  
  const handleClearCart = () => {
    dispatch({ type: 'CLEAR_CART' })
  }
  
  return (
    <SafeAreaView style={styles.container}>
      {/* Header */}
      <View style={styles.header}>
        <Text style={styles.title}>Tienda</Text>
        <View style={styles.cartBadge}>
          <Text style={styles.cartBadgeText}>🛒 {cart.items.length}</Text>
        </View>
      </View>
      
      {/* Productos */}
      <FlatList
        data={PRODUCTS}
        keyExtractor={item => item.id}
        renderItem={({ item }) => (
          <ProductCard product={item} onAdd={handleAddToCart} />
        )}
        numColumns={2}
        contentContainerStyle={styles.products}
        ListHeaderComponent={
          cart.items.length > 0 ? (
            <View style={styles.cartSection}>
              <View style={styles.cartHeader}>
                <Text style={styles.cartTitle}>Carrito</Text>
                <TouchableOpacity onPress={handleClearCart}>
                  <Text style={styles.clearButton}>Vaciar</Text>
                </TouchableOpacity>
              </View>
              
              {cart.items.map(item => (
                <CartItem
                  key={item.product.id}
                  item={item}
                  onUpdateQuantity={handleUpdateQuantity}
                  onRemove={handleRemoveItem}
                />
              ))}
              
              <View style={styles.totalContainer}>
                <Text style={styles.totalLabel}>Total:</Text>
                <Text style={styles.totalAmount}>${cart.total.toFixed(2)}</Text>
              </View>
            </View>
          ) : null
        }
      />
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
  title: {
    fontSize: 24,
    fontWeight: 'bold',
  },
  cartBadge: {
    backgroundColor: '#007AFF',
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 16,
  },
  cartBadgeText: {
    color: '#fff',
    fontWeight: '600',
  },
  products: {
    padding: 8,
  },
  cartSection: {
    backgroundColor: '#fff',
    margin: 8,
    padding: 16,
    borderRadius: 12,
    marginBottom: 16,
  },
  cartHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 12,
  },
  cartTitle: {
    fontSize: 20,
    fontWeight: 'bold',
  },
  clearButton: {
    color: '#FF3B30',
    fontWeight: '600',
  },
  totalContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginTop: 16,
    paddingTop: 16,
    borderTopWidth: 2,
    borderTopColor: '#e0e0e0',
  },
  totalLabel: {
    fontSize: 20,
    fontWeight: 'bold',
  },
  totalAmount: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#007AFF',
  },
})
```

---

## 🚀 Paso 6: App.tsx

```typescript
import React from 'react'
import { ShopScreen } from './src/screens/ShopScreen'

export default function App() {
  return <ShopScreen />
}
```

---

## ✅ Probar la Aplicación

```bash
pnpm start
```

### Funcionalidades a verificar:
- [ ] Agregar productos al carrito
- [ ] Incrementar/decrementar cantidad
- [ ] Calcular subtotales y total correctamente
- [ ] Remover items individuales
- [ ] Vaciar carrito completo

---

## 🎯 Desafíos Adicionales (Opcionales)

### 1. Persistencia
Guarda el carrito en AsyncStorage

### 2. Animaciones
Agrega animaciones al agregar/remover items

### 3. Checkout
Crea una pantalla de checkout con resumen

---

## 📊 Criterios de Evaluación

| Criterio | Puntos |
|----------|--------|
| Reducer implementado correctamente | 5 pts |
| Actions tipadas con TypeScript | 3 pts |
| Componentes funcionando | 4 pts |
| Cálculos correctos | 3 pts |
| UI limpia y usable | 3 pts |
| Manejo de edge cases | 2 pts |
| **TOTAL** | **20 pts** |

---

## 💡 Conceptos Clave

- ✅ **useReducer** para estado complejo
- ✅ **Actions** bien definidas
- ✅ **Immutability** en el reducer
- ✅ **TypeScript** discriminated unions
- ✅ **Valores derivados** (total, subtotales)

---

## 🔜 Siguiente Práctica

**[Práctica 3: Auth con Persistencia](./practica-03-auth-persistence.md)**

Combinarás Context API + AsyncStorage para autenticación.

---

_Práctica 2: Shopping Cart con useReducer - Semana 3_  
_Bootcamp React Native 2025 - EPTI_

**Tiempo estimado:** 1.5-2 horas  
**Dificultad:** ⭐⭐ Intermedio
