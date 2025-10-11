# Práctica 2: Tab Navigator - Dashboard App

> **Navegación por pestañas con Bottom Tabs**  
> Crea un dashboard con 3 tabs: Home, Search y Profile.

**Duración:** 45 minutos  
**Modalidad:** Práctica guiada en clase  
**Dificultad:** ⭐⭐ Intermedio

---

## 🎯 Objetivos

Al finalizar esta práctica, habrás:

- ✅ Implementado Bottom Tab Navigator
- ✅ Personalizado tabs con íconos de Ionicons
- ✅ Agregado badges de notificaciones
- ✅ Estilizado la barra de tabs
- ✅ Combinado Tab + Stack Navigator (navegación anidada)

---

## 📋 Requisitos Previos

- ✅ Haber completado la teoría de Tab Navigator
- ✅ Práctica 1 (Stack Navigator) completada
- ✅ Entender navegación básica

---

## 🏗️ Estructura del Proyecto

```
dashboard-app/
├── App.tsx
├── src/
│   ├── navigation/
│   │   ├── types.ts
│   │   ├── TabNavigator.tsx
│   │   └── stacks/
│   │       ├── HomeStack.tsx
│   │       └── ProfileStack.tsx
│   ├── screens/
│   │   ├── home/
│   │   │   ├── HomeScreen.tsx
│   │   │   └── NotificationsScreen.tsx
│   │   ├── search/
│   │   │   ├── SearchScreen.tsx
│   │   │   └── ResultsScreen.tsx
│   │   └── profile/
│   │       ├── ProfileScreen.tsx
│   │       └── EditProfileScreen.tsx
│   └── data/
│       └── mockData.ts
└── package.json
```

---

## 📝 Parte 1: Datos de Ejemplo (5 min)

### 1.1 Mock Data

```typescript
// src/data/mockData.ts

/**
 * Datos de ejemplo para el Dashboard
 * 
 * ¿Para qué?
 * Simular datos de notificaciones, búsquedas y perfil
 */

export interface Notification {
  id: number
  title: string
  message: string
  time: string
  read: boolean
}

export interface SearchResult {
  id: number
  title: string
  category: string
  description: string
}

export interface UserProfile {
  name: string
  email: string
  avatar: string
  bio: string
  stats: {
    posts: number
    followers: number
    following: number
  }
}

export const NOTIFICATIONS: Notification[] = [
  {
    id: 1,
    title: 'Nuevo seguidor',
    message: 'Juan Pérez comenzó a seguirte',
    time: 'Hace 5 minutos',
    read: false
  },
  {
    id: 2,
    title: 'Comentario en tu post',
    message: 'María comentó: "¡Excelente artículo!"',
    time: 'Hace 1 hora',
    read: false
  },
  {
    id: 3,
    title: 'Nueva actualización',
    message: 'Hay una nueva versión disponible',
    time: 'Hace 2 horas',
    read: true
  },
  {
    id: 4,
    title: 'Me gusta en tu foto',
    message: 'A Carlos le gustó tu publicación',
    time: 'Ayer',
    read: true
  }
]

export const SEARCH_RESULTS: SearchResult[] = [
  {
    id: 1,
    title: 'React Native Basics',
    category: 'Tutorial',
    description: 'Learn the fundamentals of React Native development'
  },
  {
    id: 2,
    title: 'Advanced Navigation',
    category: 'Guide',
    description: 'Master complex navigation patterns'
  },
  {
    id: 3,
    title: 'State Management',
    category: 'Tutorial',
    description: 'Handle app state with Context and Redux'
  }
]

export const USER_PROFILE: UserProfile = {
  name: 'Ana García',
  email: 'ana.garcia@example.com',
  avatar: 'https://i.pravatar.cc/150?img=5',
  bio: 'Desarrolladora React Native apasionada por crear experiencias móviles increíbles 📱✨',
  stats: {
    posts: 42,
    followers: 1234,
    following: 567
  }
}

export const getUnreadNotificationsCount = (): number => {
  return NOTIFICATIONS.filter(n => !n.read).length
}
```

---

## 📝 Parte 2: Tipos TypeScript (5 min)

### 2.1 Definir tipos de navegación

