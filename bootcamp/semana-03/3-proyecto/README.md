# 🚀 Proyecto Integrador: Task Manager App

> **Aplicación completa de gestión de tareas** que integra todos los conceptos de la semana: Context API, useReducer, AsyncStorage y Custom Hooks.

---

## 🎯 Objetivo del Proyecto

Crear una **aplicación profesional de gestión de tareas** con las siguientes características:

- ✅ Autenticación con persistencia
- ✅ Gestión de tareas (CRUD completo)
- ✅ Categorías y prioridades
- ✅ Estadísticas y filtros avanzados
- ✅ Persistencia local de todos los datos
- ✅ UI profesional y fluida

---

## 🎓 Conceptos Aplicados

Este proyecto integra **todos los temas de la semana**:

| Concepto | Aplicación en el Proyecto |
|----------|---------------------------|
| **Context API** | AuthContext, TaskContext, ThemeContext |
| **useReducer** | Gestión de tareas con lógica compleja |
| **AsyncStorage** | Persistencia de auth, tareas y preferencias |
| **Custom Hooks** | useAuth, useTasks, useTheme, useLocalStorage |
| **TypeScript** | Tipado completo en toda la app |
| **Performance** | useMemo, useCallback, optimizaciones |

---

## 📱 Funcionalidades

### 1. Autenticación
- [x] Login con email/password
- [x] Registro de nuevos usuarios
- [x] Persistencia de sesión
- [x] Logout

### 2. Gestión de Tareas
- [x] Crear tareas con título y descripción
- [x] Editar tareas existentes
- [x] Marcar como completadas
- [x] Eliminar tareas
- [x] Asignar categorías (Trabajo, Personal, Urgente)
- [x] Asignar prioridades (Alta, Media, Baja)
- [x] Fechas de vencimiento

### 3. Filtros y Búsqueda
- [x] Filtrar por estado (todas/activas/completadas)
- [x] Filtrar por categoría
- [x] Filtrar por prioridad
- [x] Buscar por texto

### 4. Estadísticas
- [x] Total de tareas
- [x] Tareas completadas/pendientes
- [x] Progreso por categoría
- [x] Tareas vencidas

### 5. Configuración
- [x] Tema claro/oscuro
- [x] Editar perfil
- [x] Borrar todas las tareas
- [x] Cerrar sesión

---

## 🏗️ Arquitectura del Proyecto

```
task-manager-app/
├── App.tsx
├── src/
│   ├── contexts/           # Contextos globales
│   │   ├── AuthContext.tsx
│   │   ├── TaskContext.tsx
│   │   └── ThemeContext.tsx
│   ├── hooks/              # Custom hooks
│   │   ├── useAuth.ts
│   │   ├── useTasks.ts
│   │   ├── useTheme.ts
│   │   └── useLocalStorage.ts
│   ├── reducers/           # Reducers
│   │   └── taskReducer.ts
│   ├── types/              # TypeScript types
│   │   ├── auth.ts
│   │   ├── task.ts
│   │   └── theme.ts
│   ├── components/         # Componentes reutilizables
│   │   ├── TaskCard.tsx
│   │   ├── TaskForm.tsx
│   │   ├── FilterBar.tsx
│   │   ├── StatsCard.tsx
│   │   └── ThemedButton.tsx
│   ├── screens/            # Pantallas
│   │   ├── LoginScreen.tsx
│   │   ├── RegisterScreen.tsx
│   │   ├── HomeScreen.tsx
│   │   ├── TaskDetailScreen.tsx
│   │   └── SettingsScreen.tsx
│   └── utils/              # Utilidades
│       ├── storage.ts
│       └── date.ts
└── package.json
```

---

## 📝 Fases de Desarrollo

El proyecto se desarrolla en **4 fases incrementales**:

### [Fase 1: Setup y Autenticación](./FASE-1-SETUP-AUTH.md)
- Configuración inicial del proyecto
- Implementar AuthContext con AsyncStorage
- Screens de Login y Register
- Navegación condicional

**Tiempo estimado:** 1-1.5 horas

---

### [Fase 2: Task Context y CRUD Básico](./FASE-2-TASK-CONTEXT.md)
- Crear tipos de Task
- Implementar TaskContext con useReducer
- CRUD básico de tareas
- Pantalla principal (HomeScreen)

