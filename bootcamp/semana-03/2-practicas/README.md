# 💻 Prácticas - Semana 3: Estado y Datos

> **Aplica los conceptos teóricos** en ejercicios prácticos guiados paso a paso.

---

## 🎯 Objetivos Generales

Al completar estas prácticas, habrás aplicado:

- ✅ **Context API** para estado global
- ✅ **useReducer** para estado complejo
- ✅ **AsyncStorage** para persistencia
- ✅ **Custom Hooks** para encapsular lógica
- ✅ **TypeScript** en todos los proyectos
- ✅ **Mejores prácticas** de React Native

---

## 📋 Lista de Prácticas

### Práctica 1: Todo App con Context API

**📄 [practica-01-todo-app-context.md](./practica-01-todo-app-context.md)**

**Concepto principal:** Context API

**¿Qué construirás?**  
Una aplicación de tareas (Todo List) con gestión de estado global usando Context API.

**Características:**

- ✅ Agregar, editar, eliminar tareas
- ✅ Marcar como completadas
- ✅ Filtros (todas/activas/completadas)
- ✅ Estadísticas en tiempo real
- ✅ Custom hook `useTodos()`

**Aprenderás:**

- Crear y consumir contextos
- Evitar prop drilling
- Optimizar performance con useMemo
- Crear custom hooks reutilizables

**Tiempo estimado:** 2-3 horas  
**Dificultad:** ⭐⭐ Intermedio

---

### Práctica 2: Shopping Cart con useReducer

**📄 [practica-02-shopping-cart-reducer.md](./practica-02-shopping-cart-reducer.md)**

**Concepto principal:** useReducer

**¿Qué construirás?**  
Un carrito de compras con lógica compleja manejada con useReducer.

**Características:**

- ✅ Agregar productos al carrito
- ✅ Actualizar cantidades
- ✅ Remover items
- ✅ Calcular totales automáticamente
- ✅ Vaciar carrito

**Aprenderás:**

- Cuándo usar useReducer vs useState
- Estructurar actions y reducers
- TypeScript discriminated unions
- Immutability en reducers
- Valores derivados

**Tiempo estimado:** 1.5-2 horas  
**Dificultad:** ⭐⭐ Intermedio

---

### Práctica 3: Auth con Persistencia

**📄 [practica-03-auth-persistence.md](./practica-03-auth-persistence.md)**

**Concepto principal:** Context API + AsyncStorage

**¿Qué construirás?**  
Sistema de autenticación con persistencia de sesión.

**Características:**

- ✅ Login/Logout funcional
- ✅ Persistencia con AsyncStorage
- ✅ Navegación condicional (rutas protegidas)
- ✅ Estados de loading
- ✅ Sesión que persiste al cerrar la app

**Aprenderás:**

- Integrar Context + AsyncStorage
- Manejar estados de loading
- Navegación condicional
- Persistir datos sensibles
- useEffect para cargar datos al iniciar

**Tiempo estimado:** 1-1.5 horas  
**Dificultad:** ⭐⭐ Intermedio

---

## 🗺️ Ruta Recomendada

```
┌─────────────────────────────────────────────────┐
│  1. Todo App (Context API)                      │
│     ↓                                            │
│  2. Shopping Cart (useReducer)                  │
│     ↓                                            │
│  3. Auth (Context + AsyncStorage)               │
└─────────────────────────────────────────────────┘
```

**Razón del orden:**

1. **Context API** es la base - aprende a usarlo primero
2. **useReducer** se construye sobre conocimiento de hooks
3. **Auth** combina ambos conceptos previos

---

## 💡 Consejos para las Prácticas

### Antes de Empezar

1. **Lee la teoría** correspondiente antes de cada práctica
2. **Prepara tu entorno** - asegúrate de que todo compile
3. **Lee toda la práctica** antes de codear
4. **Entiende el objetivo** - no solo copies código

### Durante la Práctica