```typescript
// src/navigation/types.ts

/**
 * Tipos de navegación del Dashboard
 * 
 * Estructura:
 * - TabParamList: Navegación principal de tabs
 * - HomeStackParamList: Stack anidado en tab Home
 * - ProfileStackParamList: Stack anidado en tab Profile
 */

export type TabParamList = {
  HomeTab: undefined
  SearchTab: undefined
  ProfileTab: undefined
}

export type HomeStackParamList = {
  Home: undefined
  Notifications: undefined
}

export type SearchStackParamList = {
  Search: undefined
  Results: { query: string }
}

export type ProfileStackParamList = {
  Profile: undefined
  EditProfile: undefined
}
```

---

## 📝 Parte 3: Pantallas del Home Tab (10 min)

### 3.1 HomeScreen

```typescript
// src/screens/home/HomeScreen.tsx
import React from 'react'
import { View, Text, ScrollView, TouchableOpacity } from 'react-native'
import type { NativeStackScreenProps } from '@react-navigation/native-stack'
import type { HomeStackParamList } from '../../navigation/types'
import { getUnreadNotificationsCount } from '../../data/mockData'

/**
 * HomeScreen - Pantalla principal del dashboard
 * 
 * ¿Qué muestra?
 * Resumen de actividad y acceso rápido a notificaciones
 */

type Props = NativeStackScreenProps<HomeStackParamList, 'Home'>

export function HomeScreen({ navigation }: Props) {
  const unreadCount = getUnreadNotificationsCount()
  
  return (
    <ScrollView className="flex-1 bg-gray-50">
      <View className="p-4">
        {/* Header */}
        <View className="mb-6">
          <Text className="text-3xl font-bold text-gray-900 mb-2">
            👋 ¡Bienvenido!
          </Text>
          <Text className="text-gray-600">
            Aquí está tu resumen de hoy
          </Text>
        </View>
        
        {/* Stats Cards */}
        <View className="flex-row gap-3 mb-6">
          <View className="flex-1 bg-blue-500 p-4 rounded-xl">
            <Text className="text-white text-3xl font-bold mb-1">12</Text>
            <Text className="text-blue-100">Tareas</Text>
          </View>
          <View className="flex-1 bg-green-500 p-4 rounded-xl">
            <Text className="text-white text-3xl font-bold mb-1">5</Text>
            <Text className="text-green-100">Completadas</Text>
          </View>
        </View>
        
        {/* Notifications Card */}
        <TouchableOpacity
          onPress={() => navigation.navigate('Notifications')}
          className="bg-white p-5 rounded-xl shadow-sm mb-4"
        >
          <View className="flex-row items-center justify-between">
            <View className="flex-row items-center gap-3">
              <View className="w-12 h-12 bg-purple-100 rounded-full items-center justify-center">
                <Text className="text-2xl">🔔</Text>
              </View>
              <View>
                <Text className="text-lg font-bold text-gray-900">
                  Notificaciones
                </Text>
                {unreadCount > 0 && (
                  <Text className="text-sm text-gray-600">
                    {unreadCount} sin leer
                  </Text>
                )}
              </View>
            </View>
            <Text className="text-gray-400">→</Text>
          </View>
        </TouchableOpacity>
        
        {/* Quick Actions */}
        <Text className="text-lg font-bold text-gray-900 mb-3">
          Acciones Rápidas
        </Text>
        
        <View className="flex-row gap-3">
          <TouchableOpacity className="flex-1 bg-white p-4 rounded-xl items-center shadow-sm">
            <Text className="text-3xl mb-2">📝</Text>
            <Text className="text-sm font-semibold text-gray-700">Nueva Nota</Text>
          </TouchableOpacity>
          
          <TouchableOpacity className="flex-1 bg-white p-4 rounded-xl items-center shadow-sm">
            <Text className="text-3xl mb-2">📷</Text>
            <Text className="text-sm font-semibold text-gray-700">Foto</Text>
          </TouchableOpacity>
          
          <TouchableOpacity className="flex-1 bg-white p-4 rounded-xl items-center shadow-sm">
            <Text className="text-3xl mb-2">📊</Text>
            <Text className="text-sm font-semibold text-gray-700">Reportes</Text>
          </TouchableOpacity>
        </View>
        
        {/* Recent Activity */}
        <Text className="text-lg font-bold text-gray-900 mt-6 mb-3">
          Actividad Reciente
        </Text>
        
        {[1, 2, 3].map((item) => (
          <View key={item} className="bg-white p-4 rounded-xl mb-3 shadow-sm">
            <Text className="font-semibold text-gray-900 mb-1">
              Tarea completada #{item}
            </Text>
            <Text className="text-sm text-gray-600">Hace {item} hora(s)</Text>
          </View>
        ))}
      </View>
    </ScrollView>
  )
}
```

