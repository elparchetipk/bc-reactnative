# 1. Introducción a React Native

**Duración:** 45 minutos  
**Nivel:** Fundamentos

---

## 🎯 Objetivos de Aprendizaje

Al completar este tema, serás capaz de:

- ✅ Explicar qué es React Native y cómo funciona
- ✅ Comprender la arquitectura y el bridge de React Native
- ✅ Identificar las diferencias entre React Native y React Web
- ✅ Reconocer ventajas y limitaciones de la plataforma
- ✅ Conocer casos de éxito en la industria

---

## ❓ ¿Qué es React Native?

### Definición

**React Native** es un framework de código abierto desarrollado por Meta (Facebook) que permite crear aplicaciones móviles **nativas multiplataforma** usando JavaScript y React.

### Conceptos Clave

**¿Qué hace?**

- Permite escribir **un solo código base** que funciona en iOS, Android y Web
- Renderiza componentes nativos reales (no WebViews)
- Usa JavaScript pero produce interfaces nativas

**¿Para qué sirve?**

- Desarrollar apps móviles sin aprender Swift/Kotlin
- Compartir código entre plataformas (~70-90%)
- Acelerar el desarrollo de aplicaciones móviles
- Mantener una sola base de código

**¿Cómo impacta?**

- Reduce costos y tiempos de desarrollo
- Permite equipos más pequeños (no necesitas equipos separados iOS/Android)
- Facilita actualizaciones simultáneas en todas las plataformas

---

## 📜 Historia y Evolución

### Timeline

```
2013 - Hackathon interno en Facebook
2015 - Primera versión pública (0.1)
2016 - Adopción por empresas grandes (Instagram, Airbnb)
2018 - Reescritura del core (Fabric, TurboModules)
2020 - React Native 0.63 (mejoras de rendimiento)
2023 - React Native 0.72 (New Architecture estable)
2024 - React Native 0.74+ (Mejoras continuas)
```

### Hitos Importantes

**2015 - Lanzamiento oficial**

- Facebook libera React Native al público
- Solo iOS inicialmente

**2015 - Soporte Android**

- Expansión a la segunda plataforma más importante

**2018 - Nueva Arquitectura**

- Inicio de la reescritura del motor
- Fabric (nuevo renderizador)
- TurboModules (módulos nativos mejorados)

**2023 - New Architecture por defecto**

- Rendimiento significativamente mejorado
- Mejor sincronización con el thread nativo

---

## 🏗️ Arquitectura de React Native

### Componentes de la Arquitectura

```
┌─────────────────────────────────────┐
│     JavaScript (React)              │
│  - Lógica de negocio                │
│  - Componentes UI                   │
│  - Estado de la aplicación          │
└──────────────┬──────────────────────┘
               │
      ┌────────▼────────┐
      │   Bridge        │ ← Comunicación asíncrona
      │   (Mensajes)    │
      └────────┬────────┘
               │
┌──────────────▼──────────────────────┐
│     Código Nativo                   │
│  - iOS (Objective-C / Swift)        │
│  - Android (Java / Kotlin)          │
│  - Renderiza componentes nativos    │
└─────────────────────────────────────┘
```

### ¿Cómo Funciona?

1. **JavaScript Thread**

   - Tu código React se ejecuta aquí
   - Lógica de negocio, estado, eventos

2. **Bridge (Puente)**

   - Serializa mensajes entre JavaScript y Nativo
   - Comunicación asíncrona (JSON)
   - Puede ser un cuello de botella

3. **Native Thread**
   - Renderiza componentes nativos reales
   - Maneja gestos, animaciones, APIs nativas

### Ejemplo Conceptual

```typescript
// Tu código TypeScript/JSX
<View style={styles.container}>
  <Text>Hello World</Text>
</View>

// ↓ Bridge traduce a...

// iOS (UIKit)
UIView {
  UILabel("Hello World")
}

// Android (Android Views)
ViewGroup {
  TextView("Hello World")
}
```

