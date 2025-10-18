# 🔒 Solucionario Bugs - Semana 1

> **CONFIDENCIAL - SOLO PARA INSTRUCTORES**  
> Este documento contiene las soluciones completas de los 5 bugs de la semana 1.

---

## 📋 Resumen de Bugs

| #   | Archivo    | Línea           | Tipo              | Severidad | Dificultad |
| --- | ---------- | --------------- | ----------------- | --------- | ---------- |
| 1   | App.js     | 15              | Obvio             | 🔴 Alta   | Fácil      |
| 2   | Card.js    | 47-48           | Sutil             | 🟠 Media  | Media      |
| 3   | Home.js    | 80-88           | Mejores Prácticas | 🟡 Baja   | Fácil      |
| 4   | theme.js   | Todo el archivo | Sutil             | 🟠 Media  | Difícil    |
| 5   | helpers.js | 30              | Obvio             | 🔴 Alta   | Fácil      |

---

## 🐛 Bug #1: Import Incorrecto

### 📍 Ubicación

- **Archivo:** `App.js`
- **Línea:** 15
- **Tipo:** Obvio (Error de sintaxis)
- **Severidad:** 🔴 Alta

### ❌ Código con Bug

```javascript
import { react-native } from 'react-native';
```

### ✅ Código Corregido

```javascript
import { SafeAreaView, StyleSheet } from 'react-native'
```

### 📝 Explicación

**¿Por qué es un bug?**

- `react-native` no es un export válido, es el nombre del paquete
- La sintaxis `{ react-native }` es incorrecta
- Los guiones en nombres de variables no son válidos en JavaScript

**¿Cómo se manifiesta?**

- Error de compilación inmediato
- La app no inicia
- Mensaje: "Unexpected token" o similar

**¿Qué aprende el estudiante?**

- Sintaxis correcta de imports en ES6
- Diferencia entre importar el paquete vs importar exports específicos
- Cómo leer errores de sintaxis

**Pistas progresivas para dar:**

1. "Revisa la sintaxis del import"
2. "¿Los nombres con guiones son válidos en JavaScript?"
3. "Mira los ejemplos de la documentación oficial de imports"

---

## 🐛 Bug #2: Mutación Directa del Estado

### 📍 Ubicación

- **Archivo:** `components/Card.js`
- **Líneas:** 47-48
- **Tipo:** Sutil (Anti-patrón de React)
- **Severidad:** 🟠 Media

### ❌ Código con Bug

```javascript
const handleLike = () => {
  setLikes(likes + 1)

  // 🐛 Mutación directa
  likeHistory.push(new Date().toISOString())
  setLikeHistory(likeHistory)
}
```

### ✅ Código Corregido

```javascript
const handleLike = () => {
  setLikes(likes + 1)

  // ✅ Crear nuevo array
  setLikeHistory([...likeHistory, new Date().toISOString()])
}
```

### 📝 Explicación

**¿Por qué es un bug?**

- React compara referencias de objetos/arrays para detectar cambios
- `likeHistory.push()` muta el array existente
- La referencia del array no cambia, React no detecta el cambio
- El componente no se re-renderiza aunque el estado "cambió"

**¿Cómo se manifiesta?**

- El contador de likes en el footer no actualiza visualmente
- `likeHistory.length` no cambia en la UI
- No hay error en consola (bug silencioso)
- El estado internamente cambia pero la UI no refleja el cambio

**¿Qué aprende el estudiante?**

- Principio de inmutabilidad en React
- Por qué React usa comparación por referencia
- Cómo crear copias de arrays con spread operator
- Diferencia entre mutar vs reemplazar

**Debugging steps:**

1. Agregar `console.log(likeHistory)` - verán que el array sí cambia
2. Agregar `console.log('render')` - verán que no se re-renderiza
3. Usar React DevTools para ver el estado

**Pistas progresivas:**

1. "¿El estado realmente está cambiando?"
2. "Investiga sobre inmutabilidad en React"
3. "¿Qué pasa si creas un nuevo array en lugar de mutar el existente?"

---

## 🐛 Bug #3: FlatList sin keyExtractor

### 📍 Ubicación

- **Archivo:** `screens/Home.js`
- **Líneas:** 80-88
- **Tipo:** Mejores Prácticas (Warning)
- **Severidad:** 🟡 Baja

### ❌ Código con Bug

```javascript
<FlatList
  data={filteredContacts}
  renderItem={renderContact}
  contentContainerStyle={styles.listContent}
  // Falta keyExtractor
/>
```

### ✅ Código Corregido

```javascript
<FlatList
  data={filteredContacts}
  renderItem={renderContact}
  keyExtractor={(item) => item.id}
  contentContainerStyle={styles.listContent}
/>
```

### 📝 Explicación

**¿Por qué es un bug?**

- FlatList necesita una key única para cada item
- Sin `keyExtractor`, usa el índice del array como key
- Esto causa problemas cuando el orden de items cambia
- React puede re-renderizar items incorrectos

