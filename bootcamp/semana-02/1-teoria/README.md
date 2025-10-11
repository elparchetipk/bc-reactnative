# Teoría - Navegación y Routing

> **Contenido teórico de la Semana 2**  
> 4.5 horas de sesión presencial divididas en 3 módulos

---

## 📚 Módulos de Teoría

### 1. [Introducción a React Navigation](./01-introduccion-react-navigation.md)

**Duración:** 1 hora

**Contenido:**

- ¿Por qué necesitamos navegación?
- React Navigation vs Expo Router
- Instalación y configuración
- Conceptos fundamentales: Navigator, Screen, Route
- Primera navegación básica
- NavigationContainer y Stack Navigator
- Debugging básico

**Objetivos:**

- ✅ Comprender la necesidad de navegación en apps móviles
- ✅ Conocer las opciones disponibles
- ✅ Instalar React Navigation correctamente
- ✅ Crear tu primera navegación Stack

---

### 2. [Stack Navigator en Profundidad](./02-stack-navigator.md)

**Duración:** 1.5 horas

**Contenido:**

- Concepto de pila (LIFO)
- Métodos de navegación: navigate, push, goBack, popToTop, replace
- Pasar parámetros entre pantallas
- TypeScript type-safe navigation
- Personalización de headers (estáticos y dinámicos)
- Botones en headers
- Modales y pantallas especiales
- Animaciones y transiciones
- Gestión programática del stack
- Deep linking básico

**Objetivos:**

- ✅ Dominar el Stack Navigator
- ✅ Pasar datos entre pantallas de forma segura
- ✅ Crear headers personalizados
- ✅ Implementar modales
- ✅ Configurar TypeScript

---

### 3. [Tab Navigator y Drawer Navigator](./03-tab-drawer-navigator.md)

**Duración:** 2 horas

**Contenido:**

- Bottom Tab Navigator: conceptos y casos de uso
- Personalización de tabs con íconos
- Badges y notificaciones en tabs
- Estilos personalizados para tabs
- Drawer Navigator: menú lateral deslizable
- Custom Drawer Content
- Navegación anidada (Drawer + Tab + Stack)
- Navegar entre diferentes navegadores
- TypeScript con navegación compleja
- Mejores prácticas y organización

**Objetivos:**

- ✅ Implementar Bottom Tabs con íconos y badges
- ✅ Crear Drawer Navigator personalizado
- ✅ Combinar múltiples navegadores (anidado)
- ✅ Gestionar navegación compleja
- ✅ Organizar código de navegación profesionalmente

---

## ⏱️ Cronograma de la Sesión Presencial

### Primera Parte (9:00 - 10:30)

**Módulo 1:** Introducción a React Navigation (1h)

- Teoría y conceptos (30 min)
- Demo en vivo: Primera navegación (20 min)
- Ejercicio guiado (10 min)

**Break:** 15 minutos ☕

---

### Segunda Parte (10:45 - 12:30)

**Módulo 2:** Stack Navigator (1.5h)

- Teoría: LIFO y métodos de navegación (20 min)
- Demo: Pasar parámetros (15 min)
- Demo: TypeScript y type-safety (15 min)
- Demo: Headers personalizados (15 min)
- Ejercicio práctico: Blog App (25 min)

**Almuerzo:** 1 hora 🍽️

---

### Tercera Parte (13:30 - 15:00)

**Módulo 3:** Tab y Drawer Navigator (2h)

- Teoría: Bottom Tabs (20 min)
- Demo: Tabs con íconos y badges (20 min)
- Teoría: Drawer Navigator (15 min)
- Demo: Custom Drawer Content (15 min)
- Teoría: Navegación anidada (20 min)
- Ejercicio integrador: E-Commerce App (30 min)

---

## 🎯 Objetivos de Aprendizaje

Al finalizar los 3 módulos de teoría, serás capaz de:

1. ✅ **Comprender navegación móvil:**

   - Diferencias entre Stack, Tab y Drawer
   - Cuándo usar cada tipo de navegación
   - Estructura de navegación de apps reales

2. ✅ **Implementar navegación básica:**

   - Stack Navigator con múltiples pantallas
   - Navegar con navigate(), push(), goBack()
   - Pasar y recibir parámetros

