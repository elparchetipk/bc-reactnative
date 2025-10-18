# 📊 Rúbrica de Evaluación - Semana 1

> **Fundamentos de React Native**  
> Evaluación integral de teoría, prácticas y proyecto integrador

---

## 🎯 Distribución de Puntos Totales

> **Versión 2.0:** Esta semana incluye **5 bugs pedagógicos intencionales** en el código de ejemplo que debes identificar, corregir y documentar (20% de la nota).

| Componente    | Peso     | Puntos      | Descripción                            |
| ------------- | -------- | ----------- | -------------------------------------- |
| **Teoría**    | 15%      | 15 pts      | Comprensión de conceptos fundamentales |
| **Prácticas** | 25%      | 25 pts      | Ejercicios guiados en clase            |
| **Proyecto**  | 40%      | 40 pts      | Proyecto integrador: Mi App Personal   |
| **Bugs**      | 20%      | 20 pts      | Identificación y corrección de bugs    |
| **TOTAL**     | **100%** | **100 pts** | Calificación final de la semana        |

---

## 📚 1. EVALUACIÓN TEÓRICA (20 puntos)

### Métodos de Evaluación:

- Participación activa en clase
- Quiz corto al final de la semana
- Preguntas durante demostraciones
- Capacidad de explicar conceptos

---

### 1.1 Conceptos Fundamentales (10 puntos)

| Criterio                  | Excelente (9-10)                                                          | Muy Bueno (7-8)                                                    | Bueno (5-6)                                                | Insuficiente (0-4)                            |
| ------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------------------ | ---------------------------------------------------------- | --------------------------------------------- |
| **¿Qué es React Native?** | Explica arquitectura, ventajas, casos de uso con ejemplos concretos       | Entiende el concepto básico y puede comparar con otras tecnologías | Conoce la definición pero tiene dudas en la arquitectura   | No puede explicar qué es o confunde conceptos |
| **Componentes**           | Diferencia componentes funcionales/clase, entiende props/state, lifecycle | Entiende componentes y props básicos                               | Confunde props con state o viceversa                       | No entiende qué es un componente              |
| **JSX**                   | Explica sintaxis, reglas, transformación a JS, puede escribir JSX limpio  | Entiende sintaxis básica y puede escribir JSX simple               | Confunde HTML con JSX, errores de sintaxis frecuentes      | No entiende JSX o lo confunde con HTML        |
| **Props vs State**        | Explica diferencias, cuándo usar cada uno, inmutabilidad                  | Diferencia básica clara, usa correctamente en ejemplos simples     | Confusión ocasional pero entiende el concepto              | No diferencia props de state                  |
| **Hooks (useState)**      | Explica funcionamiento interno, reglas de hooks, casos de uso             | Usa correctamente en ejemplos prácticos                            | Entiende el concepto pero comete errores de implementación | No entiende cómo funcionan los hooks          |

**Puntuación:**

- **9-10 pts**: Dominio completo de conceptos, puede explicar con ejemplos
- **7-8 pts**: Comprensión sólida, pequeñas dudas en temas avanzados
- **5-6 pts**: Entiende lo básico, necesita refuerzo en varios temas
- **0-4 pts**: Comprensión limitada, necesita reestudio completo

---

### 1.2 Aplicación Práctica (10 puntos)

| Criterio              | Excelente (9-10)                                                   | Muy Bueno (7-8)                                     | Bueno (5-6)                                    | Insuficiente (0-4)                         |
| --------------------- | ------------------------------------------------------------------ | --------------------------------------------------- | ---------------------------------------------- | ------------------------------------------ |
| **Estilos y Layouts** | Domina Flexbox, StyleSheet, NativeWind, crea layouts complejos     | Usa estilos correctamente, entiende Flexbox básico  | Aplica estilos con ayuda, confusión en Flexbox | No puede aplicar estilos o layouts         |
| **Manejo de Eventos** | Implementa eventos correctamente, entiende propagación y callbacks | Usa onPress y onChange correctamente                | Implementa eventos con errores ocasionales     | No entiende cómo funcionan los eventos     |
| **Listas (FlatList)** | Optimiza rendimiento, usa keyExtractor, renderItem avanzado        | Implementa FlatList correctamente con datos simples | Crea listas básicas con ayuda                  | No puede implementar listas                |
| **Debugging**         | Identifica y soluciona errores rápidamente, usa DevTools           | Soluciona errores comunes con ayuda del instructor  | Necesita mucha ayuda para solucionar errores   | No puede identificar ni solucionar errores |
| **Buenas Prácticas**  | Código limpio, nomenclatura correcta, componentes reutilizables    | Código organizado, sigue convenciones básicas       | Código funcional pero desordenado              | Código difícil de entender o mantener      |

