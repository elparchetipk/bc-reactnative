# Fase 1: Setup y Datos (30 min presencial)

> **Configuración inicial del proyecto y creación de datos mock**

---

## 🎯 Objetivos de esta Fase

- ✅ Crear estructura de carpetas
- ✅ Definir tipos TypeScript globales
- ✅ Crear mock data de productos, categorías y usuario
- ✅ Definir tipos de navegación

**Tiempo:** 30 minutos en clase presencial

---

## 📁 Paso 1: Crear Estructura de Carpetas (5 min)

```bash
# Desde la raíz del proyecto
mkdir -p src/{navigation,screens,components,context,data,types,utils}
mkdir -p src/screens/{home,cart,profile,category}
mkdir -p src/navigation/stacks
```

Estructura resultante:

```
src/
├── navigation/
│   └── stacks/
├── screens/
│   ├── home/
│   ├── cart/
│   ├── profile/
│   └── category/
├── components/
├── context/
├── data/
├── types/
└── utils/
```

---

## 📝 Paso 2: Tipos Globales (5 min)

```typescript
// src/types/index.ts

/**
 * Tipos globales de la aplicación E-Commerce
 */

// ============================================
// Product Types
// ============================================

export interface Product {
  id: number
  name: string
  description: string
  price: number
  image: string
  category: string
  rating: number
  reviews: number
  inStock: boolean
  discount?: number
}

// ============================================
// Category Types
// ============================================

export interface Category {
  id: number
  name: string
  icon: string
  description: string
  productCount: number
}

// ============================================
// Cart Types
// ============================================

export interface CartItem {
  product: Product
  quantity: number
}

export interface CartState {
  items: CartItem[]
  total: number
  itemCount: number
}

// ============================================
// Review Types
// ============================================

export interface Review {
  id: number
  productId: number
  userName: string
  userAvatar: string
  rating: number
  comment: string
  date: string
  helpful: number
}

// ============================================
// User Types
// ============================================

export interface User {
  id: number
  name: string
  email: string
  avatar: string
  phone: string
  address: Address
}

export interface Address {
  street: string
  city: string
  state: string
  zipCode: string
  country: string
}

// ============================================
// Order Types
// ============================================

export interface Order {
  id: number
  date: string
  total: number
  status: 'pending' | 'processing' | 'shipped' | 'delivered' | 'cancelled'
  items: CartItem[]
}

// ============================================
// Shipping & Payment Types
// ============================================

export interface ShippingInfo {
  fullName: string
  phone: string
  address: Address
}

export interface PaymentMethod {
  id: number
  type: 'credit_card' | 'debit_card' | 'paypal' | 'cash'
  name: string
  icon: string
  lastFourDigits?: string
}
```

---

## 📝 Paso 3: Mock Data - Productos (10 min)

