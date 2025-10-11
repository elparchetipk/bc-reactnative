# Práctica 3: Drawer Navigator - Settings App

> **Menú lateral deslizable con Drawer Navigator**  
> Crea una app con menú lateral personalizado y navegación completa.

**Duración:** 30 minutos  
**Modalidad:** Práctica guiada en clase  
**Dificultad:** ⭐⭐⭐ Intermedio-Avanzado

---

## 🎯 Objetivos

Al finalizar esta práctica, habrás:

- ✅ Implementado Drawer Navigator
- ✅ Creado Custom Drawer Content
- ✅ Integrado Drawer + Stack Navigator
- ✅ Personalizado estilos del Drawer
- ✅ Agregado avatar y opciones de logout

---

## 📋 Requisitos Previos

- ✅ Haber completado las prácticas 1 y 2
- ✅ Entender navegación anidada
- ✅ Configurar react-native-reanimated (babel.config.js)

---

## ⚙️ Configuración Inicial

### Instalar dependencias

```bash
pnpm add react-native-gesture-handler react-native-reanimated
```

### Configurar Babel

```javascript
// babel.config.js
module.exports = {
  presets: ['babel-preset-expo'],
  plugins: [
    'nativewind/babel',
    'react-native-reanimated/plugin', // ← AL FINAL
  ],
}
```

**Importante:** Reinicia el servidor con caché limpio:

```bash
pnpm start --clear
```

---

## 🏗️ Estructura del Proyecto

```
settings-app/
├── App.tsx
├── src/
│   ├── navigation/
│   │   ├── types.ts
│   │   ├── DrawerNavigator.tsx
│   │   └── MainStack.tsx
│   ├── screens/
│   │   ├── HomeScreen.tsx
│   │   ├── SettingsScreen.tsx
│   │   ├── AboutScreen.tsx
│   │   └── HelpScreen.tsx
│   ├── components/
│   │   └── CustomDrawer.tsx
│   └── data/
│       └── userData.ts
└── package.json
```

---

## 📝 Parte 1: Datos de Usuario (3 min)

```typescript
// src/data/userData.ts

export interface User {
  name: string
  email: string
  avatar: string
  role: string
}

export const CURRENT_USER: User = {
  name: 'Carlos Rodríguez',
  email: 'carlos.rodriguez@example.com',
  avatar: 'https://i.pravatar.cc/150?img=12',
  role: 'Desarrollador',
}
```

---

## 📝 Parte 2: Tipos TypeScript (3 min)

```typescript
// src/navigation/types.ts

export type DrawerParamList = {
  MainStack: undefined
  Settings: undefined
  About: undefined
  Help: undefined
}

export type MainStackParamList = {
  Home: undefined
  Details: { itemId: number }
}
```

---

## 📝 Parte 3: Pantallas (8 min)

### 3.1 HomeScreen

```typescript
// src/screens/HomeScreen.tsx
import React from 'react'
import { View, Text, ScrollView, TouchableOpacity } from 'react-native'
import type { NativeStackScreenProps } from '@react-navigation/native-stack'
import type { MainStackParamList } from '../navigation/types'

type Props = NativeStackScreenProps<MainStackParamList, 'Home'>

export function HomeScreen({ navigation }: Props) {
  return (
    <ScrollView className="flex-1 bg-gray-50">
      <View className="p-4">
        <Text className="text-3xl font-bold text-gray-900 mb-2">
          🏠 Dashboard
        </Text>
        <Text className="text-gray-600 mb-6">
          Bienvenido a tu panel de control
        </Text>

        {/* Cards */}
        <View className="gap-3">
          {[1, 2, 3].map((item) => (
            <TouchableOpacity
              key={item}
              onPress={() => navigation.navigate('Details', { itemId: item })}
              className="bg-white p-5 rounded-xl shadow-sm"
            >
              <Text className="text-lg font-bold text-gray-900 mb-2">
                Item #{item}
              </Text>
              <Text className="text-gray-600">Toca para ver detalles</Text>
            </TouchableOpacity>
          ))}
        </View>

        {/* Info Card */}
        <View className="mt-6 bg-blue-50 p-4 rounded-xl">
          <Text className="text-blue-800 font-semibold mb-2">
            💡 Tip del día
          </Text>
          <Text className="text-blue-700">
            Desliza desde el borde izquierdo para abrir el menú lateral
          </Text>
        </View>
      </View>
    </ScrollView>
  )
}
```