**Tiempo estimado:** 1.5-2 horas

---

### [Fase 3: Filtros y Estadísticas](./FASE-3-FILTERS-STATS.md)
- Sistema de filtros avanzados
- Componente de búsqueda
- Estadísticas y progreso
- Mejorar UI/UX

**Tiempo estimado:** 1-1.5 horas

---

### [Fase 4: Theme y Polish Final](./FASE-4-THEME-POLISH.md)
- Implementar ThemeContext (dark/light)
- Pantalla de configuración
- Persistir preferencias
- Pulir UI y animations
- Testing final

**Tiempo estimado:** 1-1.5 horas

---

## ⏱️ Tiempo Total Estimado

- **Desarrollo:** 5-7 horas
- **Testing y ajustes:** 1-2 horas
- **TOTAL:** ~6-9 horas

Distribuido en:
- **Sesión presencial:** 3-4 horas (Fases 1 y 2)
- **Trabajo autónomo:** 3-5 horas (Fases 3 y 4)

---

## 🎨 Diseño y UI

### Paleta de Colores

**Tema Claro:**
- Primary: `#007AFF`
- Background: `#F5F5F5`
- Card: `#FFFFFF`
- Text: `#333333`
- Border: `#E0E0E0`

**Tema Oscuro:**
- Primary: `#0A84FF`
- Background: `#1C1C1E`
- Card: `#2C2C2E`
- Text: `#FFFFFF`
- Border: `#38383A`

### Categorías

- 💼 **Trabajo** - Azul (`#007AFF`)
- 👤 **Personal** - Verde (`#34C759`)
- 🔥 **Urgente** - Rojo (`#FF3B30`)

### Prioridades

- 🔴 **Alta** - Rojo
- 🟡 **Media** - Amarillo
- 🟢 **Baja** - Verde

---

## 📊 Criterios de Evaluación

| Criterio | Peso | Puntos |
|----------|------|--------|
| **Fase 1: Auth** | 20% | 20 pts |
| **Fase 2: Tasks CRUD** | 30% | 30 pts |
| **Fase 3: Filtros/Stats** | 20% | 20 pts |
| **Fase 4: Theme/Polish** | 15% | 15 pts |
| **Código Limpio** | 10% | 10 pts |
| **Presentación** | 5% | 5 pts |
| **TOTAL** | 100% | **100 pts** |

### Desglose Detallado

**Fase 1 (20 pts):**
- Context implementado (8 pts)
- AsyncStorage funcionando (6 pts)
- Login/Register (4 pts)
- Navegación condicional (2 pts)

**Fase 2 (30 pts):**
- TaskContext + Reducer (10 pts)
- CRUD completo (12 pts)
- Persistencia (5 pts)
- UI funcional (3 pts)

**Fase 3 (20 pts):**
- Filtros funcionando (8 pts)
- Búsqueda (4 pts)
- Estadísticas (6 pts)
- UX mejorada (2 pts)

**Fase 4 (15 pts):**
- Theme system (8 pts)
- Settings screen (4 pts)
- Polish y detalles (3 pts)

**Código Limpio (10 pts):**
- TypeScript sin errores (3 pts)
- Organización de archivos (3 pts)
- Comentarios y documentación (2 pts)
- Performance (2 pts)

**Presentación (5 pts):**
- Demo funcional (3 pts)
- Explicación de decisiones (2 pts)

---

## 🚀 Instalación y Setup

### Requisitos

```bash
node --version  # v18+
pnpm --version  # v8+
```

### Crear Proyecto

```bash
# Crear proyecto con Expo
pnpx create-expo-app task-manager-app --template blank-typescript

# Entrar al directorio
cd task-manager-app

# Instalar dependencias
pnpm add @react-native-async-storage/async-storage

# Opcional: React Navigation (si quieres múltiples pantallas)
pnpm add @react-navigation/native @react-navigation/stack
pnpm add react-native-screens react-native-safe-area-context

# Iniciar proyecto
pnpm start
```

---

## 💡 Consejos de Desarrollo

### Desarrollo Incremental

1. **No intentes hacer todo de una vez** - sigue las fases
2. **Prueba cada fase** antes de continuar
3. **Commits frecuentes** - guarda tu progreso
4. **Refactoriza cuando sea necesario** - código limpio