**Puntuación:**

- **9-10 pts**: Aplica conceptos de forma autónoma y eficiente
- **7-8 pts**: Aplica correctamente con guía mínima
- **5-6 pts**: Aplica con ayuda constante del instructor
- **0-4 pts**: No puede aplicar conceptos en código

---

## 💻 2. PRÁCTICAS GUIADAS (30 puntos)

### Distribución:

- Práctica 1: Primera App (10 pts)
- Práctica 2: Card Component (10 pts)
- Práctica 3: Lista de Contactos (10 pts)

---

### 2.1 Práctica 1: Primera App - Perfil Personal (10 puntos)

| Criterio                   | Puntos | Descripción                                        | Indicadores de Cumplimiento                                                                                   |
| -------------------------- | ------ | -------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| **Setup del Proyecto**     | 2 pts  | Configuración correcta de Expo y dependencias      | ✅ Proyecto ejecuta sin errores<br>✅ Dependencias instaladas<br>✅ Estructura de carpetas organizada         |
| **Componentes Básicos**    | 4 pts  | Uso correcto de View, Text, Image, ScrollView      | ✅ Al menos 5 componentes diferentes<br>✅ Jerarquía correcta<br>✅ Props aplicados correctamente             |
| **Estilos con NativeWind** | 3 pts  | Aplicación de clases de TailwindCSS                | ✅ Al menos 10 clases diferentes<br>✅ Colores, padding, margin coherentes<br>✅ Diseño visualmente agradable |
| **App Funcional**          | 1 pt   | La app se ejecuta sin errores ni warnings críticos | ✅ No hay errores en consola<br>✅ No hay warnings rojos<br>✅ Se visualiza correctamente                     |

**Criterios de Calidad:**

**Excelente (9-10 pts):**

- Setup perfecto en menos de 10 minutos
- Todos los componentes implementados correctamente
- Estilos profesionales y consistentes
- Código limpio y bien organizado
- Sin errores ni warnings

**Muy Bueno (7-8 pts):**

- Setup correcto con ayuda mínima
- Componentes implementados correctamente
- Estilos coherentes
- Pequeños warnings no críticos

**Bueno (5-6 pts):**

- Setup con ayuda del instructor
- Componentes básicos funcionando
- Estilos aplicados pero inconsistentes
- Algunos errores solucionados con ayuda

**Insuficiente (0-4 pts):**

- No logra completar el setup
- Componentes con errores graves
- Estilos mínimos o ausentes
- App no ejecuta o tiene errores críticos

---

### 2.2 Práctica 2: Card Component Reutilizable (10 puntos)

| Criterio                    | Puntos | Descripción                                  | Indicadores de Cumplimiento                                                                                               |
| --------------------------- | ------ | -------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| **Componente Reutilizable** | 4 pts  | Card como componente independiente con props | ✅ Archivo separado<br>✅ Export/Import correcto<br>✅ Reutilizable en múltiples lugares                                  |
| **Props con TypeScript**    | 3 pts  | Interfaces definidas correctamente           | ✅ Interface `CardProps` definida<br>✅ Tipos correctos (string, number, boolean)<br>✅ Props opcionales marcadas con `?` |
| **Estilos Flexibles**       | 2 pts  | Estilos adaptativos según props              | ✅ Variaciones de color o tamaño<br>✅ Props de estilo opcionales<br>✅ Responsive                                        |
| **Código Limpio**           | 1 pt   | Nomenclatura, comentarios, organización      | ✅ Nombres descriptivos en inglés<br>✅ Comentarios explicativos<br>✅ Código formateado                                  |

**Criterios de Calidad:**

**Excelente (9-10 pts):**

- Componente totalmente reutilizable y flexible
- TypeScript impecable, tipos correctos
- Estilos adaptables por props (color, tamaño, variantes)
- Código profesional y bien documentado
- Usado en 3+ lugares diferentes

**Muy Bueno (7-8 pts):**

- Componente reutilizable
- TypeScript correcto con tipos básicos
- Estilos aplicados correctamente
- Código limpio

**Bueno (5-6 pts):**

- Componente funciona pero poco flexible
- TypeScript con errores menores
- Estilos básicos
- Código entendible