### 3.2 NotificationsScreen

```typescript
// src/screens/home/NotificationsScreen.tsx
import React from 'react'
import { View, Text, FlatList, TouchableOpacity } from 'react-native'
import type { NativeStackScreenProps } from '@react-navigation/native-stack'
import type { HomeStackParamList } from '../../navigation/types'
import { NOTIFICATIONS, type Notification } from '../../data/mockData'

/**
 * NotificationsScreen - Lista de notificaciones
 */

type Props = NativeStackScreenProps<HomeStackParamList, 'Notifications'>

export function NotificationsScreen({ navigation }: Props) {
  
  const renderNotification = ({ item }: { item: Notification }) => (
    <TouchableOpacity
      className={`p-4 border-b border-gray-200 ${!item.read ? 'bg-blue-50' : 'bg-white'}`}
    >
      <View className="flex-row items-start gap-3">
        <View className={`w-3 h-3 rounded-full mt-1 ${!item.read ? 'bg-blue-500' : 'bg-gray-300'}`} />
        <View className="flex-1">
          <Text className="font-bold text-gray-900 mb-1">{item.title}</Text>
          <Text className="text-gray-600 mb-2">{item.message}</Text>
          <Text className="text-xs text-gray-400">{item.time}</Text>
        </View>
      </View>
    </TouchableOpacity>
  )
  
  return (
    <View className="flex-1 bg-white">
      <FlatList
        data={NOTIFICATIONS}
        renderItem={renderNotification}
        keyExtractor={(item) => item.id.toString()}
        ListHeaderComponent={
          <View className="p-4 bg-gray-50 border-b border-gray-200">
            <Text className="text-sm text-gray-600">
              {NOTIFICATIONS.filter(n => !n.read).length} notificaciones sin leer
            </Text>
          </View>
        }
      />
    </View>
  )
}
```

---

## 📝 Parte 4: SearchScreen (5 min)

### 4.1 SearchScreen

```typescript
// src/screens/search/SearchScreen.tsx
import React, { useState } from 'react'
import { View, Text, TextInput, FlatList, TouchableOpacity } from 'react-native'
import { SEARCH_RESULTS } from '../../data/mockData'

/**
 * SearchScreen - Búsqueda de contenido
 */

export function SearchScreen() {
  const [query, setQuery] = useState('')
  
  const filteredResults = SEARCH_RESULTS.filter(result =>
    result.title.toLowerCase().includes(query.toLowerCase())
  )
  
  return (
    <View className="flex-1 bg-white">
      {/* Search Bar */}
      <View className="p-4 border-b border-gray-200">
        <TextInput
          value={query}
          onChangeText={setQuery}
          placeholder="Buscar..."
          className="bg-gray-100 px-4 py-3 rounded-lg text-base"
          placeholderTextColor="#9ca3af"
        />
      </View>
      
      {/* Results */}
      <FlatList
        data={filteredResults}
        keyExtractor={(item) => item.id.toString()}
        renderItem={({ item }) => (
          <TouchableOpacity className="p-4 border-b border-gray-100">
            <View className="flex-row items-center gap-3 mb-2">
              <View className="bg-blue-100 px-2 py-1 rounded">
                <Text className="text-xs text-blue-600 font-semibold">
                  {item.category}
                </Text>
              </View>
            </View>
            <Text className="text-lg font-bold text-gray-900 mb-1">
              {item.title}
            </Text>
            <Text className="text-gray-600">{item.description}</Text>
          </TouchableOpacity>
        )}
        ListEmptyComponent={
          <View className="p-8 items-center">
            <Text className="text-gray-400 text-center">
              {query ? 'No se encontraron resultados' : 'Escribe para buscar'}
            </Text>
          </View>
        }
      />
    </View>
  )
}
```

