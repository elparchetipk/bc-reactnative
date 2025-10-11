# 02. Stack Navigator en Profundidad

> **Domina la navegación tipo pila (Stack)**  
> Aprende a crear flujos de navegación profesionales con parámetros, headers dinámicos y modales.

**Duración:** 1.5 horas (presencial)  
**Modalidad:** Teoría + Práctica guiada

---

## 🎯 Objetivos

Al finalizar esta sesión, podrás:

- ✅ Entender cómo funciona el Stack Navigator (LIFO)
- ✅ Pasar y recibir parámetros entre pantallas
- ✅ Personalizar headers de forma estática y dinámica
- ✅ Crear modales y pantallas especiales
- ✅ Configurar gestos y animaciones
- ✅ Implementar TypeScript para type-safety
- ✅ Manejar deep linking básico

---

## 📚 ¿Qué es un Stack Navigator?

### Concepto de Pila (Stack)

Un **Stack Navigator** funciona como una **pila de cartas**:

```
┌─────────────────┐
│   Details       │ ← TOP (pantalla actual)
├─────────────────┤
│   Product       │
├─────────────────┤
│   Home          │ ← BOTTOM (pantalla inicial)
└─────────────────┘
```

**Principio LIFO** (Last In, First Out):

- La última pantalla agregada (push) es la primera en salir (pop)
- Como el botón "atrás" del navegador web
- Cada nueva navegación apila una pantalla encima

---

## 🔧 Creación Básica

### Instalación

```bash
pnpm add @react-navigation/native-stack
```

### Configuración Mínima

```typescript
import { createNativeStackNavigator } from '@react-navigation/native-stack'

const Stack = createNativeStackNavigator()

export function AppNavigator() {
  return (
    <Stack.Navigator>
      <Stack.Screen name="Home" component={HomeScreen} />
      <Stack.Screen name="Details" component={DetailsScreen} />
    </Stack.Navigator>
  )
}
```

---

## 🚀 Navegación Básica

### Métodos Principales

```typescript
function HomeScreen({ navigation }) {

  // 1. navigate() - Navega a una pantalla
  // Si ya existe en el stack, no la duplica (por defecto)
  const handleNavigate = () => {
    navigation.navigate('Details')
  }

  // 2. push() - SIEMPRE agrega una nueva pantalla
  // Permite duplicados en el stack
  const handlePush = () => {
    navigation.push('Details')
  }

  // 3. goBack() - Vuelve a la pantalla anterior
  const handleGoBack = () => {
    navigation.goBack()
  }

  // 4. popToTop() - Vuelve a la primera pantalla del stack
  const handleReset = () => {
    navigation.popToTop()
  }

  // 5. replace() - Reemplaza la pantalla actual
  // Útil para login → home (no quieres volver al login)
  const handleReplace = () => {
    navigation.replace('Home')
  }

  // 6. pop(n) - Elimina n pantallas del stack
  const handlePopTwo = () => {
    navigation.pop(2) // Vuelve 2 pantallas atrás
  }

  return (
    // ... UI
  )
}
```

### Diferencia entre navigate() y push()

```typescript
// Escenario: Stack actual [Home]

// Con navigate()
navigation.navigate('Details') // Stack: [Home, Details]
navigation.navigate('Details') // Stack: [Home, Details] ← No duplica
navigation.navigate('Details') // Stack: [Home, Details] ← No duplica

// Con push()
navigation.push('Details') // Stack: [Home, Details]
navigation.push('Details') // Stack: [Home, Details, Details] ← Duplica
navigation.push('Details') // Stack: [Home, Details, Details, Details]
```

**Cuándo usar cada uno:**

- `navigate()`: Navegación normal, evita duplicados
- `push()`: Cuando quieres permitir múltiples instancias (ej: chat → chat → chat)

---

## 📦 Pasar Parámetros entre Pantallas

### Enviar Parámetros

```typescript
// HomeScreen.tsx
function HomeScreen({ navigation }) {
  const handlePress = () => {
    navigation.navigate('Details', {
      itemId: 86,
      productName: 'iPhone 15 Pro',
      price: 999,
      inStock: true,
    })
  }

  return <Button title="Ver Producto" onPress={handlePress} />
}
```

### Recibir Parámetros