---

## ⚖️ React Native vs React Web

### Diferencias Clave

| Aspecto           | React Web                      | React Native                     |
| ----------------- | ------------------------------ | -------------------------------- |
| **Componentes**   | `<div>`, `<span>`, `<p>`       | `<View>`, `<Text>`, `<Image>`    |
| **Estilos**       | CSS completo                   | Subconjunto de CSS (Flexbox)     |
| **Navegación**    | React Router, URLs             | React Navigation, Stacks         |
| **Eventos**       | `onClick`, `onChange`          | `onPress`, `onChangeText`        |
| **Dimensiones**   | px, em, rem, %                 | dp (density-independent pixels)  |
| **Renderizado**   | DOM (HTML)                     | Componentes nativos              |
| **Hot Reload**    | Fast Refresh                   | Fast Refresh (similar)           |
| **Acceso Nativo** | APIs Web (fetch, localStorage) | APIs nativas (cámara, GPS, etc.) |

### Similitudes

✅ **Mismo paradigma de React:**

- Componentes funcionales
- Hooks (useState, useEffect, etc.)
- Props y estado
- Ciclo de vida similar

✅ **JavaScript/TypeScript:**

- Mismo lenguaje de programación
- Mismas herramientas (npm, webpack/metro)
- Mismas librerías (lodash, moment, etc.)

### Ejemplo Comparativo

**React Web:**

```jsx
import React, { useState } from 'react'

function Counter() {
  const [count, setCount] = useState(0)

  return (
    <div className="container">
      <h1>Contador: {count}</h1>
      <button onClick={() => setCount(count + 1)}>Incrementar</button>
    </div>
  )
}
```

**React Native con TypeScript:**

```tsx
import React, { useState } from 'react'
import { View, Text, TouchableOpacity, StyleSheet } from 'react-native'

/**
 * Componente Counter
 *
 * ¿Qué hace? Muestra un contador con botón de incremento
 * ¿Para qué? Demostrar estado básico en React Native
 * ¿Cómo? Usa useState hook y TouchableOpacity para eventos
 */
function Counter(): JSX.Element {
  const [count, setCount] = useState<number>(0)

  const handleIncrement = (): void => {
    setCount(count + 1)
  }

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Contador: {count}</Text>
      <TouchableOpacity style={styles.button} onPress={handleIncrement}>
        <Text style={styles.buttonText}>Incrementar</Text>
      </TouchableOpacity>
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    padding: 20,
    alignItems: 'center',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 16,
  },
  button: {
    padding: 10,
    backgroundColor: '#007AFF',
    borderRadius: 8,
  },
  buttonText: {
    color: '#FFFFFF',
    fontSize: 16,
  },
})

export default Counter
```

**Diferencias observadas:**

- `<div>` → `<View>`
- `<h1>` → `<Text>` con estilo
- `<button>` → `<TouchableOpacity>`
- `onClick` → `onPress`
- CSS class → StyleSheet
- `.jsx` → `.tsx` (TypeScript)
- Tipado explícito: `useState<number>`, `JSX.Element`, `(): void`

---

## ✅ Ventajas de React Native

### 1. **Código Compartido (Cross-Platform)**

**¿Qué?** Un solo código para iOS, Android y Web

**¿Para qué?** Reducir costos y tiempo de desarrollo

**¿Impacto?**

- ~70-90% de código compartido
- Un equipo de desarrollo en lugar de 2-3
- Actualizaciones simultáneas

### 2. **Performance Nativa**

**¿Qué?** Usa componentes nativos reales (no WebView)

**¿Para qué?** Experiencia de usuario fluida y nativa

**¿Impacto?**

- 60 FPS en animaciones
- Gestos nativos
- Look & Feel nativo

### 3. **Ecosistema de React**

**¿Qué?** Aprovecha todo el ecosistema de React

**¿Para qué?** Reutilizar conocimientos y librerías

**¿Impacto?**

