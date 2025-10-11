# 📐 Estructura de Navegación - E-Commerce App

> **Diagrama visual completo de la arquitectura de navegación**

---

## 🏗️ Arquitectura Completa

```
NavigationContainer
│
└─── DrawerNavigator ━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
     │                                          ┃
     │  (Menú lateral deslizable)               ┃
     │                                          ┃
     ├─── MainTabs ═══════════════════════════════════════════┓
     │    │                                                    ║
     │    │  (Bottom Tab Navigator - 3 tabs)                  ║
     │    │                                                    ║
     │    ├─── HomeTab ────────────────────────────────────┐  ║
     │    │    │                                           │  ║
     │    │    │  HomeStack (Stack Navigator)             │  ║
     │    │    ├── HomeScreen                             │  ║
     │    │    │   │                                      │  ║
     │    │    │   ├─→ ProductDetailScreen               │  ║
     │    │    │   │   │                                  │  ║
     │    │    │   │   ├─→ ReviewsScreen                 │  ║
     │    │    │   │   └─→ Agregar al Carrito (Action)   │  ║
     │    │    │   │                                      │  ║
     │    │    │   └─→ Ver más productos                 │  ║
     │    │    └───────────────────────────────────────────┘  ║
     │    │                                                    ║
     │    ├─── CartTab [🔴 Badge] ─────────────────────────┐  ║
     │    │    │                                           │  ║
     │    │    │  CartStack (Stack Navigator)             │  ║
     │    │    ├── CartScreen                             │  ║
     │    │    │   │                                      │  ║
     │    │    │   └─→ ShippingScreen                    │  ║
     │    │    │       │                                  │  ║
     │    │    │       └─→ PaymentScreen                 │  ║
     │    │    │           │                              │  ║
     │    │    │           └─→ ConfirmationScreen        │  ║
     │    │    │               (Fin del flujo)           │  ║
     │    │    └───────────────────────────────────────────┘  ║
     │    │                                                    ║
     │    └─── ProfileTab ─────────────────────────────────┐  ║
     │         │                                           │  ║
     │         │  ProfileStack (Stack Navigator)          │  ║
     │         ├── ProfileScreen                          │  ║
     │         │   │                                      │  ║
     │         │   ├─→ EditProfileScreen                 │  ║
     │         │   ├─→ OrdersScreen                      │  ║
     │         │   └─→ SettingsScreen                    │  ║
     │         └───────────────────────────────────────────┘  ║
     │                                                         ║
     └═════════════════════════════════════════════════════════┛
     │
     │  (Opciones del Drawer)
     │
     ├─── CategoryElectronics (CategoryScreen)
     ├─── CategoryClothing (CategoryScreen)
     ├─── CategoryBooks (CategoryScreen)
     ├─── CategorySports (CategoryScreen)
     └─── CategoryHomeGarden (CategoryScreen)
```

---

## 📱 Detalle por Tab

### 🏠 HomeTab (Tab 1)

```
HomeScreen
├─ Banner de bienvenida
├─ Productos destacados (FlatList horizontal)
├─ Categorías rápidas (Grid 2x3)
├─ Productos con descuento
└─ Botón "Ver más"
    │
    └─→ ProductDetailScreen (params: { productId })
        ├─ Imagen grande
        ├─ Nombre y precio
        ├─ Rating con estrellas
        ├─ Descripción
        ├─ Stock indicator
        ├─ Botón "Agregar al Carrito" ───→ [Action: addToCart()]
        └─ Botón "Ver Reviews" ───→ ReviewsScreen (params: { productId })
                                    ├─ Lista de reviews (FlatList)
                                    ├─ Promedio de rating
                                    ├─ Total de reviews
                                    └─ Filtros de ordenamiento
```

**Flujo de Navegación:**

```
Home → [Tap en producto] → ProductDetail
                            ├─→ [Tap "Ver Reviews"] → Reviews → [Back] → ProductDetail
                            ├─→ [Tap "Agregar"] → [Toast success] → Stays
                            └─→ [Back] → Home
```

---

### 🛒 CartTab (Tab 2) [con Badge]

```
CartScreen
├─ Lista de items (FlatList)
│  └─ CartItem component
│     ├─ Imagen del producto
│     ├─ Nombre y precio
│     ├─ Botones +/- cantidad
│     └─ Botón eliminar
├─ Resumen de compra
│  ├─ Subtotal
│  ├─ Descuentos
│  ├─ Envío
│  └─ Total
└─ Botón "Proceder al Checkout"
    │
    └─→ ShippingScreen
        ├─ Formulario de dirección
        ├─ Validación de campos
        └─ Botón "Continuar al Pago"
            │
            └─→ PaymentScreen
                ├─ Métodos de pago (radio buttons)
                ├─ Info del método seleccionado
                └─ Botón "Confirmar Pedido"
                    │
                    └─→ ConfirmationScreen
                        ├─ Mensaje de éxito ✅
                        ├─ Número de orden
                        ├─ Resumen del pedido
                        ├─ Action: clearCart()
                        ├─ Botón "Volver al Inicio" → HomeTab
                        └─ Botón "Ver Mis Pedidos" → OrdersScreen
```

