# 📊 Rúbrica de Evaluación - Semana 2: Navegación en React Native

> **Sistema de evaluación integral** para medir el dominio de navegación móvil con React Navigation

---

## 📋 Información General

### Distribución de Puntos

| Componente            | Peso | Puntos  | Descripción                             |
| --------------------- | ---- | ------- | --------------------------------------- |
| **1. Teoría**         | 15%  | 15      | Comprensión de conceptos de navegación  |
| **2. Prácticas**      | 25%  | 25      | Ejercicios guiados (Stack, Tab, Drawer) |
| **3. Proyecto**       | 40%  | 40      | App E-Commerce integrador               |
| **4. Bugs Resueltos** | 20%  | 20      | Identificación y solución de bugs       |
| **TOTAL**             | 100% | **100** | Puntuación máxima                       |

> **🐛 NUEVO:** Esta semana incluye **bugs pedagógicos intencionales** en el código de ejemplo. Debes identificarlos, corregirlos y documentarlos en `BUGS-RESUELTOS.md`.

### Escala de Calificación

| Rango  | Calificación | Descripción                                       |
| ------ | ------------ | ------------------------------------------------- |
| 90-100 | Excelente    | Dominio completo, supera expectativas             |
| 80-89  | Muy Bueno    | Dominio sólido, cumple todas las expectativas     |
| 70-79  | Bueno        | Comprensión adecuada, cumple expectativas básicas |
| 60-69  | Suficiente   | Comprensión mínima aceptable, necesita refuerzo   |
| 0-59   | Insuficiente | No cumple con los requisitos mínimos              |

### Criterios Transversales (Aplican a todo)

✅ **Calidad del código:**

- Nomenclatura en inglés (variables, funciones, componentes)
- Código limpio y bien estructurado
- Comentarios explicativos en español
- Buenas prácticas de React Native

✅ **TypeScript:**

- Tipado correcto cuando aplique
- Interfaces bien definidas
- No usar `any` sin justificación

✅ **Performance:**

- Optimización de renders
- Manejo eficiente de memoria
- Carga rápida de pantallas

---

## 1️⃣ EVALUACIÓN TEÓRICA (20 puntos)

### 1.1 Comprensión de Conceptos Fundamentales (10 pts)

#### Excelente (9-10 puntos)

- ✅ Explica claramente la diferencia entre Stack, Tab y Drawer Navigator
- ✅ Entiende perfectamente el concepto de navegación anidada
- ✅ Domina el flujo de datos con params entre pantallas
- ✅ Comprende el ciclo de vida de las pantallas (focus/blur)
- ✅ Puede explicar cuándo usar cada tipo de navegador
- ✅ Identifica patrones avanzados (auth flows, deep linking)

#### Muy Bueno (7-8 puntos)

- ✅ Explica adecuadamente los tres tipos de navegadores
- ✅ Entiende navegación anidada básica
- ✅ Maneja correctamente params
- ✅ Comprende eventos básicos de navegación
- ⚠️ Puede tener dudas en patrones avanzados

#### Bueno (5-6 puntos)

- ✅ Conoce los tipos básicos de navegadores
- ✅ Entiende navegación simple entre pantallas
- ✅ Puede pasar params básicos
- ⚠️ Dificultad con navegación anidada
- ⚠️ Conceptos avanzados no claros

#### Suficiente (3-4 puntos)

- ✅ Identifica al menos 2 tipos de navegadores
- ✅ Entiende navegación básica
- ⚠️ Confusión con params
- ⚠️ No domina anidación
- ❌ Conceptos avanzados desconocidos

#### Insuficiente (0-2 puntos)

- ❌ No diferencia tipos de navegadores
- ❌ Confusión sobre navegación básica
- ❌ No entiende params
- ❌ Conceptos fundamentales no claros

### 1.2 Aplicación de Conocimientos (10 pts)

#### Excelente (9-10 puntos)

- ✅ Identifica el navegador correcto para cada caso de uso
- ✅ Diseña arquitecturas de navegación complejas
- ✅ Optimiza flujos de navegación
- ✅ Propone soluciones creativas a problemas
- ✅ Relaciona navegación con UX/UI
- ✅ Considera performance y experiencia del usuario

#### Muy Bueno (7-8 puntos)

- ✅ Selecciona navegadores apropiados
- ✅ Diseña arquitecturas de complejidad media
- ✅ Aplica conceptos correctamente
- ✅ Resuelve problemas comunes
- ⚠️ Soluciones menos optimizadas

#### Bueno (5-6 puntos)

- ✅ Selecciona navegadores para casos simples
- ✅ Implementa navegación básica
- ⚠️ Arquitecturas simples, poco escalables
- ⚠️ Soluciones funcionales pero no óptimas

#### Suficiente (3-4 puntos)

- ✅ Implementa navegación muy básica
- ⚠️ Dificultad para elegir navegador apropiado
- ⚠️ Soluciones poco eficientes
- ⚠️ No considera UX

#### Insuficiente (0-2 puntos)

- ❌ No puede aplicar conceptos
- ❌ Implementaciones incorrectas
- ❌ No resuelve problemas básicos

---

