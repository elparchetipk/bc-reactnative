# 🐛 Sistema de Bugs Pedagógicos

> **Metodología anti-copia:** Código de ejemplo con bugs intencionales que los estudiantes deben identificar y resolver.

---

## 🎯 Objetivo

Prevenir la copia mecánica del código y fomentar:

- ✅ **Lectura crítica** del código
- ✅ **Comprensión profunda** de conceptos
- ✅ **Debugging skills** desde el inicio
- ✅ **Pensamiento analítico**
- ✅ **Aprendizaje activo** vs pasivo

---

## 📋 Metodología

### Tipos de Bugs Intencionales

#### 1️⃣ **Bugs Obvios** (20% de los bugs)

Errores que rompen la ejecución inmediatamente:

- Sintaxis incorrecta
- Imports faltantes
- Nombres de variables incorrectos

**Objetivo:** Verificar que ejecuten el código

#### 2️⃣ **Bugs Sutiles** (50% de los bugs)

Errores de lógica que causan comportamiento incorrecto:

- Condiciones invertidas
- Operadores incorrectos
- Parámetros en orden incorrecto
- Estado inicial erróneo

**Objetivo:** Comprensión de la lógica

#### 3️⃣ **Bugs de Mejores Prácticas** (30% de los bugs)

El código funciona pero viola estándares:

- Nombres de variables en español
- Código duplicado (DRY violation)
- Componentes no reutilizables
- Falta de validación
- Performance issues

**Objetivo:** Código profesional

---

## 🔧 Implementación por Semana

### Semana 1: Fundamentos

**Bugs a incluir (5-7 bugs):**

1. Import de componente con nombre incorrecto
2. Propiedad `onPress` escrita como `onClick`
3. Estado inicial de contador con string en vez de number
4. Condición de renderizado invertida
5. StyleSheet con camelCase incorrecto
6. FlatList sin `keyExtractor`
7. Variable en español en código

### Semana 2: Navegación

**Bugs a incluir (6-8 bugs):**

1. Screen importada pero no registrada en navigator
2. Parámetros de navegación con typo en el nombre
3. TabNavigator con screenOptions mal configurado
4. DrawerNavigator sin `react-native-gesture-handler`
5. Navigation prop no destructurado correctamente
6. Route.params sin validación de undefined
7. TabBar icons sin conditional rendering
8. Deep linking configurado incorrectamente

### Semana 3: Estado y Datos

**Bugs a incluir (7-9 bugs):**

1. Context Provider no wrapping App
2. useContext importado de 'react-native' en vez de 'react'
3. AsyncStorage key con espacios (causa error)
4. JSON.parse sin try-catch (crash con data corrupta)
5. useEffect sin array de dependencias (infinite loop)
6. Estado no actualizado correctamente (mutación directa)
7. Custom hook sin "use" prefix
8. Reducer con action.type sin default case
9. Context sin valor inicial

### Semana 4: APIs y Backend

**Bugs a incluir (8-10 bugs):**

1. Endpoint de API con URL incompleta
2. Headers de fetch sin Content-Type
3. Token de autenticación mal formateado
4. Error handling sin catch
5. Loading state no reseteado en error
6. Refresh no limpia data anterior
7. Axios instance sin base URL
8. Interceptor con respuesta mal manejada
9. FormData con key incorrecta
10. Credentials: 'include' faltante en CORS

### Semana 5: Features Nativas

**Bugs a incluir (6-8 bugs):**

1. Permisos de cámara no solicitados
2. ImagePicker con options incompletas
3. Notifications sin await en registro
4. Location con accuracy demasiado alta (battery drain)
5. File upload sin MIME type
6. Push token no guardado en backend
7. Media library sin permisos
8. Sensor listeners no removidos (memory leak)

### Semana 6: Deployment

**Bugs a incluir (5-7 bugs):**

1. app.json sin version increment
2. Environment variables hard-coded
3. Console.logs en producción
4. API keys expuestas
5. Build config con wrong bundle identifier
6. Assets sin optimización
7. Deep links sin validation

---

## 📝 Formato de Documentación

### En Cada Archivo de Código

Agregar al inicio:

```javascript
/**
 * ⚠️ ADVERTENCIA PEDAGÓGICA
 *
 * Este código contiene bugs intencionales que DEBES identificar y corregir.
 * NO es código listo para producción.
 *
 * 🐛 Cantidad de bugs: X bugs
 * 📊 Dificultad: [Baja | Media | Alta]
 *
 * ✅ Entregables:
 * - Código funcionando sin errores
 * - Documento BUGS-RESUELTOS.md con:
 *   1. Lista de bugs encontrados
 *   2. Explicación de cada bug
 *   3. Solución implementada
 *   4. Screenshot del código funcionando
 *
 * 📅 Fecha límite: [Fecha]
 */
```

### Archivo BUGS-RESUELTOS.md (Template)

````markdown
# 🐛 Bugs Resueltos - Semana X

**Estudiante:** [Tu nombre]  
**Fecha:** [Fecha de entrega]  
**Proyecto:** [Nombre del proyecto]

---

## Bug #1: [Título descriptivo]

**Archivo:** `ruta/al/archivo.js`  
**Línea:** XX

### 🔍 Descripción del Bug

[Explica qué estaba mal]

### 💡 Solución Implementada

```javascript
// ❌ Código incorrecto
const [count, setCount] = useState('0')

// ✅ Código corregido
const [count, setCount] = useState(0)
```
````

### 🎓 Lección Aprendida

[Qué aprendiste de este bug]

---

## Bug #2: [Siguiente bug]

...

---

## 📸 Screenshots

[Capturas del código funcionando]

---

## ✅ Checklist de Entrega

- [ ] Todos los bugs identificados
- [ ] Código funciona sin errores
- [ ] Tests pasan (si aplica)
- [ ] Commits en GitHub
- [ ] README actualizado

````

---

## 🎓 Guía para Instructores

### Crear Bugs Efectivos

#### ✅ DO: Buenos Bugs Pedagógicos

```javascript
// Bug sutil pero educativo
const handlePress = () => {
  setCount(count + 1) // ❌ Bug: closure stale
  // Debería ser: setCount(prev => prev + 1)
}

// Bug de mejores prácticas
const usuario = { nombre: 'Juan' } // ❌ Español
// Debería ser: const user = { name: 'Juan' }

// Bug de lógica común
if (password.length < 8) { // ❌ Validación invertida
  setError('')
} else {
  setError('Password muy corta')
}
````

#### ❌ DON'T: Bugs Confusos o Frustrantes

```javascript
// ❌ Demasiado oscuro
const x = y.z?.a?.[0]?.b || c?.d ?? e

// ❌ Error de sintaxis sin valor educativo
const data = {
  name: 'test'
  age: 25 // Coma faltante - demasiado obvio
}

// ❌ Bug de configuración externa
// Error en tsconfig.json o metro.config.js
// No enseña React Native
```

### Calibrar Dificultad

**Semana 1 (Fácil):**

- 70% bugs obvios
- 30% bugs sutiles
- 0% mejores prácticas

**Semana 2-3 (Media):**

- 30% bugs obvios
- 50% bugs sutiles
- 20% mejores prácticas

**Semana 4-6 (Alta):**

- 10% bugs obvios
- 50% bugs sutiles
- 40% mejores prácticas

### Pistas Graduales

Proporcionar pistas en niveles:

**Nivel 1 (Día 1):** Ubicación general

```
💡 Hay un bug en el componente UserProfile relacionado con el estado
```

**Nivel 2 (Día 3):** Más específico

```
💡 Revisa cómo estás actualizando el estado del contador en handlePress
```

**Nivel 3 (Día 5):** Casi la solución

```
💡 El problema es usar la variable directa en lugar del patrón funcional
💡 Busca: "React setState with previous state"
```

---

## 📊 Evaluación

### Criterios de Calificación

| Criterio                 | Puntos | Descripción                   |
| ------------------------ | ------ | ----------------------------- |
| **Bugs Identificados**   | 40     | % de bugs encontrados         |
| **Soluciones Correctas** | 30     | Calidad de las correcciones   |
| **Explicación**          | 20     | Comprensión demostrada        |
| **Documentación**        | 10     | Calidad del BUGS-RESUELTOS.md |
| **TOTAL**                | 100    |                               |

### Escala de Puntuación

```
Bugs Encontrados:
- 100% bugs: 40 puntos
- 80-99%: 32 puntos
- 60-79%: 24 puntos
- 40-59%: 16 puntos
- <40%: 0 puntos