**Insuficiente (0-4 pts):**

- No es reutilizable o no funciona
- Sin TypeScript o tipos incorrectos
- Estilos hardcoded
- Código confuso

---

### 2.3 Práctica 3: Lista de Contactos (10 puntos)

| Criterio                    | Puntos | Descripción                          | Indicadores de Cumplimiento                                                                            |
| --------------------------- | ------ | ------------------------------------ | ------------------------------------------------------------------------------------------------------ |
| **FlatList Implementado**   | 4 pts  | Lista funcional con datos dinámicos  | ✅ FlatList configurado<br>✅ Al menos 10 items<br>✅ Scroll funcional                                 |
| **Renderizado con Eventos** | 3 pts  | renderItem + onPress implementados   | ✅ Función `renderItem` correcta<br>✅ onPress muestra detalle o alerta<br>✅ Feedback visual al tocar |
| **Búsqueda y Filtros**      | 2 pts  | Funcionalidad de búsqueda (autónoma) | ✅ Input de búsqueda<br>✅ Filtrado en tiempo real<br>✅ Lista se actualiza correctamente              |
| **Performance**             | 1 pt   | Optimización con keyExtractor        | ✅ `keyExtractor` implementado<br>✅ Keys únicas por item<br>✅ No re-renders innecesarios             |

**Parte Autónoma (30 min):**

- Implementar búsqueda por nombre
- Agregar filtros (todos, favoritos, etc.)
- Mejorar diseño del item de contacto

**Criterios de Calidad:**

**Excelente (9-10 pts):**

- FlatList optimizado y fluido
- Eventos funcionan perfectamente
- Búsqueda implementada completamente
- Filtros adicionales (favoritos, categorías)
- Performance excelente (60fps)

**Muy Bueno (7-8 pts):**

- FlatList funcional
- Eventos implementados correctamente
- Búsqueda básica funcionando
- Performance buena

**Bueno (5-6 pts):**

- FlatList con datos estáticos funciona
- Eventos básicos implementados
- Búsqueda parcialmente implementada
- Performance aceptable

**Insuficiente (0-4 pts):**

- FlatList no funciona o tiene errores
- No implementa eventos
- Sin búsqueda
- Performance muy pobre

---

## 🚀 3. PROYECTO INTEGRADOR: Mi App Personal (50 puntos)

### Descripción:

Aplicación móvil de portfolio personal que integra todos los conceptos de la semana.

### Componentes Obligatorios:

1. Pantalla de perfil con foto y datos personales
2. Lista de habilidades técnicas
3. Galería de proyectos
4. Navegación básica entre secciones

---

### 3.1 Funcionalidad (20 puntos)

#### Pantalla de Perfil (6 puntos)

| Aspecto         | Excelente (6)                                      | Muy Bueno (4-5)                   | Bueno (3)                    | Insuficiente (0-2)                 |
| --------------- | -------------------------------------------------- | --------------------------------- | ---------------------------- | ---------------------------------- |
| **Contenido**   | Foto, nombre, título, biografía, contacto completo | Foto, nombre, título, biografía   | Foto, nombre, título         | Solo nombre o incompleto           |
| **Diseño**      | Profesional, jerarquía clara, espaciado perfecto   | Bien diseñado, espaciado correcto | Diseño básico pero funcional | Desordenado o mal espaciado        |
| **Componentes** | SafeAreaView, ScrollView, Image, Text optimizados  | Componentes correctos             | Componentes básicos          | Componentes incorrectos o ausentes |

#### Lista de Habilidades (6 puntos)

| Aspecto            | Excelente (6)                             | Muy Bueno (4-5)              | Bueno (3)              | Insuficiente (0-2)           |
| ------------------ | ----------------------------------------- | ---------------------------- | ---------------------- | ---------------------------- |
| **Implementación** | FlatList optimizado, categorías, niveles  | FlatList con datos dinámicos | Lista simple funcional | Lista estática o con errores |
| **Cantidad**       | 10+ habilidades organizadas por categoría | 6-9 habilidades              | 3-5 habilidades        | Menos de 3 habilidades       |
| **Visualización**  | Badges, barras de progreso, iconos        | Cards con iconos             | Lista simple de texto  | Solo texto sin formato       |

#### Galería de Proyectos (6 puntos)

