# 05. Estado y Eventos

**Duración estimada:** 1 hora  
**Modalidad:** Teórico-práctica  
**Prerequisitos:** Componentes básicos y layouts

---

## 📋 Objetivos de Aprendizaje

Al finalizar este módulo, serás capaz de:

- ✅ Gestionar estado local con `useState`
- ✅ Entender el ciclo de vida con `useEffect`
- ✅ Manejar eventos táctiles y de formularios
- ✅ Crear formularios controlados con validación
- ✅ Aplicar TypeScript a hooks y eventos
- ✅ Comprender el flujo de datos unidireccional
- ✅ Optimizar re-renders y performance básica

---

## 🔄 Estado en React: Concepto Fundamental

### ¿Qué es el Estado?

**Estado (state)** son los datos que pueden cambiar durante la vida de un componente y que afectan lo que se muestra en la pantalla.

```tsx
/**
 * Estado: Datos que cambian y provocan re-renderizado
 *
 * ¿Qué hace? Almacena información que puede cambiar
 * ¿Para qué? Hacer la UI interactiva y reactiva
 * ¿Cómo? Con el hook useState de React
 */
```

### Estado vs Props

| Aspecto           | Estado (State)                 | Props                          |
| ----------------- | ------------------------------ | ------------------------------ |
| **Mutabilidad**   | Mutable (puede cambiar)        | Inmutable (solo lectura)       |
| **Definición**    | Definido dentro del componente | Pasado desde el padre          |
| **Actualización** | Con setState                   | Solo el padre puede cambiarlas |
| **Propósito**     | Datos internos del componente  | Comunicación padre → hijo      |

---

## 🎣 Hook: `useState`

### Sintaxis Básica

```tsx
import { useState } from 'react'

const [valor, setValor] = useState<Tipo>(valorInicial)
```

- `valor`: Variable que contiene el estado actual
- `setValor`: Función para actualizar el estado
- `valorInicial`: Valor inicial del estado
- `<Tipo>`: Tipo de TypeScript (opcional pero recomendado)

### Ejemplo 1: Contador Simple

```tsx
/**
 * Contador - Ejemplo básico de useState
 *
 * ¿Para qué? Demostrar cómo el estado provoca re-renderizado
 * ¿Cómo? Al cambiar count, React actualiza la UI automáticamente
 */
import { View, Text, TouchableOpacity } from 'react-native'
import { useState } from 'react'

export default function Counter(): JSX.Element {
  // Estado: número que inicia en 0
  const [count, setCount] = useState<number>(0)

  // Handlers: funciones que modifican el estado
  const increment = (): void => {
    setCount(count + 1)
  }

  const decrement = (): void => {
    setCount(count - 1)
  }

  const reset = (): void => {
    setCount(0)
  }

  return (
    <View className="flex-1 bg-white items-center justify-center p-5">
      <Text className="text-6xl font-bold text-gray-900 mb-8">{count}</Text>

      <View className="flex-row gap-3">
        <TouchableOpacity
          onPress={decrement}
          className="bg-red-500 px-6 py-3 rounded-lg"
        >
          <Text className="text-white text-2xl font-bold">−</Text>
        </TouchableOpacity>

        <TouchableOpacity
          onPress={reset}
          className="bg-gray-500 px-6 py-3 rounded-lg"
        >
          <Text className="text-white text-lg font-bold">Reset</Text>
        </TouchableOpacity>

        <TouchableOpacity
          onPress={increment}
          className="bg-green-500 px-6 py-3 rounded-lg"
        >
          <Text className="text-white text-2xl font-bold">+</Text>
        </TouchableOpacity>
      </View>
    </View>
  )
}
```

**Flujo de ejecución:**

1. Usuario presiona botón `+`
2. Se ejecuta `increment()`
3. Se llama `setCount(count + 1)`
4. React detecta cambio de estado
5. React re-renderiza el componente
6. La UI muestra el nuevo valor

---

### Ejemplo 2: Toggle Visibility

