# 01. Fundamentos de React Native

**Duración:** 45 minutos (PRESENCIAL)  
**Modalidad:** Explicación + Demo en vivo  
**Objetivo:** Comprender qué es React Native y ver una app real funcionando

---

## 🎯 Objetivos de Aprendizaje

Al finalizar este módulo presencial, serás capaz de:

- ✅ Explicar qué es React Native y cómo funciona
- ✅ Identificar diferencias entre React Native y desarrollo nativo
- ✅ Reconocer cuándo usar React Native
- ✅ Ver una aplicación real en funcionamiento

---

## 📱 ¿Qué es React Native?

**React Native** es un framework de código abierto creado por Meta (Facebook) que permite desarrollar aplicaciones móviles **nativas** usando **JavaScript y React**.

### Concepto Clave: "Learn Once, Write Anywhere"

```
      Código JavaScript + React
               ↓
        React Native Bridge
               ↓
        ┌──────┴──────┐
        ↓             ↓
   iOS Native    Android Native
   (Swift/ObjC)  (Java/Kotlin)
```

**¿Qué significa "Nativo"?**

- No es una WebView (no es HTML/CSS ejecutándose en el navegador del móvil)
- Usa componentes nativos reales del sistema operativo
- Performance comparable a apps nativas puras

---

## 🆚 React Native vs Alternativas

### Comparativa Rápida

| Aspecto                     | React Native          | Flutter              | Nativo Puro           |
| --------------------------- | --------------------- | -------------------- | --------------------- |
| **Lenguaje**                | JavaScript/TypeScript | Dart                 | Swift/Kotlin          |
| **Performance**             | ⭐⭐⭐⭐ Muy buena    | ⭐⭐⭐⭐⭐ Excelente | ⭐⭐⭐⭐⭐ Excelente  |
| **Curva de aprendizaje**    | ⭐⭐⭐ Moderada       | ⭐⭐⭐⭐ Alta        | ⭐⭐⭐⭐⭐ Muy alta   |
| **Comunidad**               | ⭐⭐⭐⭐⭐ Enorme     | ⭐⭐⭐⭐ Grande      | ⭐⭐⭐⭐⭐ Enorme     |
| **Hot Reload**              | ✅ Sí (Fast Refresh)  | ✅ Sí                | ❌ No (recompilación) |
| **Reutilización de código** | ~80-95%               | ~90-95%              | 0% (separado)         |
| **Ecosistema JS**           | ✅ Compatible         | ❌ No                | ❌ No                 |

### ¿Cuándo usar React Native?

✅ **SÍ usar React Native cuando:**

- Ya conoces JavaScript/React
- Necesitas apps para iOS y Android rápidamente
- El equipo tiene experiencia web
- Quieres reutilizar código con React Web
- Necesitas iterar rápido (startups, MVPs)

⚠️ **CONSIDERAR alternativas cuando:**

- La app requiere performance extremo (juegos 3D, AR/VR complejo)
- Necesitas acceso profundo a APIs nativas específicas
- El equipo no tiene experiencia con JavaScript

---

## 🏗️ Arquitectura de React Native

### Modelo Simplificado

```
┌─────────────────────────────────┐
│  JavaScript Thread (Tu código)  │
│  • Lógica de negocio             │
│  • Componentes React             │
│  • Estado (state)                │
└──────────────┬──────────────────┘
               ↓
          Bridge (JSON)
               ↓
┌──────────────┴──────────────────┐
│    Native Thread (SO)            │
│  • UI Components                 │
│  • API nativas                   │
│  • Renderizado                   │
└──────────────────────────────────┘
```

**Flujo de trabajo:**

1. Escribes código en JavaScript/React
2. React Native traduce tus componentes a equivalentes nativos
3. El bridge comunica entre JS y nativo
4. El sistema operativo renderiza UI nativa real

**Ejemplo:**

