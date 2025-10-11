# 🧭 Semana 2: Navegación en React Native

> **Domina la navegación móvil** con React Navigation 6, implementando Stack, Tab y Drawer Navigators con arquitecturas anidadas profesionales.

---

## 📊 Vista General de la Semana

| Aspecto              | Detalle                                                      |
| -------------------- | ------------------------------------------------------------ |
| 🎯 **Enfoque**       | Navegación entre pantallas con React Navigation              |
| ⏱️ **Duración**      | 6 horas presenciales + 10-12h autónomas (recomendado)       |
| 📚 **Temas**         | Stack, Tab, Drawer Navigator, Navegación Anidada, Context API|
| 💻 **Prácticas**     | 3 apps completas (Blog, Dashboard, Settings)                 |
| 🚀 **Proyecto**      | E-Commerce App con 16 pantallas                              |
| 📈 **Dificultad**    | ⭐⭐⭐ Intermedia                                             |
| ✅ **Evaluación**    | 100 puntos (20% teoría, 30% prácticas, 50% proyecto)        |

---

## 🎯 Objetivos de Aprendizaje

Al finalizar esta semana, serás capaz de:

### Conocimientos Fundamentales
- [ ] **Comprender** los tres tipos principales de navegadores (Stack, Tab, Drawer)
- [ ] **Identificar** cuándo usar cada tipo de navegador según el caso de uso
- [ ] **Explicar** el concepto de navegación anidada y su arquitectura
- [ ] **Entender** el paso de parámetros entre pantallas
- [ ] **Dominar** los hooks principales de React Navigation

### Habilidades Técnicas
- [ ] **Implementar** Stack Navigator para flujos lineales
- [ ] **Configurar** Tab Navigator con iconos y badges
- [ ] **Crear** Drawer Navigator con menú lateral personalizado
- [ ] **Anidar** navegadores para arquitecturas complejas (Drawer → Tab → Stack)
- [ ] **Gestionar** estado global con Context API
- [ ] **Tipar** navegación con TypeScript para mayor seguridad

### Competencias Profesionales
- [ ] **Diseñar** arquitecturas de navegación escalables
- [ ] **Optimizar** flujos de usuario para mejor UX
- [ ] **Aplicar** mejores prácticas de la industria
- [ ] **Debuggear** problemas comunes de navegación
- [ ] **Documentar** decisiones de arquitectura

---

## 📚 Contenido de la Semana

### 1️⃣ Teoría (4 documentos)

Fundamentos teóricos de navegación móvil:

| Documento                                                          | Descripción                              | Tiempo  | Nivel      |
| ------------------------------------------------------------------ | ---------------------------------------- | ------- | ---------- |
| [01. Introducción a React Navigation](./1-teoria/01-introduccion-react-navigation.md) | Conceptos básicos, instalación, setup    | 25 min  | Básico     |
| [02. Stack Navigator](./1-teoria/02-stack-navigator.md)            | Navegación apilada, métodos, params      | 30 min  | Básico     |
| [03. Tab y Drawer Navigator](./1-teoria/03-tab-drawer-navigator.md)| Navegación por pestañas y menú lateral  | 35 min  | Intermedio |
| [📖 Índice de Teoría](./1-teoria/README.md)                        | Guía completa de contenido teórico       | 5 min   | -          |

**Total:** ~95 minutos de lectura
   - Drawer Navigator (menú lateral)
   - Iconos y personalización
   - Navegación anidada
   - Demo en vivo: App con tabs + drawer

---

### 2️⃣ [Prácticas Guiadas](./2-practicas/)

**Duración:** 2 horas presenciales

Ejercicios prácticos realizados en clase:

1. **[Stack Navigator: Blog App](./2-practicas/practica-01-stack-navigator.md)** (45 min)

   - Lista de posts
   - Detalle de post
   - Pantalla de creación
   - Navegación con parámetros