```tsx
/**
 * Toggle - Mostrar/ocultar contenido
 *
 * ¿Para qué? Controlar visibilidad de elementos
 * ¿Cómo? Estado booleano + renderizado condicional
 */
import { View, Text, TouchableOpacity } from 'react-native'
import { useState } from 'react'

export default function ToggleExample(): JSX.Element {
  const [isVisible, setIsVisible] = useState<boolean>(false)

  const toggleVisibility = (): void => {
    setIsVisible(!isVisible) // Invierte el valor: true ↔ false
  }

  return (
    <View className="flex-1 bg-gray-50 items-center justify-center p-5">
      <TouchableOpacity
        onPress={toggleVisibility}
        className="bg-blue-600 px-8 py-4 rounded-lg mb-5"
      >
        <Text className="text-white text-lg font-bold">
          {isVisible ? 'Ocultar' : 'Mostrar'} Contenido
        </Text>
      </TouchableOpacity>

      {/* Renderizado condicional */}
      {isVisible && (
        <View className="bg-white p-6 rounded-xl shadow-lg">
          <Text className="text-xl font-bold text-gray-900 mb-2">
            ¡Contenido Visible! 👀
          </Text>
          <Text className="text-gray-600">
            Este contenido solo se muestra cuando isVisible es true
          </Text>
        </View>
      )}
    </View>
  )
}
```

**Técnicas de renderizado condicional:**

```tsx
// 1. Con operador && (más común)
{
  isVisible && <Text>Contenido</Text>
}

// 2. Con operador ternario
{
  isVisible ? <Text>Visible</Text> : <Text>Oculto</Text>
}

// 3. Con variable
const content = isVisible ? <Text>Visible</Text> : null
return <View>{content}</View>

// 4. Con función
const renderContent = () => {
  if (!isVisible) return null
  return <Text>Visible</Text>
}
```

---

### Ejemplo 3: Input Controlado

```tsx
/**
 * Input Controlado - Formulario básico
 *
 * ¿Para qué? Sincronizar input con estado de React
 * ¿Cómo? El estado es la "fuente única de verdad"
 */
import { View, Text, TextInput, TouchableOpacity } from 'react-native'
import { useState } from 'react'

export default function ControlledInput(): JSX.Element {
  const [name, setName] = useState<string>('')

  const handleSubmit = (): void => {
    if (name.trim()) {
      alert(`¡Hola, ${name}!`)
      setName('') // Limpiar input después de enviar
    }
  }

  return (
    <View className="flex-1 bg-white p-5 justify-center">
      <Text className="text-2xl font-bold text-gray-900 mb-4">
        ¿Cómo te llamas?
      </Text>

      <TextInput
        value={name} // ← Valor controlado por el estado
        onChangeText={setName} // ← Actualiza el estado
        placeholder="Ingresa tu nombre"
        className="border border-gray-300 rounded-lg px-4 py-3 text-lg mb-4"
      />

      {/* Vista previa en tiempo real */}
      <Text className="text-gray-600 mb-4">
        Escribiste: <Text className="font-bold">{name || '(vacío)'}</Text>
      </Text>

      <TouchableOpacity
        onPress={handleSubmit}
        disabled={!name.trim()}
        className={`py-4 rounded-lg ${
          name.trim() ? 'bg-blue-600' : 'bg-gray-300'
        }`}
      >
        <Text className="text-white text-center text-lg font-bold">Enviar</Text>
      </TouchableOpacity>
    </View>
  )
}
```

**¿Por qué "controlado"?**

- El valor del input está sincronizado con el estado
- React controla el valor en todo momento
- Permite validación en tiempo real
- Fácil de resetear o manipular

---

### Ejemplo 4: Múltiples Estados

