# 🛍️ Proyecto Integrador - E-Commerce App

> **Aplicación completa de comercio electrónico** que integra Stack, Tab y Drawer Navigator.

**Duración:** 30 min presencial (introducción) + 5-7h autónomo  
**Peso:** 50% de la calificación semanal  
**Dificultad:** ⭐⭐⭐⭐ Avanzado

---

## 🎯 Objetivo del Proyecto

Crear una **aplicación de e-commerce funcional** que demuestre el dominio de:

- ✅ **Stack Navigator** - Flujo de navegación de productos
- ✅ **Tab Navigator** - Navegación principal (Home, Cart, Profile)
- ✅ **Drawer Navigator** - Menú lateral con categorías
- ✅ **Navegación Anidada** - Combinación de los 3 tipos
- ✅ **State Management** - Carrito de compras con Context API
- ✅ **TypeScript** - Tipado fuerte en toda la app
- ✅ **UI/UX Profesional** - Diseño atractivo y funcional

---

## 📋 Requisitos Funcionales

### Must Have (Obligatorios):

#### 1. Navegación Principal (Tab Navigator)
- [ ] **Home Tab**: Listado de productos destacados
- [ ] **Categories Tab**: Categorías de productos (con Drawer)
- [ ] **Cart Tab**: Carrito de compras con badge de cantidad
- [ ] **Profile Tab**: Perfil del usuario con Stack anidado

#### 2. Drawer Navigator (Categorías)
- [ ] Menú lateral con lista de categorías
- [ ] Custom drawer con header de usuario
- [ ] Navegación a pantallas de categoría específica
- [ ] Cerrar drawer al seleccionar categoría

#### 3. Stack Navigator (Flujo de Producto)
- [ ] ProductList → ProductDetail
- [ ] ProductDetail → Reviews
- [ ] ProductDetail → Agregar al carrito
- [ ] Checkout flow (Cart → Shipping → Payment → Confirmation)

#### 4. Carrito de Compras (Context API)
- [ ] Agregar productos al carrito
- [ ] Eliminar productos del carrito
- [ ] Actualizar cantidad de productos
- [ ] Calcular total automáticamente
- [ ] Badge con número de items en el tab

#### 5. Datos y Mock API
- [ ] Mínimo 20 productos
- [ ] 5 categorías diferentes
- [ ] Información de usuario
- [ ] Reviews de productos

### Nice to Have (Opcionales):

- [ ] Búsqueda de productos
- [ ] Filtros por precio, categoría
- [ ] Lista de favoritos
- [ ] Historial de pedidos
- [ ] Notificaciones
- [ ] Animaciones de transición

---

## 🏗️ Arquitectura de Navegación

```
NavigationContainer
│
└─── DrawerNavigator (Main)
     │
     ├─── TabNavigator (MainTabs)
     │    │
     │    ├─── HomeStack (Tab 1)
     │    │    ├── HomeScreen
     │    │    ├── ProductDetailScreen
     │    │    └── ReviewsScreen
     │    │
     │    ├─── CartStack (Tab 2)
     │    │    ├── CartScreen
     │    │    ├── ShippingScreen
     │    │    ├── PaymentScreen
     │    │    └── ConfirmationScreen
     │    │
     │    └─── ProfileStack (Tab 3)
     │         ├── ProfileScreen
     │         ├── EditProfileScreen
     │         ├── OrdersScreen
     │         └── SettingsScreen
     │
     ├─── CategoryScreen (Electronics)
     ├─── CategoryScreen (Clothing)
     ├─── CategoryScreen (Books)
     ├─── CategoryScreen (Sports)
     └─── CategoryScreen (Home & Garden)
```

---

## 📁 Estructura de Archivos