```typescript
// DetailsScreen.tsx
function DetailsScreen({ route, navigation }) {
  // Extraer parámetros del route
  const { itemId, productName, price, inStock } = route.params

  return (
    <View>
      <Text>ID: {itemId}</Text>
      <Text>Producto: {productName}</Text>
      <Text>Precio: ${price}</Text>
      <Text>Stock: {inStock ? 'Disponible' : 'Agotado'}</Text>
    </View>
  )
}
```

### Parámetros con Valores por Defecto

```typescript
function DetailsScreen({ route }) {
  // Si no recibe parámetros, usa valores por defecto
  const {
    itemId = 0,
    productName = 'Producto Desconocido',
    price = 0,
    inStock = false
  } = route.params || {}

  return (
    // ... UI
  )
}
```

---

## 🔒 TypeScript: Type-Safe Navigation

### Definir Tipos de Parámetros

```typescript
// navigation/types.ts

/**
 * RootStackParamList
 *
 * ¿Qué es?
 * Define todos los parámetros que cada pantalla puede recibir
 *
 * ¿Para qué?
 * Type-safety: TypeScript valida que pases los parámetros correctos
 */
export type RootStackParamList = {
  Home: undefined // Sin parámetros
  Details: {
    // Con parámetros requeridos
    itemId: number
    productName: string
    price: number
    inStock: boolean
  }
  Profile: {
    // Parámetros opcionales
    userId: string
    showStats?: boolean
  }
  Settings: undefined
}
```

### Usar en Navigator

```typescript
// navigation/AppNavigator.tsx
import { createNativeStackNavigator } from '@react-navigation/native-stack'
import type { RootStackParamList } from './types'

const Stack = createNativeStackNavigator<RootStackParamList>()
//                                      ^^^^^^^^^^^^^^^^^^^^
//                                      Type-safe Navigator

export function AppNavigator() {
  return (
    <Stack.Navigator>
      <Stack.Screen name="Home" component={HomeScreen} />
      <Stack.Screen name="Details" component={DetailsScreen} />
    </Stack.Navigator>
  )
}
```

### Usar en Screens con Props Tipadas

```typescript
// screens/DetailsScreen.tsx
import type { NativeStackScreenProps } from '@react-navigation/native-stack'
import type { RootStackParamList } from '../navigation/types'

/**
 * Props tipadas para DetailsScreen
 *
 * Incluye automáticamente: navigation, route
 */
type DetailsScreenProps = NativeStackScreenProps<
  RootStackParamList,
  'Details'
>

export function DetailsScreen({ route, navigation }: DetailsScreenProps) {
  // ✅ TypeScript sabe que route.params tiene estas props:
  const { itemId, productName, price, inStock } = route.params
  //      ^^^^^^  ^^^^^^^^^^^  ^^^^^  ^^^^^^^
  //      Autocompletado + validación de tipos

  // ✅ TypeScript valida que navegues con los parámetros correctos
  const handleGoToProfile = () => {
    navigation.navigate('Profile', {
      userId: '123',
      // showStats: true  // ← Opcional, no es necesario
    })
  }

  // ❌ Esto daría error de TypeScript:
  // navigation.navigate('Details', { wrongParam: 'oops' })

  return (
    // ... UI
  )
}
```

### Hooks Tipados

```typescript
// hooks/useTypedNavigation.ts

/**
 * Hook personalizado para navegación type-safe
 *
 * ¿Para qué?
 * Usar navigation con autocompletado en toda la app
 */
import { useNavigation } from '@react-navigation/native'
import type { NativeStackNavigationProp } from '@react-navigation/native-stack'
import type { RootStackParamList } from '../navigation/types'

export function useAppNavigation() {
  return useNavigation<NativeStackNavigationProp<RootStackParamList>>()
}

// Uso en cualquier componente:
function MyComponent() {
  const navigation = useAppNavigation()

  navigation.navigate('Details', {
    itemId: 1,
    productName: 'Product',
    price: 99,
    inStock: true,
  }) // ← Autocompletado y validación
}
```

---

## 🎨 Personalización de Headers

### Headers Estáticos

```typescript
<Stack.Screen
  name="Home"
  component={HomeScreen}
  options={{
    title: 'Inicio',
    headerStyle: {
      backgroundColor: '#3b82f6',
    },
    headerTintColor: '#fff',
    headerTitleStyle: {
      fontWeight: 'bold',
      fontSize: 20,
    },
    headerShadowVisible: false, // Quitar sombra
  }}
/>
```

### Headers Dinámicos

