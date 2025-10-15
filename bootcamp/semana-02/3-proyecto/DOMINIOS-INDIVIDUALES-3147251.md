# 🗺️ Asignación de Dominios Individuales - Semana 2: Navegación

## 🎯 FICHA 3147251 - Navegación y Routing

> **Objetivo:** Cada estudiante implementará un sistema de navegación completo para un dominio de aplicación único, aplicando Stack Navigator, Tab Navigator y Drawer Navigator de forma personalizada.

---

## 📋 TABLA DE ASIGNACIONES

| Apellido | 🏢 **Dominio App** | 📱 **Tipo Principal** | 🗂️ **Pantallas Mínimas** | 🎨 **Color Theme** |
|----------|-------------------|----------------------|--------------------------|-------------------|
| AREVALO CELIS | **Delivery Food** | Stack + Tabs | Home, Restaurants, Menu, Cart, Orders, Profile | `#FF6B35` (Naranja) |
| BUITRAGO CASALLAS | **Fitness Tracker** | Stack + Drawer | Dashboard, Workouts, Exercises, Progress, Settings | `#00C9A7` (Verde agua) |
| BURITICA CALDERON | **Real Estate** | Stack + Tabs | Properties, Search, Favorites, Messages, Account | `#2E86AB` (Azul) |
| CORONADO MONTAÑEZ | **Event Manager** | Stack + Drawer | Events, Calendar, Tickets, Attendees, Profile | `#9B59B6` (Púrpura) |
| DIAZ ROJAS | **E-Learning** | Stack + Tabs | Courses, Learn, Progress, Community, Profile | `#3498DB` (Azul claro) |
| GALINDO ORTIZ | **Pet Care** | Stack + Drawer | Pets, Appointments, Vets, Health, Profile | `#E74C3C` (Rojo) |
| GARCIA VASQUEZ | **Music Streaming** | Stack + Tabs | Discover, Library, Player, Search, Profile | `#1DB954` (Verde Spotify) |
| GUIO APONTE | **Travel Booking** | Stack + Drawer | Destinations, Hotels, Flights, Bookings, Account | `#00BCD4` (Cyan) |
| HERNANDEZ RODRIGUEZ | **Social Network** | Stack + Tabs | Feed, Explore, Post, Notifications, Profile | `#833AB4` (Instagram) |
| HURTADO MEJIA | **Banking App** | Stack + Drawer | Accounts, Transfer, Cards, History, Settings | `#0A2647` (Azul oscuro) |
| LEAL GUEVARA | **Marketplace** | Stack + Tabs | Products, Categories, Cart, Orders, Profile | `#FF9800` (Ámbar) |
| LEON RUIZ | **News Reader** | Stack + Drawer | Headlines, Categories, Saved, Sources, Settings | `#212121` (Gris oscuro) |
| MORALES HERRERA | **Recipe Book** | Stack + Tabs | Recipes, Collections, Cook, Shopping, Profile | `#FF5722` (Naranja rojizo) |
| OSTOS GARZON | **Task Manager** | Stack + Drawer | Tasks, Projects, Calendar, Team, Settings | `#607D8B` (Azul gris) |
| PAEZ GARAY | **Pharmacy** | Stack + Tabs | Products, Search, Prescriptions, Orders, Account | `#4CAF50` (Verde) |
| PEREZ LOSADA | **Car Rental** | Stack + Drawer | Vehicles, Search, Bookings, History, Profile | `#F44336` (Rojo) |
| PULIDO VILLANUEVA | **Weather App** | Stack + Tabs | Current, Forecast, Maps, Locations, Settings | `#03A9F4` (Azul cielo) |
| REMICIO TAPIERO | **Chat Messenger** | Stack + Drawer | Chats, Contacts, Groups, Calls, Settings | `#25D366` (WhatsApp) |
| RIVERA PASACHOA | **Podcast Player** | Stack + Tabs | Discover, Library, Player, Search, Profile | `#7C3AED` (Púrpura) |
| RIZO RODRIGUEZ | **Meditation** | Stack + Drawer | Sessions, Library, Timer, Progress, Profile | `#8E44AD` (Púrpura oscuro) |
| RODRIGUEZ LEON | **Gaming Store** | Stack + Tabs | Games, Store, Library, Community, Profile | `#9146FF` (Twitch) |
| SALAS CHAVEZ | **Parking App** | Stack + Drawer | Locations, Book, Active, History, Settings | `#5C6BC0` (Índigo) |
| SANCHEZ RIVERA | **Laundry Service** | Stack + Tabs | Services, Book, Orders, Schedule, Account | `#00BCD4` (Cyan) |
| ZARTA BRIÑEZ | **Hotel Booking** | Stack + Drawer | Hotels, Search, Bookings, Reviews, Profile | `#FFA726` (Naranja) |