```tsx
/**
 * Formulario Completo - Múltiples campos
 *
 * ¿Para qué? Gestionar varios estados relacionados
 * ¿Cómo? Un useState por cada campo o un objeto estado
 */
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  ScrollView,
} from 'react-native'
import { useState } from 'react'

// Opción 1: Estado individual por campo
export function FormIndividualStates(): JSX.Element {
  const [name, setName] = useState<string>('')
  const [email, setEmail] = useState<string>('')
  const [age, setAge] = useState<string>('')

  return (
    <ScrollView className="flex-1 bg-white p-5">
      <Text className="text-2xl font-bold mb-5">Formulario</Text>

      <TextInput
        value={name}
        onChangeText={setName}
        placeholder="Nombre"
        className="border border-gray-300 rounded-lg px-4 py-3 mb-3"
      />

      <TextInput
        value={email}
        onChangeText={setEmail}
        placeholder="Email"
        keyboardType="email-address"
        className="border border-gray-300 rounded-lg px-4 py-3 mb-3"
      />

      <TextInput
        value={age}
        onChangeText={setAge}
        placeholder="Edad"
        keyboardType="numeric"
        className="border border-gray-300 rounded-lg px-4 py-3 mb-3"
      />
    </ScrollView>
  )
}

// Opción 2: Estado único con objeto (más escalable)
interface FormData {
  name: string
  email: string
  age: string
}

export function FormObjectState(): JSX.Element {
  const [formData, setFormData] = useState<FormData>({
    name: '',
    email: '',
    age: '',
  })

  // Helper para actualizar un campo específico
  const updateField = (field: keyof FormData, value: string): void => {
    setFormData((prev) => ({
      ...prev,
      [field]: value,
    }))
  }

  const handleSubmit = (): void => {
    console.log('Datos:', formData)
  }

  return (
    <ScrollView className="flex-1 bg-white p-5">
      <Text className="text-2xl font-bold mb-5">Formulario (Objeto)</Text>

      <TextInput
        value={formData.name}
        onChangeText={(value) => updateField('name', value)}
        placeholder="Nombre"
        className="border border-gray-300 rounded-lg px-4 py-3 mb-3"
      />

      <TextInput
        value={formData.email}
        onChangeText={(value) => updateField('email', value)}
        placeholder="Email"
        keyboardType="email-address"
        className="border border-gray-300 rounded-lg px-4 py-3 mb-3"
      />

      <TextInput
        value={formData.age}
        onChangeText={(value) => updateField('age', value)}
        placeholder="Edad"
        keyboardType="numeric"
        className="border border-gray-300 rounded-lg px-4 py-3 mb-3"
      />

      <TouchableOpacity
        onPress={handleSubmit}
        className="bg-blue-600 py-4 rounded-lg"
      >
        <Text className="text-white text-center text-lg font-bold">Enviar</Text>
      </TouchableOpacity>
    </ScrollView>
  )
}
```

**Cuándo usar cada enfoque:**

| Estados Individuales      | Objeto Estado          |
| ------------------------- | ---------------------- |
| ✅ Pocos campos (2-3)     | ✅ Muchos campos (5+)  |
| ✅ Estados independientes | ✅ Datos relacionados  |
| ✅ Lógica simple          | ✅ Validación compleja |
| ⚠️ Código repetitivo      | ✅ Más escalable       |

---

## 🎯 Eventos en React Native

### Eventos Táctiles

React Native usa eventos táctiles en lugar de clicks de mouse.

```tsx
/**
 * Eventos Táctiles - Diferentes tipos
 *
 * ¿Para qué? Detectar interacciones del usuario
 * ¿Cómo? Props onPress, onLongPress, etc.
 */
import { View, Text, TouchableOpacity, Alert } from 'react-native'

export default function TouchEvents(): JSX.Element {
  const handlePress = (): void => {
    Alert.alert('Evento', 'Presión normal')
  }

  const handleLongPress = (): void => {
    Alert.alert('Evento', 'Presión prolongada (long press)')
  }

  const handlePressIn = (): void => {
    console.log('Dedo tocó la pantalla')
  }

  const handlePressOut = (): void => {
    console.log('Dedo se levantó de la pantalla')
  }

  return (
    <View className="flex-1 bg-white items-center justify-center p-5">
      {/* Presión normal */}
      <TouchableOpacity
        onPress={handlePress}
        className="bg-blue-600 px-8 py-4 rounded-lg mb-4 w-full"
      >
        <Text className="text-white text-center text-lg font-bold">
          Presionar Normal
        </Text>
      </TouchableOpacity>

      {/* Presión prolongada */}
      <TouchableOpacity
        onLongPress={handleLongPress}
        delayLongPress={1000} // 1 segundo
        className="bg-purple-600 px-8 py-4 rounded-lg mb-4 w-full"
      >
        <Text className="text-white text-center text-lg font-bold">
          Mantener Presionado (1s)
        </Text>
      </TouchableOpacity>

      {/* Eventos de entrada/salida */}
      <TouchableOpacity
        onPressIn={handlePressIn}
        onPressOut={handlePressOut}
        className="bg-green-600 px-8 py-4 rounded-lg w-full"
      >
        <Text className="text-white text-center text-lg font-bold">
          Ver Console (PressIn/Out)
        </Text>
      </TouchableOpacity>
    </View>
  )
}
```

