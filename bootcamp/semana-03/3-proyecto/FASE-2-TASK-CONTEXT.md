# 📋 Fase 2: Task Context y CRUD Básico

> **Objetivo:** Implementar gestión de tareas con useReducer y AsyncStorage.

---

## 🎯 Objetivos de esta Fase

- ✅ Crear tipos de Task con categorías y prioridades
- ✅ Implementar TaskContext con useReducer
- ✅ CRUD completo de tareas
- ✅ Persistencia de tareas en AsyncStorage
- ✅ UI para gestionar tareas

**Tiempo estimado:** 1.5-2 horas

---

## 📝 Paso 1: Tipos de Task

**Archivo:** `src/types/task.ts`

```typescript
export type TaskCategory = 'work' | 'personal' | 'urgent'
export type TaskPriority = 'high' | 'medium' | 'low'

export interface Task {
  id: string
  title: string
  description: string
  completed: boolean
  category: TaskCategory
  priority: TaskPriority
  dueDate: Date | null
  createdAt: Date
  updatedAt: Date
}

export interface TaskContextType {
  tasks: Task[]
  isLoading: boolean
  addTask: (task: Omit<Task, 'id' | 'createdAt' | 'updatedAt'>) => void
  updateTask: (id: string, updates: Partial<Task>) => void
  deleteTask: (id: string) => void
  toggleTask: (id: string) => void
}
```

---

## 🔧 Paso 2: Task Reducer

**Archivo:** `src/reducers/taskReducer.ts`

```typescript
import { Task } from '../types/task'

export interface TaskState {
  tasks: Task[]
}

export type TaskAction =
  | { type: 'SET_TASKS'; payload: Task[] }
  | { type: 'ADD_TASK'; payload: Task }
  | { type: 'UPDATE_TASK'; payload: { id: string; updates: Partial<Task> } }
  | { type: 'DELETE_TASK'; payload: string }
  | { type: 'TOGGLE_TASK'; payload: string }

export const initialTaskState: TaskState = {
  tasks: [],
}

export function taskReducer(state: TaskState, action: TaskAction): TaskState {
  switch (action.type) {
    case 'SET_TASKS':
      return {
        ...state,
        tasks: action.payload,
      }

    case 'ADD_TASK':
      return {
        ...state,
        tasks: [action.payload, ...state.tasks],
      }

    case 'UPDATE_TASK':
      return {
        ...state,
        tasks: state.tasks.map((task) =>
          task.id === action.payload.id
            ? { ...task, ...action.payload.updates, updatedAt: new Date() }
            : task
        ),
      }

    case 'DELETE_TASK':
      return {
        ...state,
        tasks: state.tasks.filter((task) => task.id !== action.payload),
      }

    case 'TOGGLE_TASK':
      return {
        ...state,
        tasks: state.tasks.map((task) =>
          task.id === action.payload
            ? { ...task, completed: !task.completed, updatedAt: new Date() }
            : task
        ),
      }

    default:
      return state
  }
}
```

---

## 🎨 Paso 3: TaskContext

**Archivo:** `src/contexts/TaskContext.tsx`