```
ecommerce-app/
├── App.tsx
├── src/
│   ├── navigation/
│   │   ├── types.ts                    # Tipos de navegación
│   │   ├── DrawerNavigator.tsx         # Drawer principal
│   │   ├── TabNavigator.tsx            # Bottom tabs
│   │   └── stacks/
│   │       ├── HomeStack.tsx
│   │       ├── CartStack.tsx
│   │       └── ProfileStack.tsx
│   │
│   ├── screens/
│   │   ├── home/
│   │   │   ├── HomeScreen.tsx
│   │   │   ├── ProductDetailScreen.tsx
│   │   │   └── ReviewsScreen.tsx
│   │   │
│   │   ├── cart/
│   │   │   ├── CartScreen.tsx
│   │   │   ├── ShippingScreen.tsx
│   │   │   ├── PaymentScreen.tsx
│   │   │   └── ConfirmationScreen.tsx
│   │   │
│   │   ├── profile/
│   │   │   ├── ProfileScreen.tsx
│   │   │   ├── EditProfileScreen.tsx
│   │   │   ├── OrdersScreen.tsx
│   │   │   └── SettingsScreen.tsx
│   │   │
│   │   └── category/
│   │       └── CategoryScreen.tsx
│   │
│   ├── components/
│   │   ├── ProductCard.tsx             # Card de producto
│   │   ├── CartItem.tsx                # Item del carrito
│   │   ├── CustomDrawer.tsx            # Drawer personalizado
│   │   └── ReviewCard.tsx              # Card de review
│   │
│   ├── context/
│   │   └── CartContext.tsx             # Context del carrito
│   │
│   ├── data/
│   │   ├── products.ts                 # Mock de productos
│   │   ├── categories.ts               # Mock de categorías
│   │   ├── reviews.ts                  # Mock de reviews
│   │   └── userData.ts                 # Datos de usuario
│   │
│   ├── types/
│   │   └── index.ts                    # Tipos globales
│   │
│   └── utils/
│       └── formatters.ts               # Utilidades (formateo)
│
└── package.json
```

---

## 📝 Guía de Implementación

### Fase 1: Setup y Datos (30 min presencial)

**En clase:**
1. Crear estructura de carpetas
2. Definir tipos TypeScript
3. Crear mock data (productos, categorías, usuario)
4. Configurar navegación básica

**Archivos a crear:**
- `src/types/index.ts`
- `src/data/products.ts`
- `src/data/categories.ts`
- `src/navigation/types.ts`

[👉 Ver guía detallada: FASE-01-SETUP.md](./FASE-01-SETUP.md)

---

### Fase 2: Context y State (1h autónomo)

**En casa:**
1. Implementar CartContext
2. Crear funciones de agregar/eliminar del carrito
3. Calcular totales
4. Integrar Provider en App.tsx

**Archivos a crear:**
- `src/context/CartContext.tsx`

[👉 Ver guía detallada: FASE-02-CONTEXT.md](./FASE-02-CONTEXT.md)

---

### Fase 3: Componentes Reutilizables (1h autónomo)

**En casa:**
1. ProductCard component
2. CartItem component
3. ReviewCard component
4. CustomDrawer component

**Archivos a crear:**
- `src/components/ProductCard.tsx`
- `src/components/CartItem.tsx`
- `src/components/ReviewCard.tsx`
- `src/components/CustomDrawer.tsx`

[👉 Ver guía detallada: FASE-03-COMPONENTES.md](./FASE-03-COMPONENTES.md)

---

### Fase 4: Pantallas - Home Stack (1.5h autónomo)

**En casa:**
1. HomeScreen (lista de productos)
2. ProductDetailScreen (detalle con botón de agregar al carrito)
3. ReviewsScreen (lista de reviews)

**Archivos a crear:**
- `src/screens/home/HomeScreen.tsx`
- `src/screens/home/ProductDetailScreen.tsx`
- `src/screens/home/ReviewsScreen.tsx`

[👉 Ver guía detallada: FASE-04-HOME-STACK.md](./FASE-04-HOME-STACK.md)