- Millones de paquetes npm disponibles
- Comunidad gigante
- Recursos de aprendizaje abundantes

### 4. **Hot Reload / Fast Refresh**

**¿Qué?** Cambios en código se reflejan instantáneamente

**¿Para qué?** Acelerar el desarrollo y debugging

**¿Impacto?**

- Ciclos de desarrollo más rápidos
- Debugging más eficiente
- Mejor experiencia de desarrollo

### 5. **Over-The-Air (OTA) Updates**

**¿Qué?** Actualizar apps sin pasar por tiendas (JavaScript)

**¿Para qué?** Corregir bugs y agregar features rápido

**¿Impacto?**

- Fixes instantáneos
- No esperar aprobación de tiendas
- Mejor experiencia de usuario

### 6. **Comunidad y Soporte**

**¿Qué?** Comunidad activa y en crecimiento

**¿Para qué?** Resolver problemas y aprender

**¿Impacto?**

- Stack Overflow activo
- Librerías de terceros abundantes
- Documentación extensa

---

## ⚠️ Limitaciones de React Native

### 1. **Bridge Bottleneck**

**Problema:** Comunicación asíncrona puede ser lenta

**Impacto:**

- Animaciones complejas pueden tener lag
- Grandes listas pueden ser lentas

**Solución:**

- New Architecture (TurboModules, Fabric)
- Usar FlatList en lugar de ScrollView
- Optimizar renders

### 2. **Acceso a APIs Nativas**

**Problema:** No todas las APIs nativas están disponibles

**Impacto:**

- A veces necesitas escribir código nativo
- Dependencia de librerías de terceros

**Solución:**

- Expo SDK cubre ~90% de casos comunes
- Módulos nativos custom cuando sea necesario

### 3. **Tamaño de la App**

**Problema:** Apps son más grandes que nativas puras

**Impacto:**

- ~20-30 MB base (runtime de React Native)
- Descargas más lentas

**Solución:**

- Hermes engine reduce tamaño
- Code splitting y lazy loading

### 4. **Debugging Complejo**

**Problema:** Errores pueden ocurrir en JavaScript o Nativo

**Impacto:**

- Stack traces a veces confusos
- Debugging más complejo que web

**Solución:**

- Herramientas como Flipper
- Reactotron para debugging
- Sentry para error tracking

### 5. **Actualizaciones de Plataforma**

**Problema:** Depende de actualizaciones de React Native

**Impacto:**

- Nuevas APIs de iOS/Android tardan en llegar
- Riesgo de incompatibilidades

**Solución:**

- Mantenerse actualizado con versiones
- Usar Expo para abstraer complejidad

---

## 🏆 Casos de Éxito en la Industria

### Grandes Empresas Usando React Native

#### 1. **Meta (Facebook, Instagram, Messenger)**

- **App:** Facebook, Instagram, Messenger
- **Impacto:** Compartir código entre plataformas
- **Resultado:** Desarrollo más rápido de features

#### 2. **Microsoft**

- **Apps:** Office, Teams, Xbox
- **Impacto:** Un solo equipo para móvil
- **Resultado:** Lanzamiento simultáneo iOS/Android

#### 3. **Shopify**

- **App:** Shopify Mobile
- **Impacto:** 95% código compartido
- **Resultado:** Mantenimiento más fácil

#### 4. **Discord**

- **App:** Discord Mobile
- **Impacto:** Experiencia consistente
- **Resultado:** Feature parity entre plataformas

#### 5. **Walmart**

- **App:** Walmart App
- **Impacto:** Desarrollo más rápido
- **Resultado:** Mejor experiencia de compra

#### 6. **Uber Eats**

- **App:** Uber Eats (Dashboard para restaurantes)
- **Impacto:** Reutilización de componentes
- **Resultado:** Consistencia entre apps

### Estadísticas

- **42%** de desarrolladores móviles usan React Native
- **20%+** de apps en tiendas usan React Native
- **Top 500** apps en App Store incluyen React Native

