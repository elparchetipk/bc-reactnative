# 03. Estado y Eventos - Haciendo Apps Interactivas

**Duración:** 1.5 horas (PRESENCIAL)  
**Modalidad:** Live coding (escribir código juntos)  
**Objetivo:** Aprender a manejar estado y eventos para crear apps interactivas

---

## 🎯 Objetivos de Aprendizaje

Al finalizar este módulo presencial, serás capaz de:

- ✅ Usar el hook `useState` para gestionar estado local
- ✅ Manejar eventos táctiles (onPress, onChangeText)
- ✅ Crear formularios controlados
- ✅ Comprender el flujo de datos unidireccional
- ✅ Usar `useEffect` para efectos secundarios básicos

---

## 🔄 Concepto Central: El Estado

### ¿Qué es el Estado?

**Estado (state)** = Datos que pueden cambiar y afectan lo que se muestra en pantalla.

```
Estado cambia → React re-renderiza → UI se actualiza
```

### Ejemplo visual:

```
Usuario presiona "+1"
     ↓
setCount(count + 1)  ← Cambia el estado
     ↓
React detecta cambio
     ↓
Componente se re-renderiza
     ↓
Número nuevo aparece en pantalla
```

---

## 📝 EJERCICIO 1: Contador Simple (20 min)

### Objetivo: Crear un contador con botones +/- y reset

**¡TODOS JUNTOS!** Vamos a escribir este código paso a paso:

```tsx
import { View, Text, TouchableOpacity } from 'react-native'
import { useState } from 'react'

export default function App() {
  // PASO 1: Declarar estado
  // useState devuelve [valor actual, función para actualizarlo]
  const [count, setCount] = useState(0)

  // PASO 2: Funciones para modificar el estado
  const increment = () => {
    setCount(count + 1) // Suma 1
  }

  const decrement = () => {
    setCount(count - 1) // Resta 1
  }

  const reset = () => {
    setCount(0) // Vuelve a 0
  }

  // PASO 3: Renderizar UI
  return (
    <View className="flex-1 bg-white items-center justify-center">
      {/* Mostrar el contador */}
      <Text className="text-8xl font-bold text-gray-900 mb-10">{count}</Text>

      {/* Botones */}
      <View className="flex-row gap-4">
        {/* Botón - */}
        <TouchableOpacity
          onPress={decrement}
          className="bg-red-500 w-16 h-16 rounded-full items-center justify-center"
        >
          <Text className="text-white text-3xl font-bold">−</Text>
        </TouchableOpacity>

        {/* Botón Reset */}
        <TouchableOpacity
          onPress={reset}
          className="bg-gray-500 w-16 h-16 rounded-full items-center justify-center"
        >
          <Text className="text-white text-sm font-bold">0</Text>
        </TouchableOpacity>

        {/* Botón + */}
        <TouchableOpacity
          onPress={increment}
          className="bg-green-500 w-16 h-16 rounded-full items-center justify-center"
        >
          <Text className="text-white text-3xl font-bold">+</Text>
        </TouchableOpacity>
      </View>

      {/* Información adicional */}
      <Text className="text-gray-500 mt-8">
        {count === 0 ? 'En cero' : count > 0 ? 'Positivo' : 'Negativo'}
      </Text>
    </View>
  )
}
```

### 🎯 Conceptos Clave:

1. **`useState(0)`** - Inicializa el estado en 0
2. **`setCount(...)`** - Única forma de actualizar el estado
3. **`onPress={() => ...}`** - Evento al presionar
4. **Re-render automático** - React actualiza la UI solo cuando cambia el estado

### ⚠️ Errores Comunes:

```tsx
// ❌ MAL: Modificar directamente (NO FUNCIONA)
count = count + 1 // NO hace nada

// ✅ BIEN: Usar la función set
setCount(count + 1) // React detecta el cambio
```

---

## 📝 EJERCICIO 2: Input Controlado (25 min)

### Objetivo: Crear un formulario de saludo personalizado

**¡TODOS JUNTOS!** Live coding:

```tsx
import { View, Text, TextInput, TouchableOpacity } from 'react-native'
import { useState } from 'react'

export default function App() {
  // Estado para el nombre
  const [name, setName] = useState('')

  // Estado para mostrar/ocultar el saludo
  const [showGreeting, setShowGreeting] = useState(false)

  const handleSubmit = () => {
    if (name.trim().length > 0) {
      setShowGreeting(true)
    }
  }

  const handleReset = () => {
    setName('')
    setShowGreeting(false)
  }

  return (
    <View className="flex-1 bg-gradient-to-br from-purple-500 to-pink-500 justify-center px-8">
      <View className="bg-white rounded-3xl p-8 shadow-2xl">
        <Text className="text-3xl font-bold text-gray-900 mb-2">¡Hola! 👋</Text>
        <Text className="text-gray-600 mb-6">¿Cómo te llamas?</Text>

        {/* Input */}
        <TextInput
          value={name}
          onChangeText={setName}
          placeholder="Escribe tu nombre..."
          className="border-2 border-gray-300 rounded-xl px-4 py-3 text-lg mb-4"
        />

        {/* Vista previa del texto */}
        <Text className="text-sm text-gray-500 mb-4">
          Escribiste: <Text className="font-bold">{name || '(vacío)'}</Text>
        </Text>

        {/* Botones */}
        <View className="flex-row gap-3">
          <TouchableOpacity
            onPress={handleSubmit}
            disabled={name.trim().length === 0}
            className={`flex-1 py-4 rounded-xl ${
              name.trim().length > 0 ? 'bg-purple-600' : 'bg-gray-300'
            }`}
          >
            <Text className="text-white text-center font-bold text-lg">
              Saludar
            </Text>
          </TouchableOpacity>

          <TouchableOpacity
            onPress={handleReset}
            className="flex-1 py-4 rounded-xl bg-gray-200"
          >
            <Text className="text-gray-900 text-center font-bold text-lg">
              Limpiar
            </Text>
          </TouchableOpacity>
        </View>

        {/* Saludo (solo si showGreeting es true) */}
        {showGreeting && (
          <View className="mt-6 bg-purple-100 p-4 rounded-xl">
            <Text className="text-xl text-purple-900 text-center font-bold">
              ¡Hola, {name}! 🎉
            </Text>
          </View>
        )}
      </View>
    </View>
  )
}
```

### 🎯 Conceptos Nuevos:

1. **Input Controlado:**

   ```tsx
   value = { name } // ← Estado controla el valor
   onChangeText = { setName } // ← Actualiza el estado al escribir
   ```

2. **Renderizado Condicional:**

   ```tsx
   {
     showGreeting && <Text>Saludo</Text>
   } // Solo si es true
   ```

3. **Estilos Condicionales:**

   ```tsx
   className={`${name.length > 0 ? 'bg-blue-500' : 'bg-gray-300'}`}
   ```

4. **Disabled:**
   ```tsx
   disabled={name.trim().length === 0}  // Deshabilitar si está vacío
   ```

---

## 📝 EJERCICIO 3: TODO List (45 min)

### Objetivo: Aplicación completa de tareas

**¡TODOS JUNTOS!** Esta es la app más completa que haremos hoy:

