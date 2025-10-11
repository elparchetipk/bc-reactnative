# 💻 Prácticas - Semana 2: Navegación en React Native

> **Ejercicios prácticos guiados** para dominar los 3 tipos de navegación fundamentales en React Native.

---

## 📋 Índice de Prácticas

| #   | Práctica                                          | Navigator        | Duración | Dificultad | Estado |
| --- | ------------------------------------------------- | ---------------- | -------- | ---------- | ------ |
| 1   | [Blog App](./practica-01-stack-navigator.md)      | Stack Navigator  | 45 min   | ⭐⭐       | 📝     |
| 2   | [Dashboard App](./practica-02-tab-navigator.md)   | Tab Navigator    | 45 min   | ⭐⭐       | 📝     |
| 3   | [Settings App](./practica-03-drawer-navigator.md) | Drawer Navigator | 30 min   | ⭐⭐⭐     | 📝     |

**Tiempo Total:** ~2 horas en clase presencial

---

## 🎯 Objetivos Generales

Al completar las 3 prácticas, serás capaz de:

- ✅ Implementar **Stack Navigator** para flujos lineales
- ✅ Crear **Tab Navigator** con pestañas inferiores
- ✅ Configurar **Drawer Navigator** con menú lateral
- ✅ **Anidar navegadores** (Stack dentro de Tab, Stack dentro de Drawer)
- ✅ Personalizar **íconos, estilos y comportamientos**
- ✅ Manejar **navegación tipada con TypeScript**
- ✅ Pasar **parámetros entre pantallas**
- ✅ Crear **custom drawer content**

---

## 📝 Práctica 1: Stack Navigator - Blog App

### 🎯 Qué aprenderás:

- Navegación apilada (push/pop)
- Pasar parámetros entre pantallas
- Presentación modal
- Validación de formularios
- TypeScript para tipos de navegación

### 🏗️ Estructura:

```
blog-app/
├── 3 pantallas: PostList, PostDetail, CreatePost
├── Stack Navigator con modal
├── 5 posts de ejemplo (hardcoded)
├── Form con validación
└── Type-safe navigation
```

### 📊 Evaluación:

- **Funcionalidad:** 40 pts
- **Navegación:** 30 pts
- **UI/UX:** 20 pts
- **TypeScript:** 10 pts

[📖 Ver práctica completa →](./practica-01-stack-navigator.md)

---

## 📝 Práctica 2: Tab Navigator - Dashboard App

### 🎯 Qué aprenderás:

- Bottom Tab Navigator
- Íconos personalizados (Ionicons)
- Badges de notificaciones
- Tab bar styling
- Navegación anidada (Stack dentro de Tabs)

### 🏗️ Estructura:

```
dashboard-app/
├── 3 tabs: Home, Search, Profile
├── 6 pantallas totales
├── Stack anidado en Home y Profile
├── Badge en Home tab
└── Mock data de notificaciones
```

### 📊 Evaluación:

- **Tabs funcionando:** 30 pts
- **Íconos personalizados:** 20 pts
- **Badge notificaciones:** 15 pts
- **Navegación anidada:** 25 pts
- **UI/UX:** 10 pts

[📖 Ver práctica completa →](./practica-02-tab-navigator.md)

---

## 📝 Práctica 3: Drawer Navigator - Settings App

### 🎯 Qué aprenderás:

- Drawer Navigator (menú lateral)
- Custom Drawer Content
- Avatar y perfil en drawer
- Drawer + Stack anidado
- Confirmación de logout

### 🏗️ Estructura:

```
settings-app/
├── 4 pantallas: Home, Settings, About, Help
├── Custom Drawer con perfil
├── Logout con confirmación
├── Items adicionales personalizados
└── Drawer + Stack anidado
```

### 📊 Evaluación:

- **Drawer funcional:** 30 pts
- **Custom drawer:** 25 pts
- **Íconos y estilos:** 20 pts
- **Navegación anidada:** 15 pts
- **Logout confirmación:** 10 pts

[📖 Ver práctica completa →](./practica-03-drawer-navigator.md)

---

## 📚 Requisitos Previos

### Conocimientos:

- ✅ React Native básico
- ✅ Componentes funcionales y hooks
- ✅ TypeScript básico (recomendado)
- ✅ Teoría de React Navigation (Semana 2)