## 2️⃣ PRÁCTICAS (30 puntos)

### Distribución por Práctica

| Práctica                     | Puntos | Tiempo Estimado | Dificultad |
| ---------------------------- | ------ | --------------- | ---------- |
| Práctica 1: Stack Navigator  | 10     | 45 min          | ⭐⭐       |
| Práctica 2: Tab Navigator    | 10     | 45 min          | ⭐⭐       |
| Práctica 3: Drawer Navigator | 10     | 30 min          | ⭐⭐       |
| **TOTAL**                    | **30** | **2 horas**     |            |

### 2.1 Práctica 1: Stack Navigator - Blog App (10 pts)

**Objetivo:** Implementar navegación por pila con 3 pantallas

#### Funcionalidad (4 pts)

- **Excelente (4 pts):**
  - ✅ Navegación fluida entre todas las pantallas
  - ✅ Parámetros se pasan correctamente
  - ✅ Modal funciona perfectamente
  - ✅ Formulario valida y maneja errores
- **Bueno (3 pts):**
  - ✅ Navegación funciona
  - ✅ Parámetros básicos correctos
  - ⚠️ Modal con problemas menores
- **Suficiente (2 pts):**
  - ✅ Navegación básica funciona
  - ⚠️ Problemas con params o modal
- **Insuficiente (0-1 pts):**
  - ❌ Navegación no funciona correctamente

#### Implementación Técnica (3 pts)

- **Excelente (3 pts):**
  - ✅ Stack Navigator configurado correctamente
  - ✅ TypeScript types bien definidos
  - ✅ Headers personalizados
  - ✅ Gestión correcta de estado local
- **Bueno (2 pts):**
  - ✅ Stack configurado
  - ⚠️ Types incompletos o con any
- **Insuficiente (0-1 pts):**
  - ❌ Configuración incorrecta

#### Código y Estilo (3 pts)

- **Excelente (3 pts):**
  - ✅ Código limpio y organizado
  - ✅ Componentes reutilizables
  - ✅ Estilos consistentes
  - ✅ Manejo de errores
- **Bueno (2 pts):**
  - ✅ Código funcional
  - ⚠️ Poca reutilización
- **Insuficiente (0-1 pts):**
  - ❌ Código desorganizado

### 2.2 Práctica 2: Tab Navigator - Dashboard App (10 pts)

**Objetivo:** Implementar tabs con navegación anidada

#### Funcionalidad (4 pts)

- **Excelente (4 pts):**
  - ✅ Tabs funcionan correctamente
  - ✅ Navegación anidada (Stack dentro de Tabs)
  - ✅ Badges se actualizan dinámicamente
  - ✅ Iconos cambian según estado activo/inactivo
- **Bueno (3 pts):**
  - ✅ Tabs básicos funcionan
  - ✅ Anidación funciona
  - ⚠️ Badges estáticos
- **Suficiente (2 pts):**
  - ✅ Tabs funcionan
  - ⚠️ Sin anidación o con errores
- **Insuficiente (0-1 pts):**
  - ❌ Tabs no funcionan correctamente

#### Implementación Técnica (3 pts)

- **Excelente (3 pts):**
  - ✅ Tab Navigator configurado correctamente
  - ✅ Nested navigation bien estructurada
  - ✅ TypeScript completo
  - ✅ Custom tab bar (si aplica)
- **Bueno (2 pts):**
  - ✅ Tabs configurados
  - ⚠️ Anidación básica
- **Insuficiente (0-1 pts):**
  - ❌ Configuración incorrecta

#### UI/UX (3 pts)

- **Excelente (3 pts):**
  - ✅ Iconos apropiados y visibles
  - ✅ Colores bien definidos
  - ✅ Transiciones suaves
  - ✅ Labels claros
- **Bueno (2 pts):**
  - ✅ UI funcional
  - ⚠️ Estética mejorable
- **Insuficiente (0-1 pts):**
  - ❌ UI confusa o poco usable

### 2.3 Práctica 3: Drawer Navigator - Settings App (10 pts)

**Objetivo:** Implementar drawer con menú lateral personalizado

#### Funcionalidad (4 pts)

- **Excelente (4 pts):**
  - ✅ Drawer se abre/cierra correctamente
  - ✅ Navegación a todas las pantallas
  - ✅ Drawer content personalizado
  - ✅ Gestión de estado (dark mode, etc.)
- **Bueno (3 pts):**
  - ✅ Drawer funciona
  - ✅ Navegación correcta
  - ⚠️ Drawer content básico
- **Suficiente (2 pts):**
  - ✅ Drawer funciona básicamente
  - ⚠️ Problemas menores
- **Insuficiente (0-1 pts):**
  - ❌ Drawer no funciona

#### Personalización (3 pts)

- **Excelente (3 pts):**
  - ✅ Custom drawer content implementado
  - ✅ Avatar/perfil de usuario
  - ✅ Estilos personalizados
  - ✅ Animaciones suaves
- **Bueno (2 pts):**
  - ✅ Drawer personalizado básico
  - ⚠️ Sin avatar o estilos limitados
- **Insuficiente (0-1 pts):**
  - ❌ Drawer default sin personalización

