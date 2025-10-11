# Práctica 1: Stack Navigator - Blog App

> **Navegación básica con Stack Navigator**  
> Crea una aplicación de blog con lista de posts, detalle y creación.

**Duración:** 45 minutos  
**Modalidad:** Práctica guiada en clase  
**Dificultad:** ⭐⭐ Intermedio

---

## 🎯 Objetivos

Al finalizar esta práctica, habrás:

- ✅ Implementado Stack Navigator desde cero
- ✅ Creado 3 pantallas conectadas
- ✅ Pasado parámetros entre pantallas
- ✅ Personalizado headers
- ✅ Manejado navegación con TypeScript

---

## 📋 Requisitos Previos

- ✅ Haber completado la teoría de Stack Navigator
- ✅ Tener proyecto Expo funcionando
- ✅ React Navigation instalado

---

## 🏗️ Estructura del Proyecto

```
blog-app/
├── App.tsx
├── src/
│   ├── navigation/
│   │   ├── types.ts
│   │   └── BlogNavigator.tsx
│   ├── screens/
│   │   ├── PostListScreen.tsx
│   │   ├── PostDetailScreen.tsx
│   │   └── CreatePostScreen.tsx
│   └── data/
│       └── posts.ts
└── package.json
```

---

## 📝 Parte 1: Configuración Inicial (5 min)

### 1.1 Crear estructura de carpetas

```bash
cd blog-app
mkdir -p src/navigation src/screens src/data
```

### 1.2 Datos de ejemplo

```typescript
// src/data/posts.ts

/**
 * Datos de ejemplo para el blog
 *
 * ¿Qué es?
 * Array de posts hardcoded para la práctica
 *
 * ¿Para qué?
 * Simular datos de una API sin necesitar backend
 */
export interface Post {
  id: number
  title: string
  author: string
  date: string
  excerpt: string
  content: string
  category: string
}

export const POSTS: Post[] = [
  {
    id: 1,
    title: 'Introducción a React Native',
    author: 'Juan Pérez',
    date: '2025-10-01',
    excerpt: 'Aprende los fundamentos de React Native y crea tu primera app.',
    content:
      'React Native es un framework increíble que permite crear aplicaciones móviles nativas usando React. En este artículo exploraremos los conceptos básicos...',
    category: 'Tutorial',
  },
  {
    id: 2,
    title: 'Navegación con React Navigation',
    author: 'María García',
    date: '2025-10-05',
    excerpt: 'Domina la navegación entre pantallas en React Native.',
    content:
      'La navegación es fundamental en cualquier app móvil. React Navigation proporciona herramientas poderosas para gestionar flujos de navegación complejos...',
    category: 'Guía',
  },
  {
    id: 3,
    title: 'Estilos con NativeWind',
    author: 'Carlos López',
    date: '2025-10-08',
    excerpt: 'Utiliza TailwindCSS en React Native con NativeWind.',
    content:
      'NativeWind trae la magia de TailwindCSS a React Native. Descubre cómo estilizar tus componentes de forma rápida y consistente...',
    category: 'Tutorial',
  },
  {
    id: 4,
    title: 'TypeScript en React Native',
    author: 'Ana Martínez',
    date: '2025-10-10',
    excerpt: 'Mejora tu código con TypeScript y type-safety.',
    content:
      'TypeScript añade tipos estáticos a JavaScript, lo que hace tu código más robusto y fácil de mantener. Aprende cómo integrarlo en React Native...',
    category: 'Avanzado',
  },
  {
    id: 5,
    title: 'Testing en React Native',
    author: 'Pedro Sánchez',
    date: '2025-10-11',
    excerpt: 'Escribe tests para tus componentes y pantallas.',
    content:
      'Los tests son esenciales para mantener la calidad del código. Exploramos Jest y React Native Testing Library para testear efectivamente...',
    category: 'Testing',
  },
]

export const getPostById = (id: number): Post | undefined => {
  return POSTS.find((post) => post.id === id)
}

export const getPostsByCategory = (category: string): Post[] => {
  return POSTS.filter((post) => post.category === category)
}
```