```typescript
<Stack.Screen
  name="Details"
  component={DetailsScreen}
  options={({ route }) => ({
    title: route.params.productName, // ← Título dinámico desde params
    headerStyle: {
      backgroundColor: route.params.inStock ? '#10b981' : '#ef4444',
    },
  })}
/>
```

### Actualizar Header desde el Componente

```typescript
function DetailsScreen({ navigation }) {

  useEffect(() => {
    // Actualizar título cuando cambie el estado
    navigation.setOptions({
      title: 'Producto Actualizado',
      headerRight: () => (
        <Button title="Save" onPress={() => console.log('Saved')} />
      ),
    })
  }, [navigation])

  return (
    // ... UI
  )
}
```

---

## 🔘 Botones en el Header

### Header Right/Left/Title

```typescript
<Stack.Screen
  name="Details"
  component={DetailsScreen}
  options={{
    title: 'Detalles',

    // Botón derecho
    headerRight: () => (
      <TouchableOpacity onPress={() => console.log('Share')}>
        <Text className="text-white mr-4">Compartir</Text>
      </TouchableOpacity>
    ),

    // Botón izquierdo personalizado
    headerLeft: () => (
      <TouchableOpacity onPress={() => console.log('Menu')}>
        <Text className="text-white ml-4">☰</Text>
      </TouchableOpacity>
    ),

    // Título personalizado
    headerTitle: () => (
      <View>
        <Text className="text-white font-bold">Mi App</Text>
        <Text className="text-white text-xs">v1.0</Text>
      </View>
    ),
  }}
/>
```

### Header con Íconos (Expo)

```typescript
import { Ionicons } from '@expo/vector-icons'

;<Stack.Screen
  name="Details"
  component={DetailsScreen}
  options={({ navigation }) => ({
    title: 'Detalles',
    headerRight: () => (
      <TouchableOpacity
        onPress={() => navigation.navigate('Cart')}
        className="mr-4"
      >
        <Ionicons name="cart" size={24} color="white" />
      </TouchableOpacity>
    ),
  })}
/>
```

---

## 🪟 Modales

### Configurar una Pantalla como Modal

```typescript
<Stack.Navigator>
  <Stack.Screen name="Home" component={HomeScreen} />
  <Stack.Screen name="Details" component={DetailsScreen} />

  {/* Modal: Se presenta desde abajo */}
  <Stack.Screen
    name="AddProduct"
    component={AddProductScreen}
    options={{
      presentation: 'modal', // ← Clave para modal
      headerTitle: 'Agregar Producto',
      headerLeft: () => (
        <Button title="Cancelar" onPress={() => navigation.goBack()} />
      ),
    }}
  />
</Stack.Navigator>
```

### Tipos de Presentación

```typescript
options={{
  presentation: 'card',              // Slide desde derecha (default)
  presentation: 'modal',             // Slide desde abajo
  presentation: 'transparentModal',  // Modal con fondo transparente
  presentation: 'containedModal',    // Modal contenido
  presentation: 'fullScreenModal',   // Modal pantalla completa
}}
```

---

## 🎭 Animaciones y Transiciones

### Animaciones Predefinidas

```typescript
<Stack.Screen
  name="Details"
  component={DetailsScreen}
  options={{
    animation: 'default', // Slide (iOS) / Fade (Android)
    animation: 'fade', // Fade in/out
    animation: 'slide_from_right',
    animation: 'slide_from_left',
    animation: 'slide_from_bottom',
    animation: 'none', // Sin animación
  }}
/>
```

### Configurar Duración de Animación

```typescript
<Stack.Navigator
  screenOptions={{
    animationDuration: 300, // 300ms (default: ~350ms)
  }}
>
  {/* Screens */}
</Stack.Navigator>
```

---

## 🔍 Gestionar el Stack Programáticamente

### Resetear el Stack

```typescript
function LoginScreen({ navigation }) {

  const handleLogin = async () => {
    // ... lógica de login

    // Resetear stack: eliminar Login y mostrar Home
    navigation.reset({
      index: 0,             // Posición inicial
      routes: [{ name: 'Home' }],  // Nueva pila
    })
  }

  return (
    // ... UI
  )
}
```

### Navegar con Reset

```typescript
// Caso: Login → Home → Perfil
// Quieres que después del login, el usuario no pueda volver atrás

navigation.reset({
  index: 1, // Pantalla activa será la segunda (Perfil)
  routes: [
    { name: 'Home' }, // Primera en el stack
    { name: 'Profile', params: { userId: '123' } }, // Segunda y activa
  ],
})
```