---

## 🎯 ¿Cuándo Usar React Native?

### ✅ React Native es IDEAL para:

1. **Apps Cross-Platform**

   - Presupuesto limitado
   - Equipo pequeño
   - MVP rápido

2. **Apps de Contenido**

   - Redes sociales
   - eCommerce
   - Noticias y blogs
   - Aplicaciones empresariales

3. **Apps con UI Estándar**

   - Formularios
   - Listas
   - Navegación simple

4. **Equipos Web-First**
   - Ya conocen React
   - Quieren entrar al móvil rápido

### ❌ React Native NO es ideal para:

1. **Apps con Rendimiento Extremo**

   - Juegos 3D
   - Video editing pesado
   - Audio processing en tiempo real

2. **Apps con UI Muy Custom**

   - Animaciones complejas específicas
   - Interfaces muy particulares del OS

3. **Apps que Necesitan Última Tecnología Nativa**
   - ARKit/ARCore avanzado
   - Machine Learning on-device complejo

---

## 📚 Conceptos Clave para Recordar

### Puntos Esenciales

1. **React Native != WebView**

   - Renderiza componentes nativos reales
   - No es Cordova ni PhoneGap

2. **JavaScript + Nativo = App Nativa**

   - Escribes JavaScript
   - Obtienes performance nativo

3. **Learn Once, Write Anywhere**

   - Mismos conceptos de React
   - Diferentes componentes por plataforma

4. **Comunidad Activa**
   - Soporte de Meta
   - Miles de librerías
   - Documentación extensa

---

## 💡 Ejercicios de Reflexión

### 1. ¿Qué aprendí?

Responde brevemente:

- ¿Qué es React Native en una frase?

  - _Tu respuesta aquí..._

- ¿Cuál es la principal ventaja de React Native?

  - _Tu respuesta aquí..._

- ¿Qué significa que React Native renderiza componentes "nativos"?
  - _Tu respuesta aquí..._

### 2. ¿Para qué me sirve?

Piensa en:

- ¿Qué tipo de aplicación me gustaría crear con React Native?

  - _Tu respuesta aquí..._

- ¿Cómo puedo aplicar mis conocimientos de React Web a React Native?
  - _Tu respuesta aquí..._

### 3. ¿Qué dudas tengo?

Anota tus dudas para consultarlas:

- _Duda 1:_
- _Duda 2:_
- _Duda 3:_

---

## 🔗 Referencias y Recursos

### Documentación Oficial

- [React Native - Getting Started](https://reactnative.dev/docs/getting-started)
- [React Native - Architecture](https://reactnative.dev/architecture/overview)
- [Meta Engineering Blog](https://engineering.fb.com/category/android/)

### Videos Recomendados

- [React Native in 100 Seconds](https://www.youtube.com/watch?v=gvkqT_Uoahw) - Fireship
- [What is React Native?](https://www.youtube.com/watch?v=_5gRDxMY5Ec) - Academind
- [React Native Architecture Explained](https://www.youtube.com/watch?v=UcqRXTriUVI) - Expo

### Artículos

- [The New React Native Architecture Explained](https://reactnative.dev/architecture/overview)
- [React Native vs Flutter](https://www.g2.com/compare/flutter-vs-react-native)
- [Companies Using React Native](https://reactnative.dev/showcase)

---

## ✅ Checklist de Comprensión

Antes de pasar al siguiente tema, asegúrate de poder:

- [ ] Explicar qué es React Native
- [ ] Describir cómo funciona el bridge
- [ ] Identificar 3 diferencias con React Web
- [ ] Mencionar 3 ventajas de React Native
- [ ] Reconocer cuándo usar React Native
- [ ] Nombrar 2 empresas que usan React Native

---

**Próximo tema:** [2. Configuración del Entorno →](./02-configuracion-entorno.md)

---

_Tiempo estimado: 45 minutos | Actualizado: Octubre 2025_
