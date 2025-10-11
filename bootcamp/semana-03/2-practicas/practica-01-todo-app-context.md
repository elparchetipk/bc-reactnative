# 📝 Práctica 1: Todo App con Context API

> **Objetivo:** Implementar una aplicación de tareas (Todo List) utilizando Context API para gestionar el estado global.

---

## 🎯 Objetivos de Aprendizaje

Al completar esta práctica, habrás:

- ✅ Creado un **Context** para gestionar tareas
- ✅ Implementado un **Provider** con lógica de negocio
- ✅ Consumido el contexto con **useContext**
- ✅ Creado un **custom hook** personalizado
- ✅ Separado componentes por responsabilidades
- ✅ Aplicado **mejores prácticas** de Context API

---

## 📚 Requisitos Previos

Antes de comenzar, asegúrate de haber:

- [ ] Leído el documento teórico [01-context-api-estado-global.md](../1-teoria/01-context-api-estado-global.md)
- [ ] Comprendido qué es Context API y para qué sirve
- [ ] Revisado los ejemplos de código del tema
- [ ] Configurado tu entorno de desarrollo

---

## 🏗️ Estructura del Proyecto

```
todo-context-app/
├── App.tsx
├── src/
│   ├── contexts/
│   │   └── TodoContext.tsx       # Context + Provider
│   ├── hooks/
│   │   └── useTodos.ts           # Custom hook
│   ├── types/
│   │   └── todo.ts               # Interfaces TypeScript
│   ├── components/
│   │   ├── TodoList.tsx          # Lista de tareas
│   │   ├── TodoItem.tsx          # Item individual
│   │   ├── TodoForm.tsx          # Formulario nueva tarea
│   │   └── TodoFilters.tsx       # Filtros (all/active/completed)
│   └── screens/
│       └── TodoScreen.tsx        # Pantalla principal
└── package.json
```

---

## 📝 Paso 1: Definir los Tipos

Crea el archivo `src/types/todo.ts`:

```typescript
/**
 * todo.ts
 * 
 * Tipos e interfaces para la aplicación de tareas
 */

export interface Todo {
  id: string
  title: string
  completed: boolean
  createdAt: Date
}

export type TodoFilter = 'all' | 'active' | 'completed'

export interface TodoContextType {
  // Estado
  todos: Todo[]
  filter: TodoFilter
  
  // Funciones para tareas
  addTodo: (title: string) => void
  toggleTodo: (id: string) => void
  deleteTodo: (id: string) => void
  editTodo: (id: string, title: string) => void
  
  // Funciones para filtros
  setFilter: (filter: TodoFilter) => void
  
  // Computed values
  activeTodosCount: number
  completedTodosCount: number
  filteredTodos: Todo[]
}
```

**💡 Explicación:**
- `Todo` - Interfaz de una tarea individual
- `TodoFilter` - Tipos de filtro posibles
- `TodoContextType` - Interfaz completa del contexto (lo que expondremos)

---

## 🎨 Paso 2: Crear el Context y Provider

Crea el archivo `src/contexts/TodoContext.tsx`:

```typescript
/**
 * TodoContext.tsx
 * 
 * Context API para gestión de tareas
 * 
 * ¿Qué hace?
 * Proporciona estado global y funciones para manejar tareas
 * 
 * ¿Para qué?
 * Evitar prop drilling y centralizar lógica de tareas
 * 
 * ¿Cómo funciona?
 * 1. Crea el contexto con createContext
 * 2. Provider mantiene el estado con useState
 * 3. Componentes consumen con useContext (o custom hook)
 */

import React, { createContext, useState, useMemo, ReactNode } from 'react'
import { Todo, TodoFilter, TodoContextType } from '../types/todo'

// 1. Crear el contexto
export const TodoContext = createContext<TodoContextType | undefined>(undefined)

// 2. Crear el Provider
interface TodoProviderProps {
  children: ReactNode
}

export function TodoProvider({ children }: TodoProviderProps) {
  // Estado local del Provider
  const [todos, setTodos] = useState<Todo[]>([])
  const [filter, setFilter] = useState<TodoFilter>('all')
  
  // Función: Agregar tarea
  const addTodo = (title: string) => {
    const newTodo: Todo = {
      id: Date.now().toString(), // En producción: usar uuid
      title: title.trim(),
      completed: false,
      createdAt: new Date(),
    }
    
    setTodos(prevTodos => [newTodo, ...prevTodos])
  }
  
  // Función: Toggle completado
  const toggleTodo = (id: string) => {
    setTodos(prevTodos =>
      prevTodos.map(todo =>
        todo.id === id
          ? { ...todo, completed: !todo.completed }
          : todo
      )
    )
  }
  
  // Función: Eliminar tarea
  const deleteTodo = (id: string) => {
    setTodos(prevTodos => prevTodos.filter(todo => todo.id !== id))
  }
  
  // Función: Editar tarea
  const editTodo = (id: string, title: string) => {
    setTodos(prevTodos =>
      prevTodos.map(todo =>
        todo.id === id
          ? { ...todo, title: title.trim() }
          : todo
      )
    )
  }
  
  // Computed values con useMemo para optimización
  const activeTodosCount = useMemo(() => {
    return todos.filter(todo => !todo.completed).length
  }, [todos])
  
  const completedTodosCount = useMemo(() => {
    return todos.filter(todo => todo.completed).length
  }, [todos])
  
  const filteredTodos = useMemo(() => {
    switch (filter) {
      case 'active':
        return todos.filter(todo => !todo.completed)
      case 'completed':
        return todos.filter(todo => todo.completed)
      case 'all':
      default:
        return todos
    }
  }, [todos, filter])
  
  // Valor del contexto (memoizado para performance)
  const value = useMemo<TodoContextType>(() => ({
    todos,
    filter,
    addTodo,
    toggleTodo,
    deleteTodo,
    editTodo,
    setFilter,
    activeTodosCount,
    completedTodosCount,
    filteredTodos,
  }), [todos, filter, activeTodosCount, completedTodosCount, filteredTodos])
  
  return (
    <TodoContext.Provider value={value}>
      {children}
    </TodoContext.Provider>
  )
}
```

**💡 Puntos clave:**
- ✅ Estado local con `useState`
- ✅ Funciones para manipular tareas
- ✅ `useMemo` para valores derivados (optimización)
- ✅ Valor del contexto memoizado
- ✅ TypeScript tipado completamente

---

## 🪝 Paso 3: Crear Custom Hook

Crea el archivo `src/hooks/useTodos.ts`:

```typescript
/**
 * useTodos.ts
 * 
 * Custom hook para consumir el TodoContext
 * 
 * ¿Para qué?
 * - API más limpia y fácil de usar
 * - Validación automática del contexto
 * - Mejor experiencia de desarrollo
 */

import { useContext } from 'react'
import { TodoContext } from '../contexts/TodoContext'

export function useTodos() {
  const context = useContext(TodoContext)
  
  if (context === undefined) {
    throw new Error('useTodos must be used within a TodoProvider')
  }
  
  return context
}
```

**💡 Ventajas del custom hook:**
- ✅ Simplifica el uso: `useTodos()` vs `useContext(TodoContext)`
- ✅ Valida que se use dentro del Provider
- ✅ TypeScript infiere tipos automáticamente

---

## 🧩 Paso 4: Componente TodoForm

Crea el archivo `src/components/TodoForm.tsx`:

```typescript
/**
 * TodoForm.tsx
 * 
 * Formulario para agregar nuevas tareas
 */

import React, { useState } from 'react'
import {
  View,
  TextInput,
  TouchableOpacity,
  Text,
  StyleSheet,
  Alert,
} from 'react-native'
import { useTodos } from '../hooks/useTodos'

export function TodoForm() {
  const [title, setTitle] = useState('')
  const { addTodo } = useTodos()
  
  const handleSubmit = () => {
    // Validación
    if (title.trim().length === 0) {
      Alert.alert('Error', 'El título no puede estar vacío')
      return
    }
    
    if (title.trim().length < 3) {
      Alert.alert('Error', 'El título debe tener al menos 3 caracteres')
      return
    }
    
    // Agregar tarea
    addTodo(title)
    
    // Limpiar input
    setTitle('')
  }
  
  return (
    <View style={styles.container}>
      <TextInput
        style={styles.input}
        value={title}
        onChangeText={setTitle}
        placeholder="¿Qué necesitas hacer?"
        placeholderTextColor="#999"
        returnKeyType="done"
        onSubmitEditing={handleSubmit}
      />
      <TouchableOpacity
        style={styles.button}
        onPress={handleSubmit}
        activeOpacity={0.7}
      >
        <Text style={styles.buttonText}>Agregar</Text>
      </TouchableOpacity>
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    padding: 16,
    backgroundColor: '#fff',
    borderBottomWidth: 1,
    borderBottomColor: '#e0e0e0',
  },
  input: {
    flex: 1,
    height: 44,
    borderWidth: 1,
    borderColor: '#ddd',
    borderRadius: 8,
    paddingHorizontal: 12,
    fontSize: 16,
    marginRight: 8,
  },
  button: {
    backgroundColor: '#007AFF',
    paddingHorizontal: 20,
    borderRadius: 8,
    justifyContent: 'center',
    alignItems: 'center',
  },
  buttonText: {
    color: '#fff',
    fontSize: 16,
    fontWeight: '600',
  },
})
```