```typescript
import React, { createContext, useReducer, useEffect, ReactNode } from 'react'
import { Task, TaskContextType } from '../types/task'
import { taskReducer, initialTaskState } from '../reducers/taskReducer'
import { STORAGE_KEYS, saveData, getData } from '../utils/storage'

export const TaskContext = createContext<TaskContextType | undefined>(undefined)

export function TaskProvider({ children }: { children: ReactNode }) {
  const [state, dispatch] = useReducer(taskReducer, initialTaskState)
  const [isLoading, setIsLoading] = React.useState(true)

  // Cargar tareas al iniciar
  useEffect(() => {
    loadTasks()
  }, [])

  // Guardar tareas cuando cambien
  useEffect(() => {
    if (!isLoading) {
      saveData(STORAGE_KEYS.TASKS, state.tasks)
    }
  }, [state.tasks, isLoading])

  async function loadTasks() {
    try {
      const tasks = await getData<Task[]>(STORAGE_KEYS.TASKS)
      if (tasks) {
        dispatch({ type: 'SET_TASKS', payload: tasks })
      }
    } catch (error) {
      console.error('Error loading tasks:', error)
    } finally {
      setIsLoading(false)
    }
  }

  function addTask(taskData: Omit<Task, 'id' | 'createdAt' | 'updatedAt'>) {
    const newTask: Task = {
      ...taskData,
      id: Date.now().toString(),
      createdAt: new Date(),
      updatedAt: new Date(),
    }

    dispatch({ type: 'ADD_TASK', payload: newTask })
  }

  function updateTask(id: string, updates: Partial<Task>) {
    dispatch({ type: 'UPDATE_TASK', payload: { id, updates } })
  }

  function deleteTask(id: string) {
    dispatch({ type: 'DELETE_TASK', payload: id })
  }

  function toggleTask(id: string) {
    dispatch({ type: 'TOGGLE_TASK', payload: id })
  }

  const value: TaskContextType = {
    tasks: state.tasks,
    isLoading,
    addTask,
    updateTask,
    deleteTask,
    toggleTask,
  }

  return <TaskContext.Provider value={value}>{children}</TaskContext.Provider>
}
```

---

## 🪝 Paso 4: Custom Hook useTasks

**Archivo:** `src/hooks/useTasks.ts`

```typescript
import { useContext } from 'react'
import { TaskContext } from '../contexts/TaskContext'

export function useTasks() {
  const context = useContext(TaskContext)

  if (!context) {
    throw new Error('useTasks must be used within TaskProvider')
  }

  return context
}
```

---

## 🧩 Paso 5: Componente TaskCard

**Archivo:** `src/components/TaskCard.tsx`

```typescript
import React from 'react'
import { View, Text, TouchableOpacity, StyleSheet, Alert } from 'react-native'
import { Task } from '../types/task'
import { useTasks } from '../hooks/useTasks'

const CATEGORY_COLORS = {
  work: '#007AFF',
  personal: '#34C759',
  urgent: '#FF3B30',
}

const CATEGORY_LABELS = {
  work: '💼 Trabajo',
  personal: '👤 Personal',
  urgent: '🔥 Urgente',
}

const PRIORITY_LABELS = {
  high: '🔴 Alta',
  medium: '🟡 Media',
  low: '🟢 Baja',
}

interface TaskCardProps {
  task: Task
}

export function TaskCard({ task }: TaskCardProps) {
  const { toggleTask, deleteTask } = useTasks()

  const handleDelete = () => {
    Alert.alert('Eliminar tarea', '¿Estás seguro?', [
      { text: 'Cancelar', style: 'cancel' },
      {
        text: 'Eliminar',
        style: 'destructive',
        onPress: () => deleteTask(task.id),
      },
    ])
  }

  return (
    <TouchableOpacity
      style={[styles.card, task.completed && styles.cardCompleted]}
      onPress={() => toggleTask(task.id)}
      onLongPress={handleDelete}
      activeOpacity={0.7}
    >
      {/* Indicator de categoría */}
      <View
        style={[
          styles.categoryIndicator,
          { backgroundColor: CATEGORY_COLORS[task.category] },
        ]}
      />

      <View style={styles.content}>
        {/* Header */}
        <View style={styles.header}>
          <View style={styles.checkbox}>
            {task.completed && <Text style={styles.checkmark}>✓</Text>}
          </View>
          <Text
            style={[styles.title, task.completed && styles.titleCompleted]}
            numberOfLines={2}
          >
            {task.title}
          </Text>
        </View>

        {/* Description */}
        {task.description ? (
          <Text
            style={[
              styles.description,
              task.completed && styles.descriptionCompleted,
            ]}
            numberOfLines={2}
          >
            {task.description}
          </Text>
        ) : null}

        {/* Tags */}
        <View style={styles.tags}>
          <View style={styles.tag}>
            <Text style={styles.tagText}>{CATEGORY_LABELS[task.category]}</Text>
          </View>
          <View style={styles.tag}>
            <Text style={styles.tagText}>{PRIORITY_LABELS[task.priority]}</Text>
          </View>
        </View>
      </View>
    </TouchableOpacity>
  )
}

const styles = StyleSheet.create({
  card: {
    backgroundColor: '#fff',
    borderRadius: 12,
    marginHorizontal: 16,
    marginBottom: 12,
    overflow: 'hidden',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  cardCompleted: {
    opacity: 0.6,
  },
  categoryIndicator: {
    position: 'absolute',
    left: 0,
    top: 0,
    bottom: 0,
    width: 4,
  },
  content: {
    padding: 16,
    paddingLeft: 20,
  },
  header: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    marginBottom: 8,
  },
  checkbox: {
    width: 24,
    height: 24,
    borderRadius: 12,
    borderWidth: 2,
    borderColor: '#007AFF',
    marginRight: 12,
    justifyContent: 'center',
    alignItems: 'center',
  },
  checkmark: {
    color: '#007AFF',
    fontSize: 16,
    fontWeight: 'bold',
  },
  title: {
    flex: 1,
    fontSize: 16,
    fontWeight: '600',
    color: '#333',
  },
  titleCompleted: {
    textDecorationLine: 'line-through',
    color: '#999',
  },
  description: {
    fontSize: 14,
    color: '#666',
    marginBottom: 12,
    paddingLeft: 36,
  },
  descriptionCompleted: {
    color: '#999',
  },
  tags: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    paddingLeft: 36,
  },
  tag: {
    backgroundColor: '#f0f0f0',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 12,
    marginRight: 8,
    marginBottom: 4,
  },
  tagText: {
    fontSize: 12,
    color: '#666',
  },
})
```