**Tipos de eventos táctiles:**

| Evento        | Cuándo se dispara             |
| ------------- | ----------------------------- |
| `onPress`     | Al tocar y soltar rápidamente |
| `onLongPress` | Al mantener presionado        |
| `onPressIn`   | Al inicio del toque           |
| `onPressOut`  | Al levantar el dedo           |

---

### Eventos de TextInput

```tsx
/**
 * Eventos de TextInput - Validación en tiempo real
 *
 * ¿Para qué? Validar y formatear mientras el usuario escribe
 * ¿Cómo? Eventos onChangeText, onFocus, onBlur, onSubmitEditing
 */
import { View, Text, TextInput } from 'react-native'
import { useState } from 'react'

export default function InputEvents(): JSX.Element {
  const [text, setText] = useState<string>('')
  const [isFocused, setIsFocused] = useState<boolean>(false)
  const [hasError, setHasError] = useState<boolean>(false)

  const handleChangeText = (value: string): void => {
    setText(value)

    // Validación en tiempo real
    if (value.length > 0 && value.length < 3) {
      setHasError(true)
    } else {
      setHasError(false)
    }
  }

  const handleFocus = (): void => {
    setIsFocused(true)
    console.log('Input enfocado')
  }

  const handleBlur = (): void => {
    setIsFocused(false)
    console.log('Input perdió el foco')
  }

  const handleSubmit = (): void => {
    console.log('Enter presionado, valor:', text)
  }

  return (
    <View className="flex-1 bg-white p-5 justify-center">
      <Text className="text-xl font-bold mb-3">Eventos de Input</Text>

      <TextInput
        value={text}
        onChangeText={handleChangeText}
        onFocus={handleFocus}
        onBlur={handleBlur}
        onSubmitEditing={handleSubmit}
        placeholder="Escribe al menos 3 caracteres"
        className={`border-2 rounded-lg px-4 py-3 text-lg mb-2 ${
          hasError
            ? 'border-red-500 bg-red-50'
            : isFocused
            ? 'border-blue-500 bg-blue-50'
            : 'border-gray-300 bg-white'
        }`}
      />

      {/* Feedback visual */}
      {hasError && (
        <Text className="text-red-600 text-sm mb-2">
          ⚠️ Mínimo 3 caracteres
        </Text>
      )}

      <Text className="text-gray-600 text-sm">
        Estado: {isFocused ? '🟢 Enfocado' : '⚪ Sin foco'}
      </Text>

      <Text className="text-gray-600 text-sm">Caracteres: {text.length}</Text>
    </View>
  )
}
```

**Eventos disponibles:**

| Evento            | Descripción                            |
| ----------------- | -------------------------------------- |
| `onChangeText`    | Al cambiar el texto                    |
| `onFocus`         | Al enfocar el input (teclado aparece)  |
| `onBlur`          | Al perder el foco                      |
| `onSubmitEditing` | Al presionar Enter/Done en el teclado  |
| `onKeyPress`      | Al presionar cualquier tecla           |
| `onEndEditing`    | Al terminar de editar (similar a blur) |

---

## 🔄 Hook: `useEffect`

### ¿Qué es useEffect?

`useEffect` permite ejecutar **efectos secundarios** (side effects) en componentes funcionales:

- Llamadas a APIs
- Suscripciones
- Timers
- Manipulación del DOM
- Logging

```tsx
import { useEffect } from 'react'

useEffect(() => {
  // Código del efecto

  return () => {
    // Cleanup (opcional)
  }
}, [dependencias])
```

### Ejemplo 1: Efecto al Montar

```tsx
/**
 * useEffect al montar - Se ejecuta una sola vez
 *
 * ¿Para qué? Inicializar datos, cargar información
 * ¿Cómo? Array de dependencias vacío []
 */
import { View, Text } from 'react-native'
import { useState, useEffect } from 'react'

export default function MountEffect(): JSX.Element {
  const [message, setMessage] = useState<string>('Cargando...')

  useEffect(() => {
    console.log('Componente montado')

    // Simular carga de datos
    setTimeout(() => {
      setMessage('¡Datos cargados!')
    }, 2000)
  }, []) // ← Array vacío = solo se ejecuta al montar

  return (
    <View className="flex-1 bg-white items-center justify-center">
      <Text className="text-2xl font-bold text-gray-900">{message}</Text>
    </View>
  )
}
```