### Dependencias:

```bash
# Instalar React Navigation y dependencias
pnpm add @react-navigation/native
pnpm add @react-navigation/native-stack
pnpm add @react-navigation/bottom-tabs
pnpm add @react-navigation/drawer

# Dependencias de Expo
pnpm add react-native-screens react-native-safe-area-context

# Para Drawer (práctica 3)
pnpm add react-native-gesture-handler react-native-reanimated

# Íconos
pnpm add @expo/vector-icons

# Styling (si usas NativeWind)
pnpm add nativewind
pnpm add --save-dev tailwindcss
```

---

## 🚀 Cómo Usar las Prácticas

### En Clase (Presencial):

1. **Lee la introducción** de la práctica (2 min)
2. **Sigue los pasos** del instructor (paso a paso)
3. **Escribe el código** junto con el instructor
4. **Prueba cada parte** antes de continuar
5. **Haz preguntas** cuando tengas dudas

### En Casa (Autónomo):

1. **Revisa la teoría** antes de empezar
2. **Lee toda la práctica** primero
3. **Implementa parte por parte** sin apuros
4. **Consulta el troubleshooting** si hay errores
5. **Intenta las mejoras opcionales** para profundizar

---

## 🎓 Metodología

### Estructura de Cada Práctica:

```
📝 Práctica X
├── 🎯 Objetivos de aprendizaje
├── 📋 Requisitos previos
├── 🏗️ Estructura del proyecto
├── 📝 Parte 1: Setup inicial
├── 📝 Parte 2: Tipos TypeScript
├── 📝 Partes 3-N: Implementación paso a paso
├── ✅ Checklist de verificación
├── 🎨 Mejoras opcionales (3 niveles)
├── 🐛 Problemas comunes y soluciones
└── 🎯 Criterios de evaluación
```

### Código con Documentación:

Cada código incluye comentarios explicativos:

```typescript
/**
 * ComponentName - Descripción breve
 *
 * ¿Qué hace?
 * Explicación de la funcionalidad
 *
 * ¿Para qué?
 * Propósito y beneficios
 *
 * ¿Cómo funciona?
 * Pasos del proceso (cuando aplique)
 */
```

---

## 📊 Sistema de Evaluación

### Por Práctica:

- Cada práctica vale **100 puntos**
- Se evalúan múltiples criterios (ver detalles en cada práctica)
- Hay checkboxes de verificación

### Calificación General:

- **Práctica 1:** 33.33% (Stack Navigator)
- **Práctica 2:** 33.33% (Tab Navigator)
- **Práctica 3:** 33.34% (Drawer Navigator)
- **Total:** 100% de la nota de prácticas

### Escala:

- **90-100:** ⭐⭐⭐⭐⭐ Excelente
- **80-89:** ⭐⭐⭐⭐ Muy Bueno
- **70-79:** ⭐⭐⭐ Bueno
- **60-69:** ⭐⭐ Suficiente
- **0-59:** ⭐ Insuficiente

---

## 🎨 Mejoras Opcionales

Cada práctica incluye 3 niveles de mejoras:

### 🟢 Nivel 1 (Fácil):

- Cambios visuales básicos
- Agregar más datos
- Modificar estilos

### 🟡 Nivel 2 (Medio):

- Nuevas funcionalidades
- Integración de APIs
- Optimizaciones

### 🔴 Nivel 3 (Avanzado):

- Características complejas
- Animaciones personalizadas
- Arquitectura avanzada

> 💡 **Tip:** Completa las mejoras opcionales para obtener puntos extra y profundizar tu aprendizaje.

---

## 🐛 Troubleshooting General

### Problema: Errores de importación

```bash
# Solución: Verifica que instalaste todas las dependencias
pnpm install
```

### Problema: "Cannot find module..."

```bash
# Solución: Limpia caché y reinstala
pnpm start --clear
```

### Problema: TypeScript errors

```typescript
// Solución: Verifica que los tipos estén bien definidos
// Consulta la sección de tipos en cada práctica
```

### Problema: El navegador no aparece

```typescript
// Solución: Asegúrate de envolver en NavigationContainer
<NavigationContainer>
  <YourNavigator />
</NavigationContainer>
```

---

## 📖 Recursos Adicionales

### Documentación Oficial:

