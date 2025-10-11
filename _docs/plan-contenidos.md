# 📋 Plan de Contenidos - Bootcamp React Native + Expo

> **Duración:** 6 semanas  
> **Formato:** 6h presenciales + trabajo autónomo (recomendado ~12h/semana)  
> **Nivel:** Intermedio  
> **Total:** ~108 horas (6h presenciales × 6 semanas + trabajo autónomo)

---

## 📊 Visión General

### Objetivos Generales del Bootcamp

Al finalizar el bootcamp, los estudiantes serán capaces de:

1. ✅ Desarrollar aplicaciones móviles multiplataforma con React Native + Expo
2. ✅ Implementar navegación compleja y flujos de usuario profesionales
3. ✅ Gestionar estado local y global de forma eficiente
4. ✅ Consumir APIs REST y manejar autenticación
5. ✅ Integrar features nativas (cámara, GPS, notificaciones)
6. ✅ Aplicar mejores prácticas y patrones de diseño
7. ✅ Publicar aplicaciones en producción
8. ✅ Escribir código limpio, mantenible y escalable

### Distribución de Tiempo por Semana

| Actividad           | Presencial | Autónoma (sugerida) | Total (aprox.) |
| ------------------- | ---------- | ------------------- | -------------- |
| Teoría y conceptos  | 2-3h       | ~2-3h               | 4-6h           |
| Prácticas guiadas   | 2-3h       | ~3-4h               | 5-7h           |
| Proyecto integrador | 1h         | ~5-7h               | 6-8h           |
| **Total Semanal**   | **6h**     | **~10-14h**         | **~16-20h**    |

> **Nota:** Las horas de trabajo autónomo son flexibles y dependen del ritmo de cada estudiante. La recomendación es de aproximadamente 12 horas semanales, pero puede variar según experiencia previa y disponibilidad.

### Sistema de Evaluación

| Componente | Peso     | Descripción                                           |
| ---------- | -------- | ----------------------------------------------------- |
| Teoría     | 20%      | Comprensión de conceptos, aplicación de conocimientos |
| Prácticas  | 30%      | Ejercicios semanales, calidad de código               |
| Proyecto   | 50%      | Funcionalidad, mejores prácticas, documentación       |
| **Total**  | **100%** | Evaluación continua semanal                           |

---

## 📅 Semana 1: Fundamentos de React Native

### 🎯 Objetivos de Aprendizaje

- [ ] Configurar entorno de desarrollo completo (Node.js, pnpm, Expo)
- [ ] Comprender la arquitectura de React Native
- [ ] Dominar componentes básicos (View, Text, Image, ScrollView)
- [ ] Aplicar estilos con StyleSheet y Flexbox
- [ ] Manejar eventos y estado básico con hooks
- [ ] Crear layouts responsive

### 📖 Contenido Teórico (2.5h presencial + 2h autónoma)

#### 1.1 Introducción a React Native (45min)

- **What?** Framework para desarrollo móvil multiplataforma
- **For?** Crear apps nativas con JavaScript/React
- **Impact?** Un código, múltiples plataformas (iOS, Android, Web)

**Temas:**

- Historia y evolución de React Native
- Diferencias entre React Native y React Web
- Ventajas y limitaciones
- Casos de éxito (Instagram, Facebook, Discord)

#### 1.2 Configuración del Entorno (1h)

**Herramientas necesarias:**

- Node.js v18+ y pnpm
- Expo CLI y Expo Go
- VS Code con extensiones recomendadas
- Android Studio / Xcode (opcional)

**Primeros pasos:**

- Crear primer proyecto con Expo
- Estructura de archivos
- Ejecutar en simulador y dispositivo físico
- Hot reload y debugging

#### 1.3 Componentes Básicos (1.5h)

**Core Components:**

- `View` - Contenedor principal
- `Text` - Textos y tipografía
- `Image` - Imágenes locales y remotas
- `ScrollView` - Contenido scrollable
- `Button` - Botones básicos
- `TextInput` - Inputs de formulario
- `TouchableOpacity` - Elementos clickeables

**Props y composición:**

- Pasar y recibir props
- Children components
- Composición vs herencia

#### 1.4 Estilos y Layouts (1.5h)

**StyleSheet API:**

- Crear estilos con StyleSheet.create()
- Inline styles vs StyleSheet
- Estilos múltiples con arrays

**Flexbox:**

- flexDirection, justifyContent, alignItems
- flex, flexWrap, flexBasis
- Layouts comunes (header, content, footer)
- Responsive design con Dimensions