```typescript
// src/data/products.ts
import type { Product } from '../types'

/**
 * Mock data de productos
 *
 * ¿Para qué?
 * Simular productos de diferentes categorías para el E-Commerce
 */

export const PRODUCTS: Product[] = [
  // Electronics
  {
    id: 1,
    name: 'iPhone 15 Pro',
    description:
      'Latest iPhone with A17 Pro chip, titanium design, and advanced camera system',
    price: 999,
    image: 'https://picsum.photos/seed/iphone15/400/400',
    category: 'Electronics',
    rating: 4.8,
    reviews: 1234,
    inStock: true,
    discount: 10,
  },
  {
    id: 2,
    name: 'MacBook Pro 16"',
    description:
      'Powerful laptop with M3 Max chip, 32GB RAM, perfect for professionals',
    price: 2499,
    image: 'https://picsum.photos/seed/macbook/400/400',
    category: 'Electronics',
    rating: 4.9,
    reviews: 856,
    inStock: true,
  },
  {
    id: 3,
    name: 'AirPods Pro 2',
    description:
      'Active noise cancellation, adaptive transparency, personalized spatial audio',
    price: 249,
    image: 'https://picsum.photos/seed/airpods/400/400',
    category: 'Electronics',
    rating: 4.7,
    reviews: 2341,
    inStock: true,
    discount: 15,
  },
  {
    id: 4,
    name: 'iPad Air M2',
    description:
      'Thin, light, and powerful tablet with M2 chip and Apple Pencil support',
    price: 599,
    image: 'https://picsum.photos/seed/ipad/400/400',
    category: 'Electronics',
    rating: 4.6,
    reviews: 678,
    inStock: true,
  },
  {
    id: 5,
    name: 'Sony WH-1000XM5',
    description:
      'Industry-leading noise canceling headphones with exceptional sound quality',
    price: 399,
    image: 'https://picsum.photos/seed/sony-headphones/400/400',
    category: 'Electronics',
    rating: 4.8,
    reviews: 1567,
    inStock: true,
    discount: 20,
  },

  // Clothing
  {
    id: 6,
    name: 'Nike Air Max 270',
    description:
      'Comfortable running shoes with Max Air unit and breathable mesh upper',
    price: 150,
    image: 'https://picsum.photos/seed/nike-shoes/400/400',
    category: 'Clothing',
    rating: 4.5,
    reviews: 892,
    inStock: true,
  },
  {
    id: 7,
    name: "Levi's 501 Jeans",
    description:
      'Classic straight fit jeans with button fly, timeless American style',
    price: 89,
    image: 'https://picsum.photos/seed/levis-jeans/400/400',
    category: 'Clothing',
    rating: 4.4,
    reviews: 1423,
    inStock: true,
    discount: 25,
  },
  {
    id: 8,
    name: 'North Face Jacket',
    description:
      'Waterproof and breathable outdoor jacket, perfect for any weather',
    price: 199,
    image: 'https://picsum.photos/seed/northface/400/400',
    category: 'Clothing',
    rating: 4.7,
    reviews: 634,
    inStock: true,
  },
  {
    id: 9,
    name: 'Adidas Ultraboost',
    description:
      'Energy-returning running shoes with Boost cushioning technology',
    price: 180,
    image: 'https://picsum.photos/seed/adidas/400/400',
    category: 'Clothing',
    rating: 4.6,
    reviews: 1789,
    inStock: false,
  },

  // Books
  {
    id: 10,
    name: 'Clean Code',
    description:
      'A Handbook of Agile Software Craftsmanship by Robert C. Martin',
    price: 42,
    image: 'https://picsum.photos/seed/clean-code/400/400',
    category: 'Books',
    rating: 4.9,
    reviews: 3456,
    inStock: true,
  },
  {
    id: 11,
    name: 'The Pragmatic Programmer',
    description: 'Your Journey to Mastery, 20th Anniversary Edition',
    price: 45,
    image: 'https://picsum.photos/seed/pragmatic/400/400',
    category: 'Books',
    rating: 4.8,
    reviews: 2134,
    inStock: true,
    discount: 10,
  },
  {
    id: 12,
    name: 'Design Patterns',
    description: 'Elements of Reusable Object-Oriented Software',
    price: 54,
    image: 'https://picsum.photos/seed/patterns/400/400',
    category: 'Books',
    rating: 4.7,
    reviews: 1876,
    inStock: true,
  },
  {
    id: 13,
    name: "You Don't Know JS",
    description: 'Complete 6-book series on JavaScript fundamentals',
    price: 120,
    image: 'https://picsum.photos/seed/ydkjs/400/400',
    category: 'Books',
    rating: 4.9,
    reviews: 2987,
    inStock: true,
  },

  // Sports
  {
    id: 14,
    name: 'Yoga Mat Pro',
    description: 'Extra thick non-slip exercise mat with carrying strap',
    price: 35,
    image: 'https://picsum.photos/seed/yoga-mat/400/400',
    category: 'Sports',
    rating: 4.5,
    reviews: 1234,
    inStock: true,
    discount: 15,
  },
  {
    id: 15,
    name: 'Dumbbells Set 20kg',
    description: 'Adjustable weight dumbbells for home gym, includes stand',
    price: 129,
    image: 'https://picsum.photos/seed/dumbbells/400/400',
    category: 'Sports',
    rating: 4.6,
    reviews: 567,
    inStock: true,
  },
  {
    id: 16,
    name: 'Resistance Bands',
    description: 'Set of 5 exercise bands with different resistance levels',
    price: 29,
    image: 'https://picsum.photos/seed/bands/400/400',
    category: 'Sports',
    rating: 4.4,
    reviews: 892,
    inStock: true,
  },
  {
    id: 17,
    name: 'Football Soccer Ball',
    description: 'Professional match ball, FIFA approved, size 5',
    price: 45,
    image: 'https://picsum.photos/seed/football/400/400',
    category: 'Sports',
    rating: 4.7,
    reviews: 1456,
    inStock: true,
    discount: 10,
  },

  // Home & Garden
  {
    id: 18,
    name: 'Smart LED Bulbs',
    description: 'WiFi enabled color changing bulbs, compatible with Alexa',
    price: 49,
    image: 'https://picsum.photos/seed/led-bulbs/400/400',
    category: 'Home & Garden',
    rating: 4.5,
    reviews: 2345,
    inStock: true,
  },
  {
    id: 19,
    name: 'Robot Vacuum',
    description: 'Smart automatic vacuum cleaner with app control and mapping',
    price: 299,
    image: 'https://picsum.photos/seed/robot-vacuum/400/400',
    category: 'Home & Garden',
    rating: 4.6,
    reviews: 1789,
    inStock: true,
    discount: 30,
  },
  {
    id: 20,
    name: 'Air Purifier',
    description:
      'HEPA filter air purifier for large rooms, removes 99.97% particles',
    price: 199,
    image: 'https://picsum.photos/seed/air-purifier/400/400',
    category: 'Home & Garden',
    rating: 4.7,
    reviews: 1234,
    inStock: true,
  },
  {
    id: 21,
    name: 'Coffee Maker',
    description: 'Programmable drip coffee maker with thermal carafe, 12 cups',
    price: 89,
    image: 'https://picsum.photos/seed/coffee-maker/400/400',
    category: 'Home & Garden',
    rating: 4.4,
    reviews: 987,
    inStock: true,
    discount: 20,
  },
]

// ============================================
// Helper Functions
// ============================================

export const getProductById = (id: number): Product | undefined => {
  return PRODUCTS.find((product) => product.id === id)
}

export const getProductsByCategory = (category: string): Product[] => {
  return PRODUCTS.filter((product) => product.category === category)
}

export const getFeaturedProducts = (limit: number = 6): Product[] => {
  return PRODUCTS.filter((product) => product.inStock)
    .sort((a, b) => b.rating - a.rating)
    .slice(0, limit)
}

export const getDiscountedProducts = (): Product[] => {
  return PRODUCTS.filter((product) => product.discount && product.discount > 0)
}

export const searchProducts = (query: string): Product[] => {
  const lowerQuery = query.toLowerCase()
  return PRODUCTS.filter(
    (product) =>
      product.name.toLowerCase().includes(lowerQuery) ||
      product.description.toLowerCase().includes(lowerQuery)
  )
}
```