**¿Cómo se manifiesta?**

- Warning en consola: "VirtualizedList: missing keys..."
- La app funciona normalmente
- Problemas potenciales al filtrar/reordenar la lista
- Pérdida de estado de items al reorganizar

**¿Qué aprende el estudiante?**

- Por qué las keys son importantes en listas
- Diferencia entre usar índice vs ID único
- Optimización de performance en React Native
- Cómo leer y resolver warnings

**Scenarios problemáticos:**

```javascript
// Si filtras la lista:
// Item con key "0" puede renderizar datos diferentes
// porque el índice 0 ahora apunta a otro contacto

// Si reordenas:
// React puede reutilizar componentes incorrectamente
```

**Pistas progresivas:**

1. "Revisa la consola, ¿hay algún warning?"
2. "Busca en la documentación de FlatList sobre keys"
3. "¿Cada item de tu data tiene algo único?"

---

## 🐛 Bug #4: Colores Hardcodeados

### 📍 Ubicación

- **Archivo:** `styles/theme.js` (todo el archivo)
- **Archivos afectados:** App.js, Card.js, Home.js
- **Tipo:** Sutil (Arquitectura/Mantenibilidad)
- **Severidad:** 🟠 Media

### ❌ Código con Bug

**En theme.js:**

```javascript
export const theme = {
  colors: {
    primary: '#007AFF',
    // ...definidos pero no usados
  },
}
```

**En Card.js:**

```javascript
backgroundColor: 'white',    // ❌ hardcoded
color: '#333',               // ❌ hardcoded
backgroundColor: '#ff6b6b',  // ❌ hardcoded
```

**En Home.js:**

```javascript
backgroundColor: '#f5f5f5',  // ❌ hardcoded
color: '#666',               // ❌ hardcoded
borderColor: '#e0e0e0',      // ❌ hardcoded
```

### ✅ Código Corregido

**theme.js actualizado:**

```javascript
export const colors = {
  // Background
  background: '#f5f5f5',
  cardBackground: '#ffffff',

  // Text
  textPrimary: '#333333',
  textSecondary: '#666666',
  textTertiary: '#999999',

  // Accent
  like: '#ff6b6b',
  primary: '#007AFF',

  // Borders
  border: '#e0e0e0',
}

export default { colors }
```

**En componentes:**

```javascript
import { colors } from '../styles/theme'

const styles = StyleSheet.create({
  card: {
    backgroundColor: colors.cardBackground, // ✅ usando constante
  },
  title: {
    color: colors.textPrimary, // ✅ usando constante
  },
  // ...
})
```

### 📝 Explicación

**¿Por qué es un bug?**

- Los colores están repetidos en múltiples archivos
- Dificulta mantener consistencia visual
- Cambiar un color requiere editar múltiples archivos
- Aumenta el riesgo de inconsistencias

**¿Cómo se manifiesta?**

- La app funciona perfectamente
- No hay errores ni warnings
- El problema aparece al intentar cambiar el tema
- Requiere buscar y reemplazar en múltiples archivos

**¿Qué aprende el estudiante?**