| Aspecto            | Excelente (6)                                            | Muy Bueno (4-5)         | Bueno (3)              | Insuficiente (0-2)      |
| ------------------ | -------------------------------------------------------- | ----------------------- | ---------------------- | ----------------------- |
| **Proyectos**      | 5+ proyectos con imagen, título, descripción, tech stack | 3-4 proyectos completos | 2 proyectos básicos    | 1 proyecto o incompleto |
| **Interactividad** | onPress muestra detalle, links externos, animaciones     | onPress funcional       | Visualización estática | Sin interacción         |
| **Layout**         | Grid/Carousel profesional                                | Lista organizada        | Lista simple           | Desordenado             |

#### Navegación (2 puntos)

| Aspecto   | Excelente (2)                                      | Bueno (1)                           | Insuficiente (0)             |
| --------- | -------------------------------------------------- | ----------------------------------- | ---------------------------- |
| **Flujo** | Navegación fluida entre 3+ secciones, botones/tabs | Navegación básica entre 2 secciones | Sin navegación o no funciona |

---

### 3.2 Calidad del Código (15 puntos)

#### TypeScript (5 puntos)

| Criterio       | Excelente (5)                                        | Muy Bueno (4)                    | Bueno (3)               | Insuficiente (0-2)           |
| -------------- | ---------------------------------------------------- | -------------------------------- | ----------------------- | ---------------------------- |
| **Interfaces** | Todas las entidades tipadas (User, Skill, Project)   | Interfaces principales definidas | Algunas interfaces      | Sin TypeScript o tipos `any` |
| **Props**      | Todos los componentes con props tipados              | Componentes principales tipados  | Tipado parcial          | Sin tipado de props          |
| **Uso**        | Sin errores de TS, tipos correctos en todo el código | Errores mínimos no críticos      | Varios errores de tipos | Código no compila            |

#### Estructura de Componentes (4 puntos)

| Criterio          | Excelente (4)                                              | Muy Bueno (3)                     | Bueno (2)                     | Insuficiente (0-1)            |
| ----------------- | ---------------------------------------------------------- | --------------------------------- | ----------------------------- | ----------------------------- |
| **Organización**  | Componentes separados por carpetas (components/, screens/) | Componentes en archivos separados | Algunos componentes separados | Todo en un solo archivo       |
| **Reutilización** | 5+ componentes reutilizables (Card, Button, Badge)         | 3-4 componentes reutilizables     | 1-2 componentes               | Sin componentes reutilizables |
| **Nomenclatura**  | PascalCase, nombres descriptivos en inglés                 | Nombres correctos en inglés       | Nomenclatura inconsistente    | Nombres en español o confusos |

#### Props y State (3 puntos)

| Criterio            | Excelente (3)                                           | Muy Bueno (2)                 | Insuficiente (0-1)       |
| ------------------- | ------------------------------------------------------- | ----------------------------- | ------------------------ |
| **Uso de useState** | 3+ estados manejados correctamente                      | 1-2 estados básicos           | Sin useState o mal usado |
| **Props drilling**  | Props pasados correctamente, sin prop drilling excesivo | Props funcionan correctamente | Props mal implementados  |

#### Código Limpio (3 puntos)

| Criterio        | Excelente (3)                                      | Muy Bueno (2)              | Insuficiente (0-1)              |
| --------------- | -------------------------------------------------- | -------------------------- | ------------------------------- |
| **Legibilidad** | Código formateado, indentación correcta, espaciado | Código legible             | Código confuso o mal formateado |
| **Comentarios** | Comentarios explicativos (qué, para qué, cómo)     | Algunos comentarios útiles | Sin comentarios o excesivos     |
| **DRY**         | No repite código, funciones auxiliares             | Mínima repetición          | Código muy repetitivo           |

---

### 3.3 Diseño y UX (10 puntos)

#### Estilos con NativeWind (4 puntos)

| Criterio          | Excelente (4)                                   | Muy Bueno (3)                    | Bueno (2)               | Insuficiente (0-1)       |
| ----------------- | ----------------------------------------------- | -------------------------------- | ----------------------- | ------------------------ |
| **Uso de clases** | 30+ clases de TailwindCSS usadas correctamente  | 20-29 clases                     | 10-19 clases            | Menos de 10 o mal usadas |
| **Consistencia**  | Paleta de colores coherente, espaciado uniforme | Colores y espaciado consistentes | Inconsistencias menores | Sin coherencia visual    |
| **Utilidades**    | Usa flexbox, gap, rounded, shadow, gradients    | Usa flexbox y utilidades básicas | Solo clases básicas     | Estilos inline o mínimos |