---

## 📝 Parte 5: ProfileScreen (5 min)

### 5.1 ProfileScreen

```typescript
// src/screens/profile/ProfileScreen.tsx
import React from 'react'
import { View, Text, ScrollView, TouchableOpacity, Image } from 'react-native'
import type { NativeStackScreenProps } from '@react-navigation/native-stack'
import type { ProfileStackParamList } from '../../navigation/types'
import { USER_PROFILE } from '../../data/mockData'

/**
 * ProfileScreen - Perfil del usuario
 */

type Props = NativeStackScreenProps<ProfileStackParamList, 'Profile'>

export function ProfileScreen({ navigation }: Props) {
  return (
    <ScrollView className="flex-1 bg-white">
      {/* Header con Avatar */}
      <View className="items-center pt-6 pb-4 bg-gray-50">
        <Image
          source={{ uri: USER_PROFILE.avatar }}
          className="w-24 h-24 rounded-full mb-3"
        />
        <Text className="text-2xl font-bold text-gray-900">
          {USER_PROFILE.name}
        </Text>
        <Text className="text-gray-600">{USER_PROFILE.email}</Text>
      </View>
      
      {/* Stats */}
      <View className="flex-row border-y border-gray-200 bg-white">
        <View className="flex-1 py-4 items-center">
          <Text className="text-2xl font-bold text-gray-900">
            {USER_PROFILE.stats.posts}
          </Text>
          <Text className="text-sm text-gray-600">Posts</Text>
        </View>
        <View className="flex-1 py-4 items-center border-x border-gray-200">
          <Text className="text-2xl font-bold text-gray-900">
            {USER_PROFILE.stats.followers}
          </Text>
          <Text className="text-sm text-gray-600">Seguidores</Text>
        </View>
        <View className="flex-1 py-4 items-center">
          <Text className="text-2xl font-bold text-gray-900">
            {USER_PROFILE.stats.following}
          </Text>
          <Text className="text-sm text-gray-600">Siguiendo</Text>
        </View>
      </View>
      
      {/* Bio */}
      <View className="p-4">
        <Text className="text-gray-700 leading-5">{USER_PROFILE.bio}</Text>
      </View>
      
      {/* Edit Button */}
      <View className="px-4 pb-4">
        <TouchableOpacity
          onPress={() => navigation.navigate('EditProfile')}
          className="bg-blue-500 py-3 rounded-lg items-center"
        >
          <Text className="text-white font-semibold">Editar Perfil</Text>
        </TouchableOpacity>
      </View>
      
      {/* Options */}
      <View className="mt-4">
        {['Configuración', 'Privacidad', 'Ayuda', 'Cerrar Sesión'].map((option, index) => (
          <TouchableOpacity
            key={index}
            className="px-4 py-4 border-b border-gray-200 flex-row justify-between items-center"
          >
            <Text className="text-gray-900">{option}</Text>
            <Text className="text-gray-400">→</Text>
          </TouchableOpacity>
        ))}
      </View>
    </ScrollView>
  )
}
```

### 5.2 EditProfileScreen

```typescript
// src/screens/profile/EditProfileScreen.tsx
import React, { useState } from 'react'
import { View, Text, TextInput, TouchableOpacity, ScrollView, Alert } from 'react-native'
import { USER_PROFILE } from '../../data/mockData'

/**
 * EditProfileScreen - Editar perfil
 */

export function EditProfileScreen({ navigation }: any) {
  const [name, setName] = useState(USER_PROFILE.name)
  const [bio, setBio] = useState(USER_PROFILE.bio)
  
  const handleSave = () => {
    Alert.alert('✅ Guardado', 'Tu perfil se actualizó correctamente', [
      { text: 'OK', onPress: () => navigation.goBack() }
    ])
  }
  
  return (
    <ScrollView className="flex-1 bg-white">
      <View className="p-4">
        <View className="mb-4">
          <Text className="text-sm font-semibold text-gray-700 mb-2">Nombre</Text>
          <TextInput
            value={name}
            onChangeText={setName}
            className="border border-gray-300 rounded-lg px-4 py-3"
          />
        </View>
        
        <View className="mb-6">
          <Text className="text-sm font-semibold text-gray-700 mb-2">Biografía</Text>
          <TextInput
            value={bio}
            onChangeText={setBio}
            multiline
            numberOfLines={4}
            className="border border-gray-300 rounded-lg px-4 py-3"
            textAlignVertical="top"
          />
        </View>
        
        <TouchableOpacity
          onPress={handleSave}
          className="bg-blue-500 py-4 rounded-lg items-center"
        >
          <Text className="text-white font-bold">Guardar Cambios</Text>
        </TouchableOpacity>
      </View>
    </ScrollView>
  )
}
```