---

## 📝 Parte 2: Tipos TypeScript (5 min)

### 2.1 Definir tipos de navegación

```typescript
// src/navigation/types.ts

/**
 * Tipos de navegación del Blog
 *
 * ¿Qué es?
 * Define los parámetros que cada pantalla puede recibir
 *
 * ¿Para qué?
 * Type-safety: TypeScript valida que pases los parámetros correctos
 *
 * ¿Cómo?
 * - undefined: La pantalla no recibe parámetros
 * - { key: type }: La pantalla recibe parámetros específicos
 */
export type BlogStackParamList = {
  PostList: undefined
  PostDetail: {
    postId: number
  }
  CreatePost: undefined
}
```

---

## 📝 Parte 3: Pantalla de Lista (10 min)

### 3.1 PostListScreen

```typescript
// src/screens/PostListScreen.tsx
import React from 'react'
import { View, Text, FlatList, TouchableOpacity } from 'react-native'
import type { NativeStackScreenProps } from '@react-navigation/native-stack'
import type { BlogStackParamList } from '../navigation/types'
import { POSTS } from '../data/posts'

/**
 * PostListScreen - Lista de posts del blog
 *
 * ¿Qué hace?
 * Muestra todos los posts en una lista scrolleable
 *
 * ¿Para qué?
 * Pantalla principal donde el usuario ve todos los artículos disponibles
 *
 * ¿Cómo funciona?
 * 1. Renderiza los posts con FlatList
 * 2. Al tocar un post, navega a PostDetail pasando el ID
 * 3. Botón para crear nuevo post
 */

type Props = NativeStackScreenProps<BlogStackParamList, 'PostList'>

export function PostListScreen({ navigation }: Props) {
  const handlePostPress = (postId: number) => {
    // Navegar a detalle pasando el ID del post
    navigation.navigate('PostDetail', { postId })
  }

  const handleCreatePress = () => {
    // Navegar a pantalla de creación
    navigation.navigate('CreatePost')
  }

  const renderPost = ({ item }: { item: (typeof POSTS)[0] }) => (
    <TouchableOpacity
      onPress={() => handlePostPress(item.id)}
      className="bg-white p-4 mb-3 rounded-lg border border-gray-200 shadow-sm"
    >
      {/* Badge de categoría */}
      <View className="flex-row items-center mb-2">
        <View className="bg-blue-100 px-3 py-1 rounded-full">
          <Text className="text-blue-600 text-xs font-semibold">
            {item.category}
          </Text>
        </View>
      </View>

      {/* Título */}
      <Text className="text-lg font-bold text-gray-900 mb-2">{item.title}</Text>

      {/* Excerpt */}
      <Text className="text-gray-600 mb-3" numberOfLines={2}>
        {item.excerpt}
      </Text>

      {/* Metadata */}
      <View className="flex-row items-center justify-between">
        <Text className="text-sm text-gray-500">{item.author}</Text>
        <Text className="text-sm text-gray-400">{item.date}</Text>
      </View>
    </TouchableOpacity>
  )

  return (
    <View className="flex-1 bg-gray-50">
      <FlatList
        data={POSTS}
        renderItem={renderPost}
        keyExtractor={(item) => item.id.toString()}
        contentContainerClassName="p-4"
        ListHeaderComponent={
          <View className="mb-4">
            <Text className="text-2xl font-bold text-gray-900 mb-1">
              📝 Mi Blog
            </Text>
            <Text className="text-gray-600">
              {POSTS.length} artículos publicados
            </Text>
          </View>
        }
      />

      {/* Botón flotante para crear post */}
      <TouchableOpacity
        onPress={handleCreatePress}
        className="absolute bottom-6 right-6 bg-blue-500 w-14 h-14 rounded-full items-center justify-center shadow-lg"
      >
        <Text className="text-white text-2xl">+</Text>
      </TouchableOpacity>
    </View>
  )
}
```