---

## 📱 Paso 6: Actualizar HomeScreen

**Archivo:** `src/screens/HomeScreen.tsx`

```typescript
import React, { useState } from 'react'
import {
  View,
  Text,
  TouchableOpacity,
  FlatList,
  StyleSheet,
  SafeAreaView,
  Modal,
  TextInput,
  Alert,
} from 'react-native'
import { useAuth } from '../hooks/useAuth'
import { useTasks } from '../hooks/useTasks'
import { TaskCard } from '../components/TaskCard'
import { TaskCategory, TaskPriority } from '../types/task'

export function HomeScreen() {
  const { user, logout } = useAuth()
  const { tasks, addTask } = useTasks()
  const [showModal, setShowModal] = useState(false)
  const [title, setTitle] = useState('')
  const [description, setDescription] = useState('')
  const [category, setCategory] = useState<TaskCategory>('personal')
  const [priority, setPriority] = useState<TaskPriority>('medium')

  const handleAddTask = () => {
    if (!title.trim()) {
      Alert.alert('Error', 'El título es requerido')
      return
    }

    addTask({
      title: title.trim(),
      description: description.trim(),
      completed: false,
      category,
      priority,
      dueDate: null,
    })

    // Reset form
    setTitle('')
    setDescription('')
    setCategory('personal')
    setPriority('medium')
    setShowModal(false)
  }

  const activeTasks = tasks.filter((t) => !t.completed).length
  const completedTasks = tasks.filter((t) => t.completed).length

  return (
    <SafeAreaView style={styles.container}>
      {/* Header */}
      <View style={styles.header}>
        <View>
          <Text style={styles.greeting}>👋 Hola, {user?.name}!</Text>
          <Text style={styles.stats}>
            {activeTasks} activas • {completedTasks} completadas
          </Text>
        </View>
        <TouchableOpacity onPress={logout}>
          <Text style={styles.logoutText}>Salir</Text>
        </TouchableOpacity>
      </View>

      {/* Task List */}
      <FlatList
        data={tasks}
        keyExtractor={(item) => item.id}
        renderItem={({ item }) => <TaskCard task={item} />}
        contentContainerStyle={styles.list}
        ListEmptyComponent={
          <View style={styles.empty}>
            <Text style={styles.emptyText}>📝</Text>
            <Text style={styles.emptyTitle}>No hay tareas</Text>
            <Text style={styles.emptySubtitle}>
              Toca el botón + para crear una
            </Text>
          </View>
        }
      />

      {/* Add Button */}
      <TouchableOpacity style={styles.fab} onPress={() => setShowModal(true)}>
        <Text style={styles.fabText}>+</Text>
      </TouchableOpacity>

      {/* Add Task Modal */}
      <Modal
        visible={showModal}
        animationType="slide"
        presentationStyle="pageSheet"
        onRequestClose={() => setShowModal(false)}
      >
        <SafeAreaView style={styles.modal}>
          <View style={styles.modalHeader}>
            <TouchableOpacity onPress={() => setShowModal(false)}>
              <Text style={styles.modalCancel}>Cancelar</Text>
            </TouchableOpacity>
            <Text style={styles.modalTitle}>Nueva Tarea</Text>
            <TouchableOpacity onPress={handleAddTask}>
              <Text style={styles.modalSave}>Guardar</Text>
            </TouchableOpacity>
          </View>

          <View style={styles.modalContent}>
            <TextInput
              style={styles.input}
              placeholder="Título"
              value={title}
              onChangeText={setTitle}
              autoFocus
            />

            <TextInput
              style={[styles.input, styles.textArea]}
              placeholder="Descripción (opcional)"
              value={description}
              onChangeText={setDescription}
              multiline
              numberOfLines={3}
            />

            <Text style={styles.label}>Categoría:</Text>
            <View style={styles.options}>
              {(['work', 'personal', 'urgent'] as TaskCategory[]).map((cat) => (
                <TouchableOpacity
                  key={cat}
                  style={[
                    styles.option,
                    category === cat && styles.optionSelected,
                  ]}
                  onPress={() => setCategory(cat)}
                >
                  <Text style={styles.optionText}>
                    {cat === 'work' && '💼 Trabajo'}
                    {cat === 'personal' && '👤 Personal'}
                    {cat === 'urgent' && '🔥 Urgente'}
                  </Text>
                </TouchableOpacity>
              ))}
            </View>

            <Text style={styles.label}>Prioridad:</Text>
            <View style={styles.options}>
              {(['high', 'medium', 'low'] as TaskPriority[]).map((pri) => (
                <TouchableOpacity
                  key={pri}
                  style={[
                    styles.option,
                    priority === pri && styles.optionSelected,
                  ]}
                  onPress={() => setPriority(pri)}
                >
                  <Text style={styles.optionText}>
                    {pri === 'high' && '🔴 Alta'}
                    {pri === 'medium' && '🟡 Media'}
                    {pri === 'low' && '🟢 Baja'}
                  </Text>
                </TouchableOpacity>
              ))}
            </View>
          </View>
        </SafeAreaView>
      </Modal>
    </SafeAreaView>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: 16,
    backgroundColor: '#fff',
    borderBottomWidth: 1,
    borderBottomColor: '#e0e0e0',
  },
  greeting: {
    fontSize: 20,
    fontWeight: '600',
    marginBottom: 4,
  },
  stats: {
    fontSize: 14,
    color: '#666',
  },
  logoutText: {
    color: '#FF3B30',
    fontWeight: '600',
  },
  list: {
    paddingTop: 16,
    paddingBottom: 80,
    flexGrow: 1,
  },
  empty: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingTop: 80,
  },
  emptyText: {
    fontSize: 64,
    marginBottom: 16,
  },
  emptyTitle: {
    fontSize: 20,
    fontWeight: '600',
    marginBottom: 8,
  },
  emptySubtitle: {
    fontSize: 16,
    color: '#666',
  },
  fab: {
    position: 'absolute',
    right: 16,
    bottom: 16,
    width: 56,
    height: 56,
    borderRadius: 28,
    backgroundColor: '#007AFF',
    justifyContent: 'center',
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.3,
    shadowRadius: 8,
    elevation: 8,
  },
  fabText: {
    color: '#fff',
    fontSize: 32,
    fontWeight: '300',
  },
  modal: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  modalHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: 16,
    backgroundColor: '#fff',
    borderBottomWidth: 1,
    borderBottomColor: '#e0e0e0',
  },
  modalCancel: {
    color: '#007AFF',
    fontSize: 16,
  },
  modalTitle: {
    fontSize: 18,
    fontWeight: '600',
  },
  modalSave: {
    color: '#007AFF',
    fontSize: 16,
    fontWeight: '600',
  },
  modalContent: {
    padding: 16,
  },
  input: {
    backgroundColor: '#fff',
    padding: 16,
    borderRadius: 12,
    fontSize: 16,
    marginBottom: 16,
    borderWidth: 1,
    borderColor: '#e0e0e0',
  },
  textArea: {
    height: 80,
    textAlignVertical: 'top',
  },
  label: {
    fontSize: 16,
    fontWeight: '600',
    marginBottom: 12,
    marginTop: 8,
  },
  options: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    marginBottom: 16,
  },
  option: {
    backgroundColor: '#fff',
    paddingHorizontal: 16,
    paddingVertical: 10,
    borderRadius: 20,
    marginRight: 8,
    marginBottom: 8,
    borderWidth: 2,
    borderColor: '#e0e0e0',
  },
  optionSelected: {
    borderColor: '#007AFF',
    backgroundColor: '#E3F2FF',
  },
  optionText: {
    fontSize: 14,
    fontWeight: '500',
  },
})
```