---

## 📝 Parte 6: Stacks Anidados (5 min)

### 6.1 HomeStack

```typescript
// src/navigation/stacks/HomeStack.tsx
import React from 'react'
import { createNativeStackNavigator } from '@react-navigation/native-stack'
import type { HomeStackParamList } from '../types'
import { HomeScreen } from '../../screens/home/HomeScreen'
import { NotificationsScreen } from '../../screens/home/NotificationsScreen'

const Stack = createNativeStackNavigator<HomeStackParamList>()

export function HomeStack() {
  return (
    <Stack.Navigator
      screenOptions={{
        headerShown: false, // El Tab Navigator ya tiene header
      }}
    >
      <Stack.Screen name="Home" component={HomeScreen} />
      <Stack.Screen 
        name="Notifications" 
        component={NotificationsScreen}
        options={{
          headerShown: true,
          title: 'Notificaciones',
        }}
      />
    </Stack.Navigator>
  )
}
```

### 6.2 ProfileStack

```typescript
// src/navigation/stacks/ProfileStack.tsx
import React from 'react'
import { createNativeStackNavigator } from '@react-navigation/native-stack'
import type { ProfileStackParamList } from '../types'
import { ProfileScreen } from '../../screens/profile/ProfileScreen'
import { EditProfileScreen } from '../../screens/profile/EditProfileScreen'

const Stack = createNativeStackNavigator<ProfileStackParamList>()

export function ProfileStack() {
  return (
    <Stack.Navigator
      screenOptions={{
        headerShown: false,
      }}
    >
      <Stack.Screen name="Profile" component={ProfileScreen} />
      <Stack.Screen 
        name="EditProfile" 
        component={EditProfileScreen}
        options={{
          headerShown: true,
          title: 'Editar Perfil',
        }}
      />
    </Stack.Navigator>
  )
}
```

---

## 📝 Parte 7: Tab Navigator (10 min)

### 7.1 TabNavigator con Íconos

```typescript
// src/navigation/TabNavigator.tsx
import React from 'react'
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs'
import { Ionicons } from '@expo/vector-icons'
import type { TabParamList } from './types'
import { HomeStack } from './stacks/HomeStack'
import { SearchScreen } from '../screens/search/SearchScreen'
import { ProfileStack } from './stacks/ProfileStack'
import { getUnreadNotificationsCount } from '../data/mockData'

/**
 * TabNavigator - Navegación principal con tabs
 * 
 * ¿Qué hace?
 * Define los 3 tabs principales: Home, Search, Profile
 * 
 * ¿Cómo?
 * - Íconos personalizados con Ionicons
 * - Badge en Home para notificaciones
 * - Stack anidado en Home y Profile
 */

const Tab = createBottomTabNavigator<TabParamList>()

export function TabNavigator() {
  const unreadCount = getUnreadNotificationsCount()
  
  return (
    <Tab.Navigator
      screenOptions={({ route }) => ({
        tabBarIcon: ({ focused, color, size }) => {
          let iconName: keyof typeof Ionicons.glyphMap
          
          if (route.name === 'HomeTab') {
            iconName = focused ? 'home' : 'home-outline'
          } else if (route.name === 'SearchTab') {
            iconName = focused ? 'search' : 'search-outline'
          } else if (route.name === 'ProfileTab') {
            iconName = focused ? 'person' : 'person-outline'
          } else {
            iconName = 'help-outline'
          }
          
          return <Ionicons name={iconName} size={size} color={color} />
        },
        tabBarActiveTintColor: '#3b82f6',
        tabBarInactiveTintColor: '#9ca3af',
        tabBarStyle: {
          height: 60,
          paddingBottom: 8,
          paddingTop: 8,
          borderTopWidth: 1,
          borderTopColor: '#e5e7eb',
        },
        tabBarLabelStyle: {
          fontSize: 12,
          fontWeight: '600',
        },
        headerStyle: {
          backgroundColor: '#3b82f6',
        },
        headerTintColor: '#fff',
        headerTitleStyle: {
          fontWeight: 'bold',
        },
      })}
    >
      <Tab.Screen
        name="HomeTab"
        component={HomeStack}
        options={{
          title: 'Inicio',
          tabBarBadge: unreadCount > 0 ? unreadCount : undefined,
          tabBarBadgeStyle: {
            backgroundColor: '#ef4444',
            color: '#fff',
            fontSize: 10,
          },
        }}
      />
      
      <Tab.Screen
        name="SearchTab"
        component={SearchScreen}
        options={{
          title: 'Buscar',
        }}
      />
      
      <Tab.Screen
        name="ProfileTab"
        component={ProfileStack}
        options={{
          title: 'Perfil',
        }}
      />
    </Tab.Navigator>
  )
}
```