---

## 🛡️ Proteger Rutas (Auth Guard)

### Ejemplo Básico

```typescript
function AppNavigator() {
  const { isLoggedIn } = useAuth() // Custom hook de autenticación

  return (
    <Stack.Navigator>
      {isLoggedIn ? (
        // Rutas protegidas (requieren login)
        <>
          <Stack.Screen name="Home" component={HomeScreen} />
          <Stack.Screen name="Profile" component={ProfileScreen} />
        </>
      ) : (
        // Rutas públicas
        <>
          <Stack.Screen name="Login" component={LoginScreen} />
          <Stack.Screen name="Register" component={RegisterScreen} />
        </>
      )}
    </Stack.Navigator>
  )
}
```

---

## 🔗 Deep Linking Básico

### Configurar Deep Links

```typescript
// App.tsx
import { NavigationContainer } from '@react-navigation/native'

const linking = {
  prefixes: ['myapp://', 'https://myapp.com'],
  config: {
    screens: {
      Home: '',
      Details: 'product/:itemId', // myapp://product/123
      Profile: 'user/:userId', // myapp://user/456
    },
  },
}

export default function App() {
  return (
    <NavigationContainer linking={linking}>
      <AppNavigator />
    </NavigationContainer>
  )
}
```

### Acceder a Parámetros de Deep Link

```typescript
function DetailsScreen({ route }) {
  // Si el usuario abre myapp://product/123
  const { itemId } = route.params // itemId = "123"

  return <Text>Producto ID: {itemId}</Text>
}
```

---

## 🐛 Debugging

### Ver el Estado del Stack

```typescript
import { useNavigationState } from '@react-navigation/native'

function DebugStack() {
  const routes = useNavigationState((state) => state.routes)

  console.log(
    'Stack actual:',
    routes.map((r) => r.name)
  )
  // Output: ['Home', 'Details', 'Profile']

  return null
}
```

### Listener de Cambios de Navegación

```typescript
function MyScreen({ navigation }) {
  useEffect(() => {
    const unsubscribe = navigation.addListener('focus', () => {
      console.log('Pantalla enfocada')
    })

    return unsubscribe
  }, [navigation])

  return (
    // ... UI
  )
}
```

---

## 💡 Mejores Prácticas

### 1. Organización de Rutas

```typescript
// navigation/routes.ts
export const ROUTES = {
  HOME: 'Home' as const,
  DETAILS: 'Details' as const,
  PROFILE: 'Profile' as const,
}

// Uso:
navigation.navigate(ROUTES.DETAILS, { itemId: 1 })
```

### 2. Componente de Header Reutilizable

```typescript
// components/CustomHeader.tsx
export function CustomHeader({ title, onBack, onSave }) {
  return (
    <View className="flex-row justify-between items-center px-4 h-14 bg-blue-500">
      <TouchableOpacity onPress={onBack}>
        <Text className="text-white">← Atrás</Text>
      </TouchableOpacity>
      <Text className="text-white font-bold">{title}</Text>
      <TouchableOpacity onPress={onSave}>
        <Text className="text-white">Guardar</Text>
      </TouchableOpacity>
    </View>
  )
}

// Uso:
;<Stack.Screen
  name="Edit"
  component={EditScreen}
  options={{
    header: () => (
      <CustomHeader
        title="Editar Producto"
        onBack={() => navigation.goBack()}
        onSave={handleSave}
      />
    ),
  }}
/>
```

### 3. Configurar opciones globales

```typescript
<Stack.Navigator
  screenOptions={{
    headerStyle: {
      backgroundColor: '#3b82f6',
    },
    headerTintColor: '#fff',
    headerTitleStyle: {
      fontWeight: 'bold',
    },
    headerBackTitle: 'Atrás', // iOS
    gestureEnabled: true,
    animation: 'slide_from_right',
  }}
>
  {/* Todas las pantallas heredan estas opciones */}
</Stack.Navigator>
```

---

## 🚨 Errores Comunes

### 1. Acceder a params que no existen

❌ **Error:**

```typescript
const { itemId } = route.params
// TypeError: Cannot destructure property 'itemId' of undefined
```

✅ **Solución:**

```typescript
const { itemId } = route.params || {}
// O con TypeScript:
const { itemId = 0 } = route.params || {}
```

