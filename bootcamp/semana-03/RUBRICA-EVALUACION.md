# 📊 Rúbrica de Evaluación - Semana 3

> **Estado y Gestión de Datos**  
> Evaluación integral de teoría, prácticas, proyecto y resolución de bugs

---

## 🎯 Distribución de Puntos Totales

> **Versión 2.0:** Esta semana incluye **7 bugs pedagógicos intencionales** en el código de ejemplo que debes identificar, corregir y documentar (20% de la nota).

| Componente    | Peso     | Puntos      | Descripción                               |
| ------------- | -------- | ----------- | ----------------------------------------- |
| **Teoría**    | 15%      | 15 pts      | Comprensión de state management y Context |
| **Prácticas** | 25%      | 25 pts      | Ejercicios guiados en clase               |
| **Proyecto**  | 40%      | 40 pts      | Proyecto integrador: Task Manager App     |
| **Bugs**      | 20%      | 20 pts      | Identificación y corrección de bugs       |
| **TOTAL**     | **100%** | **100 pts** | Calificación final de la semana           |

---

## 📚 1. EVALUACIÓN TEÓRICA (15 puntos)

### Métodos de Evaluación:

- Participación activa en clase durante demos
- Quiz corto al final de la semana
- Preguntas técnicas durante live coding
- Capacidad de explicar conceptos de estado

---

### 1.1 Conceptos de State Management (8 puntos)

| Criterio                  | Excelente (7-8)                                                      | Muy Bueno (5-6)                                | Bueno (3-4)                           | Insuficiente (0-2)         |
| ------------------------- | -------------------------------------------------------------------- | ---------------------------------------------- | ------------------------------------- | -------------------------- |
| **useState vs useEffect** | Explica diferencias, cuándo usar cada uno, dependencias, cleanup     | Entiende uso básico de ambos hooks             | Confunde dependencias o cleanup       | No diferencia los hooks    |
| **Context API**           | Explica Provider/Consumer, cuándo usar Context, ventajas/desventajas | Implementa Context correctamente               | Entiende concepto pero con errores    | No entiende Context        |
| **AsyncStorage**          | Domina API, maneja errores, entiende async/await, serialización      | Usa AsyncStorage correctamente                 | Implementa con ayuda constante        | No puede usar AsyncStorage |
| **Custom Hooks**          | Crea hooks reutilizables, extrae lógica, sigue convenciones          | Entiende custom hooks y puede crearlos simples | Confunde hooks con funciones normales | No entiende custom hooks   |

**Puntuación:**

- **7-8 pts**: Dominio completo, explica con ejemplos técnicos
- **5-6 pts**: Comprensión sólida, dudas menores
- **3-4 pts**: Entiende lo básico, necesita refuerzo
- **0-2 pts**: Comprensión insuficiente

---

### 1.2 Aplicación de Patrones (7 puntos)

| Criterio         | Excelente (6-7)                                                        | Muy Bueno (4-5)                 | Bueno (2-3)                              | Insuficiente (0-1)                  |
| ---------------- | ---------------------------------------------------------------------- | ------------------------------- | ---------------------------------------- | ----------------------------------- |
| **useReducer**   | Implementa reducer complejo, actions tipados, maneja múltiples casos   | Usa useReducer en casos simples | Entiende concepto pero prefiere useState | No entiende useReducer              |
| **Persistencia** | Sincroniza estado con storage automáticamente, maneja race conditions  | Persiste datos correctamente    | Persiste con errores ocasionales         | No logra persistir datos            |
| **Optimización** | Usa useMemo, useCallback apropiadamente, evita re-renders innecesarios | Entiende optimización básica    | Código funciona pero sin optimizar       | Código con problemas de performance |

**Puntuación:**

- **6-7 pts**: Aplica patrones profesionales
- **4-5 pts**: Aplica patrones básicos correctamente
- **2-3 pts**: Aplica con ayuda
- **0-1 pts**: No puede aplicar patrones

---

## 💻 2. PRÁCTICAS GUIADAS (25 puntos)

### Distribución:

- Práctica 1: Counter App (8 pts)
- Práctica 2: Theme App (9 pts)
- Práctica 3: Auth App (8 pts)

---

### 2.1 Práctica 1: Counter App (8 puntos)

**Objetivo:** Contador con persistencia en AsyncStorage