#### Integración (3 pts)

- **Excelente (3 pts):**
  - ✅ Drawer + Stack bien integrados
  - ✅ Headers coordinados
  - ✅ Estado compartido funciona
  - ✅ Context API implementado correctamente
- **Bueno (2 pts):**
  - ✅ Integración básica funciona
- **Insuficiente (0-1 pts):**
  - ❌ Problemas de integración

---

## 3️⃣ PROYECTO INTEGRADOR: E-COMMERCE APP (50 puntos)

### Información del Proyecto

**Descripción:** Aplicación de comercio electrónico con navegación completa (Drawer → Tab → Stack)

**Características:**

- 16 pantallas distribuidas en 3 stacks
- Navegación anidada de 3 niveles
- Gestión de estado con Context API
- Carrito de compras funcional
- Flow completo de checkout

**Tiempo:** 30 min presencial + 7 horas autónomas

### Distribución de Puntos

| Criterio                       | Puntos | Porcentaje |
| ------------------------------ | ------ | ---------- |
| 3.1 Funcionalidad              | 20     | 40%        |
| 3.2 Arquitectura de Navegación | 12     | 24%        |
| 3.3 Calidad del Código         | 10     | 20%        |
| 3.4 Context API & Estado       | 5      | 10%        |
| 3.5 UI/UX                      | 3      | 6%         |
| **TOTAL**                      | **50** | **100%**   |

---

### 3.1 Funcionalidad (20 puntos)

#### 3.1.1 Home Stack - Exploración (6 pts)

**Pantallas:** Home, ProductList, ProductDetail

##### Excelente (6 pts)

- ✅ Home muestra categorías correctamente
- ✅ ProductList filtra por categoría
- ✅ ProductDetail muestra toda la información
- ✅ Botón "Add to Cart" funciona
- ✅ Navegación entre pantallas fluida
- ✅ Búsqueda funciona (opcional)

##### Muy Bueno (5 pts)

- ✅ Todas las pantallas funcionan
- ⚠️ Búsqueda no implementada
- ⚠️ Filtros básicos

##### Bueno (4 pts)

- ✅ Navegación básica funciona
- ⚠️ ProductDetail incompleto
- ⚠️ Sin búsqueda ni filtros

##### Suficiente (3 pts)

- ✅ Home y lista funcionan mínimamente
- ⚠️ ProductDetail muy básico
- ❌ Add to cart con problemas

##### Insuficiente (0-2 pts)

- ❌ Pantallas no funcionan correctamente
- ❌ Navegación con errores

#### 3.1.2 Cart Stack - Proceso de Compra (8 pts)

**Pantallas:** Cart, Checkout, Payment, OrderConfirmation

##### Excelente (8 pts)

- ✅ Cart muestra productos correctamente
- ✅ Actualizar cantidad funciona
- ✅ Eliminar productos funciona
- ✅ Total se calcula automáticamente
- ✅ Checkout valida datos
- ✅ Payment simula proceso
- ✅ OrderConfirmation muestra resumen completo
- ✅ Flow completo sin errores

##### Muy Bueno (6-7 pts)

- ✅ Flow principal funciona
- ✅ CRUD de carrito correcto
- ⚠️ Validaciones básicas
- ⚠️ Payment simplificado

##### Bueno (4-5 pts)

- ✅ Cart básico funciona
- ✅ Checkout mínimo
- ⚠️ Payment muy simple
- ⚠️ Sin validaciones robustas

##### Suficiente (2-3 pts)

- ✅ Cart muestra items
- ⚠️ CRUD incompleto
- ⚠️ Checkout muy básico
- ❌ Payment no funcional

##### Insuficiente (0-1 pts)

- ❌ Cart no funciona correctamente
- ❌ Flow de checkout roto

#### 3.1.3 Profile Stack - Gestión de Usuario (6 pts)

**Pantallas:** Profile, Orders, Settings, EditProfile

##### Excelente (6 pts)

- ✅ Profile muestra información de usuario
- ✅ Orders lista pedidos anteriores
- ✅ Settings maneja preferencias (dark mode, etc.)
- ✅ EditProfile permite editar datos
- ✅ Cambios persisten correctamente
- ✅ Logout funciona y resetea navegación

##### Muy Bueno (5 pts)

- ✅ Todas las pantallas funcionan
- ⚠️ Persistencia básica
- ⚠️ Dark mode no implementado

##### Bueno (4 pts)

- ✅ Profile y Settings funcionan
- ⚠️ Orders simplificado
- ⚠️ EditProfile básico

##### Suficiente (2-3 pts)

- ✅ Profile muestra datos
- ⚠️ Funcionalidad limitada
- ❌ Sin persistencia

##### Insuficiente (0-1 pts)

- ❌ Pantallas no funcionan
- ❌ No hay gestión de usuario

---

### 3.2 Arquitectura de Navegación (12 puntos)

#### 3.2.1 Estructura de Navegadores (5 pts)

##### Excelente (5 pts)