**Platform-specific:**

- Platform.OS y Platform.select()
- Estilos específicos por plataforma

#### 1.5 Estado y Eventos (1h)

**React Hooks básicos:**

- useState para estado local
- useEffect para efectos secundarios
- Reglas de los hooks

**Event Handling:**

- onPress, onChangeText, onScroll
- Manejo de formularios básicos
- Validación simple

### 💻 Prácticas Guiadas (2.5h presencial + 3h autónoma)

#### Práctica 1: Hello World App (30min)

**Objetivo:** Crear primera app funcional

- Setup de proyecto
- Componentes básicos
- Estilos simples
- Ejecutar en Expo Go

#### Práctica 2: Component Gallery (1h)

**Objetivo:** Explorar todos los componentes básicos

- Vista con todos los core components
- Props y configuraciones
- Estilos aplicados
- Interactividad básica

#### Práctica 3: Flexbox Playground (1h)

**Objetivo:** Dominar Flexbox

- 5 layouts diferentes
- Header, content, footer
- Grids y listas
- Responsive design

#### Práctica 4: Todo List Simple (1.5h)

**Objetivo:** Integrar conceptos aprendidos

- Lista de tareas con estado
- Agregar y eliminar items
- Marcar como completado
- Estilos personalizados

### 🚀 Proyecto Integrador: Personal Profile App (1h presencial + ~5-6h autónoma recomendada)

**Descripción:**
Crear una aplicación de perfil personal que muestre información del usuario de forma atractiva.

**Requerimientos funcionales:**

- [ ] Pantalla principal con foto de perfil
- [ ] Información personal (nombre, bio, ubicación)
- [ ] Lista de habilidades/intereses
- [ ] Sección de redes sociales con links
- [ ] Diseño responsive y atractivo

**Requerimientos técnicos:**

- [ ] Uso correcto de componentes básicos
- [ ] Estilos con StyleSheet y Flexbox
- [ ] Al menos 3 componentes custom
- [ ] Código limpio y comentado
- [ ] README con instrucciones

**Criterios de evaluación:**

- Funcionalidad completa (30%)
- Calidad del código (25%)
- Diseño UI/UX (25%)
- Documentación (20%)

### 📚 Recursos Adicionales

**Documentación:**