- [React Navigation Docs](https://reactnavigation.org/docs/getting-started)
- [Stack Navigator](https://reactnavigation.org/docs/stack-navigator)
- [Bottom Tabs](https://reactnavigation.org/docs/bottom-tab-navigator)
- [Drawer Navigator](https://reactnavigation.org/docs/drawer-navigator)

### Videos Recomendados:

- React Navigation 6 - Complete Tutorial
- Nested Navigation in React Native
- Custom Drawer in React Navigation

### Comunidad:

- [React Navigation Discord](https://discord.gg/reactiflux)
- [Stack Overflow - React Navigation](https://stackoverflow.com/questions/tagged/react-navigation)

---

## 🔜 Siguiente Paso

Una vez completadas las 3 prácticas, estarás listo para el:

### 🚀 [Proyecto Integrador - Semana 2](../3-proyecto/README.md)

**E-Commerce App** que combina:

- ✅ Stack Navigator (flujo de compra)
- ✅ Tab Navigator (categorías)
- ✅ Drawer Navigator (perfil y configuración)

---

## ⏱️ Distribución de Tiempo

### Sesión Presencial (6 horas):

- **Práctica 1:** 1h 15min (45min + 30min Q&A)
- **Práctica 2:** 1h 15min (45min + 30min Q&A)
- **Práctica 3:** 1h (30min + 30min Q&A)
- **Breaks:** 30min (3x 10min)
- **Integración y dudas:** 2h

### Trabajo Autónomo (recomendado):

- **Completar prácticas:** 2-3h
- **Mejoras opcionales:** 1-2h
- **Investigación adicional:** 1h

> **Total aprox:** 6h presencial + 4-6h autónomo = **10-12h**

---

## ✅ Checklist de Progreso

### Antes de empezar:

- [ ] Leí la teoría de React Navigation
- [ ] Instalé todas las dependencias
- [ ] Mi entorno de desarrollo funciona
- [ ] Entiendo los conceptos de navegación

### Durante las prácticas:

- [ ] Práctica 1: Stack Navigator completada
- [ ] Práctica 2: Tab Navigator completada
- [ ] Práctica 3: Drawer Navigator completada
- [ ] Todos los checkboxes de verificación marcados
- [ ] Probé cada app en mi dispositivo/emulador

### Después de las prácticas:

- [ ] Entiendo cuándo usar cada tipo de navegación
- [ ] Puedo anidar navegadores correctamente
- [ ] Sé cómo personalizar la navegación
- [ ] Estoy listo para el proyecto integrador

---

## 💡 Consejos del Instructor

### 🎯 Para Aprender Mejor:

1. **No copies y pegues** - Escribe cada línea
2. **Lee los comentarios** - Explican el QUÉ, PARA QUÉ y CÓMO
3. **Experimenta** - Cambia valores y observa resultados
4. **Pregunta** - No hay preguntas tontas
5. **Practica** - Repite las prácticas varias veces

### ⚠️ Errores Comunes:

- Olvidar el `NavigationContainer`
- No instalar todas las dependencias
- No configurar Babel para Drawer
- Confundir tipos de navegación
- No leer la documentación de errores

### 🚀 Para Destacar:

- Completa las mejoras opcionales
- Personaliza los estilos
- Agrega features adicionales
- Documenta tu código
- Comparte con tus compañeros

---

## 📞 Soporte

### Durante la Clase:

- 🙋 Levanta la mano
- 💬 Pregunta al instructor
- 👥 Colabora con compañeros

### Fuera de Clase:

- 📧 Email al instructor
- 💻 Foro del bootcamp
- 🤝 Grupo de estudio

---

## 📄 Licencia y Uso

Este material es parte del **Bootcamp React Native 2025** y está diseñado con fines educativos.

- ✅ Puedes usar el código en tus proyectos personales
- ✅ Puedes modificar y experimentar libremente
- ✅ Puedes compartir con otros estudiantes del bootcamp
- ❌ No redistribuir comercialmente sin permiso

---

**¡Buena suerte con las prácticas! 🚀**

_Si tienes dudas, recuerda: el mejor código es el que funciona, pero el código excelente es el que además entiendes._ 💙

---

_Semana 2: Navegación en React Native - Prácticas_  
_Bootcamp React Native 2025 - EPTI_