2. **[Tab Navigator: Dashboard](./2-practicas/practica-02-tab-navigator.md)** (45 min)

   - 3 tabs: Home, Search, Profile
   - Iconos personalizados
   - Badges de notificaciones
   - Tab bar customizado

3. **[Drawer Navigator: Settings](./2-practicas/practica-03-drawer-navigator.md)** (30 min)
   - Menú lateral deslizable
   - Navegación con drawer
   - Custom drawer content
   - Integración con Stack

---

### 3️⃣ [Proyecto Integrador](./3-proyecto/)

**Duración:** 30 min presencial + 3 horas autónomo

**Proyecto:** App de E-Commerce con Navegación Completa

Aplicación que integra todos los tipos de navegación:

- **Stack Navigator:** Productos → Detalle → Carrito → Checkout
- **Tab Navigator:** Home, Categorías, Carrito, Perfil
- **Drawer Navigator:** Menú con ajustes y opciones
- **Navegación anidada:** Tabs dentro de Stack

**Archivos de soporte:**

- [README del Proyecto](./3-proyecto/README.md) - Guía completa
- [Estructura de Navegación](./3-proyecto/ESTRUCTURA-NAVEGACION.md) - Diagrama de flujos
- [Ejemplos de Datos](./3-proyecto/DATOS-EJEMPLO.md) - Productos y categorías

**Evaluación:** 50% de la nota semanal  
**Entrega:** Viernes 23:59

---

### 4️⃣ [Recursos Complementarios](./4-recursos/)

**Material opcional** para reforzar y profundizar

- **[📚 eBooks Gratuitos](./4-recursos/ebooks-free/)** - Libros sobre navegación

  - React Navigation Documentation (⭐ Esencial)
  - Expo Router Guide
  - Navigation Patterns

- **[🎥 Videografía](./4-recursos/videografia/)** - Videos tutoriales

  - React Navigation 6 Full Course
  - Expo Router Tutorial
  - Navigation Best Practices

- **[🌐 Webgrafía](./4-recursos/webgrafia/)** - Recursos web
  - Documentación oficial
  - Ejemplos de código
  - Patrones de navegación

---

### 5️⃣ [Glosario](./5-glosario/)

**Referencia rápida** de términos de navegación

- Navigator, Screen, Route
- Stack, Tab, Drawer
- Navigation Prop, Route Params
- Deep Linking, Universal Links
- Nested Navigation, Modal

---

## ⏱️ Distribución del Tiempo

### 📍 Sesión Presencial (6 horas obligatorias)

| Actividad                                  | Duración | Horario Sugerido |
| ------------------------------------------ | -------- | ---------------- |
| ☕ Bienvenida y revisión Semana 1          | 15 min   | 8:00 - 8:15      |
| 📖 Teoría 1: Introducción React Navigation | 1 h      | 8:15 - 9:15      |
| 📖 Teoría 2: Stack Navigator               | 1.5 h    | 9:15 - 10:45     |
| ☕ **BREAK**                               | 15 min   | 10:45 - 11:00    |
| 📖 Teoría 3: Tab y Drawer Navigator        | 2 h      | 11:00 - 13:00    |
| 🍕 **ALMUERZO**                            | 30 min   | 13:00 - 13:30    |
| 💻 Práctica 1: Stack Navigator             | 45 min   | 13:30 - 14:15    |
| 💻 Práctica 2: Tab Navigator               | 45 min   | 14:15 - 15:00    |
| 💻 Práctica 3: Drawer Navigator            | 30 min   | 15:00 - 15:30    |
| 🚀 Presentación Proyecto Final             | 20 min   | 15:30 - 15:50    |
| ❓ Q&A y Cierre                            | 10 min   | 15:50 - 16:00    |

**Total:** 6 horas efectivas (8:00 AM - 4:00 PM con breaks)

---

### 🏠 Trabajo Autónomo (flexible, ~3 horas recomendadas)