---

## 🏗️ ESTRUCTURA DE NAVEGACIÓN PERSONALIZADA

### 📱 Configuración por Tipo de App

Cada dominio tiene una estructura de navegación única según su propósito:

#### **Apps de Comercio (Delivery, Marketplace, Grocery)**

```typescript
// Estructura: Tabs principal + Stack por tab
<Tab.Navigator>
  <Tab.Screen name="HomeTab" component={HomeStack} /> {/* Stack interno */}
  <Tab.Screen name="CategoryTab" component={CategoryStack} />
  <Tab.Screen name="CartTab" component={CartStack} />
  <Tab.Screen name="OrdersTab" component={OrderStack} />
  <Tab.Screen name="ProfileTab" component={ProfileStack} />
</Tab.Navigator>
```

#### **Apps de Contenido (Music, Podcast, News)**

```typescript
// Estructura: Drawer principal + Tabs secundarios
<Drawer.Navigator>
  <Drawer.Screen name="Main" component={MainTabs} /> {/* Tabs internos */}
  <Drawer.Screen name="Library" component={LibraryStack} />
  <Drawer.Screen name="Downloads" component={DownloadsStack} />
  <Drawer.Screen name="Settings" component={SettingsStack} />
</Drawer.Navigator>
```

#### **Apps de Productividad (Task, Banking, Calendar)**

```typescript
// Estructura: Drawer + Stack profundo
<Drawer.Navigator>
  <Drawer.Screen name="Overview" component={OverviewStack} />
  <Drawer.Screen name="Projects" component={ProjectStack} /> {/* 3-4 niveles */}
  <Drawer.Screen name="Reports" component={ReportStack} />
  <Drawer.Screen name="Settings" component={SettingsStack} />
</Drawer.Navigator>
```

---

## 🎯 REQUISITOS MÍNIMOS POR DOMINIO

### 📊 Pantallas Obligatorias

Cada app debe tener **mínimo 8 pantallas funcionales**:

1. **Pantalla Principal** (Home/Dashboard)
2. **Pantalla de Listado** (Products/Items/Content)
3. **Pantalla de Detalle** (Item Detail)
4. **Pantalla de Búsqueda/Filtros**
5. **Pantalla de Acción Principal** (Cart/Booking/Player)
6. **Pantalla de Historial/Activity**
7. **Pantalla de Perfil/Cuenta**
8. **Pantalla de Configuración**

### 🔀 Navegación Obligatoria

1. **Stack Navigator** - Para flujos secuenciales (mínimo 3 stacks)
2. **Tab Navigator** - Para secciones principales (mínimo 4 tabs) O **Drawer Navigator** - Para menú lateral
3. **Navegación anidada** - Stacks dentro de Tabs/Drawer
4. **Parámetros entre pantallas** - Pasar datos entre rutas
5. **Headers personalizados** - Por tipo de pantalla

---

## 🎨 PERSONALIZACIÓN REQUERIDA

### 🌈 Identidad Visual

Cada app debe tener:

- **Color primario único** (ver tabla)
- **Iconos contextuales** según el dominio
- **Headers personalizados** con branding
- **Tabs con iconos relevantes** al negocio
- **Drawer con menú temático** (si aplica)

### 📱 Ejemplo: Delivery Food (ACERO PEREZ)

```typescript
// Tabs con iconos de comida
<Tab.Navigator
  screenOptions={{
    tabBarActiveTintColor: '#FF6B35',
    headerStyle: { backgroundColor: '#FF6B35' },
  }}
>
  <Tab.Screen
    name="Home"
    options={{
      tabBarIcon: () => <Icon name="home" />,
      title: '🏠 Inicio',
    }}
  />
  <Tab.Screen
    name="Restaurants"
    options={{
      tabBarIcon: () => <Icon name="restaurant" />,
      title: '🍽️ Restaurantes',
    }}
  />
  <Tab.Screen
    name="Cart"
    options={{
      tabBarIcon: () => <Icon name="shopping-cart" />,
      title: '🛒 Carrito',
    }}
  />
  <Tab.Screen
    name="Orders"
    options={{
      tabBarIcon: () => <Icon name="receipt" />,
      title: '📦 Pedidos',
    }}
  />
  <Tab.Screen
    name="Profile"
    options={{
      tabBarIcon: () => <Icon name="person" />,
      title: '👤 Perfil',
    }}
  />
</Tab.Navigator>
```