- ✅ Drawer → Tab → Stack correctamente anidado
- ✅ 3 niveles de navegación funcionan
- ✅ Drawer con opciones relevantes (Profile, Settings, Logout)
- ✅ Tab con Home, Cart, Profile
- ✅ Cada tab con su stack independiente
- ✅ No hay navegación circular ni dead-ends

##### Muy Bueno (4 pts)

- ✅ Estructura completa
- ⚠️ Pequeños problemas de navegación

##### Bueno (3 pts)

- ✅ Anidación básica funciona
- ⚠️ Estructura no óptima

##### Insuficiente (0-2 pts)

- ❌ Estructura incorrecta
- ❌ Anidación no funciona

#### 3.2.2 TypeScript & Types (4 pts)

##### Excelente (4 pts)

- ✅ ParamLists completos para cada navegador
- ✅ Types exportados y reutilizados
- ✅ ScreenProps correctamente tipados
- ✅ No hay `any` sin justificar
- ✅ Autocompletado funciona en toda la app

##### Muy Bueno (3 pts)

- ✅ ParamLists definidos
- ⚠️ Algunos `any` innecesarios

##### Bueno (2 pts)

- ✅ Types básicos
- ⚠️ Muchos `any` o types incompletos

##### Insuficiente (0-1 pts)

- ❌ Sin types o incorrectos

#### 3.2.3 Flujos de Usuario (3 pts)

##### Excelente (3 pts)

- ✅ Flow de compra lógico y fluido
- ✅ Navegación intuitiva
- ✅ Back button comportamiento correcto
- ✅ Confirmaciones en puntos críticos
- ✅ UX considerada en toda la app

##### Bueno (2 pts)

- ✅ Flows funcionan
- ⚠️ UX mejorable

##### Insuficiente (0-1 pts)

- ❌ Flows confusos o rotos

---

### 3.3 Calidad del Código (10 puntos)

#### 3.3.1 Organización y Estructura (4 pts)

##### Excelente (4 pts)

- ✅ Carpetas organizadas lógicamente
- ✅ Componentes separados por responsabilidad
- ✅ Servicios/utils bien estructurados
- ✅ Navegadores en archivos separados
- ✅ Types en archivos dedicados

**Estructura esperada:**

```
src/
├── app/              # Expo Router screens
├── components/       # Componentes reutilizables
├── contexts/         # Context providers
├── types/           # TypeScript types
├── utils/           # Utilidades
└── constants/       # Constantes
```

##### Bueno (2-3 pts)

- ✅ Organización básica
- ⚠️ Mezcla de responsabilidades

##### Insuficiente (0-1 pts)

- ❌ Sin organización clara

#### 3.3.2 Nomenclatura y Convenciones (3 pts)

##### Excelente (3 pts)

- ✅ Variables/funciones en inglés, camelCase
- ✅ Componentes PascalCase
- ✅ Constantes UPPER_SNAKE_CASE
- ✅ Archivos kebab-case o PascalCase consistente
- ✅ Nombres descriptivos y claros

##### Bueno (2 pts)

- ✅ Nomenclatura mayormente correcta
- ⚠️ Inconsistencias menores

##### Insuficiente (0-1 pts)

- ❌ Nomenclatura inconsistente o en español

#### 3.3.3 Documentación y Comentarios (3 pts)

##### Excelente (3 pts)

- ✅ Componentes documentados (qué, para qué, cómo)
- ✅ Funciones complejas comentadas
- ✅ README del proyecto completo
- ✅ Comentarios en español, claros y útiles
- ✅ Types documentados

##### Bueno (2 pts)

- ✅ Documentación básica
- ⚠️ Algunos comentarios faltantes

##### Insuficiente (0-1 pts)

- ❌ Sin documentación o muy escasa

---

### 3.4 Context API & Estado (5 puntos)

#### Excelente (5 pts)

- ✅ CartContext implementado correctamente
- ✅ Provider envuelve NavigationContainer
- ✅ Hook personalizado `useCart()`
- ✅ Funciones: addToCart, removeFromCart, updateQuantity, clearCart
- ✅ Estado persiste durante la navegación
- ✅ Cálculos automáticos (total, cantidad de items)
- ✅ TypeScript types para Context

**Ejemplo esperado:**

```typescript
interface CartItem {
  id: number
  name: string
  price: number
  quantity: number
}

interface CartContextType {
  items: CartItem[]
  totalAmount: number
  itemCount: number
  addToCart: (item: Product) => void
  removeFromCart: (id: number) => void
  updateQuantity: (id: number, quantity: number) => void
  clearCart: () => void
}
```

#### Muy Bueno (4 pts)

- ✅ Context funciona
- ✅ Funciones principales implementadas
- ⚠️ Sin hook personalizado

#### Bueno (3 pts)

- ✅ Context básico funciona
- ⚠️ Funciones incompletas
- ⚠️ Types básicos

#### Suficiente (2 pts)

- ✅ Context implementado mínimamente
- ⚠️ Muchas funcionalidades faltantes

#### Insuficiente (0-1 pts)

- ❌ Context no funciona o no implementado
- ❌ Estado no se comparte correctamente

---

### 3.5 UI/UX (3 puntos)

#### Excelente (3 pts)