- Principio DRY (Don't Repeat Yourself)
- Arquitectura escalable de estilos
- Separación de responsabilidades
- Design tokens concept

**Impacto en el mundo real:**

```javascript
// Sin constantes:
// Para cambiar el color de fondo hay que editar:
// - App.js: '#f5f5f5'
// - Home.js: '#f5f5f5'
// - 5 archivos más... (error prone)

// Con constantes:
// Solo cambiar en theme.js:
background: '#ffffff',  // ✅ cambio en un solo lugar
```

**Pistas progresivas:**

1. "¿Dónde están definidos los colores de la app?"
2. "Si quisieras cambiar el color de fondo, ¿cuántos archivos tendrías que editar?"
3. "Investiga sobre 'design tokens' o 'theme tokens'"

---

## 🐛 Bug #5: Función sin Return

### 📍 Ubicación

- **Archivo:** `utils/helpers.js`
- **Línea:** 30
- **Tipo:** Obvio (Error lógico)
- **Severidad:** 🔴 Alta

### ❌ Código con Bug

```javascript
export function formatFullName(firstName, lastName) {
  const capitalizedFirst =
    firstName.charAt(0).toUpperCase() + firstName.slice(1).toLowerCase()
  const capitalizedLast =
    lastName.charAt(0).toUpperCase() + lastName.slice(1).toLowerCase()

  // 🐛 Falta return
  ;`${capitalizedFirst} ${capitalizedLast}`
}
```

### ✅ Código Corregido

```javascript
export function formatFullName(firstName, lastName) {
  const capitalizedFirst =
    firstName.charAt(0).toUpperCase() + firstName.slice(1).toLowerCase()
  const capitalizedLast =
    lastName.charAt(0).toUpperCase() + lastName.slice(1).toLowerCase()

  // ✅ Con return
  return `${capitalizedFirst} ${capitalizedLast}`
}
```

### 📝 Explicación

**¿Por qué es un bug?**

- La función procesa los datos correctamente
- Pero no devuelve el resultado
- JavaScript retorna `undefined` por defecto
- Cualquier código que use esta función recibirá `undefined`

**¿Cómo se manifiesta?**

- Si se usa en la UI, mostrará "undefined" o nada
- `console.log(formatFullName("juan", "pérez"))` → `undefined`
- No hay error de compilación
- Error lógico que se detecta al usar la función

**¿Qué aprende el estudiante?**

- Importancia del return en funciones
- Diferencia entre ejecutar código vs devolver valores
- Cómo debuggear funciones con console.log
- Template literals no retornan automáticamente

**Testing para verificar:**

```javascript
// Test manual:
const result = formatFullName('juan', 'pérez')
console.log(result) // undefined ❌

// Después de arreglar:
console.log(result) // "Juan Pérez" ✅
```

**Pistas progresivas:**

1. "¿Qué devuelve la función cuando la llamas?"
2. "Agrega console.log antes de la última línea"
3. "¿Qué hace una función cuando no tiene return?"

---

## 📊 Estadísticas de Dificultad

### Por Tipo

- **Obvios (40%):** Bugs #1, #5 - La app no funciona correctamente
- **Sutiles (40%):** Bugs #2, #4 - La app funciona pero incorrectamente
- **Mejores Prácticas (20%):** Bug #3 - Warning, no error crítico

### Por Dificultad de Encontrar

- **Fácil:** Bugs #1, #3, #5 (errores claros o warnings)
- **Media:** Bug #2 (requiere testing)
- **Difícil:** Bug #4 (requiere análisis de arquitectura)

### Tiempo Estimado de Resolución

- Bug #1: 5 minutos (error de sintaxis obvio)
- Bug #2: 15-20 minutos (requiere entender inmutabilidad)
- Bug #3: 5-10 minutos (warning claro en consola)
- Bug #4: 20-30 minutos (requiere refactorización)
- Bug #5: 5 minutos (error lógico simple)

**Total estimado:** 50-70 minutos para un estudiante promedio

---

## 🎓 Objetivos Pedagógicos

### Habilidades Desarrolladas

1. **Lectura crítica de código**
2. **Uso de herramientas de debugging** (consola, DevTools)
3. **Comprensión de errores vs warnings**
4. **Principios de React** (inmutabilidad, keys)
5. **Mejores prácticas** (DRY, arquitectura)
6. **Problem solving** (cómo abordar bugs desconocidos)

### Conceptos Clave Reforzados

- ✅ Sintaxis de imports ES6
- ✅ Inmutabilidad en React
- ✅ Keys en listas
- ✅ Arquitectura de estilos
- ✅ Return statements en funciones

---

## 💡 Consejos para Evaluación

### Señales de Estudiante que Entendió

- ✅ Explica **por qué** era un bug, no solo cómo arreglarlo
- ✅ Menciona el **impacto** del bug (qué problemas causa)
- ✅ Propone **prevención** (cómo evitar bugs similares)
- ✅ Usa **terminología correcta** (mutación, referencia, key, etc.)

### Señales de Copia/Falta de Comprensión

- ❌ Explica cómo arreglar sin entender por qué
- ❌ Soluciones idénticas palabra por palabra con otros
- ❌ No puede explicar el bug verbalmente
- ❌ Commits todos juntos en vez de progresivos

### Preguntas para Sustentación

1. "¿Por qué el bug #2 no mostraba error en consola?"
2. "¿Qué pasaría si borras el keyExtractor después de agregarlo?"
3. "¿Cómo sabrías que el bug #4 es un problema sin que te lo diga?"
4. "Si el bug #5 tuviera un console.log en vez de return, ¿funcionaría?"

---

## 🔄 Variaciones Sugeridas

Para evitar copias entre cohortes, puedes variar:

### Bug #1 - Import

- Variante 1: `import React-Native from 'react-native';`
- Variante 2: `import * as ReactNative from 'react-native';` (sin usar)
- Variante 3: `import 'react-native';` (sin destructuring)

### Bug #2 - Mutación

- Variante 1: `array.splice(0, 1)` en vez de `push`
- Variante 2: `object.property = value` (mutar objeto)
- Variante 3: `array.sort()` (muta in-place)

### Bug #3 - Keys

- Variante 1: Usar `key={index}` explícitamente
- Variante 2: key duplicada `key="item"`
- Variante 3: key undefined `key={item.wrongProperty}`

### Bug #4 - Hardcoded

- Variante 1: Duplicar spacing en vez de colores
- Variante 2: Duplicar font sizes
- Variante 3: Duplicar border radius

### Bug #5 - Return

- Variante 1: Return fuera del scope correcto
- Variante 2: Return dentro de un if que nunca se ejecuta
- Variante 3: Return con operador ternario mal formado

---

_Solucionario Semana 1 - Fundamentos de React Native_  
_Bootcamp React Native 2025 - CONFIDENCIAL_  
_Última actualización: 18 de octubre de 2025_
