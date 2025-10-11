# 📖 Glosario - Semana 2: Navegación en React Native

> **Términos técnicos y conceptos clave** de React Navigation y navegación móvil

---

## 📑 Índice Alfabético

[A](#a) | [B](#b) | [C](#c) | [D](#d) | [E](#e) | [F](#f) | [G](#g) | [H](#h) | [I](#i) | [J](#j) | [K](#k) | [L](#l) | [M](#m) | [N](#n) | [O](#o) | [P](#p) | [Q](#q) | [R](#r) | [S](#s) | [T](#t) | [U](#u) | [V](#v) | [W](#w) | [X](#x) | [Y](#y) | [Z](#z)

---

## A

### Active Route
**Español:** Ruta activa  
**Definición:** La pantalla o ruta que está actualmente visible para el usuario.  
**Ejemplo:**
```typescript
const activeRoute = navigation.getState().routes[navigation.getState().index]
```

### AnimatedValue
**Español:** Valor animado  
**Definición:** Objeto usado para controlar animaciones en React Native.  
**Contexto:** Usado en transiciones personalizadas de navegación.

### Auth Flow
**Español:** Flujo de autenticación  
**Definición:** Patrón de navegación que maneja login, registro y protección de rutas.  
**Ejemplo:** Login screen → (authenticated) → Home, (not authenticated) → Login

---

## B

### Back Handler
**Español:** Manejador de retroceso  
**Definición:** Función que controla qué sucede cuando el usuario presiona el botón "atrás".  
**Código:**
```typescript
import { BackHandler } from 'react-native'
BackHandler.addEventListener('hardwareBackPress', () => {
  // Custom logic
  return true // Prevent default
})
```

### Badge
**Español:** Insignia/Etiqueta  
**Definición:** Indicador visual (generalmente numérico) que aparece sobre un ícono.  
**Uso común:** Mostrar cantidad de items en carrito o notificaciones sin leer.  
**Ejemplo:**
```typescript
<Tab.Screen 
  options={{ tabBarBadge: 3 }} 
/>
```

### Bottom Tab Navigator
**Español:** Navegador de pestañas inferior  
**Definición:** Tipo de navegador que muestra pestañas en la parte inferior de la pantalla.  
**También conocido como:** Tab Bar, Bottom Tabs  
**Importación:**
```typescript
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs'
```

---

## C

### Card Style Interpolator
**Español:** Interpolador de estilo de tarjeta  
**Definición:** Función que define cómo se animan las transiciones entre pantallas.  
**Tipos comunes:**
- `forHorizontalIOS` - Deslizamiento horizontal (iOS style)
- `forVerticalIOS` - Deslizamiento vertical (modal iOS)
- `forFadeFromBottomAndroid` - Fade desde abajo (Android)

### Context
**Español:** Contexto  
**Definición:** API de React para compartir datos entre componentes sin prop drilling.  
**Uso en navegación:** State management global (ej: carrito, autenticación).  
**Ejemplo:**
```typescript
const CartContext = createContext<CartContextType>()
```

### Container Component
**Español:** Componente contenedor  
**Definición:** Componente que maneja lógica y pasa datos a componentes presentacionales.  
**En navegación:** Screens suelen ser container components.

### Custom Drawer
**Español:** Drawer personalizado  
**Definición:** Componente personalizado que reemplaza el contenido predeterminado del drawer.  
**Implementación:**
```typescript
<Drawer.Navigator drawerContent={(props) => <CustomDrawer {...props} />} />
```

---

## D

### Deep Linking
**Español:** Enlaces profundos  
**Definición:** URLs que abren la app en una pantalla específica.  
**Ejemplo:** `myapp://product/123` abre el producto 123.  
**Config:**
```typescript
linking={{
  prefixes: ['myapp://'],
  config: {
    screens: {
      ProductDetail: 'product/:id'
    }
  }
}}
```

### Drawer Navigator
**Español:** Navegador de cajón/lateral  
**Definición:** Tipo de navegador que muestra un menú lateral deslizable.  
**Comportamiento:** Se abre deslizando desde el borde izquierdo.  
**Importación:**
```typescript
import { createDrawerNavigator } from '@react-navigation/drawer'
```

### Dynamic Import
**Español:** Importación dinámica  
**Definición:** Carga de componentes bajo demanda (lazy loading).  
**Beneficio:** Mejora el performance inicial de la app.  
**Ejemplo:**
```typescript
const Screen = React.lazy(() => import('./Screen'))
```

---

## E

### Event Listeners
**Español:** Escuchadores de eventos  
**Definición:** Funciones que se ejecutan cuando ocurren ciertos eventos de navegación.  
**Eventos comunes:**
- `focus` - Pantalla ganó foco
- `blur` - Pantalla perdió foco
- `beforeRemove` - Antes de remover pantalla del stack

**Ejemplo:**
```typescript
useEffect(() => {
  const unsubscribe = navigation.addListener('focus', () => {
    // Do something
  })
  return unsubscribe
}, [navigation])
```

---

## F

### Focus
**Español:** Foco  
**Definición:** Estado cuando una pantalla está activa y visible.  
**Hook:**
```typescript
import { useIsFocused } from '@react-navigation/native'
const isFocused = useIsFocused()
```

---

## G

### Gesture Handler
**Español:** Manejador de gestos  
**Definición:** Librería para manejar gestos táctiles como swipes y pans.  
**Requerido por:** Drawer Navigator  
**Instalación:**
```bash
pnpm add react-native-gesture-handler
```

### goBack()
**Español:** Ir atrás  
**Definición:** Método para volver a la pantalla anterior en el stack.  
**Uso:**
```typescript
navigation.goBack()
```

---

## H

### Header
**Español:** Encabezado/Cabecera  
**Definición:** Barra superior de una pantalla que muestra título y acciones.  
**Personalización:**
```typescript
<Stack.Screen 
  options={{
    headerTitle: 'Mi Título',
    headerStyle: { backgroundColor: '#f00' },
    headerTintColor: '#fff'
  }}
/>
```

### Header Options
**Español:** Opciones del encabezado  
**Definición:** Configuración para personalizar la apariencia del header.  
**Opciones comunes:**
- `headerTitle` - Título
- `headerStyle` - Estilos del contenedor
- `headerTintColor` - Color de texto/iconos
- `headerLeft/Right` - Componentes personalizados

### Hook
**Español:** Gancho  
**Definición:** Función de React que permite usar estado y otras características.  
**Hooks de navegación:**
- `useNavigation()` - Acceso al objeto navigation
- `useRoute()` - Acceso a información de la ruta actual
- `useIsFocused()` - Estado de foco de la pantalla

---

## I

### Initial Route Name
**Español:** Nombre de ruta inicial  
**Definición:** Primera pantalla que se muestra cuando se monta un navegador.  
**Configuración:**
```typescript
<Stack.Navigator initialRouteName="Home">
```

### Ionicons
**Español:** Ionicons (nombre de librería)  
**Definición:** Librería de iconos vectoriales incluida en Expo.  
**Uso:**
```typescript
import { Ionicons } from '@expo/vector-icons'
<Ionicons name="home" size={24} color="black" />
```

---

## J

### Jump To
**Español:** Saltar a  
**Definición:** Método para navegar directamente a una ruta específica en Tab/Drawer.  
**Uso:**
```typescript
navigation.jumpTo('Profile')
```

---

## L

### Lazy Loading
**Español:** Carga perezosa  
**Definición:** Técnica de cargar pantallas solo cuando son necesarias.  
**Beneficio:** Reduce tiempo de carga inicial.  
**Implementación:**
```typescript
lazy: true // En screen options
```

### Linking
**Español:** Enlazado  
**Definición:** Configuración para manejar deep links y URLs.  
**Ver:** Deep Linking

---

## M

### Modal
**Español:** Modal  
**Definición:** Pantalla que se presenta encima de otras, generalmente deslizándose desde abajo.  
**Configuración:**
```typescript
<Stack.Screen 
  name="CreatePost"
  options={{ presentation: 'modal' }}
/>
```

### Mode
**Español:** Modo  
**Definición:** Estilo de transición entre pantallas.  
**Opciones:**
- `card` - Transición de tarjeta (default)
- `modal` - Presentación modal

---

## N

### Navigate
**Español:** Navegar  
**Definición:** Método principal para cambiar de pantalla.  
**Diferencia con push:** Navigate no apila si la pantalla ya existe en el stack.  
**Uso:**
```typescript
navigation.navigate('Profile', { userId: 123 })
```

### Navigation
**Español:** Navegación  
**Definición:** Objeto que contiene métodos para controlar la navegación.  
**Acceso:**
```typescript
// Como prop
function Screen({ navigation }) { }

// Como hook
const navigation = useNavigation()
```

### Navigation Container
**Español:** Contenedor de navegación  
**Definición:** Componente root que envuelve toda la estructura de navegación.  
**Uso:**
```typescript
import { NavigationContainer } from '@react-navigation/native'

<NavigationContainer>
  <Navigator />
</NavigationContainer>
```

### Navigation State
**Español:** Estado de navegación  
**Definición:** Objeto que representa el estado actual de la navegación.  
**Contiene:** Rutas, índice actual, historial.

### Navigator
**Español:** Navegador  
**Definición:** Componente que gestiona un conjunto de pantallas y sus transiciones.  
**Tipos:** Stack, Tab, Drawer

### Nested Navigation
**Español:** Navegación anidada  
**Definición:** Patrón de tener navegadores dentro de otros navegadores.  
**Ejemplo común:** Tab Navigator → cada tab tiene su propio Stack Navigator

---

## O

### Options
**Español:** Opciones  
**Definición:** Configuración para personalizar comportamiento y apariencia de pantallas.  
**Uso:**
```typescript
<Stack.Screen 
  name="Home"
  options={{
    title: 'Inicio',
    headerShown: true
  }}
/>
```

---

## P

### Params
**Español:** Parámetros  
**Definición:** Datos que se pasan de una pantalla a otra durante la navegación.  
**Pasar:**
```typescript
navigation.navigate('Detail', { id: 123 })
```
**Recibir:**
```typescript
const { id } = route.params
```

### ParamList
**Español:** Lista de parámetros  
**Definición:** Tipo TypeScript que define qué params acepta cada pantalla.  
**Ejemplo:**
```typescript
type RootStackParamList = {
  Home: undefined
  Detail: { id: number }
}
```

### Pop
**Español:** Desapilar  
**Definición:** Remover pantalla(s) del stack y volver atrás.  
**Uso:**
```typescript
navigation.pop() // Remove 1 screen
navigation.pop(2) // Remove 2 screens
```

### PopToTop
**Español:** Desapilar hasta arriba  
**Definición:** Volver a la primera pantalla del stack, removiendo todas las demás.  
**Uso:**
```typescript
navigation.popToTop()
```

### Presentation
**Español:** Presentación  
**Definición:** Estilo visual de cómo se muestra una pantalla.  
**Valores:**
- `card` - Como tarjeta
- `modal` - Como modal
- `transparentModal` - Modal transparente

### Provider
**Español:** Proveedor  
**Definición:** Componente que provee un contexto a sus hijos.  
**Ejemplo:**
```typescript
<CartProvider>
  <NavigationContainer>
    <App />
  </NavigationContainer>
</CartProvider>
```

### Push
**Español:** Empujar/Apilar  
**Definición:** Agregar una nueva pantalla al stack, incluso si ya existe.  
**Diferencia con navigate:** Push siempre agrega, navigate reutiliza si existe.  
**Uso:**
```typescript
navigation.push('Detail', { id: 456 })
```

---

## R

### React Navigation
**Definición:** Librería principal de navegación para React Native.  
**Versión actual:** 6.x  
**Website:** https://reactnavigation.org

### Reanimated
**Español:** Re-animado  
**Definición:** Librería de animaciones de alto rendimiento.  
**Requerido por:** Drawer Navigator (v2)  
**Instalación:**
```bash
pnpm add react-native-reanimated
```

### Replace
**Español:** Reemplazar  
**Definición:** Reemplazar la pantalla actual por una nueva en el stack.  
**Uso común:** Después de login exitoso.  
**Uso:**
```typescript
navigation.replace('Home')
```

### Reset
**Español:** Resetear  
**Definición:** Resetear completamente el estado de navegación.  
**Uso común:** Logout.  
**Código:**
```typescript
navigation.reset({
  index: 0,
  routes: [{ name: 'Login' }]
})
```

### Route
**Español:** Ruta  
**Definición:** Objeto que contiene información sobre la pantalla actual.  
**Contiene:** `name`, `params`, `key`  
**Acceso:**
```typescript
const route = useRoute()
```

---

## S

### Safe Area
**Español:** Área segura  
**Definición:** Área de la pantalla que no es cubierta por notch, barra de estado, etc.  
**Componente:**
```typescript
import { SafeAreaView } from 'react-native-safe-area-context'
```

### Screen
**Español:** Pantalla  
**Definición:** Componente individual que representa una vista completa en la app.  
**En navegación:** Cada pantalla se registra en un Navigator.

### Screen Options
**Español:** Opciones de pantalla  
**Definición:** Configuración que se aplica a todas las pantallas de un Navigator.  
**Scope:** Navigator-level vs Screen-level

### Stack
**Español:** Pila  
**Definición:** Estructura de datos LIFO (Last In, First Out) que gestiona historial de pantallas.  
**Operaciones:** Push (agregar), Pop (remover)

### Stack Navigator
**Español:** Navegador de pila  
**Definición:** Tipo de navegador que gestiona pantallas en una pila (stack).  
**Transición:** Generalmente horizontal.  
**Importación:**
```typescript
import { createNativeStackNavigator } from '@react-navigation/native-stack'
```

### State Management
**Español:** Gestión de estado  
**Definición:** Patrón para manejar y compartir estado en la aplicación.  
**Opciones:** Context API, Redux, Zustand, MobX

---

## T

### Tab Bar
**Español:** Barra de pestañas  
**Definición:** Barra (generalmente inferior) que muestra los tabs disponibles.  
**Personalizable:** Iconos, labels, estilos, badge

### Tab Navigator
**Español:** Navegador de pestañas  
**Ver:** Bottom Tab Navigator

### Transition
**Español:** Transición  
**Definición:** Animación que ocurre al cambiar de una pantalla a otra.  
**Tipos:** Horizontal slide, vertical slide, fade, custom

### Type Safety
**Español:** Seguridad de tipos  
**Definición:** Uso de TypeScript para prevenir errores de tipos en navegación.  
**Beneficios:** Autocompletado, validación en tiempo de compilación

---

## U

### Unfocused
**Español:** Desenfocado  
**Definición:** Estado cuando una pantalla NO está activa/visible.  
**Opuesto:** Focused

### useIsFocused
**Definición:** Hook que retorna true si la pantalla está enfocada.  
**Uso:**
```typescript
const isFocused = useIsFocused()
```

### useNavigation
**Definición:** Hook para acceder al objeto navigation.  
**Ventaja:** No requiere navigation como prop.  
**Uso:**
```typescript
const navigation = useNavigation<NativeStackNavigationProp<...>>()
```

### useRoute
**Definición:** Hook para acceder al objeto route.  
**Uso:**
```typescript
const route = useRoute<RouteProp<ParamList, 'ScreenName'>>()
```

---

## V

### View
**Español:** Vista  
**Definición:** Componente básico de React Native equivalente a un `<div>`.  
**En navegación:** Contenedor principal de cada Screen.

---

## W

### Wrapper Component
**Español:** Componente envolvente  
**Definición:** Componente que envuelve otros componentes para proveer funcionalidad.  
**Ejemplo:** NavigationContainer, Provider

---

## 🔤 Términos por Categoría

### 🧭 Tipos de Navegadores
- **Stack Navigator** - Navegación apilada
- **Tab Navigator** - Navegación por pestañas
- **Drawer Navigator** - Navegación lateral
- **Bottom Tab Navigator** - Pestañas inferiores

### 🎬 Métodos de Navegación
- **navigate()** - Navegar a una pantalla
- **push()** - Agregar pantalla al stack
- **pop()** - Remover pantalla del stack
- **goBack()** - Volver atrás
- **replace()** - Reemplazar pantalla actual
- **reset()** - Resetear navegación
- **jumpTo()** - Saltar a tab/drawer

### 📦 Componentes Principales
- **NavigationContainer** - Contenedor root
- **Screen** - Definición de pantalla
- **Navigator** - Gestor de pantallas
- **Header** - Encabezado
- **Tab Bar** - Barra de pestañas

### 🎨 Personalización
- **Options** - Configuración de pantallas
- **screenOptions** - Configuración global
- **headerStyle** - Estilos de header
- **tabBarIcon** - Iconos de tabs
- **drawerContent** - Contenido de drawer

### 🔧 Hooks
- **useNavigation()** - Acceso a navigation
- **useRoute()** - Acceso a route
- **useIsFocused()** - Estado de foco
- **useFocusEffect()** - Efecto al enfocar

### 📊 TypeScript
- **ParamList** - Tipos de parámetros
- **NavigationProp** - Tipo de navigation
- **RouteProp** - Tipo de route
- **Type Safety** - Seguridad de tipos

### 🎯 Conceptos Avanzados
- **Nested Navigation** - Navegación anidada
- **Deep Linking** - Enlaces profundos
- **Auth Flow** - Flujo de autenticación
- **Lazy Loading** - Carga diferida
- **State Persistence** - Persistencia de estado

---

## 📚 Términos Relacionados con Context API

### Context
Ver definición en sección [C](#c)

### Provider
Ver definición en sección [P](#p)

### Consumer
**Español:** Consumidor  
**Definición:** Componente que consume el valor de un Context.  
**Nota:** Reemplazado por `useContext` hook.

### useContext
**Definición:** Hook para consumir un Context.  
**Uso:**
```typescript
const value = useContext(MyContext)
```

---

## 🔗 Términos de Integración

### Expo
**Definición:** Plataforma y conjunto de herramientas para React Native.  
**Incluye:** CLI, Go app, EAS (build service)

### Metro Bundler
**Español:** Empaquetador Metro  
**Definición:** Bundler de JavaScript para React Native.  
**Función:** Compila y empaqueta el código JS.

### React Native Screens
**Definición:** Librería que usa componentes nativos para mejor performance.  
**Requerida por:** React Navigation

---

## ✅ Checklist de Comprensión

### Nivel Básico:
- [ ] Entiendo qué es un Navigator
- [ ] Sé la diferencia entre Stack, Tab y Drawer
- [ ] Puedo usar navigate() y goBack()
- [ ] Entiendo qué son los params
- [ ] Sé qué es NavigationContainer

### Nivel Intermedio:
- [ ] Entiendo navegación anidada
- [ ] Puedo pasar y recibir params
- [ ] Sé personalizar headers y tabs
- [ ] Entiendo el concepto de Stack (LIFO)
- [ ] Puedo usar hooks de navegación

### Nivel Avanzado:
- [ ] Domino TypeScript en navegación
- [ ] Entiendo deep linking
- [ ] Puedo crear custom navigators
- [ ] Sé optimizar performance
- [ ] Manejo auth flows complejos

---

## 🎓 Para Profundizar

**Ver también:**
- [Documentación oficial de React Navigation](https://reactnavigation.org)
- [Teoría de Semana 2](../1-teoria/)
- [Prácticas de Semana 2](../2-practicas/)

---

_Glosario - Semana 2: Navegación en React Native_  
_Bootcamp React Native 2025 - EPTI_

**Última actualización:** Octubre 2025  
**Total de términos:** 80+