### 📱 Ejemplo: Fitness Tracker (BUITRAGO CASALLAS)

```typescript
// Drawer con menú de fitness
<Drawer.Navigator
  screenOptions={{
    drawerActiveTintColor: '#00C9A7',
    headerTintColor: '#00C9A7',
  }}
>
  <Drawer.Screen
    name="Dashboard"
    options={{
      drawerIcon: () => <Icon name="dashboard" />,
      title: '📊 Panel',
    }}
  />
  <Drawer.Screen
    name="Workouts"
    options={{
      drawerIcon: () => <Icon name="fitness-center" />,
      title: '💪 Entrenamientos',
    }}
  />
  <Drawer.Screen
    name="Progress"
    options={{
      drawerIcon: () => <Icon name="trending-up" />,
      title: '📈 Progreso',
    }}
  />
  <Drawer.Screen
    name="Settings"
    options={{
      drawerIcon: () => <Icon name="settings" />,
      title: '⚙️ Ajustes',
    }}
  />
</Drawer.Navigator>
```

---

## 🔀 FLUJOS DE NAVEGACIÓN ESPECÍFICOS

### Ejemplo 1: E-Commerce Flow (Marketplace, Grocery)

```typescript
// Usuario ve producto → Detalle → Agrega a carrito → Checkout → Confirmación
HomeScreen
  → ProductListScreen
    → ProductDetailScreen
      → CartScreen
        → CheckoutScreen
          → OrderConfirmationScreen
```

### Ejemplo 2: Booking Flow (Hotel, Car Rental, Travel)

```typescript
// Usuario busca → Filtra → Ve detalle → Reserva → Confirmación
SearchScreen
  → ResultsScreen
    → ItemDetailScreen
      → BookingScreen
        → PaymentScreen
          → ConfirmationScreen
```

### Ejemplo 3: Social Flow (Social Network, Chat)

```typescript
// Usuario ve feed → Abre post → Comenta → Perfil autor → Sigue
FeedScreen
  → PostDetailScreen
    → CommentsScreen
      → UserProfileScreen
        → UserPostsScreen
```

---

## 📋 INSTRUCCIONES DE IMPLEMENTACIÓN

### 🔍 PASO 1: Identifica tu Dominio

1. **Busca tu apellido** en la tabla de asignaciones
2. **Anota tu dominio específico** (ej: "Delivery Food")
3. **Identifica tu tipo de navegación** (Stack + Tabs o Stack + Drawer)
4. **Memoriza tu color theme** para consistencia visual

### 🎯 PASO 2: Diseña tu Estructura

1. **Lista las 8+ pantallas** que tendrá tu app
2. **Define qué pantallas van en tabs/drawer** (nivel superior)
3. **Define qué pantallas van en stacks** (flujos internos)
4. **Mapea los flujos** de navegación principales

### 💻 PASO 3: Implementa la Navegación

1. **Sigue las fases del proyecto** en orden
2. **Usa tu color theme** en toda la navegación
3. **Personaliza iconos y títulos** según tu dominio
4. **Implementa parámetros** entre pantallas
5. **Agrega headers personalizados**

### ✅ PASO 4: Prueba los Flujos

1. **Verifica cada flujo de navegación** funcione
2. **Prueba navegación hacia atrás** (back)
3. **Valida paso de parámetros** entre pantallas
4. **Confirma consistencia visual** en toda la app

---

## ⚠️ METODOLOGÍA ANTI-COPIA

### 🚫 Por qué NO se puede copiar

Cada dominio tiene:

- **Pantallas únicas** específicas del negocio
- **Flujos de navegación diferentes** según el caso de uso
- **Iconografía contextual** propia del dominio
- **Estructura de datos diferente** por tipo de app
- **Color scheme único** para identificación visual

**Ejemplo:**