1. **Sigue los pasos en orden** - están diseñados pedagógicamente
2. **Tipea el código** - no copies/pegues (mejor aprendizaje)
3. **Experimenta** - modifica y prueba variaciones
4. **Lee los comentarios** - explican el "por qué"
5. **Prueba frecuentemente** - no esperes al final

### Después de Completar

1. **Revisa tu código** - compáralo con la solución
2. **Intenta los desafíos** - consolidan el aprendizaje
3. **Reflexiona** - ¿qué aprendiste? ¿qué fue difícil?
4. **Documenta dudas** - pregúntale al instructor

---

## 📊 Matriz de Conceptos

| Concepto            | Práctica 1   | Práctica 2   | Práctica 3   |
| ------------------- | ------------ | ------------ | ------------ |
| **Context API**     | ✅ Principal | -            | ✅ Usa       |
| **useReducer**      | -            | ✅ Principal | -            |
| **AsyncStorage**    | ⚠️ Desafío   | ⚠️ Desafío   | ✅ Principal |
| **Custom Hooks**    | ✅ Crea      | -            | ✅ Usa       |
| **TypeScript**      | ✅           | ✅           | ✅           |
| **useMemo**         | ✅           | -            | -            |
| **useEffect**       | ✅           | -            | ✅           |
| **Estado complejo** | ⚠️ Medio     | ✅ Alto      | ⚠️ Medio     |

**Leyenda:**

- ✅ Concepto principal aplicado
- ⚠️ Concepto secundario o desafío
- - No se usa directamente

---

## 🎯 Sistema de Evaluación

### Cada Práctica Vale 20 Puntos

**Distribución típica:**

- Implementación correcta: 10-12 pts
- TypeScript sin errores: 2-3 pts
- UI/UX funcional: 2-3 pts
- Manejo de edge cases: 2-3 pts
- Código limpio: 2 pts

### Criterios Generales

✅ **Excelente (18-20 pts)**

- Todo funciona perfectamente
- Código limpio y bien organizado
- TypeScript correcto
- Maneja errores
- UI pulida

⚠️ **Bueno (14-17 pts)**

- Funcionalidad completa
- Algunos detalles menores
- TypeScript mayormente correcto
- UI básica funcional

❌ **Insuficiente (0-13 pts)**

- Funcionalidad incompleta
- Errores significativos
- TypeScript con errores
- UI rota o incompleta

---

## 🔧 Configuración Inicial

### Requisitos

```bash
# Node.js v18+
node --version

# pnpm
pnpm --version

# Expo CLI
pnpm add -g expo-cli
```

### Crear Proyecto para cada Práctica

```bash
# Práctica 1
pnpx create-expo-app todo-context-app --template blank-typescript
cd todo-context-app
pnpm install

# Práctica 2
pnpx create-expo-app shopping-cart-app --template blank-typescript
cd shopping-cart-app
pnpm install

# Práctica 3
pnpx create-expo-app auth-app --template blank-typescript
cd auth-app
pnpm add @react-native-async-storage/async-storage
pnpm install
```

### Ejecutar Proyectos

```bash
# Iniciar dev server
pnpm start

# Ejecutar en iOS (requiere Mac)
pnpm ios

# Ejecutar en Android
pnpm android

# Ejecutar en web (para pruebas rápidas)
pnpm web
```

---

## 🐛 Problemas Comunes

### Error: "Cannot find module"

**Solución:**

```bash
# Limpia cache y reinstala
rm -rf node_modules
pnpm install
pnpm start --clear
```

### Error: "useSomething must be used within Provider"

**Causa:** Custom hook usado fuera del Provider

**Solución:** Asegúrate de envolver tu app con el Provider:

```typescript
// ❌ MALO
<App />

// ✅ BUENO
<SomeProvider>
  <App />
</SomeProvider>
```

### AsyncStorage no guarda datos

**Solución:** Verifica que estás usando await:

```typescript
// ❌ MALO
AsyncStorage.setItem('key', 'value')

// ✅ BUENO
await AsyncStorage.setItem('key', 'value')
```