---

### Fase 5: Pantallas - Cart Stack (1.5h autónomo)

**En casa:**
1. CartScreen (lista de items en carrito)
2. ShippingScreen (formulario de envío)
3. PaymentScreen (selección de método de pago)
4. ConfirmationScreen (confirmación de pedido)

**Archivos a crear:**
- `src/screens/cart/CartScreen.tsx`
- `src/screens/cart/ShippingScreen.tsx`
- `src/screens/cart/PaymentScreen.tsx`
- `src/screens/cart/ConfirmationScreen.tsx`

[👉 Ver guía detallada: FASE-05-CART-STACK.md](./FASE-05-CART-STACK.md)

---

### Fase 6: Pantallas - Profile Stack (1h autónomo)

**En casa:**
1. ProfileScreen (info del usuario)
2. EditProfileScreen (editar perfil)
3. OrdersScreen (historial de pedidos)
4. SettingsScreen (configuraciones)

**Archivos a crear:**
- `src/screens/profile/ProfileScreen.tsx`
- `src/screens/profile/EditProfileScreen.tsx`
- `src/screens/profile/OrdersScreen.tsx`
- `src/screens/profile/SettingsScreen.tsx`

[👉 Ver guía detallada: FASE-06-PROFILE-STACK.md](./FASE-06-PROFILE-STACK.md)

---

### Fase 7: Navegación Completa (1h autónomo)

**En casa:**
1. DrawerNavigator con categorías
2. TabNavigator con badge dinámico
3. Stacks anidados
4. Integración final

**Archivos a crear:**
- `src/navigation/DrawerNavigator.tsx`
- `src/navigation/TabNavigator.tsx`
- `src/navigation/stacks/HomeStack.tsx`
- `src/navigation/stacks/CartStack.tsx`
- `src/navigation/stacks/ProfileStack.tsx`

[👉 Ver guía detallada: FASE-07-NAVEGACION.md](./FASE-07-NAVEGACION.md)

---

## 🎨 Diseño y UI/UX

### Paleta de Colores (Sugerida):

```typescript
const colors = {
  primary: '#3b82f6',      // Azul principal
  secondary: '#8b5cf6',    // Púrpura
  success: '#10b981',      // Verde
  danger: '#ef4444',       // Rojo
  warning: '#f59e0b',      // Amarillo
  dark: '#1f2937',         // Gris oscuro
  light: '#f3f4f6',        // Gris claro
  white: '#ffffff',
  black: '#000000',
}
```

### Componentes UI Recomendados:

- **Cards** con sombras sutiles
- **Botones** con estados (disabled, loading)
- **Badges** para notificaciones
- **Iconos** de Ionicons
- **Imágenes** con placeholder
- **Loading states** con ActivityIndicator

---

## 📊 Criterios de Evaluación

### 1. Navegación (25 puntos)

| Criterio | Puntos |
|----------|--------|
| Drawer Navigator implementado correctamente | 6 |
| Tab Navigator con badge dinámico | 6 |
| Stacks anidados funcionando | 7 |
| Navegación entre pantallas fluida | 6 |

### 2. Funcionalidad (30 puntos)

| Criterio | Puntos |
|----------|--------|
| Agregar productos al carrito | 8 |
| Eliminar productos del carrito | 5 |
| Actualizar cantidades | 5 |
| Cálculo de totales correcto | 6 |
| Flujo de checkout completo | 6 |

### 3. Context API (15 puntos)

| Criterio | Puntos |
|----------|--------|
| CartContext implementado | 7 |
| Provider configurado correctamente | 4 |
| Estado compartido entre pantallas | 4 |

### 4. UI/UX (15 puntos)

| Criterio | Puntos |
|----------|--------|
| Diseño atractivo y profesional | 5 |
| Componentes reutilizables | 4 |
| Responsive y bien estructurado | 3 |
| Loading states y feedback | 3 |