---

### Ejemplo 2: Efecto con Dependencias

```tsx
/**
 * useEffect con dependencias - Se ejecuta cuando cambian
 *
 * ¿Para qué? Reaccionar a cambios de estado/props
 * ¿Cómo? Incluir variables en el array de dependencias
 */
import { View, Text, TextInput } from 'react-native'
import { useState, useEffect } from 'react'

export default function DependencyEffect(): JSX.Element {
  const [search, setSearch] = useState<string>('')
  const [results, setResults] = useState<number>(0)

  // Se ejecuta cada vez que search cambia
  useEffect(() => {
    console.log('Buscando:', search)

    // Simular búsqueda
    if (search.length > 0) {
      setTimeout(() => {
        setResults(Math.floor(Math.random() * 100))
      }, 500)
    } else {
      setResults(0)
    }
  }, [search]) // ← Se ejecuta cuando search cambia

  return (
    <View className="flex-1 bg-white p-5 justify-center">
      <Text className="text-2xl font-bold mb-4">Buscador</Text>

      <TextInput
        value={search}
        onChangeText={setSearch}
        placeholder="Buscar..."
        className="border border-gray-300 rounded-lg px-4 py-3 mb-4"
      />

      <Text className="text-lg text-gray-700">
        Resultados: <Text className="font-bold">{results}</Text>
      </Text>
    </View>
  )
}
```

---

### Ejemplo 3: Cleanup Function

```tsx
/**
 * Cleanup - Limpiar efectos al desmontar
 *
 * ¿Para qué? Evitar memory leaks y bugs
 * ¿Cómo? Retornar función de limpieza en useEffect
 */
import { View, Text } from 'react-native'
import { useState, useEffect } from 'react'

export default function TimerWithCleanup(): JSX.Element {
  const [seconds, setSeconds] = useState<number>(0)

  useEffect(() => {
    console.log('Timer iniciado')

    // Crear intervalo
    const interval = setInterval(() => {
      setSeconds((prev) => prev + 1)
    }, 1000)

    // Cleanup: limpiar intervalo al desmontar
    return () => {
      console.log('Timer limpiado')
      clearInterval(interval)
    }
  }, [])

  return (
    <View className="flex-1 bg-white items-center justify-center">
      <Text className="text-6xl font-bold text-blue-600 mb-4">{seconds}</Text>
      <Text className="text-xl text-gray-600">segundos transcurridos</Text>
    </View>
  )
}
```

**¿Por qué cleanup es importante?**

- Previene memory leaks
- Cancela suscripciones activas
- Limpia timers/intervals
- Aborta peticiones HTTP pendientes

---

### Ejemplo 4: Múltiples useEffect

```tsx
/**
 * Múltiples useEffect - Separar responsabilidades
 *
 * ¿Para qué? Organizar lógica por preocupación
 * ¿Cómo? Un useEffect por cada efecto independiente
 */
import { View, Text } from 'react-native'
import { useState, useEffect } from 'react'

export default function MultipleEffects(): JSX.Element {
  const [count, setCount] = useState<number>(0)
  const [name, setName] = useState<string>('')

  // Efecto 1: Logging de count
  useEffect(() => {
    console.log('Count cambió a:', count)
  }, [count])

  // Efecto 2: Validar name
  useEffect(() => {
    if (name.length > 0) {
      console.log('Nombre válido:', name)
    }
  }, [name])

  // Efecto 3: Título del documento (solo al montar)
  useEffect(() => {
    console.log('Componente montado')

    return () => {
      console.log('Componente desmontado')
    }
  }, [])

  return <View className="flex-1 bg-white p-5">{/* UI aquí */}</View>
}
```

---

## 📝 Ejemplo Completo: TODO List