---

## 📝 Parte 4: Pantalla de Detalle (10 min)

### 4.1 PostDetailScreen

```typescript
// src/screens/PostDetailScreen.tsx
import React from 'react'
import { View, Text, ScrollView, TouchableOpacity } from 'react-native'
import type { NativeStackScreenProps } from '@react-navigation/native-stack'
import type { BlogStackParamList } from '../navigation/types'
import { getPostById } from '../data/posts'

/**
 * PostDetailScreen - Detalle completo de un post
 *
 * ¿Qué hace?
 * Muestra el contenido completo de un artículo
 *
 * ¿Para qué?
 * Permitir al usuario leer el artículo completo
 *
 * ¿Cómo funciona?
 * 1. Recibe postId como parámetro de navegación
 * 2. Busca el post en los datos
 * 3. Muestra título, autor, fecha y contenido completo
 */

type Props = NativeStackScreenProps<BlogStackParamList, 'PostDetail'>

export function PostDetailScreen({ route, navigation }: Props) {
  // Extraer el ID del post de los parámetros de navegación
  const { postId } = route.params

  // Buscar el post por ID
  const post = getPostById(postId)

  // Manejo de error: post no encontrado
  if (!post) {
    return (
      <View className="flex-1 justify-center items-center bg-white p-4">
        <Text className="text-xl font-bold text-gray-900 mb-2">
          ❌ Post no encontrado
        </Text>
        <Text className="text-gray-600 text-center mb-4">
          El artículo que buscas no existe o fue eliminado.
        </Text>
        <TouchableOpacity
          onPress={() => navigation.goBack()}
          className="bg-blue-500 px-6 py-3 rounded-lg"
        >
          <Text className="text-white font-semibold">Volver</Text>
        </TouchableOpacity>
      </View>
    )
  }

  return (
    <ScrollView className="flex-1 bg-white">
      <View className="p-4">
        {/* Header con categoría */}
        <View className="flex-row items-center mb-3">
          <View className="bg-blue-100 px-3 py-1 rounded-full">
            <Text className="text-blue-600 text-xs font-semibold">
              {post.category}
            </Text>
          </View>
        </View>

        {/* Título */}
        <Text className="text-3xl font-bold text-gray-900 mb-4">
          {post.title}
        </Text>

        {/* Metadata */}
        <View className="flex-row items-center justify-between mb-6 pb-4 border-b border-gray-200">
          <View>
            <Text className="text-sm text-gray-600">Por {post.author}</Text>
            <Text className="text-xs text-gray-400 mt-1">{post.date}</Text>
          </View>
        </View>

        {/* Contenido */}
        <Text className="text-base text-gray-700 leading-6">
          {post.content}
        </Text>

        {/* Acciones */}
        <View className="mt-8 pt-6 border-t border-gray-200">
          <Text className="text-lg font-bold text-gray-900 mb-3">
            ¿Te gustó este artículo?
          </Text>
          <View className="flex-row gap-3">
            <TouchableOpacity className="flex-1 bg-blue-500 py-3 rounded-lg items-center">
              <Text className="text-white font-semibold">👍 Me gusta</Text>
            </TouchableOpacity>
            <TouchableOpacity className="flex-1 bg-gray-200 py-3 rounded-lg items-center">
              <Text className="text-gray-700 font-semibold">🔖 Guardar</Text>
            </TouchableOpacity>
          </View>
        </View>

        {/* Botón volver */}
        <TouchableOpacity
          onPress={() => navigation.goBack()}
          className="mt-6 mb-4 py-3 border border-gray-300 rounded-lg items-center"
        >
          <Text className="text-gray-700 font-semibold">
            ← Volver a la lista
          </Text>
        </TouchableOpacity>
      </View>
    </ScrollView>
  )
}
```