### 3.2 SettingsScreen

```typescript
// src/screens/SettingsScreen.tsx
import React, { useState } from 'react'
import { View, Text, ScrollView, Switch, TouchableOpacity } from 'react-native'

export function SettingsScreen() {
  const [notifications, setNotifications] = useState(true)
  const [darkMode, setDarkMode] = useState(false)
  const [autoUpdate, setAutoUpdate] = useState(true)

  const SettingItem = ({ title, description, value, onValueChange }: any) => (
    <View className="bg-white p-4 mb-2 rounded-lg flex-row justify-between items-center">
      <View className="flex-1 mr-3">
        <Text className="font-semibold text-gray-900">{title}</Text>
        <Text className="text-sm text-gray-600">{description}</Text>
      </View>
      <Switch
        value={value}
        onValueChange={onValueChange}
        trackColor={{ false: '#d1d5db', true: '#60a5fa' }}
        thumbColor={value ? '#3b82f6' : '#f3f4f6'}
      />
    </View>
  )

  return (
    <ScrollView className="flex-1 bg-gray-50">
      <View className="p-4">
        <Text className="text-2xl font-bold text-gray-900 mb-4">
          ⚙️ Configuración
        </Text>

        {/* General */}
        <Text className="text-sm font-bold text-gray-600 mb-2 uppercase">
          General
        </Text>

        <SettingItem
          title="Notificaciones"
          description="Recibir alertas push"
          value={notifications}
          onValueChange={setNotifications}
        />

        <SettingItem
          title="Modo Oscuro"
          description="Usar tema oscuro"
          value={darkMode}
          onValueChange={setDarkMode}
        />

        <SettingItem
          title="Actualización Automática"
          description="Descargar actualizaciones automáticamente"
          value={autoUpdate}
          onValueChange={setAutoUpdate}
        />

        {/* Cuenta */}
        <Text className="text-sm font-bold text-gray-600 mt-6 mb-2 uppercase">
          Cuenta
        </Text>

        <TouchableOpacity className="bg-white p-4 mb-2 rounded-lg flex-row justify-between items-center">
          <View>
            <Text className="font-semibold text-gray-900">
              Cambiar Contraseña
            </Text>
          </View>
          <Text className="text-gray-400">→</Text>
        </TouchableOpacity>

        <TouchableOpacity className="bg-white p-4 mb-2 rounded-lg flex-row justify-between items-center">
          <View>
            <Text className="font-semibold text-gray-900">Privacidad</Text>
          </View>
          <Text className="text-gray-400">→</Text>
        </TouchableOpacity>

        {/* Peligro */}
        <Text className="text-sm font-bold text-red-600 mt-6 mb-2 uppercase">
          Zona de Peligro
        </Text>

        <TouchableOpacity className="bg-red-50 p-4 rounded-lg border border-red-200">
          <Text className="font-semibold text-red-600">Eliminar Cuenta</Text>
          <Text className="text-sm text-red-500 mt-1">
            Esta acción no se puede deshacer
          </Text>
        </TouchableOpacity>
      </View>
    </ScrollView>
  )
}
```

### 3.3 AboutScreen y HelpScreen (simples)