```tsx
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  ScrollView,
  Alert,
} from 'react-native'
import { useState } from 'react'

// Definir tipo de tarea
interface Todo {
  id: number
  text: string
  completed: boolean
}

export default function App() {
  // Estados
  const [todos, setTodos] = useState<Todo[]>([])
  const [inputText, setInputText] = useState('')
  const [nextId, setNextId] = useState(1)

  // Agregar tarea
  const addTodo = () => {
    if (inputText.trim().length === 0) {
      Alert.alert('Error', 'Ingresa una tarea')
      return
    }

    const newTodo: Todo = {
      id: nextId,
      text: inputText.trim(),
      completed: false,
    }

    setTodos([...todos, newTodo]) // Agregar al array
    setNextId(nextId + 1) // Incrementar ID
    setInputText('') // Limpiar input
  }

  // Marcar como completada
  const toggleTodo = (id: number) => {
    setTodos(
      todos.map((todo) =>
        todo.id === id ? { ...todo, completed: !todo.completed } : todo
      )
    )
  }

  // Eliminar tarea
  const deleteTodo = (id: number) => {
    Alert.alert('Confirmar', '¿Eliminar esta tarea?', [
      { text: 'Cancelar', style: 'cancel' },
      {
        text: 'Eliminar',
        style: 'destructive',
        onPress: () => {
          setTodos(todos.filter((todo) => todo.id !== id))
        },
      },
    ])
  }

  // Calcular estadísticas
  const totalTodos = todos.length
  const completedTodos = todos.filter((t) => t.completed).length
  const pendingTodos = totalTodos - completedTodos

  return (
    <View className="flex-1 bg-gray-50">
      {/* Header */}
      <View className="bg-blue-600 pt-14 pb-6 px-5">
        <Text className="text-white text-3xl font-bold mb-3">
          Mis Tareas 📝
        </Text>
        <View className="flex-row gap-4">
          <Text className="text-blue-100">Total: {totalTodos}</Text>
          <Text className="text-blue-100">Pendientes: {pendingTodos}</Text>
          <Text className="text-blue-100">Completadas: {completedTodos}</Text>
        </View>
      </View>

      {/* Input para nueva tarea */}
      <View className="flex-row p-4 bg-white border-b border-gray-200">
        <TextInput
          value={inputText}
          onChangeText={setInputText}
          onSubmitEditing={addTodo}
          placeholder="Nueva tarea..."
          className="flex-1 border border-gray-300 rounded-lg px-4 py-3 mr-2"
        />
        <TouchableOpacity
          onPress={addTodo}
          className="bg-blue-600 w-14 h-14 rounded-lg items-center justify-center"
        >
          <Text className="text-white font-bold text-2xl">+</Text>
        </TouchableOpacity>
      </View>

      {/* Lista de tareas */}
      <ScrollView className="flex-1">
        {todos.length === 0 ? (
          <View className="items-center justify-center py-20">
            <Text className="text-6xl mb-4">📋</Text>
            <Text className="text-xl text-gray-500">No hay tareas</Text>
            <Text className="text-sm text-gray-400 mt-2">
              Agrega una tarea para comenzar
            </Text>
          </View>
        ) : (
          <View className="p-4">
            {todos.map((todo) => (
              <View
                key={todo.id}
                className="flex-row items-center bg-white p-4 mb-3 rounded-xl shadow-sm"
              >
                {/* Checkbox */}
                <TouchableOpacity
                  onPress={() => toggleTodo(todo.id)}
                  className={`w-6 h-6 rounded border-2 mr-3 items-center justify-center ${
                    todo.completed
                      ? 'bg-green-500 border-green-500'
                      : 'border-gray-400'
                  }`}
                >
                  {todo.completed && (
                    <Text className="text-white font-bold text-sm">✓</Text>
                  )}
                </TouchableOpacity>

                {/* Texto de la tarea */}
                <Text
                  className={`flex-1 text-lg ${
                    todo.completed
                      ? 'text-gray-400 line-through'
                      : 'text-gray-900'
                  }`}
                >
                  {todo.text}
                </Text>

                {/* Botón eliminar */}
                <TouchableOpacity
                  onPress={() => deleteTodo(todo.id)}
                  className="bg-red-500 w-10 h-10 rounded-lg items-center justify-center ml-2"
                >
                  <Text className="text-white font-bold text-lg">×</Text>
                </TouchableOpacity>
              </View>
            ))}
          </View>
        )}
      </ScrollView>
    </View>
  )
}
```

### 🎯 Conceptos Avanzados Aplicados:

1. **Arrays en el estado:**

   ```tsx
   const [todos, setTodos] = useState<Todo[]>([])
   ```

2. **Agregar al array:**

   ```tsx
   setTodos([...todos, newItem]) // Spread operator
   ```

3. **Actualizar elemento específico:**

   ```tsx
   setTodos(
     todos.map(
       (todo) =>
         todo.id === targetId
           ? { ...todo, completed: !todo.completed } // Actualizar este
           : todo // Dejar los demás
     )
   )
   ```

4. **Eliminar del array:**

   ```tsx
   setTodos(todos.filter((todo) => todo.id !== targetId))
   ```

5. **Interface TypeScript:**
   ```tsx
   interface Todo {
     id: number
     text: string
     completed: boolean
   }
   ```

---

## 🔄 Introducción a useEffect (10 min)