---

## 📝 Paso 4: Mock Data - Categorías y Reviews (5 min)

```typescript
// src/data/categories.ts
import type { Category } from '../types'

export const CATEGORIES: Category[] = [
  {
    id: 1,
    name: 'Electronics',
    icon: 'laptop',
    description: 'Smartphones, laptops, tablets and more',
    productCount: 5,
  },
  {
    id: 2,
    name: 'Clothing',
    icon: 'shirt',
    description: 'Fashion for men, women and kids',
    productCount: 4,
  },
  {
    id: 3,
    name: 'Books',
    icon: 'book',
    description: 'Physical and digital books',
    productCount: 4,
  },
  {
    id: 4,
    name: 'Sports',
    icon: 'basketball',
    description: 'Sports equipment and fitness gear',
    productCount: 4,
  },
  {
    id: 5,
    name: 'Home & Garden',
    icon: 'home',
    description: 'Home improvement and garden supplies',
    productCount: 4,
  },
]

// src/data/reviews.ts
import type { Review } from '../types'

export const REVIEWS: Review[] = [
  {
    id: 1,
    productId: 1,
    userName: 'John Doe',
    userAvatar: 'https://i.pravatar.cc/150?img=1',
    rating: 5,
    comment:
      'Amazing phone! The camera quality is outstanding and the battery life is excellent.',
    date: '2025-01-15',
    helpful: 45,
  },
  {
    id: 2,
    productId: 1,
    userName: 'Sarah Smith',
    userAvatar: 'https://i.pravatar.cc/150?img=2',
    rating: 4,
    comment: 'Great phone but a bit pricey. The titanium design looks premium.',
    date: '2025-01-10',
    helpful: 23,
  },
  {
    id: 3,
    productId: 2,
    userName: 'Mike Johnson',
    userAvatar: 'https://i.pravatar.cc/150?img=3',
    rating: 5,
    comment: 'Best laptop for developers. M3 Max is incredibly fast!',
    date: '2025-01-08',
    helpful: 67,
  },
  // Agregar más reviews para otros productos...
]

export const getReviewsByProductId = (productId: number): Review[] => {
  return REVIEWS.filter((review) => review.productId === productId)
}

// src/data/userData.ts
import type { User, PaymentMethod } from '../types'

export const CURRENT_USER: User = {
  id: 1,
  name: 'Carlos Rodríguez',
  email: 'carlos.rodriguez@example.com',
  avatar: 'https://i.pravatar.cc/150?img=12',
  phone: '+1 234 567 8900',
  address: {
    street: '123 Main Street, Apt 4B',
    city: 'New York',
    state: 'NY',
    zipCode: '10001',
    country: 'USA',
  },
}

export const PAYMENT_METHODS: PaymentMethod[] = [
  {
    id: 1,
    type: 'credit_card',
    name: 'Visa',
    icon: 'card',
    lastFourDigits: '4242',
  },
  {
    id: 2,
    type: 'debit_card',
    name: 'Mastercard',
    icon: 'card',
    lastFourDigits: '8888',
  },
  {
    id: 3,
    type: 'paypal',
    name: 'PayPal',
    icon: 'logo-paypal',
  },
  {
    id: 4,
    type: 'cash',
    name: 'Cash on Delivery',
    icon: 'cash',
  },
]
```