### 2. Navegar sin esperar

❌ **Error:**

```typescript
navigation.navigate('Details')
navigation.goBack() // ← Esto cancela la navegación anterior
```

✅ **Solución:**

```typescript
navigation.navigate('Details')
// Espera a que la navegación termine antes de llamar otro método
```

### 3. Olvidar el botón atrás en Android

❌ **Problema:**
En Android, el botón físico "atrás" puede no funcionar correctamente.

✅ **Solución:**
React Navigation lo maneja automáticamente. Si no funciona, verifica que `gestureEnabled: true` esté configurado.

---

## 💻 Ejemplo Completo: App de Blog

```typescript
// types.ts
export type BlogStackParamList = {
  PostList: undefined
  PostDetail: { postId: number; title: string }
  AddPost: undefined
}

// AppNavigator.tsx
const Stack = createNativeStackNavigator<BlogStackParamList>()

export function BlogNavigator() {
  return (
    <Stack.Navigator
      initialRouteName="PostList"
      screenOptions={{
        headerStyle: { backgroundColor: '#1f2937' },
        headerTintColor: '#fff',
        headerTitleStyle: { fontWeight: 'bold' },
      }}
    >
      <Stack.Screen
        name="PostList"
        component={PostListScreen}
        options={{
          title: 'Blog Posts',
          headerRight: () => (
            <TouchableOpacity onPress={() => navigation.navigate('AddPost')}>
              <Text className="text-white mr-4">+ Nuevo</Text>
            </TouchableOpacity>
          ),
        }}
      />

      <Stack.Screen
        name="PostDetail"
        component={PostDetailScreen}
        options={({ route }) => ({
          title: route.params.title,
        })}
      />

      <Stack.Screen
        name="AddPost"
        component={AddPostScreen}
        options={{
          presentation: 'modal',
          title: 'Nuevo Post',
        }}
      />
    </Stack.Navigator>
  )
}

// PostListScreen.tsx
type PostListProps = NativeStackScreenProps<BlogStackParamList, 'PostList'>

export function PostListScreen({ navigation }: PostListProps) {
  const posts = [
    { id: 1, title: 'React Native Tips' },
    { id: 2, title: 'TypeScript Best Practices' },
  ]

  return (
    <FlatList
      data={posts}
      renderItem={({ item }) => (
        <TouchableOpacity
          onPress={() =>
            navigation.navigate('PostDetail', {
              postId: item.id,
              title: item.title,
            })
          }
        >
          <Text>{item.title}</Text>
        </TouchableOpacity>
      )}
    />
  )
}

// PostDetailScreen.tsx
type PostDetailProps = NativeStackScreenProps<BlogStackParamList, 'PostDetail'>

export function PostDetailScreen({ route }: PostDetailProps) {
  const { postId, title } = route.params

  return (
    <View>
      <Text>Post ID: {postId}</Text>
      <Text>Título: {title}</Text>
    </View>
  )
}
```

---

## 📖 Recursos Adicionales

- [Stack Navigator Docs](https://reactnavigation.org/docs/native-stack-navigator)
- [TypeScript Guide](https://reactnavigation.org/docs/typescript)
- [Modal Example](https://reactnavigation.org/docs/modal)

---

## ✍️ Ejercicio Práctico

**Objetivo:** Crear una app de productos con navegación Stack completa.

### Requisitos:

1. **ProductListScreen:** Lista de 5 productos (hardcoded)
2. **ProductDetailScreen:** Detalle con botón "Editar"
3. **EditProductScreen:** Modal para editar (simulado)

### Funcionalidad:

- Pasar datos del producto entre pantallas
- Header personalizado en detalle con botón "Favorito"
- Modal para editar con botón "Cancelar" y "Guardar"

**Tiempo:** 30 minutos  
**Trabajo:** Individual

---

## 🎯 Resumen

Hoy aprendiste:

✅ Cómo funciona el Stack Navigator (LIFO)  
✅ Diferencia entre `navigate()` y `push()`  
✅ Pasar y recibir parámetros entre pantallas  
✅ TypeScript type-safe navigation  
✅ Personalizar headers (estáticos y dinámicos)  
✅ Crear modales y pantallas especiales  
✅ Configurar animaciones y transiciones  
✅ Gestionar el stack programáticamente  
✅ Deep linking básico

---

_Stack Navigator - Semana 2_  
_Bootcamp React Native 2025_