| Actividad                              | Tiempo Estimado | Cuándo          |
| -------------------------------------- | --------------- | --------------- |
| Revisar documentación React Navigation | 30 min          | Lunes-Martes    |
| Desarrollar Proyecto E-Commerce        | 2.5 h           | Martes-Jueves   |
| Revisar recursos opcionales            | Variable        | Según necesidad |

**Total recomendado:** ~3 horas (flexible según tu ritmo)

---

### 📊 Balance Total de la Semana

| Tipo                      | Horas     | Porcentaje |
| ------------------------- | --------- | ---------- |
| 👨‍🏫 Presencial obligatorio | 6.0 h     | **67%**    |
| 🏠 Autónomo core          | 3.0 h     | **33%**    |
| **TOTAL CORE**            | **9.0 h** | **100%**   |
| 📚 Recursos opcionales    | Variable  | Extra      |

---

## 📋 Requisitos Previos

### Conocimientos de Semana 1:

- ✅ Componentes funcionales con TypeScript
- ✅ Props y State (useState)
- ✅ Estilos con NativeWind
- ✅ FlatList y renderizado de listas
- ✅ Manejo de eventos (onPress)

### Proyecto de Semana 1:

- ✅ Mi App Personal completada y funcionando
- ✅ Entendimiento de estructura de componentes

### Herramientas:

- ✅ Node.js 22.20+, pnpm, Expo CLI
- ✅ Expo Go instalado en móvil
- ✅ VS Code con extensiones

---

## 📦 Instalación de Dependencias

### React Navigation

```bash
# Instalar React Navigation
pnpm add @react-navigation/native

# Instalar dependencias de Expo
pnpm add react-native-screens react-native-safe-area-context

# Instalar navegadores
pnpm add @react-navigation/native-stack
pnpm add @react-navigation/bottom-tabs
pnpm add @react-navigation/drawer

# Para drawer, instalar dependencias adicionales
pnpm add react-native-gesture-handler react-native-reanimated
```

### Configuración de Reanimated

```javascript
// babel.config.js
module.exports = {
  presets: ['babel-preset-expo'],
  plugins: [
    'nativewind/babel',
    'react-native-reanimated/plugin', // ← Agregar al final
  ],
}
```

---

## ✅ Criterios de Evaluación

### Distribución de Puntos (100 puntos totales)

| Componente             | Peso     | Puntos      |
| ---------------------- | -------- | ----------- |
| 📖 Comprensión Teórica | 20%      | 20 pts      |
| 💻 Prácticas Guiadas   | 30%      | 30 pts      |
| 🚀 Proyecto Integrador | 50%      | 50 pts      |
| **TOTAL**              | **100%** | **100 pts** |

Ver [RUBRICA-EVALUACION.md](./RUBRICA-EVALUACION.md) para criterios detallados.

---

## 🎯 Conceptos Clave de la Semana

### Navegación Stack

```typescript
import { createNativeStackNavigator } from '@react-navigation/native-stack'

const Stack = createNativeStackNavigator()

function AppNavigator() {
  return (
    <Stack.Navigator>
      <Stack.Screen name="Home" component={HomeScreen} />
      <Stack.Screen name="Details" component={DetailsScreen} />
    </Stack.Navigator>
  )
}
```

### Navegación entre Pantallas

```typescript
// Navegar a otra pantalla
navigation.navigate('Details', { itemId: 42 })

// Volver atrás
navigation.goBack()

// Acceder a parámetros
const { itemId } = route.params
```

### Tab Navigator

```typescript
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs'

const Tab = createBottomTabNavigator()

function TabNavigator() {
  return (
    <Tab.Navigator>
      <Tab.Screen name="Home" component={HomeScreen} />
      <Tab.Screen name="Profile" component={ProfileScreen} />
    </Tab.Navigator>
  )
}
```

---

## 💡 Consejos para la Semana

### ✅ Durante las Clases:

1. **Practica cada tipo de navegador** en tiempo real
2. **Experimenta con los parámetros** - pasa diferentes datos
3. **Personaliza los headers** - cambia colores, títulos, botones
4. **Pregunta sobre patrones** - cuándo usar Stack vs Tab vs Drawer