---

## 📝 Paso 5: Tipos de Navegación (5 min)

```typescript
// src/navigation/types.ts

/**
 * Tipos de navegación para toda la app
 *
 * Estructura:
 * - DrawerParamList: Navegador principal (Drawer)
 * - TabParamList: Tabs dentro del Drawer
 * - HomeStackParamList: Stack de Home
 * - CartStackParamList: Stack de Cart
 * - ProfileStackParamList: Stack de Profile
 */

// ============================================
// Drawer Navigator
// ============================================

export type DrawerParamList = {
  MainTabs: undefined
  CategoryElectronics: undefined
  CategoryClothing: undefined
  CategoryBooks: undefined
  CategorySports: undefined
  CategoryHomeGarden: undefined
}

// ============================================
// Tab Navigator
// ============================================

export type TabParamList = {
  HomeTab: undefined
  CartTab: undefined
  ProfileTab: undefined
}

// ============================================
// Home Stack
// ============================================

export type HomeStackParamList = {
  Home: undefined
  ProductDetail: { productId: number }
  Reviews: { productId: number }
}

// ============================================
// Cart Stack
// ============================================

export type CartStackParamList = {
  Cart: undefined
  Shipping: undefined
  Payment: undefined
  Confirmation: { orderId: number }
}

// ============================================
// Profile Stack
// ============================================

export type ProfileStackParamList = {
  Profile: undefined
  EditProfile: undefined
  Orders: undefined
  Settings: undefined
}
```

---

## ✅ Verificación de la Fase 1

### Checklist:

- [ ] Estructura de carpetas creada
- [ ] `src/types/index.ts` con todos los tipos globales
- [ ] `src/data/products.ts` con 21 productos
- [ ] `src/data/categories.ts` con 5 categorías
- [ ] `src/data/reviews.ts` con reviews de ejemplo
- [ ] `src/data/userData.ts` con usuario y métodos de pago
- [ ] `src/navigation/types.ts` con tipos de navegación
- [ ] No hay errores de TypeScript

### Archivos creados:

```
✅ src/types/index.ts
✅ src/data/products.ts
✅ src/data/categories.ts
✅ src/data/reviews.ts
✅ src/data/userData.ts
✅ src/navigation/types.ts
```

---

## 🔜 Siguiente Fase

**[Fase 2: Context y State →](./FASE-02-CONTEXT.md)**

Crearemos el CartContext para manejar el estado del carrito de compras.

---

_Fase 1 completada ✅_  
_Proyecto E-Commerce - Semana 2_