#### Diseño Visual (3 puntos)

| Criterio       | Excelente (3)                                      | Muy Bueno (2)                  | Insuficiente (0-1)             |
| -------------- | -------------------------------------------------- | ------------------------------ | ------------------------------ |
| **Atractivo**  | Diseño profesional y moderno, buena jerarquía      | Diseño limpio y funcional      | Diseño básico o poco atractivo |
| **Colores**    | Paleta profesional (3-5 colores) de GUIA-DISENO.md | Colores coherentes             | Colores aleatorios o chocantes |
| **Tipografía** | 3+ tamaños de texto con hierarchy correcta         | 2 tamaños usados correctamente | Solo un tamaño o sin jerarquía |

#### Responsive (3 puntos)

| Criterio          | Excelente (3)                                 | Muy Bueno (2)                      | Insuficiente (0-1)                         |
| ----------------- | --------------------------------------------- | ---------------------------------- | ------------------------------------------ |
| **Adaptabilidad** | Se adapta a diferentes tamaños (iOS/Android)  | Funciona en ambas plataformas      | Solo funciona en una plataforma o se rompe |
| **Scrolling**     | ScrollView donde es necesario, SafeAreaView   | Scroll funcional                   | Sin scroll o contenido cortado             |
| **Imágenes**      | Imágenes responsive con aspect ratio correcto | Imágenes se muestran correctamente | Imágenes distorsionadas o cortadas         |

---

### 3.4 Documentación (5 puntos)

#### README del Proyecto (2 puntos)

| Aspecto         | Contenido Requerido                                       |
| --------------- | --------------------------------------------------------- |
| **Descripción** | ✅ Qué es la app<br>✅ Funcionalidades principales        |
| **Instalación** | ✅ Comandos paso a paso<br>✅ Dependencias requeridas     |
| **Ejecución**   | ✅ Cómo ejecutar (`pnpm start`)<br>✅ Cómo ver en Expo Go |
| **Tecnologías** | ✅ React Native, Expo, TypeScript, NativeWind             |
| **Capturas**    | ✅ Al menos 2 screenshots o GIF                           |

**Puntuación:**

- **2 pts**: README completo con todos los elementos
- **1 pt**: README básico, falta algún elemento
- **0 pts**: Sin README o muy incompleto

#### Comentarios en Código (2 puntos)

| Criterio          | Excelente (2)                                            | Bueno (1)                  | Insuficiente (0)  |
| ----------------- | -------------------------------------------------------- | -------------------------- | ----------------- |
| **Comentarios**   | Componentes principales comentados (qué, para qué, cómo) | Algunos comentarios útiles | Sin comentarios   |
| **Explicaciones** | Secciones complejas explicadas                           | Explicaciones básicas      | Sin explicaciones |

#### Instrucciones de Ejecución (1 punto)

- ✅ Archivo con instrucciones claras de cómo ejecutar
- ✅ Menciona requisitos (Node.js 22.20+, pnpm, Expo Go)
- ✅ Incluye troubleshooting básico

---

## 📊 TABLA DE PUNTUACIÓN CONSOLIDADA

### Por Componente:

| Componente             | Sub-componente                 | Puntos      | % del Total |
| ---------------------- | ------------------------------ | ----------- | ----------- |
| **TEORÍA**             | Conceptos Fundamentales        | 10 pts      | 10%         |
|                        | Aplicación Práctica            | 10 pts      | 10%         |
| **Subtotal Teoría**    |                                | **20 pts**  | **20%**     |
|                        |                                |             |             |
| **PRÁCTICAS**          | Práctica 1: Primera App        | 10 pts      | 10%         |
|                        | Práctica 2: Card Component     | 10 pts      | 10%         |
|                        | Práctica 3: Lista de Contactos | 10 pts      | 10%         |
| **Subtotal Prácticas** |                                | **30 pts**  | **30%**     |
|                        |                                |             |             |
| **PROYECTO**           | Funcionalidad                  | 20 pts      | 20%         |
|                        | Calidad del Código             | 15 pts      | 15%         |
|                        | Diseño y UX                    | 10 pts      | 10%         |
|                        | Documentación                  | 5 pts       | 5%          |
| **Subtotal Proyecto**  |                                | **50 pts**  | **50%**     |
|                        |                                |             |             |
| **TOTAL SEMANA 1**     |                                | **100 pts** | **100%**    |

---

## 🎯 ESCALA DE CALIFICACIÓN FINAL