```tsx
// Tu código JavaScript:
<View>
  <Text>Hola Mundo</Text>
</View>

// Se convierte en:
iOS → UIView + UILabel
Android → ViewGroup + TextView
```

---

## 🌟 Casos de Éxito

### Apps Famosas Hechas con React Native

| App           | Descripción          | Usuarios            |
| ------------- | -------------------- | ------------------- |
| **Facebook**  | Red social           | 3+ mil millones     |
| **Instagram** | Foto/Video sharing   | 2+ mil millones     |
| **WhatsApp**  | Mensajería           | 2+ mil millones     |
| **Discord**   | Comunicación gamers  | 150+ millones       |
| **Shopify**   | eCommerce            | Millones de tiendas |
| **Uber Eats** | Delivery comida      | 66+ millones        |
| **Pinterest** | Inspiración visual   | 450+ millones       |
| **Coinbase**  | Crypto exchange      | 110+ millones       |
| **Skype**     | Videollamadas        | 300+ millones       |
| **Bloomberg** | Noticias financieras | Millones            |

**¿Por qué lo usan?**

- Desarrollo más rápido (un solo equipo para ambas plataformas)
- Actualizaciones sin pasar por app stores (over-the-air updates)
- Reutilización de talento web
- Hot Reload acelera desarrollo

---

## 🔥 Ventajas de React Native

### 1. **Reutilización de Código**

```
Desarrollo Tradicional:
iOS app → 3 meses (equipo Swift)
Android app → 3 meses (equipo Kotlin)
Total: 6 meses, 2 equipos

React Native:
Ambas plataformas → 3.5 meses (un equipo)
Ahorro: ~40-50% tiempo y costo
```

### 2. **Fast Refresh (Hot Reload)**

- Cambios en código se reflejan **instantáneamente** sin perder el estado de la app
- Desarrollo ~2-3x más rápido que nativo puro
- No necesitas recompilar toda la app

### 3. **Ecosistema JavaScript**

- Acceso a **npm** con millones de paquetes
- Librerías de React Web compatibles
- Herramientas de desarrollo maduras

### 4. **Comunidad Gigante**

- Meta (Facebook) como principal sponsor
- Microsoft, Expo, Shopify contribuyen activamente
- Miles de librerías de terceros
- Documentación extensa

### 5. **Over-The-Air Updates**

- Actualiza la app sin pasar por App Store review
- Despliega fixes críticos en minutos
- A/B testing en tiempo real

---

## ⚠️ Limitaciones y Consideraciones

### Desventajas de React Native

1. **Performance en casos extremos**

   - Animaciones complejas 60fps
   - Procesamiento intensivo de imágenes
   - Juegos 3D/AR avanzado

2. **Bridge overhead**

   - Comunicación JS ↔ Native tiene costo
   - En apps simples: imperceptible
   - En apps complejas: requiere optimización

3. **Dependencia de librerías de terceros**

   - Algunas APIs nativas requieren módulos nativos
   - Necesitas verificar compatibilidad con versiones

4. **Debugging más complejo**

   - Stack traces pueden ser confusos
   - Errores nativos requieren conocimiento de Swift/Kotlin

5. **Tamaño de la app**
   - Apps RN son ~5-10MB más grandes que nativas puras
   - Incluye runtime de JavaScript (Hermes)

---

## 🛠️ Herramientas del Ecosistema

### Core

- **React Native** - Framework principal
- **Metro** - Bundler (como Webpack)
- **Hermes** - Engine de JavaScript optimizado para móviles
- **Flipper** - Debugger avanzado

### Frameworks y Plataformas

- **Expo** - Plataforma que simplifica desarrollo RN (usaremos este)
- **Ignite** - Boilerplate con mejores prácticas
- **NativeBase** - Librería de componentes UI

### Navegación y Estado

- **React Navigation** - Navegación entre pantallas
- **Expo Router** - Enrutamiento basado en archivos (Next.js style)
- **Redux / Zustand / Context API** - Manejo de estado global