---

## 📝 Parte 8: App Principal (5 min)

### 8.1 App.tsx

```typescript
// App.tsx
import React from 'react'
import { NavigationContainer } from '@react-navigation/native'
import { TabNavigator } from './src/navigation/TabNavigator'

export default function App() {
  return (
    <NavigationContainer>
      <TabNavigator />
    </NavigationContainer>
  )
}
```

---

## ✅ Checklist de Verificación

### Funcionalidad:
- [ ] Los 3 tabs se muestran correctamente
- [ ] Íconos cambian entre filled/outline según estado
- [ ] Badge de notificaciones aparece en Home tab
- [ ] Navegación interna en Home funciona (Home → Notifications)
- [ ] Navegación interna en Profile funciona (Profile → Edit)
- [ ] Búsqueda filtra resultados en tiempo real

### Navegación:
- [ ] Los tabs mantienen su estado al cambiar
- [ ] Stack anidado funciona dentro de cada tab
- [ ] Botón "atrás" funciona en pantallas internas
- [ ] No hay conflictos entre Tab y Stack headers

### UI/UX:
- [ ] Los íconos son claros y apropiados
- [ ] El badge es visible pero no intrusivo
- [ ] Los colores activo/inactivo son distinguibles
- [ ] La barra de tabs tiene buen tamaño (60px)
- [ ] Las transiciones son suaves

### TypeScript:
- [ ] Tipos correctos para cada navigator
- [ ] No hay errores de compilación
- [ ] Autocompletado funciona en navigation

---

## 🎨 Mejoras Opcionales

### Nivel 1:
- [ ] Agregar más notificaciones
- [ ] Cambiar colores del tema
- [ ] Agregar más opciones en Profile

### Nivel 2:
- [ ] Implementar búsqueda con debounce
- [ ] Marcar notificaciones como leídas
- [ ] Actualizar badge dinámicamente

### Nivel 3:
- [ ] Persistir estado con AsyncStorage
- [ ] Agregar animaciones personalizadas
- [ ] Implementar pull-to-refresh

---

## 🐛 Problemas Comunes

### 1. Badge no aparece
```typescript
// ✅ Solución: Asegúrate de que sea > 0
tabBarBadge: unreadCount > 0 ? unreadCount : undefined
```

### 2. Headers duplicados
```typescript
// ✅ En el Stack anidado:
screenOptions={{ headerShown: false }}
```

### 3. Íconos no se muestran
```bash
# Asegúrate de tener @expo/vector-icons instalado
pnpm add @expo/vector-icons
```

---

## 🎯 Criterios de Evaluación

| Criterio | Puntos |
|----------|--------|
| Tabs funcionan correctamente | 30 |
| Íconos personalizados | 20 |
| Badge de notificaciones | 15 |
| Navegación anidada | 25 |
| UI/UX pulida | 10 |
| **TOTAL** | **100** |

---

## 🔜 Próxima Práctica

**Práctica 3:** Drawer Navigator - Settings App

---

_Práctica 2: Tab Navigator - Dashboard App_  
_Bootcamp React Native 2025 - Semana 2_