| Rango      | Calificación     | Descripción                                           | Estado      |
| ---------- | ---------------- | ----------------------------------------------------- | ----------- |
| **90-100** | **Excelente**    | Dominio completo de fundamentos, proyecto profesional | ⭐⭐⭐      |
| **80-89**  | **Muy Bueno**    | Muy buena comprensión, proyecto bien implementado     | ⭐⭐        |
| **70-79**  | **Bueno**        | Comprensión sólida, proyecto funcional                | ⭐          |
| **60-69**  | **Suficiente**   | Comprensión básica, proyecto cumple mínimos           | ✅          |
| **0-59**   | **Insuficiente** | Comprensión limitada, proyecto incompleto             | ❌ Refuerzo |

---

## ✅ CHECKLIST DE AUTO-EVALUACIÓN

Antes de entregar, verifica que cumples con todos estos puntos:

### Teoría:

- [ ] Puedo explicar qué es React Native y para qué sirve
- [ ] Entiendo la diferencia entre Props y State
- [ ] Sé cómo funciona useState
- [ ] Puedo escribir JSX correctamente
- [ ] Entiendo Flexbox para layouts

### Prácticas:

- [ ] Completé las 3 prácticas guiadas
- [ ] Todas las prácticas ejecutan sin errores
- [ ] Implementé búsqueda en la Práctica 3
- [ ] Mi código sigue las convenciones (inglés, camelCase, etc.)

### Proyecto:

- [ ] App tiene las 3 secciones requeridas (perfil, habilidades, proyectos)
- [ ] Uso TypeScript con interfaces definidas
- [ ] Aplico NativeWind/TailwindCSS para estilos
- [ ] Al menos 5 componentes reutilizables
- [ ] FlatList implementado correctamente
- [ ] Diseño es atractivo y profesional
- [ ] App ejecuta sin errores en Expo Go
- [ ] README completo con instrucciones
- [ ] Código comentado en partes clave

### Entrega:

- [ ] Repositorio en GitHub es público o instructor agregado
- [ ] Link del repositorio enviado a la plataforma
- [ ] Fecha de entrega cumplida (Viernes 23:59)
- [ ] Commits descriptivos y frecuentes

---

## 📝 CRITERIOS DE PENALIZACIÓN

| Situación                      | Penalización                   |
| ------------------------------ | ------------------------------ |
| Entrega tarde (1 día)          | -10% del total                 |
| Entrega tarde (2+ días)        | -20% del total                 |
| App no ejecuta                 | -30 pts (proyecto)             |
| Sin TypeScript                 | -10 pts (código)               |
| Código en español              | -5 pts (calidad)               |
| Sin README                     | -2 pts (documentación)         |
| Plagio detectado               | 0 pts en el componente copiado |
| Repositorio privado sin acceso | No se puede evaluar (0 pts)    |

---

## 🎁 BONIFICACIONES OPCIONALES

| Logro                         | Puntos Extra | Máximo          |
| ----------------------------- | ------------ | --------------- |
| Animaciones con Animated API  | +3 pts       | +3 pts          |
| Dark mode implementado        | +2 pts       | +2 pts          |
| Persistencia con AsyncStorage | +2 pts       | +2 pts          |
| Testing básico (Jest)         | +3 pts       | +3 pts          |
| Deploy en Expo Go compartible | +2 pts       | +2 pts          |
| Documentación excepcional     | +2 pts       | +2 pts          |
|                               |              | **+14 pts máx** |

**Nota:** Las bonificaciones NO pueden hacer que la nota supere 100 pts, pero pueden compensar pérdidas en otros criterios.

---

## 💡 CONSEJOS PARA OBTENER CALIFICACIÓN EXCELENTE

### 1. **Durante las Prácticas:**

- ✅ Participa activamente en clase
- ✅ Haz preguntas cuando no entiendas algo
- ✅ Toma notas de conceptos clave
- ✅ Prueba variaciones de los ejercicios

### 2. **En el Proyecto:**

- ✅ Empieza temprano (no dejes todo para el último día)
- ✅ Revisa EJEMPLOS-DATOS.md para inspiración
- ✅ Usa GUIA-DISENO.md para paleta de colores
- ✅ Commit frecuentemente (cada feature completada)
- ✅ Prueba en dispositivo real con Expo Go

### 3. **Antes de Entregar:**