- [React Native Core Components](https://reactnative.dev/docs/components-and-apis)
- [Expo Documentation](https://docs.expo.dev/)
- [Flexbox Guide](https://reactnative.dev/docs/flexbox)

**Videos:**

- Curso Expo: Getting Started (YouTube)
- React Native Basics (freeCodeCamp)

**Lecturas:**

- "React Native in Action" - Cap. 1-3
- Expo Blog: Best Practices

---

## 📅 Semana 2: Navegación y Routing

### 🎯 Objetivos de Aprendizaje

- [ ] Implementar navegación entre pantallas
- [ ] Configurar React Navigation (Stack, Tab, Drawer)
- [ ] Utilizar Expo Router (file-based routing)
- [ ] Pasar parámetros entre rutas
- [ ] Gestionar el stack de navegación
- [ ] Crear transiciones y animaciones

### 📖 Contenido Teórico (2.5h presencial + 2h autónoma)

#### 2.1 Fundamentos de Navegación (45min)

**Conceptos clave:**

- Single Page Application (SPA) vs Multi-Screen
- Navigation Stack y history
- Route params y deep linking
- Navigation lifecycle

**Librerías principales:**

- React Navigation (más popular)
- Expo Router (file-based, recomendado)
- Comparación y cuándo usar cada una

#### 2.2 React Navigation (2h)

**Stack Navigator:**

- Instalación y setup
- Configurar NavigationContainer
- Crear Stack.Navigator
- Push, pop, replace, goBack
- Header customización
- Transiciones entre pantallas

**Tab Navigator:**

- Bottom tabs y top tabs
- Iconos y badges
- Tab bar customización
- Combinar con Stack

**Drawer Navigator:**

- Setup y configuración
- Custom drawer content
- Gestos y animaciones
- Combinar navegadores

**Navegación avanzada:**

- Nested navigators
- Pasar params
- Navigation prop vs useNavigation hook
- Deep linking y universal links

#### 2.3 Expo Router (1.5h)

**File-based routing:**

- Estructura de carpetas app/
- Rutas dinámicas [id].tsx
- Grupos de rutas (tabs)
- Layouts compartidos

**API de Expo Router:**

- useRouter, useLocalSearchParams
- Link component
- router.push, router.replace
- Navegación programática

### 💻 Prácticas Guiadas (2.5h presencial + 3h autónoma)

#### Práctica 1: Stack Navigation Basic (45min)

- 3 pantallas con Stack Navigator
- Navegación entre ellas
- Pasar datos
- Botones de navegación

#### Práctica 2: Tab Navigation (1h)

- Bottom tabs con 4 secciones
- Iconos personalizados
- Badge en uno de los tabs
- Stack dentro de cada tab

#### Práctica 3: Drawer Navigation (45min)

- Drawer con menú lateral
- Custom drawer content
- Combinar con tabs
- Perfil de usuario en drawer

#### Práctica 4: Expo Router App (1.5h)

- Crear app con file-based routing
- Rutas dinámicas
- Layout compartido
- Navegación entre rutas

### 🚀 Proyecto Integrador: Multi-Screen News App (1h presencial + 6h autónoma)

**Descripción:**
App de noticias con múltiples pantallas y navegación compleja.

**Pantallas requeridas:**

- [ ] Home (lista de noticias)
- [ ] Detalle de noticia
- [ ] Categorías (tabs)
- [ ] Favoritos
- [ ] Perfil de usuario
- [ ] Configuración

**Navegación requerida:**

- [ ] Stack principal
- [ ] Bottom tabs (Home, Categorías, Favoritos, Perfil)
- [ ] Drawer opcional para menú
- [ ] Deep linking a detalle de noticia

**Criterios de evaluación:**

- Navegación funcional (35%)
- Estructura de navegadores (25%)
- UX y fluidez (20%)
- Código limpio (20%)

### 📚 Recursos Adicionales

**Documentación:**

- [React Navigation Docs](https://reactnavigation.org/)
- [Expo Router Docs](https://docs.expo.dev/router/introduction/)

**Videos:**

- React Navigation Tutorial (YouTube)
- Expo Router Complete Guide

---

## 📅 Semana 3: Estado y Gestión de Datos

### 🎯 Objetivos de Aprendizaje

- [ ] Gestionar estado local con hooks avanzados
- [ ] Implementar Context API para estado global
- [ ] Persistir datos con AsyncStorage
- [ ] Usar Expo SecureStore para datos sensibles
- [ ] Aplicar patrones de state management
- [ ] Optimizar re-renders

### 📖 Contenido Teórico (2.5h presencial + 2.5h autónoma)

#### 3.1 Hooks Avanzados (1.5h)

**useState y useReducer:**

- Estado complejo con useReducer
- Cuándo usar cada uno
- Patterns comunes

**useEffect:**

- Dependencies array
- Cleanup functions
- Efectos asíncronos
- Custom hooks

**useMemo y useCallback:**

- Optimización de performance
- Memoización de valores
- Prevenir re-renders innecesarios

**useRef:**

- Referencias a elementos
- Valores mutables
- Focus management

#### 3.2 Context API (1.5h)

**Fundamentos:**

- Crear contextos
- Provider y Consumer
- useContext hook
- Composición de providers

**Patterns:**

- Auth context
- Theme context
- User preferences
- Multi-level contexts

**Best practices:**

- Separar concerns
- Evitar prop drilling
- Context vs Redux
- Performance considerations

#### 3.3 Persistencia Local (1.5h)

**AsyncStorage:**

- API básica (get, set, remove)
- Almacenar objetos
- Error handling
- Límites y consideraciones

**Expo SecureStore:**

- Almacenamiento seguro
- Tokens y credenciales
- Diferencias con AsyncStorage
- Cuándo usar cada uno

**Patterns de persistencia:**

- Auto-save
- Optimistic updates
- Sync con backend

### 💻 Prácticas Guiadas (2.5h presencial + 3.5h autónoma)

#### Práctica 1: Custom Hooks (1h)

- useToggle
- useDebounce
- useAsync
- useFetch

#### Práctica 2: Theme Context (1h)

- Dark/Light theme
- Context provider
- Switch de tema
- Persistir preferencia

#### Práctica 3: Auth Context (1.5h)

- Login/Logout flow
- Protected routes
- Token storage
- User state management

#### Práctica 4: Shopping Cart (2h)

- Cart context
- Add/Remove items
- Persist cart
- Calculate totals

### 🚀 Proyecto Integrador: Task Manager App (1h presencial + 7h autónoma)

**Descripción:**
Aplicación completa de gestión de tareas con estado global y persistencia.

**Features requeridas:**

- [ ] CRUD de tareas (Create, Read, Update, Delete)
- [ ] Categorías de tareas
- [ ] Filtros (todas, completadas, pendientes)
- [ ] Búsqueda
- [ ] Persistencia local
- [ ] Tema dark/light
- [ ] Estadísticas de tareas

**Arquitectura requerida:**

- [ ] Context API para estado global
- [ ] AsyncStorage para persistencia
- [ ] Custom hooks reutilizables
- [ ] Componentes optimizados

**Criterios de evaluación:**

- Funcionalidad completa (30%)
- Arquitectura de estado (30%)
- Performance (20%)
- Código y documentación (20%)

### 📚 Recursos Adicionales

**Documentación:**

- [React Hooks Reference](https://react.dev/reference/react)
- [AsyncStorage API](https://react-native-async-storage.github.io/async-storage/)
- [Expo SecureStore](https://docs.expo.dev/versions/latest/sdk/securestore/)

---

## 📅 Semana 4: APIs y Backend Integration

### 🎯 Objetivos de Aprendizaje

- [ ] Consumir APIs REST con Fetch y Axios
- [ ] Manejar autenticación con JWT
- [ ] Implementar loading y error states
- [ ] Crear servicios reutilizables
- [ ] Aplicar best practices de networking
- [ ] Implementar caché y optimistic updates

### 📖 Contenido Teórico (2.5h presencial + 2.5h autónoma)

#### 4.1 Fundamentos de APIs (1h)

**REST APIs:**

- HTTP methods (GET, POST, PUT, DELETE)
- Status codes y headers
- Request/Response cycle
- JSON data format
- API design basics

**Autenticación:**

- Token-based auth
- JWT (JSON Web Tokens)
- Refresh tokens
- Secure storage

#### 4.2 Fetch vs Axios (1h)

**Fetch API:**

- Sintaxis básica
- Headers y body
- Error handling
- Pros y contras

**Axios:**

- Setup y configuración
- Interceptors
- Timeout y retry
- Ventajas sobre Fetch

**Cuándo usar cada uno:**

- Proyectos simples vs complejos
- Features necesarias
- Bundle size considerations

#### 4.3 Patrones de Networking (1.5h)

**Service Layer:**

- Crear servicios API
- Centralizar endpoints
- Error handling global
- Type safety con TypeScript

**Estado de requests:**

- Loading states
- Error handling
- Success feedback
- Empty states

**Optimización:**

- Request cancellation
- Debouncing
- Caché strategies
- Optimistic updates

#### 4.4 Autenticación Flow (1h)

**Login/Register:**

- Form validation
- API calls
- Token storage
- Error messages

**Protected Routes:**

- Auth guards
- Redirect logic
- Token verification
- Auto-logout

**Token Management:**

- Refresh token flow
- Interceptors para tokens
- Handle expired tokens
- Logout cleanup

### 💻 Prácticas Guiadas (2.5h presencial + 4h autónoma)

#### Práctica 1: Fetch básico (45min)

- GET request a API pública
- Mostrar datos en lista
- Loading state
- Error handling

#### Práctica 2: CRUD completo (1.5h)

- Create, Read, Update, Delete
- Formularios
- Confirmaciones
- Feedback al usuario

#### Práctica 3: Auth Flow (1.5h)

- Login screen
- Register screen
- Token storage
- Protected navigation

#### Práctica 4: API Service (1.5h)

- Crear servicio centralizado
- Interceptors
- Error handling global
- TypeScript types

### 🚀 Proyecto Integrador: Social Feed App (1h presencial + 7h autónoma)

**Descripción:**
Red social simple con autenticación y CRUD de posts.

**Features requeridas:**

- [ ] Registro y login de usuarios
- [ ] Feed de posts con infinite scroll
- [ ] Crear nuevos posts (texto + imagen)
- [ ] Like y comentarios
- [ ] Perfil de usuario editable
- [ ] Búsqueda de usuarios
- [ ] Seguir/Dejar de seguir

**Backend sugerido:**

- [JSONPlaceholder](https://jsonplaceholder.typicode.com/) para mock
- [DummyJSON](https://dummyjson.com/) con auth
- O crear backend simple con Express

**Criterios de evaluación:**

- Funcionalidad completa (30%)
- Arquitectura de servicios (25%)
- Auth flow (20%)
- UX y error handling (15%)
- Documentación (10%)

### 📚 Recursos Adicionales

**APIs públicas para practicar:**

- [JSONPlaceholder](https://jsonplaceholder.typicode.com/)
- [The Movie Database (TMDB)](https://www.themoviedb.org/documentation/api)
- [OpenWeather API](https://openweathermap.org/api)
- [News API](https://newsapi.org/)

**Documentación:**

- [Axios Documentation](https://axios-http.com/docs/intro)
- [JWT.io](https://jwt.io/)

---

## 📅 Semana 5: Features Nativas y APIs de Expo

### 🎯 Objetivos de Aprendizaje

- [ ] Usar la cámara y galería de imágenes
- [ ] Implementar geolocalización y mapas
- [ ] Configurar notificaciones push
- [ ] Acceder a sensores del dispositivo
- [ ] Manejar permisos de forma correcta
- [ ] Optimizar performance con imágenes

### 📖 Contenido Teórico (2.5h presencial + 2h autónoma)

#### 5.1 Expo Camera y Media (1.5h)

**Expo Camera:**

- Setup y permisos
- Tomar fotos
- Grabar videos
- Front/Back camera
- Flash y zoom

**Expo ImagePicker:**

- Seleccionar de galería
- Tomar foto rápida
- Opciones de calidad
- Crop y edición básica

**Expo Media Library:**

- Guardar en galería
- Acceder a albums
- Metadata de imágenes

**Image optimization:**

- Resize y compress
- Lazy loading
- Cache strategies
- expo-image component

#### 5.2 Geolocalización y Mapas (1.5h)

**Expo Location:**

- Pedir permisos
- Current location
- Watch position
- Background location
- Geocoding y reverse geocoding

**React Native Maps:**

- Setup y configuración
- Markers y callouts
- Polylines y polygons
- Custom markers
- Map regions y zoom

**Use cases:**

- Delivery tracking
- Store locator
- Running tracker
- Check-in features

#### 5.3 Notificaciones Push (1h)

**Expo Notifications:**

- Local notifications
- Scheduled notifications
- Push notifications setup
- Notification handlers
- Custom sounds y badges

**Push notification service:**

- Expo push tokens
- Send from backend
- Notification categories
- Deep linking desde notificaciones

#### 5.4 Otros Features Nativos (1h)

**Sensores:**

- Accelerometer
- Gyroscope
- Magnetometer
- Barometer

**Device features:**

- Battery status
- Network info
- Device info
- Haptics (vibration)
- Clipboard
- Share API

**Permissions:**

- Request permissions
- Check permissions status
- Handle denials
- Settings redirect

### 💻 Prácticas Guiadas (2.5h presencial + 4h autónoma)

#### Práctica 1: Camera App (1h)

- Tomar fotos
- Cambiar cámara
- Preview de fotos
- Guardar en galería

#### Práctica 2: Map Explorer (1h)

- Mapa con ubicación actual
- Agregar markers
- Info windows
- Buscar lugares

#### Práctica 3: Notification Manager (45min)

- Local notifications
- Scheduled notifications
- Notification handlers
- Badge counts

#### Práctica 4: Sensor Dashboard (45min)

- Mostrar datos de sensores
- Accelerometer graph
- Device info
- Share functionality

### 🚀 Proyecto Integrador: Social Photo App (1h presencial + 7h autónoma)

**Descripción:**
Instagram-like app con cámara, galería, geolocalización y notificaciones.

**Features requeridas:**

- [ ] Feed de fotos con infinite scroll
- [ ] Tomar foto con cámara o subir de galería
- [ ] Filtros básicos (opcional)
- [ ] Geolocalización en posts
- [ ] Ver posts en mapa
- [ ] Likes y comentarios
- [ ] Notificaciones de nuevos likes
- [ ] Perfil con galería de fotos
- [ ] Share posts

**APIs nativas utilizadas:**

- [ ] Expo Camera
- [ ] Expo ImagePicker
- [ ] Expo Location
- [ ] React Native Maps
- [ ] Expo Notifications
- [ ] Expo Sharing

**Criterios de evaluación:**

- Funcionalidad completa (30%)
- Integración de features nativas (30%)
- Performance con imágenes (20%)
- UX y diseño (20%)

### 📚 Recursos Adicionales

**Documentación:**

- [Expo Camera](https://docs.expo.dev/versions/latest/sdk/camera/)
- [Expo Location](https://docs.expo.dev/versions/latest/sdk/location/)
- [React Native Maps](https://github.com/react-native-maps/react-native-maps)
- [Expo Notifications](https://docs.expo.dev/versions/latest/sdk/notifications/)

**Videos:**

- Building a Camera App (YouTube)
- React Native Maps Tutorial

---

## 📅 Semana 6: Testing, Optimization y Deployment

### 🎯 Objetivos de Aprendizaje

- [ ] Escribir tests unitarios y de integración
- [ ] Optimizar performance de la aplicación
- [ ] Preparar app para producción
- [ ] Crear builds con EAS
- [ ] Publicar en app stores
- [ ] Implementar CI/CD básico

### 📖 Contenido Teórico (3h presencial + 2h autónoma)

#### 6.1 Testing en React Native (1.5h)

**Jest:**

- Setup y configuración
- Unit tests de funciones
- Testing de componentes
- Mocks y spies
- Snapshots

**React Native Testing Library:**

- Render components
- Queries (getBy, findBy)
- User interactions
- Async testing
- Best practices

**E2E Testing:**

- Detox setup
- Write E2E tests
- CI integration
- Cuándo hacer E2E

#### 6.2 Performance Optimization (1.5h)

**Profiling:**

- React DevTools Profiler
- Flamegraph analysis
- Identify bottlenecks
- Memory leaks

**Optimización:**

- React.memo y useMemo
- useCallback para callbacks
- FlatList optimization
- Image optimization
- Bundle size reduction
- Code splitting

**Best practices:**

- Avoid inline functions
- Optimize re-renders
- Lazy loading
- Remove console.logs

#### 6.3 Build y Deployment (2h)

**EAS Build:**

- Setup EAS CLI
- eas.json configuration
- Development builds
- Preview builds
- Production builds

**App Store Submission:**

- App Store Connect setup
- iOS certificates y profiles
- Google Play Console setup
- Screenshots y metadata
- Review process

**OTA Updates:**

- Expo Updates
- Publish updates
- Rollback strategy
- Update channels

#### 6.4 CI/CD y Monitoring (1h)

**CI/CD básico:**

- GitHub Actions
- Automated testing
- Automated builds
- Deploy on merge

**Monitoring:**

- Sentry para error tracking
- Analytics con Firebase
- Performance monitoring
- User feedback

### 💻 Prácticas Guiadas (2h presencial + 4h autónoma)

#### Práctica 1: Unit Testing (1h)

- Tests de funciones utility
- Tests de componentes
- Coverage report
- Mocking APIs

#### Práctica 2: Performance Audit (1h)

- Profile existing app
- Identify issues
- Apply optimizations
- Measure improvements

#### Práctica 3: EAS Build (1h)

- Configure EAS
- Create development build
- Test on device
- Create preview build

#### Práctica 4: CI Setup (1h)

- GitHub Actions workflow
- Run tests on PR
- Lint check
- Build check

### 🚀 Proyecto Final: Complete App (2h presencial + 10h autónoma)

**Descripción:**
Desarrollar una aplicación completa integrando todos los conceptos del bootcamp.

**Opciones de proyecto:**

1. **E-commerce App:** Tienda online con carrito, checkout, pagos
2. **Fitness Tracker:** Registrar ejercicios, stats, rutinas
3. **Recipe App:** Recetas con búsqueda, favoritos, shopping list
4. **Chat App:** Mensajería en tiempo real con Firebase
5. **Budget Tracker:** Control de gastos con categorías y reportes

**Requerimientos obligatorios:**

- [ ] Navegación completa (Stack + Tabs)
- [ ] Estado global con Context API
- [ ] Persistencia local
- [ ] Consumo de API o Firebase
- [ ] Al menos 2 features nativas (cámara, ubicación, etc.)
- [ ] Autenticación completa
- [ ] Tests unitarios (>50% coverage)
- [ ] Optimización de performance
- [ ] Build de producción
- [ ] README completo con instrucciones

**Presentación (última sesión):**

- [ ] Demo en vivo (5-10 min)
- [ ] Explicar arquitectura
- [ ] Mostrar código destacado
- [ ] Lecciones aprendidas
- [ ] Q&A

**Criterios de evaluación:**

- Funcionalidad y features (25%)
- Arquitectura y código (25%)
- Testing y calidad (20%)
- Performance y optimization (15%)
- Presentación y documentación (15%)

### 📚 Recursos Adicionales

**Testing:**

- [Jest Documentation](https://jestjs.io/)
- [React Native Testing Library](https://callstack.github.io/react-native-testing-library/)
- [Detox E2E](https://wix.github.io/Detox/)

**Deployment:**

- [EAS Build Documentation](https://docs.expo.dev/build/introduction/)
- [App Store Review Guidelines](https://developer.apple.com/app-store/review/guidelines/)
- [Google Play Policies](https://play.google.com/about/developer-content-policy/)

---

## 📊 Resumen de Proyectos

| Semana | Proyecto              | Complejidad | Tiempo | Conceptos Clave                   |
| ------ | --------------------- | ----------- | ------ | --------------------------------- |
| 1      | Personal Profile App  | ⭐          | 6h     | Componentes, Estilos, Layouts     |
| 2      | Multi-Screen News App | ⭐⭐        | 7h     | Navegación, Routing, Deep linking |
| 3      | Task Manager App      | ⭐⭐⭐      | 8h     | Context, Hooks, Persistencia      |
| 4      | Social Feed App       | ⭐⭐⭐      | 8h     | APIs, Auth, Networking            |
| 5      | Social Photo App      | ⭐⭐⭐⭐    | 8h     | Features nativas, Permisos        |
| 6      | Complete App          | ⭐⭐⭐⭐⭐  | 12h    | Todo lo aprendido                 |

---

## 🎓 Metodología de Enseñanza

### Sesión Presencial (6 horas)

#### Estructura tipo:

1. **Warm-up** (15min)

   - Repaso semana anterior
   - Q&A de tareas autónomas
   - Objetivos del día

2. **Bloque teórico 1** (1h)

   - Presentación de conceptos
   - Live coding
   - Ejemplos interactivos

3. **Break** (15min)

4. **Práctica guiada 1** (1h)

   - Ejercicio paso a paso
   - Resolución de dudas
   - Code review grupal

5. **Bloque teórico 2** (1h)

   - Conceptos avanzados
   - Best practices
   - Casos de uso reales

6. **Break** (15min)

7. **Práctica guiada 2** (1h)

   - Ejercicio más complejo
   - Trabajo en parejas
   - Debugging conjunto

8. **Proyecto de la semana** (45min)

   - Explicación detallada
   - Planificación
   - Inicio del proyecto
   - Q&A

9. **Cierre** (15min)
   - Resumen de conceptos
   - Asignación de tareas
   - Recursos adicionales

### Trabajo Autónomo (9-14 horas)

#### Distribución sugerida:

- **Repaso teórico:** 2-3h

  - Revisar material
  - Ver videos complementarios
  - Leer documentación

- **Prácticas adicionales:** 3-4h

  - Completar ejercicios
  - Experimentar con código
  - Resolver desafíos

- **Proyecto integrador:** 4-7h
  - Desarrollo completo
  - Testing y debugging
  - Documentación
  - Preparar dudas

---

## 📈 Sistema de Evaluación Detallado

### Evaluación Semanal (100 puntos)

#### 1. Teoría (20 puntos)

- **Comprensión de conceptos** (10pts)

  - Quiz corto al inicio de sesión
  - Participación en clase
  - Respuestas a preguntas técnicas

- **Aplicación de conocimientos** (10pts)
  - Capacidad de resolver problemas
  - Uso correcto de APIs
  - Implementación de patterns

#### 2. Prácticas (30 puntos)

- **Completitud** (10pts)

  - Todas las prácticas entregadas
  - Funcionalidad completa
  - Requisitos cumplidos

- **Calidad de código** (10pts)

  - Código limpio y legible
  - Nomenclatura correcta (inglés)
  - Comentarios explicativos
  - Sin código duplicado

- **Best practices** (10pts)
  - Patrones de diseño
  - Manejo de errores
  - Performance considerations
  - Organización de archivos

#### 3. Proyecto Integrador (50 puntos)

- **Funcionalidad** (20pts)

  - Features completas
  - Sin bugs críticos
  - UX fluida
  - Edge cases manejados

- **Arquitectura** (15pts)

  - Estructura de archivos
  - Separación de concerns
  - Componentes reutilizables
  - State management apropiado

- **Código** (10pts)

  - Calidad general
  - TypeScript/PropTypes
  - Tests (cuando aplique)
  - Performance

- **Documentación** (5pts)
  - README completo
  - Instrucciones claras
  - Comentarios en código
  - Screenshots/GIFs

### Evaluación Final (Semana 6)

El proyecto final representa el 40% de la nota total del bootcamp.

**Distribución:**

- Funcionalidad (100pts)
- Arquitectura (100pts)
- Testing (80pts)
- Performance (60pts)
- Presentación (60pts)
- **Total: 400 puntos**

### Escala de Calificación General

| Rango  | Calificación | Descripción                            |
| ------ | ------------ | -------------------------------------- |
| 90-100 | Excelente    | Dominio completo, código profesional   |
| 80-89  | Muy Bueno    | Sólido entendimiento, buena ejecución  |
| 70-79  | Bueno        | Comprende conceptos, cumple requisitos |
| 60-69  | Suficiente   | Nivel mínimo aceptable                 |
| 0-59   | Insuficiente | No cumple con requisitos mínimos       |

---

## 🎯 Habilidades por Nivel

### Al finalizar cada semana, el estudiante será capaz de:

#### Semana 1 - Junior Level

✅ Crear interfaces básicas  
✅ Aplicar estilos simples  
✅ Manejar estado local

#### Semana 2 - Junior+

✅ Implementar navegación compleja  
✅ Gestionar flujos de usuarios  
✅ Crear apps multi-pantalla

#### Semana 3 - Mid-level

✅ Arquitecturar estado global  
✅ Persistir datos localmente  
✅ Crear hooks custom

#### Semana 4 - Mid-level+

✅ Integrar APIs backend  
✅ Implementar autenticación  
✅ Manejar data fetching

#### Semana 5 - Senior-ready

✅ Usar features nativas  
✅ Optimizar performance  
✅ Manejar permisos

#### Semana 6 - Senior

✅ Testing completo  
✅ Deploy a producción  
✅ Mantener apps profesionales

---

## 📚 Recursos Generales del Bootcamp

### Documentación Oficial

- [React Native Docs](https://reactnative.dev/)
- [Expo Documentation](https://docs.expo.dev/)
- [React Documentation](https://react.dev/)

### Libros Recomendados

- "Learning React Native" - Bonnie Eisenman
- "React Native in Action" - Nader Dabit
- "Fullstack React Native" - Accomazzo et al.

### Canales YouTube

- [Expo](https://www.youtube.com/@expo)
- [React Native School](https://www.youtube.com/@reactnativeschool)
- [William Candillon](https://www.youtube.com/@wcandillon)
- [Coding with Curry](https://www.youtube.com/@CodingWithCurry)

### Comunidades

- [React Native Community Discord](https://www.reactnative.dev/community/overview)
- [Expo Discord](https://chat.expo.dev/)
- [Reddit r/reactnative](https://reddit.com/r/reactnative)

### Herramientas Esenciales

- VS Code + extensiones
- React Native Debugger
- Expo Go app
- Postman/Insomnia
- Git y GitHub

---

## ✅ Checklist del Estudiante

### Antes de empezar

- [ ] Node.js v18+ instalado
- [ ] pnpm instalado globalmente
- [ ] Expo CLI configurado
- [ ] VS Code con extensiones
- [ ] Git configurado
- [ ] Cuenta GitHub activa
- [ ] Expo account creada
- [ ] Expo Go en móvil

### Durante el bootcamp

- [ ] Asistir a todas las sesiones presenciales
- [ ] Completar prácticas semanales
- [ ] Entregar proyectos a tiempo
- [ ] Participar en code reviews
- [ ] Hacer preguntas cuando sea necesario
- [ ] Estudiar material complementario
- [ ] Practicar código diariamente

### Al finalizar

- [ ] Portafolio con 6 proyectos
- [ ] App completa en producción
- [ ] Tests unitarios escritos
- [ ] GitHub con commits profesionales
- [ ] README profesionales
- [ ] Conocimiento de deployment
- [ ] Certificado del bootcamp

---

## 🎖️ Certificación

Al completar exitosamente el bootcamp (calificación ≥ 70%), el estudiante recibe:

✅ **Certificado de Finalización**

- 90-120 horas de formación
- 6 proyectos completados
- Habilidades verificadas

✅ **Portfolio**

- 6 apps en GitHub
- App final deployada
- Código profesional

✅ **Skills adquiridas:**

- React Native
- Expo
- TypeScript/JavaScript
- State Management
- API Integration
- Native Features
- Testing
- Deployment

---

## 📞 Soporte y Recursos

### Durante el bootcamp

- **Sesiones presenciales:** 6h semanales
- **Office hours:** 2h semanales (virtual)
- **Discord/Slack:** 24/7
- **Email:** respuesta en 24h

### Después del bootcamp

- **Alumni community**
- **Job board exclusivo**
- **Mentorías opcionales**
- **Material actualizado**

---

<div align="center">

**¡Éxito en tu camino como desarrollador React Native!** 🚀

[Volver al README principal](../README.md)

</div>