### Testing Continuo

- ✅ Prueba cada feature al implementarla
- ✅ Verifica la persistencia cerrando y abriendo la app
- ✅ Prueba casos edge (ej: sin tareas, sin conexión)
- ✅ Valida inputs del usuario

### Performance

- ✅ Usa `useMemo` para cálculos pesados
- ✅ Usa `useCallback` para funciones en props
- ✅ Memoiza valores del contexto
- ✅ Evita re-renders innecesarios

---

## 🐛 Problemas Comunes

### "Cannot read property of undefined"

**Causa:** Intentas acceder a datos antes de que se carguen

**Solución:** Usa loading states:
```typescript
if (isLoading) return <ActivityIndicator />
if (!data) return <Text>No data</Text>
```

### Datos no persisten

**Causa:** No usas `await` con AsyncStorage

**Solución:**
```typescript
await AsyncStorage.setItem(key, value)
```

### Re-renders excesivos

**Causa:** Valor del contexto no está memoizado

**Solución:**
```typescript
const value = useMemo(() => ({ ...state, ...actions }), [state])
```

---

## 📚 Recursos de Apoyo

### Durante el Desarrollo

- **Teoría:** [../1-teoria/](../1-teoria/)
- **Prácticas:** [../2-practicas/](../2-practicas/)
- **Glosario:** [../5-glosario/](../5-glosario/)

### Documentación

- [React Context](https://react.dev/reference/react/useContext)
- [useReducer](https://react.dev/reference/react/useReducer)
- [AsyncStorage](https://react-native-async-storage.github.io/async-storage/)
- [TypeScript](https://www.typescriptlang.org/docs/)

---

## ✅ Checklist de Completitud

### Funcionalidad
- [ ] Login/Register funcional
- [ ] Sesión persiste al cerrar app
- [ ] CRUD completo de tareas
- [ ] Filtros funcionando
- [ ] Búsqueda operativa
- [ ] Estadísticas correctas
- [ ] Theme switcher funcional
- [ ] Settings screen completa

### Calidad
- [ ] TypeScript sin errores
- [ ] Código bien organizado
- [ ] Comentarios explicativos
- [ ] UI responsive
- [ ] Manejo de errores
- [ ] Loading states
- [ ] Edge cases cubiertos

### Testing
- [ ] App funciona sin errores
- [ ] Persistencia verificada
- [ ] Todos los filtros probados
- [ ] Theme switching probado
- [ ] Probado en iOS/Android
- [ ] Performance aceptable

---

## 🎓 Entrega del Proyecto

### Formato de Entrega

1. **Código fuente** en repositorio Git
2. **README.md** con instrucciones de instalación
3. **Video demo** (2-3 minutos) mostrando funcionalidades
4. **Documento de reflexión** (opcional):
   - ¿Qué aprendiste?
   - ¿Qué fue más difícil?
   - ¿Qué mejorarías?

### Presentación (5 minutos)

1. **Demo en vivo** (3 min) - muestra las funcionalidades
2. **Código destacado** (1 min) - explica una parte interesante
3. **Q&A** (1 min) - responde preguntas

---

## 🌟 Mejoras Opcionales

Si completas todo y quieres ir más allá:

### Performance
- [ ] Implementar virtualización en listas largas
- [ ] Lazy loading de datos
- [ ] Optimizar imágenes

### Features
- [ ] Notificaciones locales para deadlines
- [ ] Compartir tareas
- [ ] Export/Import de datos
- [ ] Gráficos de productividad
- [ ] Modo offline completo

### UI/UX
- [ ] Animations con Reanimated
- [ ] Gestos con Gesture Handler
- [ ] Skeleton loaders
- [ ] Haptic feedback

---

## 🔜 Comienza Ahora

**➡️ [Fase 1: Setup y Autenticación](./FASE-1-SETUP-AUTH.md)**

¡Inicia tu proyecto con la primera fase!

---

_Proyecto Integrador: Task Manager App - Semana 3_  
_Bootcamp React Native 2025 - EPTI_

**Complejidad:** ⭐⭐⭐ Intermedio-Avanzado  
**Tiempo estimado:** 6-9 horas