### 5. Código y Buenas Prácticas (15 puntos)

| Criterio | Puntos |
|----------|--------|
| TypeScript bien implementado | 5 |
| Código limpio y organizado | 4 |
| Nomenclatura en inglés | 3 |
| Comentarios explicativos | 3 |

### Puntuación Extra (Máximo +10 puntos)

| Feature Opcional | Puntos |
|------------------|--------|
| Búsqueda de productos | +3 |
| Filtros funcionales | +3 |
| Lista de favoritos | +2 |
| Animaciones personalizadas | +2 |

**Total Base:** 100 puntos  
**Total con extras:** Hasta 110 puntos (máximo 100)

---

## ✅ Checklist de Entrega

### Funcionalidad Básica:
- [ ] Navegación entre todos los tabs funciona
- [ ] Drawer se abre y navega a categorías
- [ ] Se pueden ver detalles de productos
- [ ] Se pueden agregar productos al carrito
- [ ] Se pueden eliminar productos del carrito
- [ ] El badge del carrito muestra la cantidad correcta
- [ ] El flujo de checkout funciona completo

### Código:
- [ ] Todo el código en inglés (variables, funciones, componentes)
- [ ] Tipos TypeScript definidos correctamente
- [ ] No hay errores de compilación
- [ ] No hay warnings críticos
- [ ] Código bien comentado

### UI/UX:
- [ ] La app se ve profesional
- [ ] Los componentes son consistentes
- [ ] Hay feedback visual (loading, errores, éxito)
- [ ] Las imágenes se cargan correctamente
- [ ] Los botones tienen estados visuales

### Documentación:
- [ ] README.md con instrucciones de instalación
- [ ] Comentarios explicativos en código complejo
- [ ] Tipos documentados

---

## 🚀 Cómo Empezar

### 1. Setup Inicial

```bash
# Crear proyecto
npx create-expo-app ecommerce-app
cd ecommerce-app

# Instalar dependencias de navegación
pnpm add @react-navigation/native
pnpm add @react-navigation/native-stack
pnpm add @react-navigation/bottom-tabs
pnpm add @react-navigation/drawer

# Dependencias de Expo
pnpm add react-native-screens react-native-safe-area-context
pnpm add react-native-gesture-handler react-native-reanimated

# Íconos y styling
pnpm add @expo/vector-icons
pnpm add nativewind
pnpm add --save-dev tailwindcss

# TypeScript (si no está)
pnpm add --save-dev typescript @types/react @types/react-native
```

### 2. Configurar Babel

```javascript
// babel.config.js
module.exports = {
  presets: ['babel-preset-expo'],
  plugins: [
    'nativewind/babel',
    'react-native-reanimated/plugin',
  ],
}
```

### 3. Crear Estructura de Carpetas

```bash
mkdir -p src/{navigation,screens,components,context,data,types,utils}
mkdir -p src/screens/{home,cart,profile,category}
mkdir -p src/navigation/stacks
```

### 4. Seguir las Fases

Sigue cada fase en orden:
1. [Fase 1: Setup](./FASE-01-SETUP.md)
2. [Fase 2: Context](./FASE-02-CONTEXT.md)
3. [Fase 3: Componentes](./FASE-03-COMPONENTES.md)
4. [Fase 4: Home Stack](./FASE-04-HOME-STACK.md)
5. [Fase 5: Cart Stack](./FASE-05-CART-STACK.md)
6. [Fase 6: Profile Stack](./FASE-06-PROFILE-STACK.md)
7. [Fase 7: Navegación](./FASE-07-NAVEGACION.md)

---

## 📝 Entrega del Proyecto

### Formato de Entrega:

1. **Repositorio Git:**
   - Crear repo en GitHub
   - Commits organizados por fase
   - README.md con instrucciones

2. **Video Demo (3-5 min):**
   - Mostrar navegación completa
   - Demostrar agregar/eliminar del carrito
   - Mostrar flujo de checkout
   - Explicar decisiones técnicas