| Criterio              | Puntos | Descripción                     | Indicadores                                                                         |
| --------------------- | ------ | ------------------------------- | ----------------------------------------------------------------------------------- |
| **useState Correcto** | 2 pts  | Manejo de estado del contador   | ✅ Incremento/decremento funciona<br>✅ Reset funcional<br>✅ No hay bugs de estado |
| **AsyncStorage**      | 3 pts  | Persistencia del contador       | ✅ Guarda al cambiar<br>✅ Carga al iniciar<br>✅ Maneja errores                    |
| **useEffect**         | 2 pts  | Sincronización estado-storage   | ✅ Dependencias correctas<br>✅ Cleanup si necesario<br>✅ No loops infinitos       |
| **UI Funcional**      | 1 pt   | Interfaz completa y sin errores | ✅ Botones funcionan<br>✅ Muestra valor actual<br>✅ Sin warnings                  |

**Criterios de Calidad:**

**Excelente (7-8 pts):**

- Todo funciona perfectamente
- Código limpio y optimizado
- Manejo de errores robusto
- UX fluida sin delays

**Muy Bueno (5-6 pts):**

- Funciona correctamente
- Código organizado
- Errores manejados básicamente

**Bueno (3-4 pts):**

- Funciona con bugs menores
- Código funcional pero mejorable

**Insuficiente (0-2 pts):**

- No funciona o muchos errores
- Código desorganizado

---

### 2.2 Práctica 2: Theme App (9 puntos)

**Objetivo:** Dark/Light mode con Context API y persistencia

| Criterio              | Puntos | Descripción                   | Indicadores                                                                                |
| --------------------- | ------ | ----------------------------- | ------------------------------------------------------------------------------------------ |
| **Context Setup**     | 3 pts  | ThemeContext correcto         | ✅ Provider envuelve app<br>✅ Value con estado y setter<br>✅ Exporta useTheme hook       |
| **Toggle Funcional**  | 2 pts  | Cambio de tema funciona       | ✅ Toggle dark/light<br>✅ Estado actualiza UI<br>✅ Todos los componentes reflejan cambio |
| **Persistencia**      | 2 pts  | Tema persiste entre reinicios | ✅ Guarda preferencia<br>✅ Carga al iniciar<br>✅ Default apropiado                       |
| **Estilos Dinámicos** | 2 pts  | Colores cambian según tema    | ✅ Background cambia<br>✅ Text color cambia<br>✅ Contraste apropiado                     |

**Criterios de Calidad:**

**Excelente (8-9 pts):**

- Context implementado profesionalmente
- Transiciones suaves
- Todos los componentes temáticos
- Sin flickers al cargar

**Muy Bueno (6-7 pts):**

- Context funcional
- Toggle inmediato
- Persistencia correcta

**Bueno (4-5 pts):**

- Context funciona con bugs menores
- Algunos componentes sin tematizar

**Insuficiente (0-3 pts):**

- Context incorrecto o no funciona
- No persiste

---

### 2.3 Práctica 3: Auth App (8 puntos)

**Objetivo:** Sistema de autenticación básico con useReducer

| Criterio             | Puntos | Descripción                    | Indicadores                                                                             |
| -------------------- | ------ | ------------------------------ | --------------------------------------------------------------------------------------- |
| **useReducer Setup** | 3 pts  | Reducer y actions correctos    | ✅ Initial state definido<br>✅ Reducer maneja LOGIN/LOGOUT<br>✅ Dispatch correcto     |
| **Auth Context**     | 2 pts  | AuthContext con useReducer     | ✅ Context provee state y dispatch<br>✅ Custom hook useAuth<br>✅ Provider configurado |
| **Login/Logout**     | 2 pts  | Funcionalidad de autenticación | ✅ Login actualiza estado<br>✅ Logout limpia estado<br>✅ Navegación condicional       |
| **Persistencia**     | 1 pt   | Sesión persiste                | ✅ Token guardado<br>✅ Auto-login al reabrir                                           |

**Criterios de Calidad:**

**Excelente (7-8 pts):**

- useReducer implementado perfectamente
- Actions tipados
- Estado inmutable
- Manejo de loading states

**Muy Bueno (5-6 pts):**

- useReducer funcional
- Login/Logout funcionan
- Persistencia básica