---

## 📝 Parte 5: Pantalla de Creación (10 min)

### 5.1 CreatePostScreen

```typescript
// src/screens/CreatePostScreen.tsx
import React, { useState } from 'react'
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  ScrollView,
  Alert,
} from 'react-native'
import type { NativeStackScreenProps } from '@react-navigation/native-stack'
import type { BlogStackParamList } from '../navigation/types'

/**
 * CreatePostScreen - Formulario para crear nuevo post
 *
 * ¿Qué hace?
 * Permite al usuario crear un nuevo artículo de blog
 *
 * ¿Para qué?
 * Demostrar formularios y navegación después de crear
 *
 * ¿Cómo funciona?
 * 1. Captura título, autor y contenido
 * 2. Valida que no estén vacíos
 * 3. Simula creación (en práctica real guardaría en DB)
 * 4. Vuelve a la lista con mensaje de éxito
 */

type Props = NativeStackScreenProps<BlogStackParamList, 'CreatePost'>

export function CreatePostScreen({ navigation }: Props) {
  const [title, setTitle] = useState('')
  const [author, setAuthor] = useState('')
  const [content, setContent] = useState('')

  const handleSubmit = () => {
    // Validación simple
    if (!title.trim()) {
      Alert.alert('Error', 'El título es obligatorio')
      return
    }

    if (!author.trim()) {
      Alert.alert('Error', 'El autor es obligatorio')
      return
    }

    if (!content.trim()) {
      Alert.alert('Error', 'El contenido es obligatorio')
      return
    }

    // Simular creación exitosa
    Alert.alert('✅ Post creado', `"${title}" ha sido publicado exitosamente`, [
      {
        text: 'OK',
        onPress: () => {
          // Volver a la lista de posts
          navigation.navigate('PostList')
        },
      },
    ])
  }

  const handleCancel = () => {
    Alert.alert('Cancelar', '¿Descartar los cambios?', [
      { text: 'No', style: 'cancel' },
      {
        text: 'Sí, descartar',
        style: 'destructive',
        onPress: () => navigation.goBack(),
      },
    ])
  }

  return (
    <ScrollView className="flex-1 bg-white">
      <View className="p-4">
        {/* Header */}
        <View className="mb-6">
          <Text className="text-2xl font-bold text-gray-900 mb-2">
            ✍️ Nuevo Artículo
          </Text>
          <Text className="text-gray-600">
            Comparte tus conocimientos con la comunidad
          </Text>
        </View>

        {/* Formulario */}
        <View className="gap-4">
          {/* Título */}
          <View>
            <Text className="text-sm font-semibold text-gray-700 mb-2">
              Título *
            </Text>
            <TextInput
              value={title}
              onChangeText={setTitle}
              placeholder="Ej: Introducción a React Native"
              className="border border-gray-300 rounded-lg px-4 py-3 text-base"
              placeholderTextColor="#9ca3af"
            />
          </View>

          {/* Autor */}
          <View>
            <Text className="text-sm font-semibold text-gray-700 mb-2">
              Autor *
            </Text>
            <TextInput
              value={author}
              onChangeText={setAuthor}
              placeholder="Tu nombre"
              className="border border-gray-300 rounded-lg px-4 py-3 text-base"
              placeholderTextColor="#9ca3af"
            />
          </View>

          {/* Contenido */}
          <View>
            <Text className="text-sm font-semibold text-gray-700 mb-2">
              Contenido *
            </Text>
            <TextInput
              value={content}
              onChangeText={setContent}
              placeholder="Escribe el contenido de tu artículo..."
              multiline
              numberOfLines={8}
              textAlignVertical="top"
              className="border border-gray-300 rounded-lg px-4 py-3 text-base"
              placeholderTextColor="#9ca3af"
            />
          </View>
        </View>

        {/* Botones */}
        <View className="mt-6 gap-3">
          <TouchableOpacity
            onPress={handleSubmit}
            className="bg-blue-500 py-4 rounded-lg items-center"
          >
            <Text className="text-white font-bold text-base">
              Publicar Artículo
            </Text>
          </TouchableOpacity>

          <TouchableOpacity
            onPress={handleCancel}
            className="border border-gray-300 py-4 rounded-lg items-center"
          >
            <Text className="text-gray-700 font-semibold text-base">
              Cancelar
            </Text>
          </TouchableOpacity>
        </View>

        {/* Ayuda */}
        <View className="mt-6 p-4 bg-blue-50 rounded-lg">
          <Text className="text-sm text-blue-800">
            💡 <Text className="font-semibold">Tip:</Text> Escribe contenido
            claro y útil para tus lectores.
          </Text>
        </View>
      </View>
    </ScrollView>
  )
}
```

