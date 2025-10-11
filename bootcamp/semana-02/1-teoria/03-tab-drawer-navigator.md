# 03. Tab Navigator y Drawer Navigator

> **Navegación por pestañas y menú lateral**  
> Crea interfaces profesionales con Bottom Tabs y Drawer para apps complejas.

**Duración:** 2 horas (presencial)  
**Modalidad:** Teoría + Demo + Práctica

---

## 🎯 Objetivos

Al finalizar esta sesión, podrás:

- ✅ Implementar Bottom Tab Navigator
- ✅ Personalizar tabs con íconos y estilos
- ✅ Configurar badges y notificaciones en tabs
- ✅ Crear Drawer Navigator (menú lateral)
- ✅ Personalizar el contenido del Drawer
- ✅ Combinar Stack + Tab + Drawer (navegación anidada)
- ✅ Gestionar navegación entre diferentes navigators

---

## 📱 Tab Navigator (Bottom Tabs)

### ¿Qué es?

Un **Tab Navigator** muestra pestañas en la parte inferior (iOS/Android) o superior de la pantalla.

**Casos de uso:**

- Secciones principales de la app (Home, Buscar, Perfil)
- Navegación rápida entre vistas
- Acceso constante a funciones clave

**Ejemplos reales:**

- Instagram: Feed, Buscar, Reels, Tienda, Perfil
- Twitter: Inicio, Buscar, Notificaciones, Mensajes
- Spotify: Inicio, Buscar, Tu Biblioteca

---

### Instalación

```bash
pnpm add @react-navigation/bottom-tabs
```

---

### Configuración Básica

```typescript
// navigation/TabNavigator.tsx
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs'
import { HomeScreen } from '../screens/HomeScreen'
import { SearchScreen } from '../screens/SearchScreen'
import { ProfileScreen } from '../screens/ProfileScreen'

const Tab = createBottomTabNavigator()

export function TabNavigator() {
  return (
    <Tab.Navigator>
      <Tab.Screen name="Home" component={HomeScreen} />
      <Tab.Screen name="Search" component={SearchScreen} />
      <Tab.Screen name="Profile" component={ProfileScreen} />
    </Tab.Navigator>
  )
}
```

---

### Personalizar con Íconos

```typescript
import { Ionicons } from '@expo/vector-icons'

export function TabNavigator() {
  return (
    <Tab.Navigator
      screenOptions={({ route }) => ({
        tabBarIcon: ({ focused, color, size }) => {
          let iconName: keyof typeof Ionicons.glyphMap

          if (route.name === 'Home') {
            iconName = focused ? 'home' : 'home-outline'
          } else if (route.name === 'Search') {
            iconName = focused ? 'search' : 'search-outline'
          } else if (route.name === 'Profile') {
            iconName = focused ? 'person' : 'person-outline'
          }

          return <Ionicons name={iconName} size={size} color={color} />
        },
        tabBarActiveTintColor: '#3b82f6',
        tabBarInactiveTintColor: '#9ca3af',
      })}
    >
      <Tab.Screen name="Home" component={HomeScreen} />
      <Tab.Screen name="Search" component={SearchScreen} />
      <Tab.Screen name="Profile" component={ProfileScreen} />
    </Tab.Navigator>
  )
}
```

**Explicación:**

- `tabBarIcon`: Función que renderiza el ícono del tab
- `focused`: true cuando el tab está activo
- `color`: Color automático según `tabBarActiveTintColor` o `tabBarInactiveTintColor`
- `size`: Tamaño del ícono (default: 25)

---

### Estilos Personalizados

```typescript
<Tab.Navigator
  screenOptions={{
    // Estilos de la barra de tabs
    tabBarStyle: {
      backgroundColor: '#1f2937',
      borderTopWidth: 0,
      height: 60,
      paddingBottom: 8,
    },

    // Estilos del label
    tabBarLabelStyle: {
      fontSize: 12,
      fontWeight: '600',
    },

    // Colores
    tabBarActiveTintColor: '#60a5fa',
    tabBarInactiveTintColor: '#9ca3af',

    // Header
    headerStyle: {
      backgroundColor: '#1f2937',
    },
    headerTintColor: '#fff',
    headerTitleStyle: {
      fontWeight: 'bold',
    },
  }}
>
  {/* Screens */}
</Tab.Navigator>
```

---

### Badges (Notificaciones)

```typescript
<Tab.Screen
  name="Messages"
  component={MessagesScreen}
  options={{
    tabBarBadge: 3, // Número de notificaciones
    tabBarBadgeStyle: {
      backgroundColor: '#ef4444',
      color: '#fff',
    },
  }}
/>
```