---

## 🚀 Paso 7: Actualizar App.tsx

```typescript
import React, { useState } from 'react'
import { ActivityIndicator, View, StyleSheet, StatusBar } from 'react-native'
import { AuthProvider, useAuth } from './src/contexts/AuthContext'
import { TaskProvider } from './src/contexts/TaskContext'
import { LoginScreen } from './src/screens/LoginScreen'
import { RegisterScreen } from './src/screens/RegisterScreen'
import { HomeScreen } from './src/screens/HomeScreen'

function AppContent() {
  const { isAuthenticated, isLoading } = useAuth()
  const [showRegister, setShowRegister] = useState(false)

  if (isLoading) {
    return (
      <View style={styles.loading}>
        <ActivityIndicator size="large" color="#007AFF" />
      </View>
    )
  }

  if (!isAuthenticated) {
    return showRegister ? (
      <RegisterScreen onSwitchToLogin={() => setShowRegister(false)} />
    ) : (
      <LoginScreen onSwitchToRegister={() => setShowRegister(true)} />
    )
  }

  return (
    <TaskProvider>
      <HomeScreen />
    </TaskProvider>
  )
}

export default function App() {
  return (
    <AuthProvider>
      <StatusBar barStyle="dark-content" />
      <AppContent />
    </AuthProvider>
  )
}

const styles = StyleSheet.create({
  loading: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#f5f5f5',
  },
})
```

---

## ✅ Verificar Fase 2

### Funcionalidades:

- [ ] Crear tareas con título, descripción, categoría, prioridad
- [ ] Tareas se muestran en lista
- [ ] Toggle completado funciona
- [ ] Eliminar con long press
- [ ] Estadísticas actualizadas (activas/completadas)
- [ ] Persistencia al cerrar/abrir app
- [ ] UI limpia y funcional

---

## 📊 Checklist

- [ ] Tipos Task definidos
- [ ] Reducer implementado
- [ ] TaskContext funcionando
- [ ] useTasks hook creado
- [ ] TaskCard componente
- [ ] HomeScreen actualizado con CRUD
- [ ] Modal de nueva tarea
- [ ] Persistencia con AsyncStorage
- [ ] Sin errores TypeScript

---

## 🔜 Siguiente Fase

**➡️ [Fase 3: Filtros y Estadísticas](./FASE-3-FILTERS-STATS.md)**

---

_Fase 2: Task Context y CRUD - Proyecto Integrador_  
_Semana 3 - Bootcamp React Native 2025_