### ✅ Durante el Proyecto:

1. **Dibuja el flujo primero** - esquema en papel antes de codificar
2. **Empieza por Stack simple** - agrega complejidad gradualmente
3. **Prueba la navegación frecuentemente** - no esperes al final
4. **Usa TypeScript para las rutas** - evita errores de nombres

### ✅ Errores Comunes a Evitar:

1. ❌ Olvidar envolver con `NavigationContainer`
2. ❌ No agregar `react-native-reanimated/plugin` al final de plugins
3. ❌ Pasar objetos complejos como parámetros (usar IDs)
4. ❌ No usar TypeScript para los tipos de navegación
5. ❌ Ignorar el ciclo de vida de las pantallas

---

## 🆘 Soporte y Ayuda

### Durante la Semana:

1. **Discord del Bootcamp** - Canal #semana-02
2. **Office Hours Virtuales** - Martes y Jueves 7-8 PM
3. **Documentación Oficial**:
   - [React Navigation](https://reactnavigation.org/docs/getting-started)
   - [Expo Router](https://docs.expo.dev/router/introduction/)

---

## 🎉 Qué Lograrás Esta Semana

Al terminar la Semana 2, habrás:

✅ **Dominado React Navigation** - Stack, Tab y Drawer  
✅ **Creado flujos complejos** - Navegación anidada  
✅ **Pasado datos entre pantallas** - Con type-safety  
✅ **Personalizado la navegación** - Headers, iconos, estilos  
✅ **Desarrollado app multi-pantalla** - E-Commerce completo  
✅ **Entendido patrones de navegación** - Cuándo usar cada uno  
✅ **Implementado deep linking** - URLs que abren pantallas específicas  
✅ **Optimizado la UX** - Transiciones suaves y gestos nativos  
✅ **Usado TypeScript con navegación** - Type-safe navigation  
✅ **Construido base para apps reales** - Lista para Semana 3 (Estado Global)

---

## 🔜 Próxima Semana: Estado Global y Context API

**Semana 3 Preview:**

- Context API para estado compartido
- useContext y useReducer
- Estado global vs local
- Patrones de gestión de estado
- Redux (introducción)

**Preparación:** Tener tu proyecto de navegación completamente funcional, lo usaremos como base para agregar estado global.

---

## 📊 Progreso del Bootcamp

- ✅ **Semana 1:** Fundamentos de React Native
- 🔄 **Semana 2:** Navegación y Routing (actual)
- ⏳ **Semana 3:** Estado Global
- ⏳ **Semana 4:** APIs y Backend
- ⏳ **Semana 5:** Features Avanzadas
- ⏳ **Semana 6:** Deployment y Proyecto Final

**Progreso:** 33% del bootcamp completado

---

## 📞 Contacto

**Instructor:** [Nombre del Instructor]  
**Email:** instructor@bootcamp.com  
**Discord:** @instructor  
**Office Hours:** Martes y Jueves 7-8 PM

---

## 📌 Recursos Rápidos

### Documentación Esencial:

- [React Navigation Docs](https://reactnavigation.org/)
- [Expo Router Docs](https://docs.expo.dev/router/)
- [TypeScript + Navigation](https://reactnavigation.org/docs/typescript/)

### Herramientas:

- [React Navigation Playground](https://reactnavigation.org/docs/hello-react-navigation)
- [Expo Snack](https://snack.expo.dev/)

### Ejemplos:

- [React Navigation Examples](https://github.com/react-navigation/react-navigation/tree/main/example)
- [Awesome React Native Navigation](https://github.com/topics/react-native-navigation)

---

<div align="center">

**Bootcamp React Native 2025**  
Semana 2 de 6 | Navegación y Routing

[⬅️ Semana 1](../semana-01/) | [Siguiente: Semana 3 ➡️](../semana-03/)

---

_Última actualización: 11 de octubre de 2025_  
_Versión: 1.0.0_

</div>