**Badge Dinámico:**

```typescript
export function TabNavigator() {
  const [messageCount, setMessageCount] = useState(5)

  return (
    <Tab.Navigator>
      <Tab.Screen
        name="Messages"
        component={MessagesScreen}
        options={{
          tabBarBadge: messageCount > 0 ? messageCount : undefined,
        }}
      />
    </Tab.Navigator>
  )
}
```

---

### Ocultar Tabs en Pantallas Específicas

```typescript
// En el Screen que quieres ocultar los tabs:
<Tab.Screen
  name="Profile"
  component={ProfileScreen}
  options={({ route }) => ({
    tabBarStyle: { display: 'none' }, // Oculta la barra de tabs
  })}
/>
```

**O desde el componente:**

```typescript
function ProfileScreen({ navigation }) {
  useEffect(() => {
    navigation.setOptions({
      tabBarStyle: { display: 'none' }
    })

    return () => {
      navigation.setOptions({
        tabBarStyle: { display: 'flex' }
      })
    }
  }, [])

  return (
    // ... UI
  )
}
```

---

### Listener de Cambio de Tab

```typescript
function HomeScreen({ navigation }) {
  useEffect(() => {
    const unsubscribe = navigation.addListener('tabPress', (e) => {
      // Prevenir acción default
      // e.preventDefault()

      console.log('Tab Home presionado')

      // Recargar datos, scroll to top, etc.
    })

    return unsubscribe
  }, [navigation])

  return (
    // ... UI
  )
}
```

---

### TypeScript con Tab Navigator

```typescript
// types.ts
export type TabParamList = {
  Home: undefined
  Search: { query?: string }
  Profile: { userId: string }
}

// TabNavigator.tsx
const Tab = createBottomTabNavigator<TabParamList>()

// Uso en Screen
type HomeScreenProps = BottomTabScreenProps<TabParamList, 'Home'>

export function HomeScreen({ navigation }: HomeScreenProps) {
  navigation.navigate('Search', { query: 'react native' })
  // ✅ Type-safe
}
```

---

## 🗂️ Drawer Navigator (Menú Lateral)

### ¿Qué es?

Un **Drawer Navigator** muestra un menú lateral deslizable desde el borde izquierdo (o derecho).

**Casos de uso:**

- Apps con muchas secciones (no caben en tabs)
- Configuración y ajustes
- Navegación secundaria
- Logout, About, Help

**Ejemplos reales:**

- Gmail: Inbox, Drafts, Sent, Trash
- Medium: Home, Bookmarks, Settings, Help
- Slack: Workspaces, Settings, Help

---

### Instalación

```bash
pnpm add @react-navigation/drawer
pnpm add react-native-gesture-handler react-native-reanimated
```

**⚠️ IMPORTANTE:** Configurar `react-native-reanimated` en `babel.config.js`:

```javascript
module.exports = function (api) {
  api.cache(true)
  return {
    presets: ['babel-preset-expo'],
    plugins: [
      'nativewind/babel',
      'react-native-reanimated/plugin', // ← AL FINAL
    ],
  }
}
```

Después ejecutar:

```bash
pnpm start --clear
```

---

### Configuración Básica

```typescript
// navigation/DrawerNavigator.tsx
import { createDrawerNavigator } from '@react-navigation/drawer'

const Drawer = createDrawerNavigator()

export function DrawerNavigator() {
  return (
    <Drawer.Navigator>
      <Drawer.Screen name="Home" component={HomeScreen} />
      <Drawer.Screen name="Settings" component={SettingsScreen} />
      <Drawer.Screen name="About" component={AboutScreen} />
    </Drawer.Navigator>
  )
}
```

---

### Personalizar con Íconos

```typescript
import { Ionicons } from '@expo/vector-icons'

export function DrawerNavigator() {
  return (
    <Drawer.Navigator
      screenOptions={{
        drawerActiveTintColor: '#3b82f6',
        drawerInactiveTintColor: '#6b7280',
      }}
    >
      <Drawer.Screen
        name="Home"
        component={HomeScreen}
        options={{
          drawerIcon: ({ color, size }) => (
            <Ionicons name="home" size={size} color={color} />
          ),
          drawerLabel: 'Inicio',
        }}
      />

      <Drawer.Screen
        name="Settings"
        component={SettingsScreen}
        options={{
          drawerIcon: ({ color, size }) => (
            <Ionicons name="settings" size={size} color={color} />
          ),
          drawerLabel: 'Configuración',
        }}
      />

      <Drawer.Screen
        name="About"
        component={AboutScreen}
        options={{
          drawerIcon: ({ color, size }) => (
            <Ionicons name="information-circle" size={size} color={color} />
          ),
          drawerLabel: 'Acerca de',
        }}
      />
    </Drawer.Navigator>
  )
}
```