- ✅ UI limpia y profesional
- ✅ Estilos consistentes en toda la app
- ✅ Iconos apropiados (Ionicons)
- ✅ Colores bien definidos
- ✅ Espaciado y padding coherente
- ✅ Estados de carga mostrados
- ✅ Feedback visual en acciones (ej: agregar al carrito)
- ✅ Badge en tab de carrito con cantidad

#### Muy Bueno (2 pts)

- ✅ UI funcional y agradable
- ✅ Estilos consistentes
- ⚠️ Algunos detalles menores

#### Bueno (1 pt)

- ✅ UI básica funcional
- ⚠️ Estilos inconsistentes
- ⚠️ Sin estados de carga

#### Insuficiente (0 pts)

- ❌ UI muy básica o confusa
- ❌ Sin considerar UX

---

## 📊 Tabla Resumen de Evaluación

### Puntuación por Componente

| Componente           | Puntos Máximos | Mi Puntuación |
| -------------------- | -------------- | ------------- |
| **1. TEORÍA**        | 20             |               |
| 1.1 Conceptos        | 10             |               |
| 1.2 Aplicación       | 10             |               |
| **2. PRÁCTICAS**     | 30             |               |
| 2.1 Stack Navigator  | 10             |               |
| 2.2 Tab Navigator    | 10             |               |
| 2.3 Drawer Navigator | 10             |               |
| **3. PROYECTO**      | 50             |               |
| 3.1 Funcionalidad    | 20             |               |
| 3.2 Arquitectura     | 12             |               |
| 3.3 Calidad Código   | 10             |               |
| 3.4 Context API      | 5              |               |
| 3.5 UI/UX            | 3              |               |
| **TOTAL**            | **100**        |               |

---

## ✅ Checklist de Auto-Evaluación

### Antes de Entregar - Teoría

- [ ] He comprendido las diferencias entre Stack, Tab y Drawer
- [ ] Puedo explicar navegación anidada con ejemplos
- [ ] Entiendo el paso de parámetros entre pantallas
- [ ] Conozco los hooks principales de React Navigation
- [ ] Sé cuándo usar cada tipo de navegador

### Antes de Entregar - Prácticas

- [ ] Práctica 1: Stack Navigator completada y funcional
- [ ] Práctica 2: Tab Navigator con nested navigation
- [ ] Práctica 3: Drawer personalizado implementado
- [ ] Todo el código compila sin errores
- [ ] TypeScript types definidos correctamente

### Antes de Entregar - Proyecto

- [ ] Las 16 pantallas están implementadas
- [ ] Drawer → Tab → Stack anidados correctamente
- [ ] CartContext funciona en toda la app
- [ ] Flow completo de compra funciona
- [ ] Puedo agregar/eliminar/actualizar productos en carrito
- [ ] Total se calcula correctamente
- [ ] Badge del carrito muestra cantidad
- [ ] Navegación fluida sin errores
- [ ] TypeScript completo sin errores
- [ ] Código limpio y organizado
- [ ] Documentación presente
- [ ] UI consistente y profesional

---

## 🎯 Criterios de Aprobación

### Aprobado (≥60 puntos)

**Requisitos mínimos:**

- ✅ Comprensión básica de navegación
- ✅ Al menos 2 prácticas completadas
- ✅ Proyecto con funcionalidad básica (Home, Cart, Profile)
- ✅ Navegación anidada implementada
- ✅ Context API funcionando

### Bien (≥70 puntos)

**Adicional a aprobado:**

- ✅ Todas las prácticas completadas
- ✅ Proyecto con mayoría de funcionalidades
- ✅ Código limpio y organizado
- ✅ TypeScript básico

### Muy Bien (≥80 puntos)

**Adicional a bien:**

- ✅ Proyecto completo con todas las pantallas
- ✅ Arquitectura sólida
- ✅ TypeScript completo
- ✅ UI profesional
- ✅ Buenas prácticas aplicadas

### Excelente (≥90 puntos)

**Adicional a muy bien:**

- ✅ Código ejemplar, referencia para otros
- ✅ Optimizaciones de performance
- ✅ Features extra (búsqueda, filtros, etc.)
- ✅ Documentación exhaustiva
- ✅ Dominio completo de navegación

---

## 📝 Formato de Entrega

### Requerimientos Técnicos

1. **Repositorio Git**

   - Branch: `semana-02-navegacion`
   - Commits descriptivos en inglés
   - README.md con instrucciones

2. **Estructura de Carpetas**

   ```
   proyecto-ecommerce/
   ├── README.md
   ├── package.json
   ├── app.json
   ├── tsconfig.json
   ├── src/
   │   ├── app/
   │   ├── components/
   │   ├── contexts/
   │   ├── types/
   │   └── utils/
   └── assets/
   ```

3. **Documentación Requerida**

   - README.md principal
   - Comentarios en código
   - Screenshots de la app (opcional)

4. **Testing**
   - App debe correr sin errores con `pnpm start`
   - Testear en iOS y Android (simulador)

### Fecha de Entrega

**Día 6 de la semana** (antes de la sesión presencial)

### Método de Entrega

- Link al repositorio en GitHub/GitLab
- O archivo ZIP con proyecto completo

---