---

## 📝 Parte 6: Navegador (5 min)

### 6.1 BlogNavigator

```typescript
// src/navigation/BlogNavigator.tsx
import React from 'react'
import { createNativeStackNavigator } from '@react-navigation/native-stack'
import type { BlogStackParamList } from './types'
import { PostListScreen } from '../screens/PostListScreen'
import { PostDetailScreen } from '../screens/PostDetailScreen'
import { CreatePostScreen } from '../screens/CreatePostScreen'

/**
 * BlogNavigator - Stack Navigator del Blog
 *
 * ¿Qué hace?
 * Configura la navegación entre las 3 pantallas del blog
 *
 * ¿Para qué?
 * Gestionar el flujo de navegación: Lista → Detalle → Crear
 *
 * ¿Cómo?
 * Define las pantallas, sus nombres y opciones de header
 */

const Stack = createNativeStackNavigator<BlogStackParamList>()

export function BlogNavigator() {
  return (
    <Stack.Navigator
      initialRouteName="PostList"
      screenOptions={{
        headerStyle: {
          backgroundColor: '#3b82f6',
        },
        headerTintColor: '#fff',
        headerTitleStyle: {
          fontWeight: 'bold',
        },
        headerBackTitle: 'Atrás',
      }}
    >
      <Stack.Screen
        name="PostList"
        component={PostListScreen}
        options={{
          title: 'Blog',
          headerLargeTitle: true,
        }}
      />

      <Stack.Screen
        name="PostDetail"
        component={PostDetailScreen}
        options={{
          title: 'Artículo',
        }}
      />

      <Stack.Screen
        name="CreatePost"
        component={CreatePostScreen}
        options={{
          title: 'Nuevo Post',
          presentation: 'modal',
        }}
      />
    </Stack.Navigator>
  )
}
```

---

## 📝 Parte 7: App Principal (5 min)

### 7.1 App.tsx

```typescript
// App.tsx
import React from 'react'
import { NavigationContainer } from '@react-navigation/native'
import { BlogNavigator } from './src/navigation/BlogNavigator'

/**
 * App Principal
 *
 * ¿Qué hace?
 * Punto de entrada que configura la navegación
 *
 * ¿Para qué?
 * Envuelve la app con NavigationContainer para habilitar navegación
 */

export default function App() {
  return (
    <NavigationContainer>
      <BlogNavigator />
    </NavigationContainer>
  )
}
```

---

## ✅ Checklist de Verificación

Asegúrate de que tu app cumple con:

### Funcionalidad:

- [ ] La lista muestra 5 posts correctamente
- [ ] Al tocar un post, navega al detalle
- [ ] El detalle muestra toda la información del post
- [ ] El botón "+" abre la pantalla de creación como modal
- [ ] El formulario valida campos obligatorios
- [ ] Después de crear, vuelve a la lista con confirmación

### Navegación:

- [ ] Botón "atrás" funciona en todas las pantallas
- [ ] Los parámetros se pasan correctamente
- [ ] El modal se cierra correctamente
- [ ] No hay errores de navegación en consola