---

### Abrir/Cerrar Drawer Programáticamente

```typescript
function HomeScreen({ navigation }) {
  return (
    <View>
      <Button title="Abrir Menú" onPress={() => navigation.openDrawer()} />

      <Button title="Cerrar Menú" onPress={() => navigation.closeDrawer()} />

      <Button title="Toggle Menú" onPress={() => navigation.toggleDrawer()} />
    </View>
  )
}
```

---

### Drawer Personalizado (Custom Drawer Content)

```typescript
// components/CustomDrawer.tsx
import {
  DrawerContentScrollView,
  DrawerItemList,
  DrawerItem,
} from '@react-navigation/drawer'
import { View, Text, Image, TouchableOpacity } from 'react-native'

/**
 * CustomDrawer
 *
 * ¿Qué hace?
 * Reemplaza el contenido default del Drawer con UI personalizada
 *
 * ¿Para qué?
 * Agregar header con avatar, sección de logout, footer, etc.
 */
export function CustomDrawer(props) {
  return (
    <DrawerContentScrollView {...props}>
      {/* Header con perfil */}
      <View className="p-4 border-b border-gray-200">
        <Image
          source={{ uri: 'https://via.placeholder.com/100' }}
          className="w-20 h-20 rounded-full mb-2"
        />
        <Text className="text-lg font-bold">John Doe</Text>
        <Text className="text-gray-600">john@example.com</Text>
      </View>

      {/* Items default del Drawer */}
      <DrawerItemList {...props} />

      {/* Items personalizados adicionales */}
      <DrawerItem
        label="Ayuda"
        icon={({ color, size }) => (
          <Ionicons name="help-circle" size={size} color={color} />
        )}
        onPress={() => console.log('Help pressed')}
      />

      <DrawerItem
        label="Cerrar Sesión"
        icon={({ color, size }) => (
          <Ionicons name="log-out" size={size} color={color} />
        )}
        onPress={() => {
          // Lógica de logout
          console.log('Logout')
        }}
        labelStyle={{ color: '#ef4444' }}
      />
    </DrawerContentScrollView>
  )
}

// Uso en DrawerNavigator:
;<Drawer.Navigator drawerContent={(props) => <CustomDrawer {...props} />}>
  {/* Screens */}
</Drawer.Navigator>
```

---

### Estilos del Drawer

```typescript
<Drawer.Navigator
  screenOptions={{
    drawerStyle: {
      backgroundColor: '#f3f4f6',
      width: 280,
    },
    drawerActiveTintColor: '#3b82f6',
    drawerInactiveTintColor: '#6b7280',
    drawerLabelStyle: {
      fontSize: 16,
      fontWeight: '500',
    },
    drawerItemStyle: {
      marginVertical: 4,
      borderRadius: 8,
    },
    headerStyle: {
      backgroundColor: '#1f2937',
    },
    headerTintColor: '#fff',
  }}
>
  {/* Screens */}
</Drawer.Navigator>
```

---

### Drawer desde la Derecha

```typescript
<Drawer.Navigator
  screenOptions={{
    drawerPosition: 'right', // Default: 'left'
  }}
>
  {/* Screens */}
</Drawer.Navigator>
```

---

## 🔗 Navegación Anidada (Nested Navigation)

### ¿Por Qué Anidar Navegadores?

Las apps reales combinan diferentes tipos de navegación:

**Estructura típica:**

```
App
└── Drawer (menú lateral global)
    └── Tab (secciones principales)
        └── Stack (navegación dentro de cada tab)
```

**Ejemplo real (Instagram):**

```
Drawer Navigator (Ajustes, Guardados, etc.)
└── Tab Navigator (Feed, Buscar, Reels, Tienda, Perfil)
    └── Stack Navigator en cada tab
        - Feed → Post Detail → Comments
        - Buscar → User Profile → User Posts
        - Perfil → Edit Profile → Change Password
```

---

### Ejemplo 1: Tab + Stack