```typescript
// src/screens/AboutScreen.tsx
import React from 'react'
import { View, Text, ScrollView } from 'react-native'

export function AboutScreen() {
  return (
    <ScrollView className="flex-1 bg-white">
      <View className="p-4">
        <View className="items-center py-6">
          <Text className="text-6xl mb-4">📱</Text>
          <Text className="text-2xl font-bold text-gray-900 mb-2">
            Settings App
          </Text>
          <Text className="text-gray-600">Versión 1.0.0</Text>
        </View>

        <View className="mt-4">
          <Text className="font-semibold text-gray-900 mb-2">
            Acerca de esta app
          </Text>
          <Text className="text-gray-600 leading-6">
            Aplicación de ejemplo para demostrar el uso de Drawer Navigator con
            React Navigation. Incluye navegación anidada, drawer personalizado y
            mejores prácticas de desarrollo.
          </Text>
        </View>

        <View className="mt-6">
          <Text className="font-semibold text-gray-900 mb-2">
            Desarrollado con
          </Text>
          <View className="gap-2">
            {[
              'React Native 0.74+',
              'Expo SDK 51+',
              'React Navigation 6',
              'NativeWind',
              'TypeScript',
            ].map((tech, i) => (
              <View key={i} className="flex-row items-center gap-2">
                <Text className="text-blue-500">•</Text>
                <Text className="text-gray-700">{tech}</Text>
              </View>
            ))}
          </View>
        </View>
      </View>
    </ScrollView>
  )
}

// src/screens/HelpScreen.tsx
import React from 'react'
import { View, Text, ScrollView, TouchableOpacity } from 'react-native'

export function HelpScreen() {
  const faqs = [
    {
      question: '¿Cómo abro el menú?',
      answer: 'Desliza desde el borde izquierdo o toca el ícono de menú.',
    },
    {
      question: '¿Cómo cambio la configuración?',
      answer: 'Ve a la sección Configuración en el menú lateral.',
    },
    {
      question: '¿Puedo personalizar el tema?',
      answer: 'Sí, activa el modo oscuro en Configuración.',
    },
  ]

  return (
    <ScrollView className="flex-1 bg-gray-50">
      <View className="p-4">
        <Text className="text-2xl font-bold text-gray-900 mb-2">❓ Ayuda</Text>
        <Text className="text-gray-600 mb-6">Preguntas frecuentes</Text>

        {faqs.map((faq, index) => (
          <View key={index} className="bg-white p-4 rounded-lg mb-3">
            <Text className="font-bold text-gray-900 mb-2">{faq.question}</Text>
            <Text className="text-gray-600">{faq.answer}</Text>
          </View>
        ))}

        <TouchableOpacity className="bg-blue-500 p-4 rounded-lg items-center mt-4">
          <Text className="text-white font-semibold">Contactar Soporte</Text>
        </TouchableOpacity>
      </View>
    </ScrollView>
  )
}
```

---

## 📝 Parte 4: Custom Drawer (8 min)