**Flujo de Navegación:**

```
Cart → [Empty] → Empty state con botón "Explorar Productos"
       │
       └─→ [Con items] → "Checkout" → Shipping → Payment → Confirmation
                                                              └─→ Home o Orders
```

**Badge Lógico:**

```typescript
// Badge muestra: cart.itemCount
Badge = {
  value: cart.itemCount > 0 ? cart.itemCount : undefined,
  backgroundColor: '#ef4444',
}
```

---

### 👤 ProfileTab (Tab 3)

```
ProfileScreen
├─ Avatar y nombre
├─ Email y teléfono
├─ Stats
│  ├─ Pedidos totales
│  ├─ Favoritos
│  └─ Puntos
├─ Opciones
│  ├─ "Editar Perfil" ───→ EditProfileScreen
│  │                      ├─ Formulario
│  │                      ├─ Validación
│  │                      └─ "Guardar" → [Back]
│  │
│  ├─ "Mis Pedidos" ───→ OrdersScreen
│  │                      ├─ Lista de pedidos (FlatList)
│  │                      ├─ Card por pedido
│  │                      │  ├─ ID y fecha
│  │                      │  ├─ Total
│  │                      │  └─ Badge de estado
│  │                      └─ Empty state si no hay pedidos
│  │
│  ├─ "Configuración" ───→ SettingsScreen
│  │                      ├─ Notificaciones (Switch)
│  │                      ├─ Modo oscuro (Switch)
│  │                      ├─ Idioma (Select)
│  │                      ├─ Privacidad
│  │                      ├─ Términos
│  │                      └─ Versión
│  │
│  └─ "Cerrar Sesión" → [Alert confirm] → [Logout action]
```

**Flujo de Navegación:**

```
Profile → [Tap opción] → Pantalla específica → [Back] → Profile
```

---

## 🗂️ Drawer Navigator (Categorías)

```
CustomDrawer Content
├─ Header
│  ├─ Avatar del usuario
│  ├─ Nombre
│  ├─ Email
│  └─ Badge de rol
│
├─ Navegación Principal
│  └─ "Inicio" → MainTabs
│
├─ Categorías (Drawer Items)
│  ├─ "Electronics" → CategoryScreen (category: 'Electronics')
│  ├─ "Clothing" → CategoryScreen (category: 'Clothing')
│  ├─ "Books" → CategoryScreen (category: 'Books')
│  ├─ "Sports" → CategoryScreen (category: 'Sports')
│  └─ "Home & Garden" → CategoryScreen (category: 'Home & Garden')
│
├─ Items Adicionales
│  ├─ "Favoritos" → [To implement]
│  ├─ "Historial" → [To implement]
│  └─ "Compartir App" → [Share action]
│
└─ Footer
   ├─ "Cerrar Sesión" → [Logout]
   └─ Versión 1.0.0
```

**CategoryScreen (Generic):**

```typescript
// Una sola pantalla reutilizable para todas las categorías

CategoryScreen
├─ Props: route.params.category o route.name
├─ Header con nombre de categoría
├─ Filtros (opcional)
│  ├─ Precio
│  ├─ Rating
│  └─ Disponibilidad
├─ Grid de productos (FlatList)
│  └─ ProductCard components
└─ [Tap en producto] → ProductDetailScreen (en HomeStack)
```

---

## 🔄 Flujos de Usuario Completos

### Flujo 1: Compra de Producto

```
1. Usuario abre app → HomeScreen (Tab 1)
2. Scroll y ve productos destacados
3. Tap en "iPhone 15 Pro" → ProductDetailScreen
4. Lee descripción, ve specs
5. Tap "Agregar al Carrito" → Toast success ✅
6. Badge en CartTab muestra "1" 🔴
7. Navega a CartTab → CartScreen
8. Ve su iPhone en el carrito
9. Tap "Proceder al Checkout" → ShippingScreen
10. Llena formulario de envío
11. Tap "Continuar" → PaymentScreen
12. Selecciona "Visa ***4242"
13. Tap "Confirmar Pedido" → ConfirmationScreen
14. Ve mensaje "¡Pedido confirmado! 🎉"
15. Badge del carrito desaparece (cart cleared)
16. Tap "Ver Mis Pedidos" → OrdersScreen
17. Ve su nuevo pedido con estado "Processing"
```