- Un **Delivery Food** tiene: Restaurants, Menu, Cart, Orders
- Un **Banking App** tiene: Accounts, Transfer, Cards, History
- Un **Fitness Tracker** tiene: Workouts, Exercises, Progress

**¡Son completamente diferentes!** No puedes copiar la estructura de navegación.

### ✅ Lo que SÍ puedes compartir

- Patrones de código React Navigation
- Estructura de carpetas
- Configuración de navegadores
- Hooks personalizados genéricos

### ❌ Lo que NO puedes copiar

- Nombres de pantallas (son únicos por dominio)
- Estructura de navegación (diferente por app)
- Flujos de usuario (específicos del negocio)
- Iconos y colores (personalizados por dominio)

---

## 📊 CRITERIOS DE EVALUACIÓN

| Criterio                    | Peso     | Descripción                                |
| --------------------------- | -------- | ------------------------------------------ |
| **Pantallas Implementadas** | 25%      | Mínimo 8 pantallas funcionales del dominio |
| **Navegación Funcional**    | 25%      | Stack + Tabs/Drawer correctamente anidados |
| **Personalización**         | 20%      | Color theme, iconos y branding del dominio |
| **Flujos Lógicos**          | 15%      | Navegación coherente con el tipo de app    |
| **Paso de Parámetros**      | 10%      | Datos entre pantallas correctamente        |
| **Headers Personalizados**  | 5%       | Headers contextuales por sección           |
| **TOTAL**                   | **100%** |                                            |

---

## 🎓 RECURSOS POR TIPO DE APP

### Apps de Comercio

- [Expo Icons](https://icons.expo.fyi/) - Iconos de e-commerce
- [React Navigation Tabs](https://reactnavigation.org/docs/tab-based-navigation)

### Apps de Contenido

- [Drawer Navigator](https://reactnavigation.org/docs/drawer-based-navigation)
- [Custom Drawer](https://reactnavigation.org/docs/drawer-navigator#providing-a-custom-drawercontent)

### Apps de Productividad

- [Stack Navigator](https://reactnavigation.org/docs/stack-navigator)
- [Nesting Navigators](https://reactnavigation.org/docs/nesting-navigators)

---

## 💡 TIPS POR DOMINIO

### 🍔 Delivery Food (ACERO PEREZ)

- **Tabs principales:** Home, Restaurants, Cart, Orders, Profile
- **Stack interno:** Restaurant → Menu → Item Detail → Cart
- **Parámetros:** restaurantId, itemId, cartItems

### 💪 Fitness Tracker (ALFONSO MENDEZ)

- **Drawer principal:** Dashboard, Workouts, Progress, Settings
- **Stack interno:** Workout → Exercise Detail → Start → Timer
- **Parámetros:** workoutId, exerciseId, duration

### 🏠 Real Estate (AVILA PEREZ)

- **Tabs principales:** Properties, Search, Favorites, Messages, Account
- **Stack interno:** Property List → Property Detail → Gallery → Contact
- **Parámetros:** propertyId, location, price

### 🎉 Event Manager (BERNAL VELANDIA)

- **Drawer principal:** Events, Calendar, Tickets, Attendees
- **Stack interno:** Event → Details → Buy Ticket → Confirmation
- **Parámetros:** eventId, ticketType, quantity

_(Continúa para cada estudiante según su dominio)_

---

## 🔜 ENTREGA

### Formato

1. **Código fuente** en repositorio Git
2. **Video demo** (3 min) mostrando:
   - Navegación completa entre todas las pantallas
   - Flujos principales del dominio
   - Paso de parámetros funcionando
3. **README.md** con:
   - Descripción del dominio
   - Estructura de navegación implementada
   - Pantallas incluidas
   - Instrucciones de instalación

### Checklist

- [ ] Mínimo 8 pantallas funcionales
- [ ] Stack Navigator implementado
- [ ] Tabs o Drawer Navigator implementado
- [ ] Navegación anidada funcionando
- [ ] Paso de parámetros entre pantallas
- [ ] Color theme aplicado consistentemente
- [ ] Iconos contextuales del dominio
- [ ] Headers personalizados
- [ ] Sin errores de navegación
- [ ] Video demo grabado

---

**FICHA 3147251 - SEMANA 2: NAVEGACIÓN Y ROUTING**  
_25 dominios únicos de aplicación con estructuras de navegación personalizadas_

**Bootcamp React Native 2025 - EPTI** 🚀