- ✅ Ejecuta la app desde cero (borra node_modules, reinstala)
- ✅ Verifica que no haya errores ni warnings
- ✅ Lee tu código y asegúrate de que es legible
- ✅ Revisa el README (¿otro estudiante podría ejecutar tu app?)
- ✅ Toma screenshots para el README

### 4. **Para Destacar:**

- ⭐ Agrega un toque personal creativo
- ⭐ Implementa una feature extra (animaciones, dark mode)
- ⭐ Documenta decisiones de diseño en el README
- ⭐ Código excepcionalmente limpio y organizado

---

## � 4. BUGS PEDAGÓGICOS (20 puntos)

> Esta semana incluye **5 bugs intencionales** en el código de ejemplo. Debes identificarlos, corregirlos y documentar el proceso en un archivo `BUGS-RESUELTOS.md` siguiendo el [template oficial](../../_docs/instructor/TEMPLATE-BUGS-RESUELTOS.md).

### 4.1 Bugs Identificados (8 puntos)

| Bugs Encontrados  | Puntos | Descripción                       |
| ----------------- | ------ | --------------------------------- |
| **5 bugs (100%)** | 8 pts  | Encontraste todos los bugs        |
| **4 bugs (80%)**  | 6 pts  | Encontraste la mayoría            |
| **3 bugs (60%)**  | 4 pts  | Encontraste más de la mitad       |
| **2 bugs (40%)**  | 2 pts  | Encontraste algunos bugs          |
| **0-1 bug**       | 0 pts  | No identificaste suficientes bugs |

### 4.2 Soluciones Correctas (6 puntos)

| Criterio       | Excelente (5-6)                                                         | Muy Bueno (4)                          | Bueno (2-3)                             | Insuficiente (0-1)                   |
| -------------- | ----------------------------------------------------------------------- | -------------------------------------- | --------------------------------------- | ------------------------------------ |
| **Corrección** | Todos los bugs corregidos apropiadamente, código funciona perfectamente | Mayoría corregidos bien, 1 error menor | Varios bugs corregidos pero con errores | Soluciones incorrectas o incompletas |
| **Calidad**    | Soluciones elegantes siguiendo mejores prácticas                        | Soluciones correctas y funcionales     | Soluciones funcionales pero mejorables  | Código de baja calidad               |

### 4.3 Documentación (4 puntos)

| Criterio              | Excelente (4)                                                                                                | Muy Bueno (3)                            | Bueno (2)                               | Insuficiente (0-1)             |
| --------------------- | ------------------------------------------------------------------------------------------------------------ | ---------------------------------------- | --------------------------------------- | ------------------------------ |
| **BUGS-RESUELTOS.md** | Documento completo siguiendo el template, incluye código before/after, screenshots, explicaciones detalladas | Documento completo con información clara | Documento básico con información mínima | Sin documento o muy incompleto |
| **Commits**           | Commits progresivos (1 por bug), mensajes descriptivos, historial limpio                                     | Varios commits con mensajes claros       | Pocos commits o mensajes poco claros    | 1 solo commit o sin commits    |

### 4.4 Explicaciones y Comprensión (2 puntos)

| Criterio          | Excelente (2)                                                       | Bueno (1)                           | Insuficiente (0)                    |
| ----------------- | ------------------------------------------------------------------- | ----------------------------------- | ----------------------------------- |
| **Entendimiento** | Explica claramente por qué era bug, cómo lo solucionó, qué aprendió | Explica el bug y la solución básica | No explica o explicaciones confusas |

---

### 📋 Lista de Bugs - Semana 1 (5 bugs)

| #   | Ubicación                    | Tipo                  | Severidad | Descripción                                                   |
| --- | ---------------------------- | --------------------- | --------- | ------------------------------------------------------------- |
| 1   | `App.js` línea 15            | **Obvio**             | 🔴 Alta   | Import incorrecto: `react-native` sin componentes específicos |
| 2   | `components/Card.js` línea 8 | **Sutil**             | 🟠 Media  | Estado no se actualiza: mutación directa del array            |
| 3   | `screens/Home.js` línea 23   | **Mejores Prácticas** | 🟡 Baja   | FlatList sin `keyExtractor`, genera warnings                  |
| 4   | `styles/theme.js` línea 5    | **Sutil**             | 🟠 Media  | Colores hardcodeados en vez de usar constantes                |
| 5   | `utils/helpers.js` línea 12  | **Obvio**             | 🔴 Alta   | Función sin return, retorna `undefined`                       |

**Distribución:**