**💡 Nota:** El componente usa `useTodos()` para acceder a `addTodo()` - ¡No necesita props!

---

## ✅ Paso 5: Componente TodoItem

Crea el archivo `src/components/TodoItem.tsx`:

```typescript
/**
 * TodoItem.tsx
 * 
 * Item individual de tarea con acciones
 */

import React, { useState } from 'react'
import {
  View,
  Text,
  TouchableOpacity,
  TextInput,
  StyleSheet,
  Alert,
} from 'react-native'
import { Todo } from '../types/todo'
import { useTodos } from '../hooks/useTodos'

interface TodoItemProps {
  todo: Todo
}

export function TodoItem({ todo }: TodoItemProps) {
  const { toggleTodo, deleteTodo, editTodo } = useTodos()
  const [isEditing, setIsEditing] = useState(false)
  const [editText, setEditText] = useState(todo.title)
  
  const handleToggle = () => {
    toggleTodo(todo.id)
  }
  
  const handleDelete = () => {
    Alert.alert(
      'Eliminar tarea',
      '¿Estás seguro de eliminar esta tarea?',
      [
        { text: 'Cancelar', style: 'cancel' },
        {
          text: 'Eliminar',
          style: 'destructive',
          onPress: () => deleteTodo(todo.id),
        },
      ]
    )
  }
  
  const handleEdit = () => {
    if (editText.trim().length === 0) {
      Alert.alert('Error', 'El título no puede estar vacío')
      return
    }
    
    editTodo(todo.id, editText)
    setIsEditing(false)
  }
  
  const handleCancelEdit = () => {
    setEditText(todo.title)
    setIsEditing(false)
  }
  
  return (
    <View style={styles.container}>
      {/* Checkbox */}
      <TouchableOpacity
        style={[styles.checkbox, todo.completed && styles.checkboxCompleted]}
        onPress={handleToggle}
        activeOpacity={0.7}
      >
        {todo.completed && <Text style={styles.checkmark}>✓</Text>}
      </TouchableOpacity>
      
      {/* Título */}
      <View style={styles.content}>
        {isEditing ? (
          <TextInput
            style={styles.input}
            value={editText}
            onChangeText={setEditText}
            autoFocus
            onSubmitEditing={handleEdit}
          />
        ) : (
          <TouchableOpacity
            onPress={() => setIsEditing(true)}
            onLongPress={handleDelete}
            activeOpacity={0.7}
          >
            <Text style={[styles.title, todo.completed && styles.titleCompleted]}>
              {todo.title}
            </Text>
            <Text style={styles.date}>
              {new Date(todo.createdAt).toLocaleDateString()}
            </Text>
          </TouchableOpacity>
        )}
      </View>
      
      {/* Botones de acción */}
      {isEditing ? (
        <View style={styles.actions}>
          <TouchableOpacity onPress={handleEdit} style={styles.actionButton}>
            <Text style={styles.saveButton}>💾</Text>
          </TouchableOpacity>
          <TouchableOpacity onPress={handleCancelEdit} style={styles.actionButton}>
            <Text style={styles.cancelButton}>✖️</Text>
          </TouchableOpacity>
        </View>
      ) : (
        <TouchableOpacity onPress={handleDelete} style={styles.deleteButton}>
          <Text style={styles.deleteText}>🗑️</Text>
        </TouchableOpacity>
      )}
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    alignItems: 'center',
    padding: 16,
    backgroundColor: '#fff',
    borderBottomWidth: 1,
    borderBottomColor: '#e0e0e0',
  },
  checkbox: {
    width: 24,
    height: 24,
    borderWidth: 2,
    borderColor: '#007AFF',
    borderRadius: 12,
    marginRight: 12,
    justifyContent: 'center',
    alignItems: 'center',
  },
  checkboxCompleted: {
    backgroundColor: '#007AFF',
  },
  checkmark: {
    color: '#fff',
    fontSize: 16,
    fontWeight: 'bold',
  },
  content: {
    flex: 1,
  },
  title: {
    fontSize: 16,
    color: '#333',
    marginBottom: 4,
  },
  titleCompleted: {
    textDecorationLine: 'line-through',
    color: '#999',
  },
  date: {
    fontSize: 12,
    color: '#999',
  },
  input: {
    fontSize: 16,
    color: '#333',
    borderBottomWidth: 1,
    borderBottomColor: '#007AFF',
    padding: 4,
  },
  actions: {
    flexDirection: 'row',
  },
  actionButton: {
    marginLeft: 8,
  },
  saveButton: {
    fontSize: 20,
  },
  cancelButton: {
    fontSize: 20,
  },
  deleteButton: {
    padding: 8,
  },
  deleteText: {
    fontSize: 20,
  },
})
```