3. ✅ **Personalizar navegación:**

   - Headers estáticos y dinámicos
   - Íconos y botones en headers
   - Estilos personalizados para tabs y drawer
   - Badges y notificaciones

4. ✅ **Navegación avanzada:**

   - Combinar Stack + Tab + Drawer (anidado)
   - Navegar entre diferentes navegadores
   - TypeScript para type-safety
   - Deep linking básico

5. ✅ **Mejores prácticas:**
   - Organización de archivos
   - Configuración centralizada
   - Componentes reutilizables
   - Debugging efectivo

---

## 📖 Recursos Complementarios

### Documentación Oficial

- [React Navigation Docs](https://reactnavigation.org/)
- [Native Stack Navigator](https://reactnavigation.org/docs/native-stack-navigator)
- [Bottom Tabs Navigator](https://reactnavigation.org/docs/bottom-tab-navigator)
- [Drawer Navigator](https://reactnavigation.org/docs/drawer-navigator)
- [TypeScript Guide](https://reactnavigation.org/docs/typescript)

### Videos Recomendados

- [React Navigation 6 - The Basics](https://www.youtube.com/watch?v=nQVCkqvU1uE)
- [Bottom Tabs + Stack Navigator](https://www.youtube.com/watch?v=VpfZiNssno8)
- [Custom Drawer Content](https://www.youtube.com/watch?v=kPm6hLTGw9k)

### Ejemplos de Código

- [React Navigation Examples](https://github.com/react-navigation/react-navigation/tree/main/example)
- [Auth Flow Example](https://reactnavigation.org/docs/auth-flow)
- [Nesting Navigators](https://reactnavigation.org/docs/nesting-navigators)

---

## ✅ Checklist de Preparación

Antes de la sesión presencial, asegúrate de:

- [ ] Haber completado la Semana 1 (fundamentos de React Native)
- [ ] Tener Node.js 22.20+ y pnpm 9+ instalados
- [ ] Tener Expo Go instalado en tu celular
- [ ] Haber clonado el repositorio del bootcamp
- [ ] Revisar la [Guía de Instalación](./../../../_docs/guias/instalacion-entorno.md)
- [ ] Leer el README principal de la Semana 2

---

## 🚀 Preparación para Prácticas

Después de la teoría, aplicarás estos conceptos en:

1. **Práctica 1:** Stack Navigator - Blog App
2. **Práctica 2:** Tab Navigator - Dashboard App
3. **Práctica 3:** Drawer Navigator - Settings App

Ver detalles en [`/2-practicas/`](./../2-practicas/README.md)

---

## 💬 Preguntas Frecuentes

### ¿Debo memorizar toda la API?

No. Enfócate en entender los conceptos y cuándo usar cada navegador. La documentación siempre estará disponible.

### ¿Es obligatorio usar TypeScript?

No es obligatorio, pero es **altamente recomendado**. TypeScript previene muchos errores comunes en navegación.

### ¿Puedo usar Expo Router en lugar de React Navigation?

Sí, pero en este bootcamp enseñamos React Navigation porque:

- Es el estándar de la industria
- Funciona con Expo y bare workflow
- Conocimiento transferible a cualquier proyecto RN

### ¿Cuántos navegadores puedo anidar?

Técnicamente, sin límite. Pero en la práctica, 2-3 niveles (Drawer > Tab > Stack) es lo más común y recomendado.

---

## 🎓 Evaluación

La teoría se evaluará mediante:

1. **Comprensión conceptual** (20% de la nota semanal)

   - Quiz sobre conceptos clave
   - Preguntas durante la clase
   - Participación en ejercicios

2. **Aplicación práctica** (80%)
   - Prácticas guiadas (30%)
   - Proyecto integrador (50%)

Ver detalles en [RUBRICA-EVALUACION.md](./../RUBRICA-EVALUACION.md)

---

## 📞 Soporte

Si tienes dudas durante el estudio:

1. Revisa la documentación oficial de React Navigation
2. Consulta los ejemplos de código en el repositorio
3. Pregunta en el foro del bootcamp
4. Contacta al instructor durante las office hours

---

_Teoría - Navegación y Routing_  
_Semana 2 - Bootcamp React Native 2025_