```typescript
// src/components/CustomDrawer.tsx
import React from 'react'
import { View, Text, Image, TouchableOpacity, Alert } from 'react-native'
import {
  DrawerContentScrollView,
  DrawerItemList,
  DrawerItem,
} from '@react-navigation/drawer'
import { Ionicons } from '@expo/vector-icons'
import { CURRENT_USER } from '../data/userData'

/**
 * CustomDrawer - Contenido personalizado del drawer
 *
 * ¿Qué hace?
 * Muestra header con perfil, items del drawer y opciones adicionales
 *
 * ¿Para qué?
 * Personalizar completamente la apariencia y funcionalidad del drawer
 */

export function CustomDrawer(props: any) {
  const handleLogout = () => {
    Alert.alert('Cerrar Sesión', '¿Estás seguro de que quieres salir?', [
      { text: 'Cancelar', style: 'cancel' },
      {
        text: 'Salir',
        style: 'destructive',
        onPress: () => {
          console.log('Logout')
          // Aquí iría la lógica de logout real
        },
      },
    ])
  }

  return (
    <View className="flex-1">
      <DrawerContentScrollView {...props}>
        {/* Header con perfil */}
        <View className="px-4 py-6 bg-blue-500">
          <View className="flex-row items-center gap-3">
            <Image
              source={{ uri: CURRENT_USER.avatar }}
              className="w-16 h-16 rounded-full border-2 border-white"
            />
            <View className="flex-1">
              <Text className="text-white font-bold text-lg">
                {CURRENT_USER.name}
              </Text>
              <Text className="text-blue-100 text-sm">
                {CURRENT_USER.email}
              </Text>
              <View className="bg-blue-600 px-2 py-1 rounded mt-1 self-start">
                <Text className="text-white text-xs font-semibold">
                  {CURRENT_USER.role}
                </Text>
              </View>
            </View>
          </View>
        </View>

        {/* Separador */}
        <View className="h-px bg-gray-200 my-2" />

        {/* Items del drawer (generados automáticamente) */}
        <DrawerItemList {...props} />

        {/* Separador */}
        <View className="h-px bg-gray-200 my-2" />

        {/* Items personalizados adicionales */}
        <DrawerItem
          label="Favoritos"
          icon={({ color, size }) => (
            <Ionicons name="star-outline" size={size} color={color} />
          )}
          onPress={() => console.log('Favoritos')}
          labelStyle={{ color: '#374151' }}
        />

        <DrawerItem
          label="Historial"
          icon={({ color, size }) => (
            <Ionicons name="time-outline" size={size} color={color} />
          )}
          onPress={() => console.log('Historial')}
          labelStyle={{ color: '#374151' }}
        />

        <DrawerItem
          label="Compartir App"
          icon={({ color, size }) => (
            <Ionicons name="share-social-outline" size={size} color={color} />
          )}
          onPress={() => console.log('Compartir')}
          labelStyle={{ color: '#374151' }}
        />
      </DrawerContentScrollView>

      {/* Footer con Logout */}
      <View className="border-t border-gray-200 p-4">
        <TouchableOpacity
          onPress={handleLogout}
          className="flex-row items-center gap-3 p-3 bg-red-50 rounded-lg"
        >
          <Ionicons name="log-out-outline" size={24} color="#ef4444" />
          <Text className="text-red-600 font-semibold">Cerrar Sesión</Text>
        </TouchableOpacity>

        <Text className="text-center text-xs text-gray-400 mt-3">
          Versión 1.0.0
        </Text>
      </View>
    </View>
  )
}
```

---

## 📝 Parte 5: Navegadores (5 min)

### 5.1 MainStack

```typescript
// src/navigation/MainStack.tsx
import React from 'react'
import { createNativeStackNavigator } from '@react-navigation/native-stack'
import type { MainStackParamList } from './types'
import { HomeScreen } from '../screens/HomeScreen'

const Stack = createNativeStackNavigator<MainStackParamList>()

export function MainStack() {
  return (
    <Stack.Navigator
      screenOptions={{
        headerShown: false, // El Drawer ya tiene header
      }}
    >
      <Stack.Screen name="Home" component={HomeScreen} />
    </Stack.Navigator>
  )
}
```

### 5.2 DrawerNavigator

```typescript
// src/navigation/DrawerNavigator.tsx
import React from 'react'
import { createDrawerNavigator } from '@react-navigation/drawer'
import { Ionicons } from '@expo/vector-icons'
import type { DrawerParamList } from './types'
import { MainStack } from './MainStack'
import { SettingsScreen } from '../screens/SettingsScreen'
import { AboutScreen } from '../screens/AboutScreen'
import { HelpScreen } from '../screens/HelpScreen'
import { CustomDrawer } from '../components/CustomDrawer'

/**
 * DrawerNavigator - Navegador con menú lateral
 *
 * ¿Qué hace?
 * Define las pantallas accesibles desde el drawer
 *
 * ¿Cómo?
 * - Custom drawer content con perfil
 * - Íconos personalizados
 * - Estilos consistentes
 */

const Drawer = createDrawerNavigator<DrawerParamList>()

export function DrawerNavigator() {
  return (
    <Drawer.Navigator
      drawerContent={(props) => <CustomDrawer {...props} />}
      screenOptions={{
        drawerActiveTintColor: '#3b82f6',
        drawerInactiveTintColor: '#6b7280',
        drawerLabelStyle: {
          fontSize: 16,
          fontWeight: '500',
        },
        drawerItemStyle: {
          marginVertical: 2,
          borderRadius: 8,
        },
        headerStyle: {
          backgroundColor: '#3b82f6',
        },
        headerTintColor: '#fff',
        headerTitleStyle: {
          fontWeight: 'bold',
        },
      }}
    >
      <Drawer.Screen
        name="MainStack"
        component={MainStack}
        options={{
          title: 'Inicio',
          drawerIcon: ({ color, size }) => (
            <Ionicons name="home" size={size} color={color} />
          ),
        }}
      />

      <Drawer.Screen
        name="Settings"
        component={SettingsScreen}
        options={{
          title: 'Configuración',
          drawerIcon: ({ color, size }) => (
            <Ionicons name="settings" size={size} color={color} />
          ),
        }}
      />

      <Drawer.Screen
        name="About"
        component={AboutScreen}
        options={{
          title: 'Acerca de',
          drawerIcon: ({ color, size }) => (
            <Ionicons name="information-circle" size={size} color={color} />
          ),
        }}
      />

      <Drawer.Screen
        name="Help"
        component={HelpScreen}
        options={{
          title: 'Ayuda',
          drawerIcon: ({ color, size }) => (
            <Ionicons name="help-circle" size={size} color={color} />
          ),
        }}
      />
    </Drawer.Navigator>
  )
}
```