## 🔍 Proceso de Evaluación

### Fase 1: Revisión Automática

- ✅ Código compila sin errores
- ✅ Estructura de carpetas correcta
- ✅ Dependencias instaladas

### Fase 2: Evaluación Funcional

- ✅ Testing manual de cada pantalla
- ✅ Verificación de flujos completos
- ✅ Testing de Context API
- ✅ Validación de navegación

### Fase 3: Revisión de Código

- ✅ Calidad del código
- ✅ TypeScript types
- ✅ Organización
- ✅ Documentación

### Fase 4: Evaluación Teórica

- ✅ Quiz o entrevista corta
- ✅ Explicación de decisiones técnicas
- ✅ Resolución de problemas

---

## 💡 Consejos para Maximizar tu Puntuación

### 🎯 Para la Teoría (20 pts)

1. Lee toda la documentación de `1-teoria/`
2. Practica explicar conceptos con tus palabras
3. Crea diagramas de navegación
4. Relaciona conceptos con apps que usas
5. Consulta documentación oficial

### 💻 Para las Prácticas (30 pts)

1. Completa las 3 prácticas en orden
2. No copies y pegues, entiende cada línea
3. Experimenta con personalizaciones
4. Testea en diferentes dispositivos
5. Documenta problemas y soluciones

### 🚀 Para el Proyecto (50 pts)

**Funcionalidad (20 pts):**

- Implementa todas las pantallas del INDICE
- Testea cada flow múltiples veces
- Maneja casos edge (carrito vacío, errores, etc.)

**Arquitectura (12 pts):**

- Sigue la estructura en ESTRUCTURA-NAVEGACION.md
- Define types completos en archivos separados
- Documenta decisiones de diseño

**Código (10 pts):**

- Refactoriza código duplicado
- Crea componentes reutilizables
- Nomenclatura consistente
- Comentarios en español

**Context (5 pts):**

- Sigue el ejemplo de FASE-02-CONTEXT.md
- Testea que el estado persiste
- Implementa todas las funciones

**UI/UX (3 pts):**

- Usa Ionicons coherentemente
- Define paleta de colores
- Espaciado consistente
- Estados de loading

---

## ❓ Preguntas Frecuentes

### ¿Puedo usar librerías adicionales?

**Sí**, pero justifica su uso. Evita dependencias innecesarias.

### ¿Es obligatorio TypeScript?

**No**, pero suma puntos significativos (TypeScript es una mejor práctica).

### ¿Puedo trabajar en equipo?

**No**, este es un proyecto individual para evaluar tu comprensión.

### ¿Qué pasa si no termino a tiempo?

Entregas parciales se evalúan, pero se penalizará (10% por día).

### ¿Puedo agregar features extra?

**Sí**, features bien implementados pueden compensar puntos en otras áreas.

### ¿Cómo se evalúa el código?

Se revisa:

- Funcionalidad
- Organización
- Nomenclatura
- Documentación
- Buenas prácticas

---

## 📚 Recursos de Apoyo

### Durante la Evaluación