**💡 Características:**
- ✅ Toggle completado con checkbox
- ✅ Edición inline al hacer tap
- ✅ Eliminar con long press + confirmación
- ✅ Fecha de creación

---

## 📋 Paso 6: Componente TodoList

Crea el archivo `src/components/TodoList.tsx`:

```typescript
/**
 * TodoList.tsx
 * 
 * Lista de tareas con FlatList
 */

import React from 'react'
import { FlatList, View, Text, StyleSheet } from 'react-native'
import { useTodos } from '../hooks/useTodos'
import { TodoItem } from './TodoItem'

export function TodoList() {
  const { filteredTodos } = useTodos()
  
  if (filteredTodos.length === 0) {
    return (
      <View style={styles.emptyContainer}>
        <Text style={styles.emptyText}>📝</Text>
        <Text style={styles.emptyTitle}>No hay tareas</Text>
        <Text style={styles.emptySubtitle}>
          Agrega una tarea para comenzar
        </Text>
      </View>
    )
  }
  
  return (
    <FlatList
      data={filteredTodos}
      keyExtractor={item => item.id}
      renderItem={({ item }) => <TodoItem todo={item} />}
      contentContainerStyle={styles.list}
    />
  )
}

const styles = StyleSheet.create({
  list: {
    flexGrow: 1,
  },
  emptyContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 40,
  },
  emptyText: {
    fontSize: 64,
    marginBottom: 16,
  },
  emptyTitle: {
    fontSize: 20,
    fontWeight: '600',
    color: '#333',
    marginBottom: 8,
  },
  emptySubtitle: {
    fontSize: 16,
    color: '#999',
    textAlign: 'center',
  },
})
```

---

## 🔍 Paso 7: Componente TodoFilters

Crea el archivo `src/components/TodoFilters.tsx`:

```typescript
/**
 * TodoFilters.tsx
 * 
 * Filtros y estadísticas
 */

import React from 'react'
import { View, Text, TouchableOpacity, StyleSheet } from 'react-native'
import { useTodos } from '../hooks/useTodos'
import { TodoFilter } from '../types/todo'

export function TodoFilters() {
  const {
    filter,
    setFilter,
    activeTodosCount,
    completedTodosCount,
  } = useTodos()
  
  const filters: { key: TodoFilter; label: string }[] = [
    { key: 'all', label: 'Todas' },
    { key: 'active', label: 'Activas' },
    { key: 'completed', label: 'Completadas' },
  ]
  
  return (
    <View style={styles.container}>
      {/* Estadísticas */}
      <View style={styles.stats}>
        <Text style={styles.statsText}>
          ✅ {completedTodosCount} completadas
        </Text>
        <Text style={styles.statsText}>
          ⏳ {activeTodosCount} pendientes
        </Text>
      </View>
      
      {/* Filtros */}
      <View style={styles.filters}>
        {filters.map(({ key, label }) => (
          <TouchableOpacity
            key={key}
            style={[
              styles.filterButton,
              filter === key && styles.filterButtonActive,
            ]}
            onPress={() => setFilter(key)}
            activeOpacity={0.7}
          >
            <Text
              style={[
                styles.filterText,
                filter === key && styles.filterTextActive,
              ]}
            >
              {label}
            </Text>
          </TouchableOpacity>
        ))}
      </View>
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: '#f5f5f5',
    borderBottomWidth: 1,
    borderBottomColor: '#e0e0e0',
  },
  stats: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    paddingVertical: 12,
    paddingHorizontal: 16,
  },
  statsText: {
    fontSize: 14,
    color: '#666',
    fontWeight: '500',
  },
  filters: {
    flexDirection: 'row',
    paddingHorizontal: 16,
    paddingBottom: 12,
  },
  filterButton: {
    flex: 1,
    paddingVertical: 8,
    paddingHorizontal: 16,
    marginHorizontal: 4,
    borderRadius: 8,
    backgroundColor: '#fff',
    alignItems: 'center',
  },
  filterButtonActive: {
    backgroundColor: '#007AFF',
  },
  filterText: {
    fontSize: 14,
    color: '#666',
    fontWeight: '600',
  },
  filterTextActive: {
    color: '#fff',
  },
})
```

---

## 📱 Paso 8: Pantalla Principal

Crea el archivo `src/screens/TodoScreen.tsx`:

```typescript
/**
 * TodoScreen.tsx
 * 
 * Pantalla principal que ensambla todos los componentes
 */

import React from 'react'
import { View, StyleSheet, SafeAreaView } from 'react-native'
import { TodoForm } from '../components/TodoForm'
import { TodoFilters } from '../components/TodoFilters'
import { TodoList } from '../components/TodoList'

export function TodoScreen() {
  return (
    <SafeAreaView style={styles.container}>
      <TodoForm />
      <TodoFilters />
      <TodoList />
    </SafeAreaView>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
})
```

**💡 Nota:** Esta pantalla es súper simple porque **todos los componentes obtienen sus datos del Context**, no necesitan props.

---

## 🚀 Paso 9: App Principal

Actualiza `App.tsx`:

```typescript
/**
 * App.tsx
 * 
 * Envuelve la app con el TodoProvider
 */

import React from 'react'
import { StatusBar } from 'react-native'
import { TodoProvider } from './src/contexts/TodoContext'
import { TodoScreen } from './src/screens/TodoScreen'

export default function App() {
  return (
    <TodoProvider>
      <StatusBar barStyle="dark-content" />
      <TodoScreen />
    </TodoProvider>
  )
}
```

**💡 Puntos clave:**
- ✅ `TodoProvider` envuelve toda la app
- ✅ Cualquier componente hijo puede usar `useTodos()`
- ✅ No hay prop drilling

---

## ✅ Paso 10: Probar la Aplicación

### Ejecutar el proyecto

```bash
# Si usas Expo
pnpm start

# En otra terminal (para iOS)
pnpm ios

# O para Android
pnpm android
```

### Funcionalidades a probar

- [ ] **Agregar tareas** con el formulario
- [ ] **Marcar como completadas** haciendo tap en el checkbox
- [ ] **Editar tareas** haciendo tap en el título
- [ ] **Eliminar tareas** con long press
- [ ] **Filtrar tareas** (Todas/Activas/Completadas)
- [ ] **Ver estadísticas** actualizadas en tiempo real

---

## 🎯 Desafíos Adicionales

Una vez completada la práctica básica, intenta:

### Desafío 1: Persistencia
Integra AsyncStorage para guardar las tareas:

```typescript
// En TodoContext.tsx
import AsyncStorage from '@react-native-async-storage/async-storage'

// Cargar al iniciar
useEffect(() => {
  async function loadTodos() {
    const stored = await AsyncStorage.getItem('todos')
    if (stored) {
      setTodos(JSON.parse(stored))
    }
  }
  loadTodos()
}, [])

// Guardar cuando cambien
useEffect(() => {
  AsyncStorage.setItem('todos', JSON.stringify(todos))
}, [todos])
```

### Desafío 2: Ordenamiento
Agrega opciones para ordenar tareas:
- Por fecha (más reciente primero)
- Por nombre (alfabético)
- Por estado (completadas al final)