3. **Documentación:**
   - README.md con setup
   - Comentarios en código complejo
   - Lista de features implementadas

### Fecha de Entrega:

**Viernes de la Semana 2** - 23:59h

### Forma de Entrega:

- Link de GitHub repo
- Link de video demo (YouTube, Loom, etc.)
- Documento con reflexión personal (opcional, +2 puntos extra)

---

## 💡 Consejos y Tips

### Para el Desarrollo:

1. **Empieza simple:** Implementa lo básico primero
2. **Prueba frecuentemente:** No esperes a terminar todo
3. **Commits frecuentes:** Guarda progreso regularmente
4. **Usa los tipos:** TypeScript te ayudará a evitar errores
5. **Reutiliza componentes:** DRY (Don't Repeat Yourself)

### Para la UI:

1. **Consistencia:** Usa los mismos estilos en toda la app
2. **Espaciado:** Padding y margin consistentes
3. **Feedback:** Siempre da feedback al usuario (loading, success, error)
4. **Accesibilidad:** Botones con buen tamaño táctil (min 44x44)
5. **Imágenes:** Usa placeholders mientras cargan

### Para el Código:

1. **Organización:** Cada archivo con responsabilidad única
2. **Nombres claros:** Variables y funciones descriptivas
3. **Comentarios útiles:** Explica el porqué, no el qué
4. **Manejo de errores:** Try-catch donde sea necesario
5. **TypeScript:** Define tipos para todo

---

## 🐛 Troubleshooting

### Error: "Drawer no se abre"

```bash
# Solución: Verifica configuración de reanimated
# babel.config.js debe tener el plugin al final
pnpm start --clear
```

### Error: "Cannot read property 'navigate'"

```typescript
// Solución: Verifica que el screen tiene la prop navigation
// O usa useNavigation hook
import { useNavigation } from '@react-navigation/native'
```

### Badge no actualiza

```typescript
// Solución: Asegúrate de que el Context esté por encima del Navigator
<CartProvider>
  <NavigationContainer>
    <DrawerNavigator />
  </NavigationContainer>
</CartProvider>
```

---

## 📚 Recursos Adicionales

### Documentación:
- [React Navigation Docs](https://reactnavigation.org)
- [Context API](https://react.dev/learn/passing-data-deeply-with-context)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/handbook/intro.html)

### Inspiración de Diseño:
- [Dribbble - E-commerce](https://dribbble.com/tags/ecommerce-app)
- [Mobbin - Shopping Apps](https://mobbin.com)

### Herramientas:
- [React Navigation Playground](https://reactnavigation.org/playground)
- [TypeScript Playground](https://www.typescriptlang.org/play)

---

## 🎓 Reflexión Final (Opcional +2 pts)

Crea un documento respondiendo:

1. **¿Qué aprendiste?** (conceptos nuevos)
2. **¿Qué fue más difícil?** (desafíos)
3. **¿Cómo lo solucionaste?** (estrategias)
4. **¿Qué mejorarías?** (autocrítica)
5. **¿Qué aplicarías en futuros proyectos?** (takeaways)

Máximo 1 página (300-500 palabras)

---

## 🔜 Próximos Pasos

Después de completar este proyecto:

1. ✅ **Semana 3:** State Management Avanzado
2. ✅ **Semana 4:** APIs y Backend Integration
3. ✅ **Semana 5:** Features Nativas (Camera, GPS)
4. ✅ **Semana 6:** Proyecto Final del Bootcamp

---

**¡Mucho éxito con el proyecto! 🚀**

_Recuerda: La calidad es más importante que la cantidad. Es mejor una app simple que funcione bien, que una compleja llena de bugs._ 💙

---

_Semana 2: Navegación en React Native - Proyecto Integrador_  
_Bootcamp React Native 2025 - EPTI_