---

## 🎯 ¿Por Qué Aprender React Native en 2025?

### Demanda Laboral

- Salario promedio: $70,000 - $120,000 USD/año
- Crecimiento de ofertas: +35% anual
- Empresas buscan desarrolladores fullstack (web + móvil)

### Versatilidad

```
Aprende React Native →
  ✅ Apps iOS
  ✅ Apps Android
  ✅ React Web (mismo conocimiento)
  ✅ Apps de escritorio (React Native Windows/macOS)
  ✅ tvOS / Apple TV
  ✅ Web con React Native Web
```

### Futuro del Framework

- Meta invierte fuertemente (es core para Instagram/Facebook)
- Nueva arquitectura (Fabric + TurboModules) mejora performance
- Compatibilidad con React 18+ y Server Components
- Adopción empresarial en crecimiento

---

## 🚀 Demostración en Vivo

### Durante la clase presencial veremos:

1. **App funcionando en Expo Go**

   - Escanear QR code
   - Ver cambios en tiempo real (Fast Refresh)
   - Navegar por diferentes pantallas

2. **Comparativa visual**

   - Misma app en iOS y Android
   - Diferencias sutiles en UI
   - Cómo adaptar estilos por plataforma

3. **Código real**
   - Estructura de un proyecto
   - Cómo se ve un componente
   - Herramientas de debugging

**Nota:** Esta demostración es **fundamental** para comprender el flujo de desarrollo. Presta atención y toma notas de las preguntas que surjan.

---

## 📝 Ejercicio de Reflexión (Presencial)

### Discusión en Clase (10 minutos)

**Pregunta 1:** Piensa en una app que usas diariamente. ¿Crees que está hecha con React Native? ¿Por qué?

**Pregunta 2:** ¿Qué ventaja de React Native te parece más valiosa para tu carrera?

**Pregunta 3:** ¿Qué tipo de app NO harías con React Native y por qué?

---

## ✅ Checklist de Comprensión

Al finalizar este módulo deberías poder:

- [ ] Explicar qué es React Native en 2-3 frases
- [ ] Mencionar al menos 3 apps famosas hechas con RN
- [ ] Diferenciar entre React Native y desarrollo nativo
- [ ] Identificar cuándo usar o no usar React Native
- [ ] Entender el concepto de "bridge" entre JS y nativo
- [ ] Explicar qué es Fast Refresh y por qué es útil

---

## 🔗 Recursos para Profundizar (Autónomo)

### Documentación Oficial

- [React Native Docs](https://reactnative.dev/docs/getting-started)
- [Expo Documentation](https://docs.expo.dev/)
- [React Docs](https://react.dev/)

### Videos Recomendados (30 minutos total)

- [React Native en 100 segundos](https://www.youtube.com/watch?v=gvkqT_Uoahw) - Fireship (2min)
- [¿Qué es React Native?](https://www.youtube.com/watch?v=0-S5a0eXPoc) - Traversy Media (15min)
- [React Native vs Flutter vs Native](https://www.youtube.com/watch?v=X8ipUgXH6jw) - Fireship (10min)

### Artículos

- [State of React Native 2024](https://reactnative.dev/blog)
- [Airbnb's React Native Story](https://medium.com/airbnb-engineering/react-native-at-airbnb-f95aa460be1c)
- [Discord's React Native Journey](https://discord.com/blog/how-discord-achieves-native-ios-performance-with-react-native)

---

## 🎓 Próximo Módulo

**Siguiente clase presencial:**  
[02. Setup y Primer Proyecto](./02-setup-y-primer-proyecto.md) - Configuraremos el entorno y crearemos nuestra primera app juntos.

---

**Tiempo presencial:** 45 minutos ✓  
**Tiempo autónomo recomendado:** ~30 minutos (videos + lectura opcional)