```tsx
/**
 * TODO List - Aplicación completa con estado y eventos
 *
 * ¿Para qué? Demostrar conceptos integrados
 * ¿Cómo? useState + eventos + renderizado condicional
 */
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  ScrollView,
  Alert,
} from 'react-native'
import { useState, useEffect } from 'react'

interface Todo {
  id: number
  text: string
  completed: boolean
}

export default function TodoList(): JSX.Element {
  const [todos, setTodos] = useState<Todo[]>([])
  const [inputText, setInputText] = useState<string>('')
  const [nextId, setNextId] = useState<number>(1)

  // Efecto: Log cuando cambia la lista
  useEffect(() => {
    console.log('Total de tareas:', todos.length)
    console.log('Completadas:', todos.filter((t) => t.completed).length)
  }, [todos])

  // Agregar nueva tarea
  const addTodo = (): void => {
    if (inputText.trim().length === 0) {
      Alert.alert('Error', 'Ingresa una tarea')
      return
    }

    const newTodo: Todo = {
      id: nextId,
      text: inputText.trim(),
      completed: false,
    }

    setTodos((prev) => [...prev, newTodo])
    setNextId((prev) => prev + 1)
    setInputText('') // Limpiar input
  }

  // Marcar como completada
  const toggleTodo = (id: number): void => {
    setTodos((prev) =>
      prev.map((todo) =>
        todo.id === id ? { ...todo, completed: !todo.completed } : todo
      )
    )
  }

  // Eliminar tarea
  const deleteTodo = (id: number): void => {
    Alert.alert('Confirmar', '¿Eliminar esta tarea?', [
      { text: 'Cancelar', style: 'cancel' },
      {
        text: 'Eliminar',
        style: 'destructive',
        onPress: () => {
          setTodos((prev) => prev.filter((todo) => todo.id !== id))
        },
      },
    ])
  }

  // Estadísticas
  const totalTodos = todos.length
  const completedTodos = todos.filter((t) => t.completed).length
  const pendingTodos = totalTodos - completedTodos

  return (
    <View className="flex-1 bg-gray-50">
      {/* Header */}
      <View className="bg-blue-600 pt-12 pb-6 px-5">
        <Text className="text-white text-3xl font-bold mb-2">Mis Tareas</Text>
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
          className="bg-blue-600 px-6 py-3 rounded-lg justify-center"
        >
          <Text className="text-white font-bold text-lg">+</Text>
        </TouchableOpacity>
      </View>

      {/* Lista de tareas */}
      <ScrollView className="flex-1">
        {todos.length === 0 ? (
          <View className="items-center justify-center py-20">
            <Text className="text-6xl mb-4">📝</Text>
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
                className="flex-row items-center bg-white p-4 mb-2 rounded-lg shadow-sm"
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
                    <Text className="text-white font-bold">✓</Text>
                  )}
                </TouchableOpacity>

                {/* Texto */}
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
                  className="bg-red-500 w-10 h-10 rounded-lg items-center justify-center"
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

---

## 🎯 Mejores Prácticas

### 1. Naming Conventions

```tsx
// ✅ BIEN: Nombres descriptivos
const [isLoading, setIsLoading] = useState<boolean>(false)
const [userData, setUserData] = useState<User | null>(null)
const [errorMessage, setErrorMessage] = useState<string>('')

// ❌ MAL: Nombres genéricos
const [data, setData] = useState(null)
const [flag, setFlag] = useState(false)
const [x, setX] = useState('')
```

### 2. Inicialización de Estado

```tsx
// ✅ BIEN: Tipo e inicial correctos
const [count, setCount] = useState<number>(0)
const [items, setItems] = useState<Item[]>([])
const [user, setUser] = useState<User | null>(null)

// ❌ MAL: Sin tipo o inicial incorrecto
const [count, setCount] = useState() // undefined
const [items, setItems] = useState([1, 2, 3]) // hardcoded
```

### 3. Actualización de Estado

```tsx
// ✅ BIEN: Usar función updater con prev
setCount((prev) => prev + 1)
setItems((prev) => [...prev, newItem])
setUser((prev) => ({ ...prev, name: 'Juan' }))

// ⚠️ FUNCIONA pero menos confiable
setCount(count + 1)
setItems([...items, newItem])

// ❌ MAL: Mutar directamente
items.push(newItem) // NO HACE NADA
setItems(items) // React no detecta cambio
```

### 4. Dependencias de useEffect

```tsx
// ✅ BIEN: Todas las dependencias listadas
useEffect(() => {
  fetchData(userId, filters)
}, [userId, filters])