### Flujo 2: Explorar por Categoría

```
1. Usuario abre drawer → Swipe desde izquierda
2. Ve lista de categorías
3. Tap "Electronics" → CategoryScreen (Electronics)
4. Ve grid de productos electrónicos
5. Tap en "MacBook Pro" → ProductDetailScreen
6. Tap "Ver Reviews" → ReviewsScreen
7. Lee opiniones de usuarios
8. Back → ProductDetailScreen
9. Tap "Agregar al Carrito"
10. Drawer se cierra automáticamente
11. Badge actualizado en CartTab
```

### Flujo 3: Gestión de Carrito

```
1. Usuario va a CartTab
2. Ve 3 productos en el carrito
3. Tap "+" en iPhone → Cantidad: 2
4. Total se actualiza automáticamente
5. Tap "🗑️" en AirPods → Se elimina
6. Badge actualiza de "3" a "2"
7. Total recalculado
8. Continúa con checkout...
```

---

## 🎨 Interacciones Visuales

### Tab Navigator:

- **Active Tab:** Color azul (#3b82f6), ícono filled
- **Inactive Tab:** Color gris (#9ca3af), ícono outline
- **Badge:** Fondo rojo (#ef4444), texto blanco, circular
- **Tab Bar:** Altura 60px, borde superior gris

### Drawer Navigator:

- **Open:** Swipe desde izquierda o tap ícono menú
- **Width:** 80% del ancho de pantalla
- **Overlay:** Fondo semi-transparente
- **Close:** Tap overlay, Back button, o seleccionar item

### Stack Navigator:

- **Header:** Fondo azul, texto blanco
- **Back Button:** Flecha izquierda, automático
- **Modal:** Desliza desde abajo (CreatePost ejemplo)

---

## 📊 Resumen de Pantallas

### Total de Pantallas: 16

| Navigator    | Pantalla            | Ruta           | Params        |
| ------------ | ------------------- | -------------- | ------------- |
| HomeStack    | HomeScreen          | Home           | -             |
| HomeStack    | ProductDetailScreen | ProductDetail  | { productId } |
| HomeStack    | ReviewsScreen       | Reviews        | { productId } |
| CartStack    | CartScreen          | Cart           | -             |
| CartStack    | ShippingScreen      | Shipping       | -             |
| CartStack    | PaymentScreen       | Payment        | -             |
| CartStack    | ConfirmationScreen  | Confirmation   | { orderId }   |
| ProfileStack | ProfileScreen       | Profile        | -             |
| ProfileStack | EditProfileScreen   | EditProfile    | -             |
| ProfileStack | OrdersScreen        | Orders         | -             |
| ProfileStack | SettingsScreen      | Settings       | -             |
| Drawer       | CategoryScreen (x5) | Category[Name] | -             |

---

## 🔗 Conexiones de State

```
CartContext (Global State)
├─ Compartido entre todos los navigators
├─ Accesible desde cualquier pantalla
└─ Actualiza badge en CartTab automáticamente

Flujo de datos:
ProductDetailScreen → [addToCart()] → CartContext
                                       └─→ cart.itemCount++
                                           └─→ Badge actualiza ✅

CartScreen → [removeFromCart()] → CartContext
                                   └─→ cart.itemCount--
                                       └─→ Badge actualiza ✅
```

---

## ✅ Checklist de Navegación

### Configuración:

- [ ] NavigationContainer envuelve todo
- [ ] CartProvider está por encima de NavigationContainer
- [ ] Todos los tipos en `types.ts` coinciden con pantallas

### Stacks:

- [ ] HomeStack con 3 pantallas
- [ ] CartStack con 4 pantallas
- [ ] ProfileStack con 4 pantallas
- [ ] Navegación entre pantallas funciona

### Tab Navigator:

- [ ] 3 tabs configurados
- [ ] Íconos correctos (Ionicons)
- [ ] Badge dinámico en CartTab
- [ ] Tab activo se destaca visualmente

### Drawer Navigator:

- [ ] CustomDrawer implementado
- [ ] 5 categorías en el drawer
- [ ] MainTabs dentro del drawer
- [ ] Drawer se abre/cierra correctamente

### Funcionalidad:

- [ ] Todas las pantallas accesibles
- [ ] Parámetros se pasan correctamente
- [ ] Badge se actualiza con el carrito
- [ ] Back button funciona en todos los stacks
- [ ] Drawer se cierra al seleccionar

---

_Estructura de Navegación Completa_  
_Proyecto E-Commerce - Semana 2_