### ¿Qué es useEffect?

`useEffect` se usa para **efectos secundarios** (side effects):

- Llamar APIs
- Timers/Intervals
- Suscripciones
- Logging

**Ejemplo simple:**

```tsx
import { useEffect } from 'react'

export default function App() {
  const [count, setCount] = useState(0)

  // Se ejecuta cada vez que count cambia
  useEffect(() => {
    console.log('El count cambió a:', count)
  }, [count]) // ← Dependencia

  // Se ejecuta solo una vez al montar
  useEffect(() => {
    console.log('Componente montado')
  }, []) // ← Array vacío

  return (
    <View>
      <Text>{count}</Text>
      <TouchableOpacity onPress={() => setCount(count + 1)}>
        <Text>Incrementar</Text>
      </TouchableOpacity>
    </View>
  )
}
```

**Veremos más de useEffect en la Semana 2.**

---

## ⚡ Mejores Prácticas

### 1. Nomenclatura

```tsx
// ✅ BIEN: Nombres descriptivos
const [isLoading, setIsLoading] = useState(false)
const [userData, setUserData] = useState(null)
const [errorMessage, setErrorMessage] = useState('')

// ❌ MAL: Nombres genéricos
const [data, setData] = useState(null)
const [flag, setFlag] = useState(false)
```

### 2. Actualizar Estado

```tsx
// ✅ BIEN: Usar función updater cuando dependes del valor anterior
setCount((prevCount) => prevCount + 1)

// ⚠️ FUNCIONA pero menos confiable en actualizaciones rápidas
setCount(count + 1)

// ❌ MAL: Mutar directamente
count = count + 1 // NO HACE NADA
```

### 3. Estados Múltiples

```tsx
// Para formularios complejos, usar objeto:
const [formData, setFormData] = useState({
  name: '',
  email: '',
  age: '',
})

// Actualizar un campo:
setFormData({ ...formData, name: 'Juan' })
```

---

## ✅ Checklist de Verificación

Al finalizar esta sesión presencial deberías poder:

- [ ] Usar `useState` para crear estado local
- [ ] Actualizar estado con la función `set...`
- [ ] Manejar eventos `onPress` en TouchableOpacity
- [ ] Crear inputs controlados con `TextInput`
- [ ] Renderizar contenido condicionalmente
- [ ] Aplicar estilos condicionales
- [ ] Trabajar con arrays en el estado
- [ ] Entender conceptos básicos de `useEffect`

---

## 📚 Trabajo Autónomo (45 minutos recomendados)

### Para practicar:

1. **Mejora el TODO List:**

   - Agrega categorías (Personal, Trabajo, Urgente)
   - Implementa filtros (Todas, Pendientes, Completadas)
   - Agrega fechas de vencimiento

2. **Crea un Conversor de Monedas:**

   - Input para monto
   - Selector de monedas (USD, EUR, MXN)
   - Botón para convertir
   - Mostrar resultado

3. **Revisa documentación:**
   - [useState Hook](https://react.dev/reference/react/useState)
   - [useEffect Hook](https://react.dev/reference/react/useEffect)
   - [Handling Events](https://reactnative.dev/docs/handling-touches)

---

## 🎉 ¡Felicitaciones!

Has completado toda la teoría de la Semana 1. Ahora sabes:

- ✅ Qué es React Native y cuándo usarlo
- ✅ Configurar un entorno de desarrollo
- ✅ Usar los componentes básicos
- ✅ Aplicar estilos con TailwindCSS
- ✅ Crear layouts con Flexbox
- ✅ Manejar estado con useState
- ✅ Responder a eventos del usuario
- ✅ Crear formularios funcionales

**Siguiente paso:** Aplicar todo esto en las prácticas guiadas y el proyecto integrador.

---

## 🔗 Navegación

- ⬅️ [Anterior: Setup y Componentes](./02-setup-y-componentes-basicos.md)
- ➡️ [Siguiente: Prácticas Guiadas](../2-practicas/README.md)
- 🏠 [Inicio Semana 1](../README.md)

---

**Tiempo presencial:** 1.5 horas ✓  
**Tiempo autónomo recomendado:** ~45 minutos  
**Total teoría presencial Semana 1:** ~4.5 horas