```typescript
// Stack dentro de cada Tab

// navigation/HomeStack.tsx
const HomeStack = createNativeStackNavigator()

function HomeStackNavigator() {
  return (
    <HomeStack.Navigator>
      <HomeStack.Screen name="Feed" component={FeedScreen} />
      <HomeStack.Screen name="PostDetail" component={PostDetailScreen} />
      <HomeStack.Screen name="Comments" component={CommentsScreen} />
    </HomeStack.Navigator>
  )
}

// navigation/ProfileStack.tsx
const ProfileStack = createNativeStackNavigator()

function ProfileStackNavigator() {
  return (
    <ProfileStack.Navigator>
      <ProfileStack.Screen name="ProfileHome" component={ProfileHomeScreen} />
      <ProfileStack.Screen name="EditProfile" component={EditProfileScreen} />
      <ProfileStack.Screen name="Settings" component={SettingsScreen} />
    </ProfileStack.Navigator>
  )
}

// navigation/TabNavigator.tsx
const Tab = createBottomTabNavigator()

export function TabNavigator() {
  return (
    <Tab.Navigator>
      <Tab.Screen
        name="HomeTab"
        component={HomeStackNavigator} // ← Stack anidado
        options={{
          tabBarLabel: 'Inicio',
          tabBarIcon: ({ color, size }) => (
            <Ionicons name="home" size={size} color={color} />
          ),
        }}
      />

      <Tab.Screen
        name="ProfileTab"
        component={ProfileStackNavigator} // ← Stack anidado
        options={{
          tabBarLabel: 'Perfil',
          tabBarIcon: ({ color, size }) => (
            <Ionicons name="person" size={size} color={color} />
          ),
        }}
      />
    </Tab.Navigator>
  )
}
```

**Resultado:**

- En el tab "Inicio": Puedes navegar Feed → PostDetail → Comments
- En el tab "Perfil": Puedes navegar ProfileHome → EditProfile → Settings
- Los tabs siempre son visibles en la parte inferior
- Cada tab tiene su propio historial de navegación

---

### Ejemplo 2: Drawer + Tab + Stack

```typescript
// Estructura completa: Drawer > Tab > Stack

// App.tsx
export default function App() {
  return (
    <NavigationContainer>
      <DrawerNavigator />
    </NavigationContainer>
  )
}

// navigation/DrawerNavigator.tsx
const Drawer = createDrawerNavigator()

export function DrawerNavigator() {
  return (
    <Drawer.Navigator>
      <Drawer.Screen
        name="Main"
        component={TabNavigator} // ← Tab Navigator anidado
        options={{
          drawerLabel: 'Inicio',
          title: 'Mi App',
        }}
      />

      <Drawer.Screen
        name="Settings"
        component={SettingsScreen}
        options={{
          drawerLabel: 'Configuración',
        }}
      />

      <Drawer.Screen
        name="About"
        component={AboutScreen}
        options={{
          drawerLabel: 'Acerca de',
        }}
      />
    </Drawer.Navigator>
  )
}

// navigation/TabNavigator.tsx (ya definido arriba)
// Cada Tab tiene su Stack Navigator
```

**Resultado:**

- Drawer: Acceso global a Configuración, About, etc.
- Tabs: Secciones principales (Home, Search, Profile)
- Stack: Navegación dentro de cada tab

---

### Navegar entre Navegadores Anidados

```typescript
// Desde cualquier pantalla anidada, navegar al Drawer:
navigation.navigate('Main') // Drawer Screen name

// Navegar a un Tab específico:
navigation.navigate('Main', {
  screen: 'ProfileTab', // Tab name
})

// Navegar a una pantalla dentro de un Stack dentro de un Tab:
navigation.navigate('Main', {
  screen: 'ProfileTab',
  params: {
    screen: 'EditProfile', // Stack Screen name
    params: { userId: '123' },
  },
})
```

**Ejemplo práctico:**

```typescript
// En SettingsScreen (Drawer), ir al EditProfile (Stack > Tab)
function SettingsScreen({ navigation }) {
  const handleEditProfile = () => {
    navigation.navigate('Main', {
      screen: 'ProfileTab',
      params: {
        screen: 'EditProfile',
        params: { userId: '123' },
      },
    })
  }

  return <Button title="Editar Perfil" onPress={handleEditProfile} />
}
```

---

### TypeScript con Navegación Anidada

```typescript
// types.ts

// Drawer Param List
export type DrawerParamList = {
  Main: NavigatorScreenParams<TabParamList>
  Settings: undefined
  About: undefined
}

// Tab Param List
export type TabParamList = {
  HomeTab: NavigatorScreenParams<HomeStackParamList>
  ProfileTab: NavigatorScreenParams<ProfileStackParamList>
}

// Home Stack Param List
export type HomeStackParamList = {
  Feed: undefined
  PostDetail: { postId: number }
  Comments: { postId: number }
}

// Profile Stack Param List
export type ProfileStackParamList = {
  ProfileHome: undefined
  EditProfile: { userId: string }
  Settings: undefined
}
```

**Uso:**