- 40% Bugs Obvios (rompen la app o generan errores)
- 40% Bugs Sutiles (app funciona pero con comportamiento incorrecto)
- 20% Mejores Prácticas (funciona pero no es profesional)

---

### ⚠️ Detección de Copias

**Se considerará copia y recibirá automáticamente 0 puntos si:**

- ✅ El documento `BUGS-RESUELTOS.md` es idéntico o muy similar a otro estudiante
- ✅ Las explicaciones son copiadas textualmente de internet sin atribución
- ✅ El código corregido es idéntico en múltiples estudiantes (incluyendo formato, nombres de variables, comentarios)
- ✅ Solo hay 1 commit con "bugs arreglados" (debe haber commits progresivos)
- ✅ No hay evidencia de proceso de debugging (screenshots, pruebas)

**Patrones sospechosos:**

- Mismos nombres de variables en las correcciones
- Orden idéntico de bugs encontrados
- Explicaciones con fraseología idéntica
- Screenshots con misma resolución/timestamp
- Commits al mismo tiempo con mensajes similares

---

### ✅ Checklist de Auto-Evaluación

Antes de entregar, verifica:

- [ ] He encontrado los 5 bugs (o al menos 3-4)
- [ ] He corregido cada bug correctamente
- [ ] La app funciona sin errores después de las correcciones
- [ ] He creado `BUGS-RESUELTOS.md` con toda la información
- [ ] Cada bug tiene: ubicación, código before/after, explicación
- [ ] He incluido screenshots que demuestran la funcionalidad
- [ ] He hecho commits progresivos (no 1 solo commit)
- [ ] Mis explicaciones son con mis propias palabras
- [ ] He probado que todo funciona antes de entregar

---

## 📊 Tabla Resumen de Evaluación

| Componente       | Criterios                                                         | Puntos Máximos | Mi Puntuación    |
| ---------------- | ----------------------------------------------------------------- | -------------- | ---------------- |
| **1. Teoría**    | Conceptos (10) + Aplicación (5)                                   | 15 pts         | \_\_\_ / 15      |
| **2. Prácticas** | Práctica 1 (8) + Práctica 2 (8) + Práctica 3 (9)                  | 25 pts         | \_\_\_ / 25      |
| **3. Proyecto**  | Funcionalidad (16) + Código (12) + UI (8) + Docs (4)              | 40 pts         | \_\_\_ / 40      |
| **4. Bugs**      | Identificados (8) + Soluciones (6) + Docs (4) + Explicaciones (2) | 20 pts         | \_\_\_ / 20      |
| **TOTAL**        |                                                                   | **100 pts**    | **\_\_\_ / 100** |

---

## �📞 Dudas sobre la Evaluación

Si tienes dudas sobre algún criterio de evaluación:

- **Durante la clase:** Pregunta al instructor directamente
- **Office Hours:** Martes y Jueves 7-8 PM
- **Discord:** Canal #evaluacion
- **Email:** instructor@bootcamp.com (solo para casos específicos)

---

## 📅 Fechas Importantes

| Evento                        | Fecha            | Descripción                       |
| ----------------------------- | ---------------- | --------------------------------- |
| **Prácticas 1-3**             | Jueves 23:59     | Entrega de las 3 prácticas        |
| **Proyecto Integrador**       | Viernes 23:59    | Entrega del proyecto completo     |
| **Quiz Teórico**              | Viernes en clase | Quiz de 15-20 minutos             |
| **Retroalimentación**         | Sábado siguiente | Calificaciones y feedback         |
| **Sustentaciones (opcional)** | Sábado en clase  | Demostración en vivo del proyecto |

---

## ⚖️ Nota sobre Justicia en la Evaluación

Esta rúbrica está diseñada para:

- ✅ **Ser objetiva:** Criterios claros y medibles
- ✅ **Ser justa:** Todos evaluados con los mismos estándares
- ✅ **Ser transparente:** Sabes exactamente cómo se calcula tu nota
- ✅ **Promover el aprendizaje:** Feedback constructivo para mejorar

Si consideras que tu evaluación fue injusta, puedes:

1. Revisar esta rúbrica con tu calificación
2. Solicitar reunión con el instructor para revisión
3. Presentar evidencia adicional si es necesario

---

_Rúbrica de Evaluación - Semana 1: Fundamentos de React Native_  
_Bootcamp React Native 2025 - Ficha 3147252_  
_Versión 2.0 (con bugs pedagógicos) - Actualizada: 18 de octubre de 2025_