### TypeScript marca errores

**Solución:** Verifica tipos e interfaces:

```typescript
// Define tipos explícitamente
const [data, setData] = useState<MyType[]>([])
```

---

## 🎓 Integración de Conceptos

Las 3 prácticas se pueden **combinar** en un proyecto integrador:

```typescript
/**
 * App integrada que combina:
 * - Auth (Práctica 3) para login
 * - Todo List (Práctica 1) con contexto
 * - Shopping Cart (Práctica 2) con reducer
 *
 * Todos los datos se persisten en AsyncStorage
 */

<AuthProvider>
  <TodoProvider>
    <CartProvider>
      <NavigationContainer>
        {isAuthenticated ? (
          <MainStack>
            <TodoScreen />
            <ShopScreen />
            <ProfileScreen />
          </MainStack>
        ) : (
          <LoginScreen />
        )}
      </NavigationContainer>
    </CartProvider>
  </TodoProvider>
</AuthProvider>
```

Este será un patrón común en aplicaciones reales.

---

## 📚 Recursos de Apoyo

### Durante las Prácticas

- **Teoría:** [../1-teoria/](../1-teoria/)
- **Glosario:** [../5-glosario/](../5-glosario/)
- **Docs oficiales:**
  - [React Context](https://react.dev/reference/react/useContext)
  - [useReducer](https://react.dev/reference/react/useReducer)
  - [AsyncStorage](https://react-native-async-storage.github.io/async-storage/)

### Si te atascas

1. **Revisa los errores** en consola - son muy descriptivos
2. **Consulta la teoría** - ahí están las explicaciones
3. **Busca en el glosario** - terminología técnica
4. **Pregunta al instructor** - para eso está
5. **Colabora con compañeros** - aprendizaje peer-to-peer

---

## ⏱️ Distribución de Tiempo

### Sesión Presencial (6 horas)

**Propuesta:**

- **Práctica 1** (2.5h) - Context API (la más importante)
- **Práctica 2** (2h) - useReducer
- **Práctica 3** (1.5h) - Auth + Persistencia

### Trabajo Autónomo (flexible)

**Sugerencia:** ~8-10 horas

- Completar prácticas iniciadas (4-5h)
- Desafíos adicionales (2-3h)
- Experimentación y repaso (2h)

> Los tiempos son flexibles según tu experiencia y ritmo.

---

## 🏆 Desafíos Globales

Una vez completadas las 3 prácticas:

### Desafío 1: App Integrada

Combina las 3 prácticas en una sola app con navegación

### Desafío 2: Offline First

Implementa sincronización offline/online

### Desafío 3: Testing

Agrega tests unitarios a tus contexts y reducers

### Desafío 4: Performance

Optimiza re-renders con React DevTools

---

## ✅ Checklist de Progreso

### Práctica 1: Todo App

- [ ] Context creado y funcionando
- [ ] Custom hook implementado
- [ ] CRUD de tareas completo
- [ ] Filtros funcionando
- [ ] Optimización con useMemo

### Práctica 2: Shopping Cart

- [ ] Reducer implementado
- [ ] Actions tipadas correctamente
- [ ] Carrito funcional
- [ ] Cálculos correctos
- [ ] UI responsive

### Práctica 3: Auth

- [ ] Login/Logout funcional
- [ ] AsyncStorage guardando datos
- [ ] Persistencia al reiniciar
- [ ] Loading states
- [ ] Navegación condicional

---

## 🔜 Siguiente Paso

Una vez completadas todas las prácticas:

**➡️ [Proyecto Integrador](../3-proyecto/README.md)**

Aplicarás **todos los conceptos** en un proyecto realista de mayor escala.

---

_Prácticas - Semana 3: Estado y Datos_  
_Bootcamp React Native 2025 - EPTI_

**Total:** 3 prácticas | ~5-7 horas estimadas  
**Nivel:** Intermedio ⭐⭐