**Bueno (3-4 pts):**

- Funciona con errores menores
- Reducer básico

**Insuficiente (0-2 pts):**

- useReducer incorrecto
- No funciona

---

## 🚀 3. PROYECTO INTEGRADOR (40 puntos)

### Proyecto: Task Manager App

**Descripción:** Aplicación completa de gestión de tareas con Context API, AsyncStorage y custom hooks.

---

### 3.1 Funcionalidad (16 puntos)

| Funcionalidad        | Puntos | Descripción                              | Debe Incluir                                                                                                               |
| -------------------- | ------ | ---------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| **CRUD Completo**    | 6 pts  | Crear, leer, actualizar, eliminar tareas | ✅ Agregar tarea<br>✅ Editar tarea<br>✅ Eliminar tarea<br>✅ Marcar completada<br>✅ Filtros (todas/activas/completadas) |
| **Persistencia**     | 4 pts  | Datos persisten localmente               | ✅ Tareas guardan automáticamente<br>✅ Cargan al iniciar<br>✅ No se pierden datos                                        |
| **Validaciones**     | 3 pts  | Validación de inputs                     | ✅ No permite tareas vacías<br>✅ Límite de caracteres<br>✅ Feedback al usuario                                           |
| **Estados de Carga** | 3 pts  | Loading y error states                   | ✅ Loading al cargar<br>✅ Loading al guardar<br>✅ Mensajes de error                                                      |

**Puntuación Funcionalidad:**

- **14-16 pts**: Todas las funcionalidades perfectas
- **11-13 pts**: Funcionalidades principales completas
- **8-10 pts**: CRUD básico funciona
- **0-7 pts**: Funcionalidades incompletas

---

### 3.2 Arquitectura de Estado (12 puntos)

| Criterio         | Puntos | Descripción                   | Debe Incluir                                                                                                                   |
| ---------------- | ------ | ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| **TaskContext**  | 4 pts  | Context API para tareas       | ✅ TaskProvider componente<br>✅ State global de tareas<br>✅ Actions (add, update, delete, toggle)<br>✅ useTasks custom hook |
| **useReducer**   | 4 pts  | Reducer para gestión compleja | ✅ Reducer con todos los action types<br>✅ State inmutable<br>✅ Actions tipados (TS opcional)                                |
| **Custom Hooks** | 4 pts  | Hooks reutilizables           | ✅ useAsyncStorage hook<br>✅ useTaskFilters hook<br>✅ Lógica extraída correctamente                                          |

**Puntuación Arquitectura:**

- **11-12 pts**: Arquitectura profesional, hooks reutilizables
- **8-10 pts**: Context y reducer correctos
- **5-7 pts**: Arquitectura funcional pero mejorable
- **0-4 pts**: Arquitectura incorrecta o incompleta

---

### 3.3 Calidad del Código (8 puntos)

| Criterio          | Puntos | Descripción                                                       |
| ----------------- | ------ | ----------------------------------------------------------------- |
| **Organización**  | 2 pts  | Estructura de carpetas clara, separación de responsabilidades     |
| **Nomenclatura**  | 2 pts  | Nombres descriptivos en inglés, convenciones seguidas             |
| **Reutilización** | 2 pts  | Componentes y hooks reutilizables, DRY principle                  |
| **Performance**   | 2 pts  | Optimizaciones (useMemo, useCallback), no re-renders innecesarios |

**Puntuación Calidad:**

- **7-8 pts**: Código profesional, optimizado
- **5-6 pts**: Código limpio y organizado
- **3-4 pts**: Código funcional pero mejorable
- **0-2 pts**: Código desorganizado

---

### 3.4 UI/UX (4 puntos)

| Criterio          | Puntos | Descripción                                                  |
| ----------------- | ------ | ------------------------------------------------------------ |
| **Diseño Visual** | 2 pts  | Interfaz atractiva, colores coherentes, tipografía apropiada |
| **Usabilidad**    | 2 pts  | Fácil de usar, feedback visual, transiciones suaves          |

**Puntuación UI/UX:**

- **4 pts**: UI profesional, excelente UX
- **3 pts**: UI agradable, buena UX
- **2 pts**: UI básica pero funcional
- **0-1 pts**: UI poco cuidada

---

## 🐛 4. BUGS PEDAGÓGICOS (20 puntos)