```typescript
// En una pantalla del Stack
type EditProfileProps = NativeStackScreenProps<
  ProfileStackParamList,
  'EditProfile'
>

export function EditProfileScreen({ route, navigation }: EditProfileProps) {
  const { userId } = route.params // ✅ Type-safe

  // Navegar al Drawer
  navigation.navigate('Settings') // ✅ Autocompletado
}
```

---

## 💡 Mejores Prácticas

### 1. Organización de Archivos

```
src/
├── navigation/
│   ├── types.ts                # Tipos de todos los navegadores
│   ├── DrawerNavigator.tsx     # Drawer principal
│   ├── TabNavigator.tsx        # Tab Navigator
│   ├── stacks/
│   │   ├── HomeStack.tsx       # Stack del Home
│   │   ├── ProfileStack.tsx    # Stack del Perfil
│   │   └── index.ts
│   └── index.ts
```

### 2. Configuración Centralizada

```typescript
// navigation/config.ts
export const COLORS = {
  primary: '#3b82f6',
  secondary: '#6b7280',
  background: '#f3f4f6',
  text: '#1f2937',
}

export const TAB_OPTIONS = {
  tabBarActiveTintColor: COLORS.primary,
  tabBarInactiveTintColor: COLORS.secondary,
  tabBarStyle: {
    height: 60,
    paddingBottom: 8,
  },
}

export const DRAWER_OPTIONS = {
  drawerActiveTintColor: COLORS.primary,
  drawerInactiveTintColor: COLORS.secondary,
}
```

### 3. Componentes Reutilizables

```typescript
// components/TabIcon.tsx
interface TabIconProps {
  name: keyof typeof Ionicons.glyphMap
  focused: boolean
  color: string
  size: number
}

export function TabIcon({ name, focused, color, size }: TabIconProps) {
  const iconName = focused ? name : `${name}-outline`
  return <Ionicons name={iconName} size={size} color={color} />
}

// Uso:
options={{
  tabBarIcon: ({ focused, color, size }) => (
    <TabIcon name="home" focused={focused} color={color} size={size} />
  ),
}}
```

---

## 🚨 Errores Comunes

### 1. Reanimated no configurado

❌ **Error:**

```
Reanimated 2 failed to create a worklet
```

✅ **Solución:**
Agregar `'react-native-reanimated/plugin'` como último plugin en `babel.config.js` y ejecutar `pnpm start --clear`.

### 2. Header duplicado

❌ **Problema:**
Al anidar navegadores, aparecen múltiples headers.

✅ **Solución:**

```typescript
<Tab.Screen
  name="HomeTab"
  component={HomeStackNavigator}
  options={{
    headerShown: false, // Oculta el header del Tab
  }}
/>
```

### 3. Tabs visibles en pantallas de Stack

❌ **Problema:**
Los tabs se ven en pantallas internas del Stack.

✅ **Solución:**

```typescript
// En el Stack Screen
<HomeStack.Screen
  name="PostDetail"
  component={PostDetailScreen}
  options={{
    tabBarStyle: { display: 'none' }, // Solo si es necesario
  }}
/>
```

---

## 💻 Ejercicio Práctico: App de E-Commerce

**Objetivo:** Crear navegación completa Drawer + Tab + Stack.

### Estructura:

```
Drawer
├── Main (Tab Navigator)
│   ├── Home (Stack)
│   │   ├── ProductList
│   │   └── ProductDetail
│   ├── Cart (Stack)
│   │   ├── CartList
│   │   └── Checkout
│   └── Profile (Stack)
│       ├── ProfileHome
│       └── EditProfile
├── Settings
└── Help
```

### Requisitos:

1. Drawer con 3 items (Main, Settings, Help)
2. Tab Navigator con 3 tabs (Home, Cart, Profile)
3. Cada tab tiene su Stack Navigator
4. Iconos en tabs y drawer
5. Badge en Cart tab (número de items)
6. Custom Drawer Content con avatar
7. Navegar entre navegadores

**Tiempo:** 40 minutos  
**Trabajo:** En parejas

---

## 🎯 Resumen

Hoy aprendiste:

✅ Implementar Bottom Tab Navigator con íconos  
✅ Personalizar tabs (estilos, badges, listeners)  
✅ Crear Drawer Navigator con menú lateral  
✅ Custom Drawer Content con UI personalizada  
✅ Navegación anidada (Drawer + Tab + Stack)  
✅ Navegar entre navegadores anidados  
✅ TypeScript con navegación compleja  
✅ Mejores prácticas y organización

---

_Tab & Drawer Navigator - Semana 2_  
_Bootcamp React Native 2025_