// ❌ MAL: Falta dependencia
useEffect(() => {
  fetchData(userId, filters)
}, [userId]) // filters falta - bug potencial
```

### 5. Cleanup en useEffect

```tsx
// ✅ BIEN: Limpiar recursos
useEffect(() => {
  const timer = setInterval(() => {}, 1000)
  return () => clearInterval(timer)
}, [])

// ❌ MAL: Sin cleanup
useEffect(() => {
  setInterval(() => {}, 1000)
  // Memory leak - no se limpia
}, [])
```

---

## 🧪 Ejercicios Prácticos

### Ejercicio 1: Calculadora Simple (20 minutos)

Crea una calculadora que permita:

- Ingresar dos números
- Seleccionar operación (+, -, ×, ÷)
- Mostrar resultado
- Limpiar campos

**Requisitos:**

- Usar `useState` para los números y operación
- Validar división por cero
- TypeScript para todos los tipos

### Ejercicio 2: Registro de Usuario (25 minutos)

Crea un formulario de registro con:

- Nombre, email, contraseña, confirmar contraseña
- Validación en tiempo real:
  - Email debe ser válido
  - Contraseña mínimo 8 caracteres
  - Contraseñas deben coincidir
- Mostrar mensajes de error
- Deshabilitar botón si hay errores

**Pistas:**

- Un `useState` con objeto para el form
- Otro `useState` con objeto para errores
- `useEffect` para validar cuando cambian los campos

### Ejercicio 3: Temporizador Pomodoro (30 minutos)

Crea un temporizador Pomodoro:

- 25 minutos de trabajo, 5 de descanso
- Botones: Start, Pause, Reset
- Mostrar tiempo restante (MM:SS)
- Cambiar color según modo (trabajo/descanso)
- Sonido o alerta al terminar

**Desafío:**

- Usar `useEffect` para el intervalo
- Implementar cleanup correctamente
- Formatear tiempo a MM:SS

---

## ✅ Checklist de Verificación

Antes de continuar, asegúrate de:

- [ ] Entender qué es el estado y por qué es importante
- [ ] Usar `useState` con TypeScript correctamente
- [ ] Diferenciar entre estado y props
- [ ] Crear inputs controlados
- [ ] Manejar eventos táctiles (onPress, onLongPress)
- [ ] Usar `useEffect` para efectos secundarios
- [ ] Implementar cleanup functions
- [ ] Comprender el array de dependencias
- [ ] Aplicar mejores prácticas de naming
- [ ] Actualizar estado inmutablemente

---

## 📚 Recursos Adicionales

### Documentación Oficial

- [React Hooks Documentation](https://react.dev/reference/react)
- [useState Hook](https://react.dev/reference/react/useState)
- [useEffect Hook](https://react.dev/reference/react/useEffect)
- [Handling Events](https://reactnative.dev/docs/handling-touches)
- [TextInput Events](https://reactnative.dev/docs/textinput#events)

### Guías y Tutoriales

- [React Native Express - State](http://www.reactnativeexpress.com/hooks)
- [Thinking in React](https://react.dev/learn/thinking-in-react)
- [You Might Not Need an Effect](https://react.dev/learn/you-might-not-need-an-effect)

### Herramientas

- [React DevTools](https://reactnative.dev/docs/debugging#react-devtools)
- [TypeScript Playground](https://www.typescriptlang.org/play)

---

## 🔗 Navegación

- ⬅️ [Anterior: Estilos y Layouts](./04-estilos-layouts.md)
- 🏠 [Volver al índice de teoría](./README.md)

---

## 🎉 ¡Felicitaciones!

Has completado toda la **teoría de la Semana 1**. Ahora tienes las bases fundamentales de React Native:

- ✅ Conceptos de React Native y su arquitectura
- ✅ Entorno de desarrollo configurado
- ✅ Componentes básicos y su uso
- ✅ Layouts con Flexbox y TailwindCSS
- ✅ Estado y eventos con hooks

**Siguiente paso:** Practicar estos conceptos con ejercicios guiados y el proyecto integrador de la semana.

---

**Tiempo total completado:** ~6 horas (sesión presencial completa)  
**Próximo módulo:** Prácticas guiadas (`2-practicas/`)
