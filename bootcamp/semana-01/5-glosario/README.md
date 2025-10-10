# 📖 Glosario - Semana 1: Fundamentos de React Native

Términos técnicos, conceptos clave y definiciones del vocabulario de React Native.

---

## 🎯 Cómo Usar Este Glosario

- 📚 **Consulta rápida:** Busca términos específicos con Ctrl+F
- 🔤 **Orden alfabético:** Términos organizados de A-Z
- 💡 **Ejemplos:** Muchos términos incluyen ejemplos de código
- 🔗 **Referencias cruzadas:** Links entre términos relacionados

---

## A

### API (Application Programming Interface)

**Definición:** Conjunto de funciones y procedimientos que permiten la comunicación entre diferentes componentes de software.

**En React Native:** Usamos APIs para acceder a funcionalidades nativas del dispositivo (cámara, GPS, etc.) y para comunicarnos con servidores.

**Ejemplo:**

```typescript
// API de Fetch para llamar a un servidor
fetch('https://api.example.com/users')
  .then((response) => response.json())
  .then((data) => console.log(data))
```

**Ver también:** [REST API](#rest-api), [Fetch](#fetch)

---

### Arrow Function

**Definición:** Sintaxis corta para escribir funciones en JavaScript (ES6+). Usa `=>` en lugar de `function`.

**Ventajas:** Sintaxis más limpia, no re-asigna `this`.

**Ejemplo:**

```typescript
// Función tradicional
function suma(a, b) {
  return a + b
}

// Arrow function
const suma = (a, b) => a + b

// Arrow function en componente
const MiComponente = () => {
  return (
    <View>
      <Text>Hola</Text>
    </View>
  )
}
```

**Ver también:** [ES6](#es6), [Function Component](#function-component)

---

### Async/Await

**Definición:** Sintaxis moderna de JavaScript para manejar código asíncrono de forma más legible.

**Uso en RN:** Para llamadas a APIs, lectura de archivos, acceso a bases de datos.

**Ejemplo:**

```typescript
const fetchUser = async () => {
  try {
    const response = await fetch('https://api.example.com/user')
    const data = await response.json()
    console.log(data)
  } catch (error) {
    console.error(error)
  }
}
```

**Ver también:** [Promise](#promise), [API](#api)

---

### AsyncStorage

**Definición:** Sistema de almacenamiento persistente, asíncrono y no encriptado para React Native. Similar a localStorage en web.

**Uso:** Guardar configuraciones, datos de usuario, cache.

**Ejemplo:**

```typescript
import AsyncStorage from '@react-native-async-storage/async-storage'

// Guardar
await AsyncStorage.setItem('user', JSON.stringify(userData))

// Leer
const user = await AsyncStorage.getItem('user')
```

**Ver también:** [Storage](#storage), [Expo SecureStore](#expo-securestore)

---

## B

### Babel

**Definición:** Compilador de JavaScript que transforma código moderno (ES6+, JSX) a JavaScript compatible con todos los navegadores/plataformas.

**En React Native:** Babel convierte tu código JSX y TypeScript a JavaScript que puede ejecutarse en iOS y Android.

**Ejemplo de configuración:**

```javascript
// babel.config.js
module.exports = {
  presets: ['babel-preset-expo'],
  plugins: ['nativewind/babel'],
}
```

**Ver también:** [JSX](#jsx), [TypeScript](#typescript)

---

### Bundler

**Definición:** Herramienta que empaqueta todos los archivos de tu app (JS, assets, etc.) en un bundle ejecutable.

**En React Native:** Metro Bundler es el bundler por defecto.

**Ver también:** [Metro](#metro)

---

## C

### Component (Componente)

**Definición:** Pieza reutilizable de UI que encapsula lógica y presentación. Los componentes son los bloques básicos de construcción en React Native.

**Tipos:**

- **Funcional:** Usa hooks (moderno, recomendado)
- **Clase:** Usa lifecycle methods (legacy)

**Ejemplo:**

```typescript
// Componente funcional
function Saludo({ nombre }: { nombre: string }) {
  return <Text>Hola {nombre}</Text>
}

// Uso
;<Saludo nombre="Juan" />
```

**Ver también:** [Props](#props), [State](#state), [Hooks](#hooks)

---

### className

**Definición:** Atributo usado por NativeWind para aplicar clases de TailwindCSS a componentes de React Native.

**Ejemplo:**

```typescript
<View className="bg-blue-500 p-4 rounded-lg">
  <Text className="text-white font-bold">Hola</Text>
</View>
```

**Ver también:** [NativeWind](#nativewind), [TailwindCSS](#tailwindcss)

---

### Conditional Rendering

**Definición:** Renderizar componentes o elementos solo si se cumple una condición.

**Métodos:**

```typescript
// Con &&
{
  isLoggedIn && <Text>Bienvenido</Text>
}

// Con ternario
{
  isLoggedIn ? <Text>Bienvenido</Text> : <Text>Inicia sesión</Text>
}

// Con if/else (fuera del JSX)
if (isLoggedIn) {
  return <Dashboard />
} else {
  return <Login />
}
```

**Ver también:** [JSX](#jsx), [State](#state)

---

## D

### Destructuring (Desestructuración)

**Definición:** Sintaxis de ES6 para extraer valores de objetos o arrays de forma concisa.

**Ejemplo:**

```typescript
// Objetos
const user = { name: 'Juan', age: 25 }
const { name, age } = user

// Arrays
const colors = ['red', 'green', 'blue']
const [first, second] = colors

// Props
function Card({ title, description }: CardProps) {
  return <View>...</View>
}
```

**Ver también:** [Props](#props), [ES6](#es6)

---

### DevTools

**Definición:** Herramientas de desarrollo para inspeccionar, debuggear y optimizar tu aplicación.

**En React Native:**

- React DevTools (inspeccionar componentes)
- Chrome DevTools (console, network)
- Expo DevTools (Expo específico)

**Ver también:** [Debugging](#debugging)

---

## E

### ES6 (ECMAScript 2015)

**Definición:** Versión moderna de JavaScript con nuevas features como arrow functions, destructuring, classes, modules, etc.

**Features clave:**

- Arrow functions: `() => {}`
- Template literals: `` `Hola ${nombre}` ``
- Destructuring: `const { x, y } = obj`
- Spread operator: `...array`
- Classes: `class MyClass {}`
- Modules: `import/export`

**Ver también:** [Arrow Function](#arrow-function), [Destructuring](#destructuring)

---

### Expo

**Definición:** Plataforma y conjunto de herramientas que facilita el desarrollo de apps React Native. Incluye APIs, build services y Expo Go.

**Ventajas:**

- Setup rápido (sin Xcode/Android Studio)
- APIs nativas pre-configuradas
- Expo Go para testing rápido
- Build service en la nube

**Ejemplo:**

```bash
npx create-expo-app mi-app
cd mi-app
pnpm start
```

**Ver también:** [Expo Go](#expo-go), [SDK](#sdk)

---

### Expo Go

**Definición:** App móvil que permite ejecutar proyectos Expo en desarrollo sin necesidad de compilar la app.

**Uso:** Escanea el QR code generado por `pnpm start` y tu app corre instantáneamente.

**Ver también:** [Expo](#expo), [Hot Reload](#hot-reload)

---

### Expo SecureStore

**Definición:** API de Expo para almacenar datos de forma segura y encriptada en el dispositivo.

**Uso:** Tokens de autenticación, contraseñas, datos sensibles.

**Ejemplo:**

```typescript
import * as SecureStore from 'expo-secure-store'

// Guardar
await SecureStore.setItemAsync('token', authToken)

// Leer
const token = await SecureStore.getItemAsync('token')
```

**Ver también:** [AsyncStorage](#asyncstorage)

---

## F

### Fetch

**Definición:** API nativa de JavaScript para realizar peticiones HTTP (GET, POST, etc.).

**Ejemplo:**

```typescript
// GET request
const response = await fetch('https://api.example.com/users')
const data = await response.json()

// POST request
const response = await fetch('https://api.example.com/users', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({ name: 'Juan', email: 'juan@example.com' }),
})
```

**Ver también:** [API](#api), [Async/Await](#asyncawait)

---

### Flexbox

**Definición:** Sistema de layout CSS para organizar elementos de forma flexible. Es el sistema principal de layouts en React Native.

**Propiedades clave:**

```typescript
<View style={{
  flexDirection: 'row',      // dirección: row | column
  justifyContent: 'center',  // eje principal
  alignItems: 'center',      // eje cruzado
  flex: 1                    // crecimiento flexible
}}>
```

**Ver también:** [Layout](#layout), [StyleSheet](#stylesheet)

---

### FlatList

**Definición:** Componente optimizado para renderizar listas largas en React Native. Solo renderiza los elementos visibles (virtualización).

**Ejemplo:**

```typescript
<FlatList
  data={items}
  renderItem={({ item }) => <Text>{item.name}</Text>}
  keyExtractor={(item) => item.id}
/>
```

**Ver también:** [ScrollView](#scrollview), [Virtualization](#virtualization)

---

### Function Component

**Definición:** Componente de React definido como una función (en lugar de clase). Usa hooks para estado y efectos.

**Ejemplo:**

```typescript
function MiComponente() {
  const [count, setCount] = useState(0)

  return (
    <View>
      <Text>{count}</Text>
      <Button onPress={() => setCount(count + 1)} />
    </View>
  )
}
```

**Ver también:** [Component](#component), [Hooks](#hooks)

---

## G

### Git

**Definición:** Sistema de control de versiones para rastrear cambios en código.

**Comandos básicos:**

```bash
git init              # Iniciar repo
git add .             # Agregar archivos
git commit -m "msg"   # Guardar cambios
git push              # Subir a GitHub
```

**Ver también:** [GitHub](#github)

---

### GitHub

**Definición:** Plataforma web para alojar repositorios Git y colaborar en código.

**Ver también:** [Git](#git)

---

## H

### Hooks

**Definición:** Funciones especiales de React que permiten usar estado y otras features en componentes funcionales.

**Hooks principales:**

- `useState`: Manejo de estado
- `useEffect`: Efectos secundarios
- `useContext`: Acceso a contexto
- `useCallback`: Memoizar funciones
- `useMemo`: Memoizar valores

**Ejemplo:**

```typescript
function Counter() {
  const [count, setCount] = useState(0)

  useEffect(() => {
    console.log(`Count: ${count}`)
  }, [count])

  return <Text>{count}</Text>
}
```

**Ver también:** [useState](#usestate), [useEffect](#useeffect)

---

### Hot Reload

**Definición:** Funcionalidad que actualiza la app automáticamente al guardar cambios en el código, sin perder el estado.

**En React Native:** Se activa automáticamente durante desarrollo.

**Ver también:** [Fast Refresh](#fast-refresh), [Expo Go](#expo-go)

---

## I

### Interface (TypeScript)

**Definición:** Contrato que define la estructura de un objeto en TypeScript. Especifica qué propiedades y tipos debe tener.

**Ejemplo:**

```typescript
interface User {
  id: string
  name: string
  email: string
  age?: number // opcional
}

interface CardProps {
  title: string
  description: string
  onPress: () => void
}

function Card({ title, description, onPress }: CardProps) {
  return <View>...</View>
}
```

**Ver también:** [TypeScript](#typescript), [Props](#props)

---

## J

### JSX (JavaScript XML)

**Definición:** Extensión de sintaxis de JavaScript que permite escribir markup similar a HTML dentro de JavaScript.

**Ejemplo:**

```typescript
// JSX
const element = <Text>Hola Mundo</Text>

// Con expresiones JS
const name = 'Juan'
const greeting = <Text>Hola {name}</Text>

// Con componentes
const App = () => {
  return (
    <View>
      <Text>Título</Text>
      <Button title="Click" onPress={() => {}} />
    </View>
  )
}
```

**Reglas:**

- Solo un elemento raíz (usa `<View>` o `<>` Fragment)
- Atributos en camelCase: `onClick`, `className`
- Expresiones JS entre `{}`

**Ver también:** [Component](#component), [Babel](#babel)

---

## K

### Key (en listas)

**Definición:** Prop especial que ayuda a React a identificar qué elementos de una lista han cambiado.

**Ejemplo:**

```typescript
{
  items.map((item) => <Card key={item.id} title={item.title} />)
}

// Con FlatList
;<FlatList
  data={items}
  keyExtractor={(item) => item.id}
  renderItem={({ item }) => <Card {...item} />}
/>
```

**Importante:** Las keys deben ser únicas y estables (no usar índices).

**Ver también:** [FlatList](#flatlist), [Map](#map)

---

## L

### Layout

**Definición:** Organización y posicionamiento de elementos en la pantalla.

**En React Native:** Se usa principalmente Flexbox.

**Ver también:** [Flexbox](#flexbox), [StyleSheet](#stylesheet)

---

## M

### Map (método de array)

**Definición:** Método de JavaScript que transforma cada elemento de un array y retorna un nuevo array.

**En React Native:** Se usa frecuentemente para renderizar listas.

**Ejemplo:**

```typescript
const numbers = [1, 2, 3, 4]
const doubled = numbers.map((n) => n * 2) // [2, 4, 6, 8]

// Renderizar lista
{
  users.map((user) => <Text key={user.id}>{user.name}</Text>)
}
```

**Ver también:** [Key](#key), [FlatList](#flatlist)

---

### Metro

**Definición:** Bundler de JavaScript usado por React Native para empaquetar el código de la app.

**Comandos:**

```bash
pnpm start           # Inicia Metro
pnpm start --clear   # Inicia limpiando caché
```

**Ver también:** [Bundler](#bundler)

---

## N

### NativeWind

**Definición:** Librería que permite usar utilidades de TailwindCSS en React Native.

**Ejemplo:**

```typescript
<View className="bg-blue-500 p-4 rounded-lg">
  <Text className="text-white font-bold text-xl">Título</Text>
</View>
```

**Ver también:** [TailwindCSS](#tailwindcss), [className](#classname)

---

### npm / pnpm

**Definición:** Gestores de paquetes para JavaScript. Instalan y gestionan librerías y dependencias.

**En este bootcamp usamos:** pnpm (más rápido y eficiente)

**Comandos:**

```bash
pnpm install        # Instalar dependencias
pnpm add <librería> # Agregar librería
pnpm start          # Iniciar proyecto
```

**Ver también:** [Package Manager](#package-manager)

---

## O

### onPress

**Definición:** Prop que se ejecuta cuando el usuario toca un elemento.

**Ejemplo:**

```typescript
<TouchableOpacity onPress={() => console.log('Presionado')}>
  <Text>Tócame</Text>
</TouchableOpacity>

<Button
  title="Click"
  onPress={handlePress}
/>
```

**Ver también:** [TouchableOpacity](#touchableopacity), [Event Handler](#event-handler)

---

## P

### Package Manager

**Definición:** Herramienta para instalar, actualizar y gestionar dependencias de un proyecto.

**Opciones:** npm, yarn, pnpm (usamos pnpm)

**Ver también:** [pnpm](#npm--pnpm)

---

### Props

**Definición:** Propiedades que se pasan de un componente padre a un hijo. Son inmutables (read-only).

**Ejemplo:**

```typescript
// Definir componente con props
interface CardProps {
  title: string
  description: string
}

function Card({ title, description }: CardProps) {
  return (
    <View>
      <Text>{title}</Text>
      <Text>{description}</Text>
    </View>
  )
}

// Usar componente
;<Card title="Mi Título" description="Mi descripción" />
```

**Ver también:** [Component](#component), [Interface](#interface-typescript)

---

### Promise

**Definición:** Objeto que representa la eventual finalización (o falla) de una operación asíncrona.

**Estados:** pending, fulfilled, rejected

**Ejemplo:**

```typescript
fetch('https://api.example.com/users')
  .then((response) => response.json())
  .then((data) => console.log(data))
  .catch((error) => console.error(error))

// Con async/await (preferido)
try {
  const response = await fetch('...')
  const data = await response.json()
} catch (error) {
  console.error(error)
}
```

**Ver también:** [Async/Await](#asyncawait), [Fetch](#fetch)

---

## R

### React

**Definición:** Librería de JavaScript para construir interfaces de usuario. React Native está basado en React.

**Ver también:** [React Native](#react-native)

---

### React Native

**Definición:** Framework para construir aplicaciones móviles nativas usando React y JavaScript/TypeScript.

**Ventajas:**

- Código compartido entre iOS y Android
- Ecosistema de React
- Hot Reload
- Performance nativo

**Ver también:** [Expo](#expo), [Metro](#metro)

---

### renderItem

**Definición:** Función que define cómo renderizar cada elemento en FlatList o SectionList.

**Ejemplo:**

```typescript
<FlatList
  data={users}
  renderItem={({ item, index }) => (
    <View>
      <Text>
        {index}. {item.name}
      </Text>
    </View>
  )}
/>
```

**Ver también:** [FlatList](#flatlist)

---

### REST API

**Definición:** Arquitectura para crear servicios web que usan HTTP para CRUD (Create, Read, Update, Delete).

**Verbos HTTP:**

- GET: Leer datos
- POST: Crear datos
- PUT/PATCH: Actualizar datos
- DELETE: Eliminar datos

**Ver también:** [API](#api), [Fetch](#fetch)

---

## S

### SafeAreaView

**Definición:** Componente que renderiza contenido dentro del área segura de un dispositivo (evita notch, barras de estado, etc.).

**Ejemplo:**

```typescript
<SafeAreaView style={{ flex: 1 }}>
  <Text>Contenido seguro</Text>
</SafeAreaView>
```

**Ver también:** [View](#view)

---

### ScrollView

**Definición:** Componente que permite hacer scroll vertical u horizontal del contenido.

**Cuándo usar:** Para contenido limitado (pocas decenas de elementos)

**Ejemplo:**

```typescript
<ScrollView>
  <Text>Contenido largo...</Text>
  <Text>Más contenido...</Text>
</ScrollView>
```

**Ver también:** [FlatList](#flatlist), [View](#view)

---

### SDK (Software Development Kit)

**Definición:** Conjunto de herramientas para desarrollar en una plataforma específica.

**Expo SDK:** Conjunto de APIs y componentes nativos que Expo proporciona.

**Ver también:** [Expo](#expo)

---

### Spread Operator (...)

**Definición:** Operador de ES6 que expande elementos de arrays u objetos.

**Ejemplo:**

```typescript
// Arrays
const arr1 = [1, 2, 3]
const arr2 = [...arr1, 4, 5]  // [1, 2, 3, 4, 5]

// Objetos
const user = { name: 'Juan', age: 25 }
const updatedUser = { ...user, age: 26 }

// Props
<Card {...cardData} />  // Pasa todas las props
```

**Ver también:** [ES6](#es6), [Props](#props)

---

### State (Estado)

**Definición:** Datos internos de un componente que pueden cambiar a lo largo del tiempo. Cuando el estado cambia, el componente se re-renderiza.

**Gestión:** Con hook `useState` en componentes funcionales.

**Ejemplo:**

```typescript
function Counter() {
  const [count, setCount] = useState(0)

  return (
    <View>
      <Text>{count}</Text>
      <Button title="+" onPress={() => setCount(count + 1)} />
    </View>
  )
}
```

**Ver también:** [useState](#usestate), [Props](#props)

---

### StyleSheet

**Definición:** API de React Native para crear estilos de forma optimizada.

**Ejemplo:**

```typescript
import { StyleSheet } from 'react-native'

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
  },
})

// Uso
<View style={styles.container}>
  <Text style={styles.title}>Título</Text>
</View>
```

**Ver también:** [Flexbox](#flexbox), [NativeWind](#nativewind)

---

## T

### TailwindCSS

**Definición:** Framework CSS con clases utilitarias para construir diseños rápidamente.

**En React Native:** Usamos NativeWind para aplicar Tailwind.

**Ejemplo:**

```typescript
<View className="bg-blue-500 p-4 rounded-lg">
  <Text className="text-white font-bold">Texto</Text>
</View>
```

**Ver también:** [NativeWind](#nativewind), [className](#classname)

---

### Template Literals

**Definición:** Strings de ES6 que permiten interpolación de variables y strings multilínea.

**Sintaxis:** Usar backticks `` ` `` en lugar de comillas

**Ejemplo:**

```typescript
const name = 'Juan'
const age = 25

// Interpolación
const greeting = `Hola ${name}, tienes ${age} años`

// Multilínea
const text = `
  Primera línea
  Segunda línea
  Tercera línea
`
```

**Ver también:** [ES6](#es6)

---

### TouchableOpacity

**Definición:** Componente que responde al toque reduciendo la opacidad. Usado para crear botones personalizados.

**Ejemplo:**

```typescript
<TouchableOpacity onPress={handlePress}>
  <View style={styles.button}>
    <Text>Presionar</Text>
  </View>
</TouchableOpacity>
```

**Ver también:** [onPress](#onpress), [Button](#button)

---

### TypeScript

**Definición:** Superset de JavaScript que agrega tipado estático.

**Ventajas:**

- Detecta errores en tiempo de desarrollo
- Autocompletado mejorado
- Refactoring seguro
- Documentación implícita

**Ejemplo:**

```typescript
// JavaScript (sin tipos)
function suma(a, b) {
  return a + b
}

// TypeScript (con tipos)
function suma(a: number, b: number): number {
  return a + b
}
```

**Ver también:** [Interface](#interface-typescript)

---

## U

### URI (Uniform Resource Identifier)

**Definición:** Identificador de recursos. En RN se usa para imágenes remotas.

**Ejemplo:**

```typescript
<Image
  source={{ uri: 'https://example.com/image.jpg' }}
  style={{ width: 100, height: 100 }}
/>
```

**Ver también:** [Image](#image)

---

### useEffect

**Definición:** Hook de React para ejecutar efectos secundarios (llamadas a API, suscripciones, timers, etc.).

**Sintaxis:**

```typescript
useEffect(() => {
  // Efecto (se ejecuta después del render)

  return () => {
    // Limpieza (opcional)
  }
}, [dependencies]) // Array de dependencias
```

**Ejemplos:**

```typescript
// Ejecutar solo una vez (al montar)
useEffect(() => {
  fetchData()
}, [])

// Ejecutar cuando cambie 'count'
useEffect(() => {
  console.log(`Count: ${count}`)
}, [count])

// Ejecutar en cada render (evitar!)
useEffect(() => {
  console.log('Cada render')
})
```

**Ver también:** [Hooks](#hooks), [useState](#usestate)

---

### useState

**Definición:** Hook de React para agregar estado local a un componente funcional.

**Sintaxis:**

```typescript
const [valor, setValor] = useState(valorInicial)
```

**Ejemplos:**

```typescript
// String
const [name, setName] = useState('Juan')

// Number
const [count, setCount] = useState(0)

// Boolean
const [isVisible, setIsVisible] = useState(true)

// Object
const [user, setUser] = useState({ name: 'Juan', age: 25 })

// Array
const [items, setItems] = useState([])
```

**Ver también:** [Hooks](#hooks), [State](#state)

---

## V

### View

**Definición:** Componente fundamental de React Native. Similar a un `<div>` en web. Contenedor básico para layouts.

**Ejemplo:**

```typescript
<View style={{ flex: 1, padding: 20 }}>
  <Text>Contenido</Text>
</View>
```

**Ver también:** [SafeAreaView](#safeareaview), [ScrollView](#scrollview)

---

### Virtualization

**Definición:** Técnica que renderiza solo los elementos visibles en pantalla para optimizar performance.

**En React Native:** FlatList implementa virtualización automáticamente.

**Ver también:** [FlatList](#flatlist)

---

## W

### Wrapper (Componente Envolvente)

**Definición:** Componente que envuelve a otros componentes agregando funcionalidad o estilos adicionales.

**Ejemplo:**

```typescript
function Container({ children }) {
  return <View style={styles.container}>{children}</View>
}

// Uso
;<Container>
  <Text>Contenido</Text>
  <Button title="Click" />
</Container>
```

---

## Símbolos y Operadores

### `=>` (Arrow Function)

Ver [Arrow Function](#arrow-function)

### `...` (Spread Operator)

Ver [Spread Operator](#spread-operator)

### `{}` (Expresiones JSX)

**Uso:** Para insertar código JavaScript dentro de JSX.

**Ejemplo:**

```typescript
<Text>{variable}</Text>
<Text>{2 + 2}</Text>
<Text>{user.name}</Text>
<Button onPress={() => console.log('Click')} />
```

### `?.` (Optional Chaining)

**Definición:** Operador para acceder a propiedades que pueden ser undefined/null sin errores.

**Ejemplo:**

```typescript
const name = user?.profile?.name
// Si user o profile es undefined, name será undefined (no error)

// Sin optional chaining (antigua forma)
const name = user && user.profile && user.profile.name
```

### `??` (Nullish Coalescing)

**Definición:** Operador que retorna el operando derecho si el izquierdo es `null` o `undefined`.

**Ejemplo:**

```typescript
const value = data ?? 'default'
// Si data es null o undefined, usa 'default'

const count = 0
const result = count ?? 10 // result = 0 (no usa 10)
const result2 = count || 10 // result2 = 10 (|| considera 0 como falsy)
```

---

## 📚 Términos por Categoría

### React Native Core:

[Component](#component), [Props](#props), [State](#state), [Hooks](#hooks), [JSX](#jsx)

### Componentes Básicos:

[View](#view), [SafeAreaView](#safeareaview), [ScrollView](#scrollview), [FlatList](#flatlist), [TouchableOpacity](#touchableopacity)

### Estilos:

[StyleSheet](#stylesheet), [Flexbox](#flexbox), [TailwindCSS](#tailwindcss), [NativeWind](#nativewind), [className](#classname)

### TypeScript:

[TypeScript](#typescript), [Interface](#interface-typescript)

### JavaScript Moderno:

[ES6](#es6), [Arrow Function](#arrow-function), [Destructuring](#destructuring), [Spread Operator](#spread-operator), [Template Literals](#template-literals), [Async/Await](#asyncawait), [Promise](#promise)

### Expo:

[Expo](#expo), [Expo Go](#expo-go), [SDK](#sdk)

### Herramientas:

[Git](#git), [GitHub](#github), [npm/pnpm](#npm--pnpm), [Metro](#metro), [Babel](#babel)

---

## 💡 Cómo Estudiar Este Glosario

### Para Principiantes:

1. Lee términos marcados como fundamentales
2. No intentes memorizar todo
3. Vuelve cuando encuentres un término desconocido
4. Enfócate en los ejemplos prácticos

### Para Preparar Exámenes:

1. Lee las definiciones completas
2. Comprende las relaciones entre términos
3. Practica los ejemplos de código
4. Crea tus propios ejemplos

### Como Referencia Rápida:

1. Usa Ctrl+F para buscar
2. Lee solo la definición
3. Ve el ejemplo si es necesario

---

## ⚠️ Nota Importante

Este glosario cubre términos de la **Semana 1**. En semanas posteriores se agregarán más términos específicos de navegación, estado global, APIs avanzadas, etc.

---

## 🆕 Actualizaciones

**Última revisión:** Octubre 2025  
**Versión:** 1.0

---

_Glosario de Fundamentos - Semana 1 - React Native_  
_Bootcamp React Native 2025_