- [Documentación React Navigation](https://reactnavigation.org)
- [Expo Docs](https://docs.expo.dev)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/)
- Material de `1-teoria/`
- Soluciones de `2-practicas/`
- Código de referencia en `3-proyecto/`

### Para Consultas

- Instructor: Office hours (horarios en README principal)
- Compañeros: Grupo de WhatsApp/Discord
- Stack Overflow: Tag `react-navigation`
- GitHub Issues: React Navigation repo

---

## 🏆 Ejemplos de Excelencia

### Proyecto Destacado Ejemplo:

```
✅ 16 pantallas funcionando perfectamente
✅ Navegación fluida sin bugs
✅ Context API bien implementado
✅ TypeScript completo sin any
✅ UI profesional y consistente
✅ Código limpio y documentado
✅ Features extra: búsqueda, filtros, favoritos
✅ Performance optimizado
✅ README detallado con screenshots

Puntuación: 98/100
```

---

---

## 🐛 4. Bugs Resueltos (20 puntos)

> **Sistema anti-copia:** El código de ejemplo contiene bugs intencionales que debes identificar, corregir y documentar.

### Objetivo

Fomentar la lectura crítica del código, debugging activo y comprensión profunda en lugar de copiar/pegar mecánicamente.

### Entregables

1. **Código corregido** (funcional en tu repositorio)
2. **Documento BUGS-RESUELTOS.md** con análisis detallado
3. **Screenshots** de la app funcionando
4. **Commits en GitHub** mostrando el proceso

### Distribución de Puntos

| Sub-criterio             | Puntos | Descripción                             |
| ------------------------ | ------ | --------------------------------------- |
| **Bugs identificados**   | 8      | Cantidad de bugs encontrados            |
| **Soluciones correctas** | 6      | Calidad y corrección de las soluciones  |
| **Documentación**        | 4      | Calidad del documento BUGS-RESUELTOS.md |
| **Explicaciones**        | 2      | Comprensión demostrada en explicaciones |
| **TOTAL**                | **20** |                                         |

---

### 4.1 Bugs Identificados (8 puntos)

**Cantidad de bugs en esta semana:** 7 bugs intencionales

#### Excelente (7-8 pts) ⭐⭐⭐⭐⭐

- ✅ Identificados **100% de los bugs** (7/7)
- ✅ Documentados todos con detalles
- ✅ Comprendió la naturaleza de cada bug

#### Muy Bueno (6-6.5 pts) ⭐⭐⭐⭐

- ✅ Identificados **6 bugs** (85%)
- ✅ Documentados correctamente
- ⚠️ Faltó 1 bug sutil

#### Bueno (5-5.5 pts) ⭐⭐⭐

- ✅ Identificados **5 bugs** (71%)
- ✅ Documentados adecuadamente
- ⚠️ Faltaron 2 bugs

#### Suficiente (4-4.5 pts) ⭐⭐

- ✅ Identificados **4 bugs** (57%)
- ⚠️ Documentación mínima
- ❌ Faltaron bugs importantes

#### Insuficiente (0-3.5 pts) ⭐

- ❌ Menos de 4 bugs identificados
- ❌ Documentación incompleta o ausente
- ❌ No demuestra comprensión

---

### 4.2 Soluciones Correctas (6 puntos)

Evalúa la **calidad** de las correcciones implementadas.

#### Excelente (5.5-6 pts) ⭐⭐⭐⭐⭐

- ✅ **Todas** las soluciones son correctas
- ✅ Código eficiente y optimizado
- ✅ Aplica mejores prácticas
- ✅ Va más allá de lo mínimo

**Ejemplo:**

```javascript
// No solo corrige el bug, sino que optimiza
const handlePress = useCallback(() => {
  setCount((prev) => prev + 1)
}, [])
```

#### Muy Bueno (4.5-5 pts) ⭐⭐⭐⭐

- ✅ **Mayoría** de soluciones correctas (85%+)
- ✅ Código funcional y limpio
- ⚠️ 1-2 soluciones subóptimas pero funcionales

#### Bueno (3.5-4 pts) ⭐⭐⭐

- ✅ **Varias** soluciones correctas (70%+)
- ⚠️ Algunas soluciones funcionan pero no son óptimas
- ⚠️ Código mejorable

#### Suficiente (2.5-3 pts) ⭐⭐

- ⚠️ **Pocas** soluciones correctas (60%+)
- ⚠️ Código funciona pero con problemas
- ❌ No aplica mejores prácticas

#### Insuficiente (0-2 pts) ⭐

- ❌ Soluciones incorrectas o ausentes
- ❌ Código no funcional
- ❌ Introdujo nuevos bugs

---

### 4.3 Documentación (4 puntos)

Evalúa la calidad del archivo **BUGS-RESUELTOS.md**.

#### Excelente (3.5-4 pts) ⭐⭐⭐⭐⭐

- ✅ Documento completo y bien estructurado
- ✅ Cada bug con código antes/después
- ✅ Screenshots de evidencia incluidos
- ✅ Formato profesional (Markdown correcto)
- ✅ Tabla resumen de bugs
- ✅ Checklist de entrega completado

**Estructura esperada:**

```markdown
# Bug #1: [Título descriptivo]

## Código incorrecto

## Código corregido

## Explicación

## Screenshots
```

#### Muy Bueno (3-3.5 pts) ⭐⭐⭐⭐

- ✅ Documento bien estructurado
- ✅ Bugs documentados correctamente
- ⚠️ Faltan algunos screenshots
- ⚠️ Formato mejorable

#### Bueno (2.5-3 pts) ⭐⭐⭐

- ✅ Documento básico pero completo
- ⚠️ Estructura mejorable
- ⚠️ Pocas evidencias visuales

#### Suficiente (2-2.5 pts) ⭐⭐

- ⚠️ Documento mínimo
- ⚠️ Información incompleta
- ❌ Sin screenshots

#### Insuficiente (0-1.5 pts) ⭐

- ❌ Documento ausente o muy incompleto
- ❌ Sin estructura
- ❌ No sigue el template

---

### 4.4 Explicaciones (2 puntos)

Evalúa la **comprensión** demostrada en las explicaciones.

#### Excelente (1.8-2 pts) ⭐⭐⭐⭐⭐

- ✅ Explicaciones claras y profundas
- ✅ Demuestra comprensión total del concepto
- ✅ Explica **por qué** estaba mal
- ✅ Explica **cómo** lo solucionó
- ✅ Menciona qué aprendió

**Ejemplo de buena explicación:**

```
El bug estaba en usar `setCount(count + 1)` dentro de un handler.
Esto causa problemas de stale closure porque 'count' captura el
valor al momento de crear la función.

Solución: usar la forma funcional `setCount(prev => prev + 1)`
que garantiza que siempre trabajamos con el valor más reciente.

Lección: Siempre usar updater functions cuando el nuevo estado
depende del anterior.
```

#### Muy Bueno (1.5-1.7 pts) ⭐⭐⭐⭐

- ✅ Explicaciones correctas
- ✅ Demuestra buena comprensión
- ⚠️ Falta profundidad en algunos bugs

#### Bueno (1.2-1.4 pts) ⭐⭐⭐

- ✅ Explicaciones adecuadas
- ⚠️ Superficiales en algunos casos
- ⚠️ No siempre explica el "por qué"

#### Suficiente (1-1.1 pts) ⭐⭐

- ⚠️ Explicaciones mínimas
- ⚠️ No demuestra comprensión profunda
- ❌ Solo dice "estaba mal" sin explicar

#### Insuficiente (0-0.9 pts) ⭐

- ❌ Sin explicaciones o incorrectas
- ❌ No demuestra comprensión
- ❌ Copió explicaciones

---

### 📝 Lista de Bugs de Esta Semana

**Total:** 7 bugs intencionales distribuidos en:

| #   | Tipo        | Archivo                | Severidad | Concepto                  |
| --- | ----------- | ---------------------- | --------- | ------------------------- |
| 1   | Sintaxis    | HomeScreen.js          | Alta      | Import incorrectos        |
| 2   | Lógica      | TabNavigator.tsx       | Media     | Configuración de tabs     |
| 3   | Práctica    | DrawerContent.tsx      | Baja      | Nombres en español        |
| 4   | Lógica      | ProductDetailScreen.js | Media     | Navigation params         |
| 5   | Estado      | CartContext.tsx        | Alta      | Mutación directa          |
| 6   | Performance | ProductList.tsx        | Media     | FlatList sin keyExtractor |
| 7   | TypeScript  | types.ts               | Baja      | Interfaces incompletas    |

> **📚 Nota para Instructor:** Lista detallada en `_docs/instructor/bugs-semana-02-solucionario.md`

---

### 🎯 Indicadores de Copia

**Calificación automática de 0 si:**

- ❌ Repositorio clonado sin modificaciones
- ❌ Commits genéricos: "fix", "update", "changes"
- ❌ 1 solo commit con todo el código
- ❌ Código idéntico a otro estudiante
- ❌ BUGS-RESUELTOS.md idéntico a otro estudiante
- ❌ No hay evidencia de debugging (sin commits progresivos)

**Indicadores sospechosos:**

- ⚠️ Bugs encontrados en orden alfabético (no de dificultad)
- ⚠️ Explicaciones idénticas entre estudiantes
- ⚠️ Mismo vocabulario técnico único
- ⚠️ Screenshots con nombres de usuario diferentes

**Proceso ante sospecha:**

1. Revisión manual del código
2. Entrevista individual sobre soluciones
3. Solicitar explicación en vivo del código
4. Comparación con otros trabajos similares

---

### ✅ Checklist de Auto-evaluación (Bugs)

Antes de entregar, verifica:

**Código:**

- [ ] Todos los bugs identificados y corregidos
- [ ] App ejecuta sin errores en consola
- [ ] App funciona correctamente
- [ ] Commits descriptivos en GitHub
- [ ] Código formateado (Prettier)

**Documentación:**

- [ ] BUGS-RESUELTOS.md en la raíz del repo
- [ ] Tabla resumen completa
- [ ] Cada bug con código antes/después
- [ ] Explicaciones claras de cada solución
- [ ] Screenshots de evidencia
- [ ] Checklist de entrega marcado

**Repositorio:**

- [ ] Link del repo compartido con instructor
- [ ] README.md con instrucciones
- [ ] Carpeta /screenshots con evidencias
- [ ] No hay node_modules en el repo
- [ ] .gitignore configurado

---

## 📈 Rúbrica en Formato Tabla (Vista Rápida)

| Criterio          | Insuficiente (0-59%) | Suficiente (60-69%) | Bueno (70-79%)  | Muy Bueno (80-89%) | Excelente (90-100%) |
| ----------------- | -------------------- | ------------------- | --------------- | ------------------ | ------------------- |
| **Teoría**        | No comprende         | Comprende básico    | Comprende bien  | Domina conceptos   | Experto, enseña     |
| **Prácticas**     | 0-1 completada       | 2 completadas       | 3 básicas       | 3 completas        | 3 + extras          |
| **Funcionalidad** | No funciona          | Funciona parcial    | Funciona bien   | Todo funciona      | Perfecto + extras   |
| **Arquitectura**  | Incorrecta           | Básica correcta     | Bien diseñada   | Muy bien diseñada  | Arquitectura modelo |
| **Código**        | Desorganizado        | Organizado básico   | Limpio          | Muy limpio         | Código ejemplar     |
| **TypeScript**    | Sin types o `any`    | Types básicos       | Types completos | Types avanzados    | Types perfectos     |
| **Context API**   | No funciona          | Básico funciona     | Bien impl.      | Completo           | Perfecto + extras   |
| **UI/UX**         | Muy básica           | Funcional           | Agradable       | Profesional        | Excepcional         |
| **Bugs**          | <4 bugs (0-57%)      | 4 bugs (57%)        | 5 bugs (71%)    | 6 bugs (85%)       | 7 bugs (100%)       |

---

_Rúbrica de Evaluación - Semana 2: Navegación en React Native_  
_Bootcamp React Native 2025 - EPTI_

**Versión:** 2.0 (con sistema de bugs pedagógicos)  
**Última actualización:** Octubre 2025
**Última actualización:** Octubre 2025  
**Total de puntos:** 100