---

## 📝 Parte 6: App Principal (3 min)

```typescript
// App.tsx
import React from 'react'
import { NavigationContainer } from '@react-navigation/native'
import { DrawerNavigator } from './src/navigation/DrawerNavigator'

export default function App() {
  return (
    <NavigationContainer>
      <DrawerNavigator />
    </NavigationContainer>
  )
}
```

---

## ✅ Checklist de Verificación

### Funcionalidad:

- [ ] El drawer se abre deslizando desde la izquierda
- [ ] El ícono de menú (hamburguesa) abre el drawer
- [ ] Custom drawer muestra avatar y perfil
- [ ] Todas las pantallas son accesibles desde el drawer
- [ ] Logout muestra confirmación

### Navegación:

- [ ] El drawer se cierra al seleccionar un item
- [ ] El item activo se destaca visualmente
- [ ] Stack anidado funciona dentro del drawer

### UI/UX:

- [ ] Los íconos son apropiados
- [ ] El perfil se ve bien en el header
- [ ] Los colores son consistentes
- [ ] El footer con logout está fijo abajo

### TypeScript:

- [ ] No hay errores de tipos
- [ ] Props tipadas correctamente

---

## 🎨 Mejoras Opcionales

### Nivel 1:

- [ ] Cambiar el avatar
- [ ] Agregar más items al drawer
- [ ] Cambiar colores del tema

### Nivel 2:

- [ ] Drawer desde la derecha
- [ ] Animaciones personalizadas
- [ ] Modo oscuro

### Nivel 3:

- [ ] Drawer con width dinámico
- [ ] Gestos personalizados
- [ ] Múltiples perfiles

---

## 🐛 Problemas Comunes

### 1. Error de Reanimated

```bash
# Solución: Asegúrate de que el plugin esté al final
'react-native-reanimated/plugin'
```

### 2. Drawer no se abre

```bash
# Reinicia con caché limpio
pnpm start --clear
```

### 3. Header duplicado

```typescript
// En MainStack:
screenOptions={{ headerShown: false }}
```

---

## 🎯 Criterios de Evaluación

| Criterio                      | Puntos  |
| ----------------------------- | ------- |
| Drawer funciona correctamente | 30      |
| Custom drawer implementado    | 25      |
| Íconos y estilos              | 20      |
| Navegación anidada            | 15      |
| Logout y confirmación         | 10      |
| **TOTAL**                     | **100** |

---

## 🎉 ¡Felicidades!

Has completado las 3 prácticas de navegación:

- ✅ Stack Navigator
- ✅ Tab Navigator
- ✅ Drawer Navigator

Ahora estás listo para el **Proyecto Integrador** que combina los 3 tipos! 🚀

---

_Práctica 3: Drawer Navigator - Settings App_  
_Bootcamp React Native 2025 - Semana 2_