> Esta semana incluye **7 bugs intencionales** en el código de ejemplo. Debes identificarlos, corregirlos y documentar el proceso en un archivo `BUGS-RESUELTOS.md` siguiendo el [template oficial](../../_docs/instructor/TEMPLATE-BUGS-RESUELTOS.md).

### 4.1 Bugs Identificados (8 puntos)

| Bugs Encontrados      | Puntos | Descripción                |
| --------------------- | ------ | -------------------------- |
| **7 bugs (100%)**     | 8 pts  | Encontraste todos los bugs |
| **5-6 bugs (71-85%)** | 6 pts  | Encontraste la mayoría     |
| **3-4 bugs (43-57%)** | 4 pts  | Encontraste la mitad       |
| **1-2 bugs (14-28%)** | 2 pts  | Encontraste algunos bugs   |
| **0 bugs**            | 0 pts  | No identificaste bugs      |

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

### 📋 Lista de Bugs - Semana 3 (7 bugs)

| #   | Ubicación                           | Tipo                  | Severidad | Descripción                                         |
| --- | ----------------------------------- | --------------------- | --------- | --------------------------------------------------- |
| 1   | `TaskContext.js` línea 18           | **Sutil**             | 🔴 Alta   | useEffect sin dependencias causa loop infinito      |
| 2   | `TaskContext.js` línea 45           | **Sutil**             | 🟠 Media  | Mutación directa del estado en reducer              |
| 3   | `hooks/useAsyncStorage.js` línea 12 | **Obvio**             | 🔴 Alta   | Falta `await` en AsyncStorage.setItem, no guarda    |
| 4   | `components/TaskItem.js` línea 23   | **Mejores Prácticas** | 🟡 Baja   | Función inline en onPress causa re-renders          |
| 5   | `screens/TaskList.js` línea 15      | **Sutil**             | 🟠 Media  | JSON.parse sin try-catch, crash con datos corruptos |
| 6   | `utils/taskFilters.js` línea 8      | **Mejores Prácticas** | 🟡 Baja   | Filter no devuelve nuevo array, muta original       |
| 7   | `App.js` línea 30                   | **Obvio**             | 🟠 Media  | Context Provider sin value, no comparte estado      |

**Distribución:**

- 29% Bugs Obvios (app no funciona o errores críticos)
- 43% Bugs Sutiles (funciona pero con comportamiento incorrecto/peligroso)
- 28% Mejores Prácticas (funciona pero no es profesional)

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

- [ ] He encontrado los 7 bugs (o al menos 5)
- [ ] He corregido cada bug correctamente
- [ ] La app funciona sin errores después de las correcciones
- [ ] No hay loops infinitos ni memory leaks
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
| **1. Teoría**    | Conceptos (8) + Aplicación (7)                                    | 15 pts         | \_\_\_ / 15      |
| **2. Prácticas** | Counter (8) + Theme (9) + Auth (8)                                | 25 pts         | \_\_\_ / 25      |
| **3. Proyecto**  | Funcionalidad (16) + Arquitectura (12) + Código (8) + UI (4)      | 40 pts         | \_\_\_ / 40      |
| **4. Bugs**      | Identificados (8) + Soluciones (6) + Docs (4) + Explicaciones (2) | 20 pts         | \_\_\_ / 20      |
| **TOTAL**        |                                                                   | **100 pts**    | **\_\_\_ / 100** |

---

## 🎯 Escala de Calificación

| Rango  | Calificación | Descripción                           |
| ------ | ------------ | ------------------------------------- |
| 90-100 | Excelente    | Dominio completo, supera expectativas |
| 80-89  | Muy Bueno    | Dominio sólido, cumple todo           |
| 70-79  | Bueno        | Comprensión adecuada                  |
| 60-69  | Suficiente   | Comprensión mínima, necesita refuerzo |
| 0-59   | Insuficiente | No cumple requisitos mínimos          |

---

## 📞 Dudas sobre la Evaluación

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
| **BUGS-RESUELTOS.md**         | Viernes 23:59    | Documentación de bugs             |
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

_Rúbrica de Evaluación - Semana 3: Estado y Gestión de Datos_  
_Bootcamp React Native 2025 - Ficha 3147252_  
_Versión 2.0 (con bugs pedagógicos) - Actualizada: 18 de octubre de 2025_