### UI/UX:

- [ ] Los estilos son consistentes
- [ ] Los colores siguen el tema (azul)
- [ ] El texto es legible
- [ ] Los botones responden al toque
- [ ] Las animaciones son suaves

### TypeScript:

- [ ] No hay errores de tipos
- [ ] Las props están correctamente tipadas
- [ ] Los parámetros de navegación son type-safe

---

## 🎨 Mejoras Opcionales

Si terminas antes del tiempo, intenta:

### Nivel 1 (Fácil):

- [ ] Agregar más posts a la lista
- [ ] Cambiar los colores del tema
- [ ] Agregar más campos al formulario (categoría, excerpt)

### Nivel 2 (Medio):

- [ ] Filtrar posts por categoría
- [ ] Buscador de posts por título
- [ ] Contador de "likes" con estado local

### Nivel 3 (Avanzado):

- [ ] Persistir posts con AsyncStorage
- [ ] Editar posts existentes
- [ ] Eliminar posts con confirmación
- [ ] Compartir posts (share API)

---

## 🐛 Problemas Comunes y Soluciones

### 1. Error: "Cannot find module"

**Causa:** Ruta de importación incorrecta

**Solución:**

```typescript
// ❌ Mal
import { Post } from 'data/posts'

// ✅ Bien
import { Post } from '../data/posts'
```

### 2. Error de TypeScript en parámetros

**Causa:** Tipo incorrecto en navigate()

**Solución:**

```typescript
// ❌ Mal
navigation.navigate('PostDetail', { id: 1 })

// ✅ Bien (según nuestros tipos)
navigation.navigate('PostDetail', { postId: 1 })
```

### 3. Modal no se cierra

**Causa:** No usar navigation.goBack()

**Solución:**

```typescript
// Después de crear el post
navigation.navigate('PostList') // o navigation.goBack()
```

### 4. Post no encontrado

**Causa:** ID incorrecto o conversión de tipos

**Solución:**

```typescript
// Asegurarse de pasar number, no string
const postId = Number(route.params.postId)
```

---

## 📖 Conceptos Clave Aplicados

### 1. Stack Navigator

- Navegación tipo pila (LIFO)
- Cada pantalla se apila sobre la anterior
- Botón "atrás" automático

### 2. Parámetros de Navegación

- Pasar datos entre pantallas
- Type-safe con TypeScript
- Acceso vía `route.params`

### 3. Presentación Modal

- `presentation: 'modal'` en opciones
- Se presenta desde abajo
- Botón "cerrar" en lugar de "atrás"

### 4. TypeScript Integration

- `NativeStackScreenProps<ParamList, 'ScreenName'>`
- Autocompletado en navigation.navigate()
- Validación de parámetros en compile-time

---

## 🎯 Criterios de Evaluación

| Criterio          | Puntos  | Descripción                    |
| ----------------- | ------- | ------------------------------ |
| **Funcionalidad** | 40      | App funciona sin errores       |
| **Navegación**    | 30      | Flujo correcto entre pantallas |
| **UI/UX**         | 20      | Interfaz clara y usable        |
| **TypeScript**    | 10      | Tipos correctos, sin `any`     |
| **TOTAL**         | **100** |                                |

---

## 📚 Recursos Adicionales

- [Stack Navigator Docs](https://reactnavigation.org/docs/native-stack-navigator)
- [Passing params to routes](https://reactnavigation.org/docs/params)
- [Configuring the header bar](https://reactnavigation.org/docs/headers)

---

## 🔜 Próxima Práctica

**Práctica 2:** Tab Navigator - Dashboard App

En la siguiente práctica implementarás:

- Bottom Tab Navigator
- Iconos personalizados
- Badges de notificaciones
- Múltiples tabs con Stack anidado

---

_Práctica 1: Stack Navigator - Blog App_  
_Bootcamp React Native 2025 - Semana 2_