Calidad de Soluciones:
- Todas correctas y eficientes: 30 puntos
- Mayoría correctas: 24 puntos
- Algunas correctas: 18 puntos
- Pocas correctas: 12 puntos
- Incorrectas: 0 puntos
```

---

## 🚨 Detectar Copias

### Indicadores de Copia

1. **Commits sospechosos:**

   - 1 solo commit con todo el código
   - Commit message genérico: "fix" o "update"
   - Fecha/hora idéntica entre varios estudiantes

2. **Código idéntico:**

   - Mismos nombres de variables (especialmente si son únicos)
   - Mismos comentarios
   - Mismo orden de imports
   - Mismos espacios/indentación

3. **BUGS-RESUELTOS.md sospechoso:**
   - Explicaciones idénticas
   - Mismo vocabulario
   - Mismo orden de bugs

### Herramientas de Detección

```bash
# Script para comparar similitud entre repositorios
# Ver: _scripts/validators/detect-plagiarism.js

pnpm run validate:plagiarism semana-01
```

---

## 🎯 Beneficios del Sistema

### Para Estudiantes

- ✅ **Lectura activa** del código
- ✅ **Debugging skills** tempranos
- ✅ **Pensamiento crítico**
- ✅ **Autonomía** en resolución de problemas
- ✅ **Portfolio único** (cada solución es diferente)

### Para Instructores

- ✅ **Evidencia de aprendizaje** real
- ✅ **Fácil detección de copias**
- ✅ **Evaluación más justa**
- ✅ **Conversaciones pedagógicas** sobre bugs
- ✅ **Feedback dirigido** a errores comunes

---

## 📚 Recursos para Crear Bugs

### Errores Comunes en React Native

- [React Native Common Mistakes](https://reactnative.dev/docs/troubleshooting)
- [React Hook Pitfalls](https://react.dev/learn/you-might-not-need-an-effect)
- [JavaScript Common Errors](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Errors)

### Herramientas

- ESLint con reglas desactivadas temporalmente
- Prettier configurado para permitar inconsistencias
- TypeScript en modo permisivo

---

## 📝 Ejemplos de Bugs por Categoría

### Bugs de Estado

```javascript
// ❌ Bug: Mutación directa
const handleAdd = () => {
  items.push(newItem)
  setItems(items)
}

// ✅ Solución
const handleAdd = () => {
  setItems([...items, newItem])
}
```

### Bugs de Efectos

```javascript
// ❌ Bug: Dependencias faltantes
useEffect(() => {
  fetchData(userId)
}, []) // userId no está en dependencias

// ✅ Solución
useEffect(() => {
  fetchData(userId)
}, [userId])
```

### Bugs de Navegación

```javascript
// ❌ Bug: Parámetros incorrectos
navigation.navigate('Details', { userId: user.id })
// Pero en Details lees: route.params.id (sin 'user')

// ✅ Solución: Consistencia
navigation.navigate('Details', { id: user.id })
// O: route.params.userId
```

### Bugs de API

```javascript
// ❌ Bug: Error handling incompleto
const fetchData = async () => {
  const response = await fetch(url)
  const data = await response.json() // Falla si response.ok es false
  return data
}

// ✅ Solución
const fetchData = async () => {
  const response = await fetch(url)
  if (!response.ok) {
    throw new Error(`HTTP error! status: ${response.status}`)
  }
  const data = await response.json()
  return data
}
```

---

## ✅ Checklist para Implementación

### Por Cada Semana

- [ ] Identificar 5-10 conceptos clave
- [ ] Crear bugs relacionados a cada concepto
- [ ] Calibrar dificultad según semana
- [ ] Agregar comentario de advertencia al código
- [ ] Crear template BUGS-RESUELTOS.md
- [ ] Documentar bugs en instructor/bugs-semana-X.md
- [ ] Preparar pistas graduales
- [ ] Configurar validación automática (tests)
- [ ] Actualizar rúbrica de evaluación

### En Clase

- [ ] Explicar metodología de bugs pedagógicos
- [ ] Mostrar ejemplo de BUGS-RESUELTOS.md
- [ ] Demostrar debugging workflow
- [ ] Establecer fecha límite de entrega
- [ ] Aclarar que es actividad individual

---

## 🎓 Conclusión

Este sistema transforma el código de "copiar y pegar" a "leer, entender, debuggear y documentar", asegurando un aprendizaje genuino y profundo.

**Recordatorio:** Los bugs son herramientas pedagógicas, no trampas. Deben ser educativos, no frustrantes.

---

_Material para Instructores - Bootcamp React Native 2025_  
_Última actualización: Octubre 2025_