### Desafío 3: Categorías
Agrega categorías/etiquetas a las tareas:
- Trabajo, Personal, Urgente, etc.
- Filtrar por categoría
- Colores por categoría

### Desafío 4: Búsqueda
Implementa un buscador de tareas:
- Input de búsqueda
- Filtrar por texto en tiempo real
- Resaltar coincidencias

---

## 📊 Criterios de Evaluación

| Criterio | Puntos | Descripción |
|----------|--------|-------------|
| **Estructura** | 2 pts | Archivos organizados correctamente |
| **Context** | 3 pts | Context y Provider implementados |
| **Custom Hook** | 2 pts | useTodos() funcional con validación |
| **Componentes** | 3 pts | Todos los componentes funcionan |
| **Funcionalidad** | 4 pts | CRUD completo de tareas |
| **Filtros** | 2 pts | Filtros funcionando correctamente |
| **UI/UX** | 2 pts | Interfaz limpia y usable |
| **TypeScript** | 2 pts | Tipado correcto |
| **TOTAL** | **20 pts** | |

---

## 💡 Conceptos Clave Aplicados

### Context API
- ✅ `createContext()` para crear el contexto
- ✅ `Provider` component para proveer el estado
- ✅ `useContext()` para consumir (vía custom hook)

### Optimización
- ✅ `useMemo()` para valores derivados
- ✅ Memoización del valor del contexto
- ✅ Evitar re-renders innecesarios

### Arquitectura
- ✅ Separación de responsabilidades
- ✅ Custom hook para encapsular lógica
- ✅ Componentes presentacionales vs contenedores

---

## 🐛 Problemas Comunes

### Error: "useTodos must be used within TodoProvider"

**Causa:** Intentas usar `useTodos()` fuera del `<TodoProvider>`

**Solución:**
```typescript
// ❌ MALO
<TodoScreen /> // Sin Provider

// ✅ BUENO
<TodoProvider>
  <TodoScreen />
</TodoProvider>
```

### Las tareas no se actualizan

**Causa:** No estás usando el estado correctamente

**Solución:** Usa funciones del contexto, no modifiques el estado directamente:
```typescript
// ❌ MALO
todos.push(newTodo)

// ✅ BUENO
addTodo(newTodo.title)
```

### Re-renders excesivos

**Causa:** Valor del contexto no está memoizado

**Solución:**
```typescript
const value = useMemo(() => ({
  todos,
  addTodo,
  // ...
}), [todos]) // Dependencias correctas
```

---

## 📚 Recursos Adicionales

- [React Context Docs](https://react.dev/reference/react/useContext)
- [Context API Best Practices](https://kentcdodds.com/blog/how-to-use-react-context-effectively)
- [TypeScript with Context](https://react-typescript-cheatsheet.netlify.app/docs/basic/getting-started/context/)

---

## ✅ Checklist de Completitud

- [ ] Todos los archivos creados según la estructura
- [ ] Context y Provider implementados
- [ ] Custom hook `useTodos()` funcionando
- [ ] CRUD de tareas completo (Create, Read, Update, Delete)
- [ ] Filtros funcionando (All, Active, Completed)
- [ ] Estadísticas actualizándose en tiempo real
- [ ] TypeScript sin errores
- [ ] UI responsive y funcional
- [ ] Aplicación probada en dispositivo/simulador

---

## 🎓 Conclusión

Has implementado con éxito una aplicación de tareas usando **Context API** para gestionar el estado global. Los conceptos aprendidos:

1. **Context API** elimina prop drilling
2. **Custom hooks** simplifican el uso del contexto
3. **useMemo** optimiza performance
4. **Separación de responsabilidades** mejora mantenibilidad

Estos patrones son fundamentales en aplicaciones React Native profesionales.

---

## 🔜 Siguiente Práctica

**[Práctica 2: Shopping Cart con useReducer](./practica-02-shopping-cart-reducer.md)**

Aprenderás a manejar estado complejo con el hook `useReducer`.

---

_Práctica 1: Todo App con Context API - Semana 3_  
_Bootcamp React Native 2025 - EPTI_

**Tiempo estimado:** 2-3 horas  
**Dificultad:** ⭐⭐ Intermedio
