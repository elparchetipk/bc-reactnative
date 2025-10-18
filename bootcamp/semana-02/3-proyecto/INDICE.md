# 📚 Índice del Proyecto Integrador

> **Guía completa del proyecto E-Commerce App - Semana 2**

---

## 📖 Documentos del Proyecto

### 📘 Principal

**[README.md](./README.md)** - Documento principal del proyecto

- Descripción general
- Requisitos funcionales
- Arquitectura de navegación
- Criterios de evaluación
- Cómo empezar
- Entrega del proyecto

---

### 📗 Fases de Desarrollo

#### **[FASE-01-SETUP.md](./FASE-01-SETUP.md)** (30 min presencial)

- ✅ Crear estructura de carpetas
- ✅ Definir tipos TypeScript globales
- ✅ Crear mock data (productos, categorías, reviews, usuario)
- ✅ Definir tipos de navegación

#### **[FASE-02-CONTEXT.md](./FASE-02-CONTEXT.md)** (1h autónomo)

- ✅ Implementar CartContext
- ✅ Funciones de agregar/eliminar/actualizar carrito
- ✅ Calcular totales automáticamente
- ✅ Integrar Provider en App
- ✅ Crear utilidades de formateo

#### **[FASES-RESUMEN.md](./FASES-RESUMEN.md)** (Resumen de Fases 3-7)

- 📝 Fase 3: Componentes Reutilizables (1h)
  - ProductCard, CartItem, ReviewCard, CustomDrawer
- 📝 Fase 4: Home Stack (1.5h)
  - HomeScreen, ProductDetailScreen, ReviewsScreen
- 📝 Fase 5: Cart Stack (1.5h)
  - CartScreen, ShippingScreen, PaymentScreen, ConfirmationScreen
- 📝 Fase 6: Profile Stack (1h)
  - ProfileScreen, EditProfileScreen, OrdersScreen, SettingsScreen
- 📝 Fase 7: Navegación Completa (1h)
  - Todos los navigators (Drawer, Tab, Stacks)

---

### 📐 Arquitectura

#### **[ESTRUCTURA-NAVEGACION.md](./ESTRUCTURA-NAVEGACION.md)**

- Diagrama completo de navegación
- Detalle por Tab (Home, Cart, Profile)
- Drawer Navigator con categorías
- Flujos de usuario completos
- Interacciones visuales
- Resumen de 16 pantallas
- Conexiones de state global

---

## 🗺️ Roadmap del Proyecto

```
Semana 2 - Días 1-7

📅 Lunes (Presencial - 6h):
├─ Teoría de navegación (2h)
├─ Prácticas 1-3 (3h)
└─ Introducción al proyecto (1h)
   └─ Fase 1: Setup y Datos (30 min en clase)

📅 Martes-Miércoles (Autónomo - 3h):
├─ Fase 2: Context y State (1h)
└─ Fase 3: Componentes (1h)
    └─ ProductCard, CartItem, ReviewCard, CustomDrawer

📅 Jueves (Autónomo - 2h):
└─ Fase 4: Home Stack (1.5h)
    ├─ HomeScreen
    ├─ ProductDetailScreen
    └─ ReviewsScreen

📅 Viernes (Autónomo - 2h):
├─ Fase 5: Cart Stack (1.5h)
│  ├─ CartScreen
│  ├─ ShippingScreen
│  ├─ PaymentScreen
│  └─ ConfirmationScreen

📅 Sábado (Autónomo - 2h):
├─ Fase 6: Profile Stack (1h)
│  ├─ ProfileScreen
│  ├─ EditProfileScreen
│  ├─ OrdersScreen
│  └─ SettingsScreen
└─ Fase 7: Navegación (1h)
    ├─ DrawerNavigator
    ├─ TabNavigator
    ├─ Stacks anidados
    └─ CategoryScreen

📅 Domingo (Autónomo - 1h):
├─ Testing completo
├─ Pulir UI/UX
├─ Grabar video demo
└─ Preparar entrega

📅 Viernes próximo (23:59h):
└─ 📤 ENTREGA DEL PROYECTO
```

---

## 🎯 Objetivos de Aprendizaje

Al completar este proyecto, dominarás:

### Navegación:

- [x] Stack Navigator (flujos lineales)
- [x] Tab Navigator (navegación principal)
- [x] Drawer Navigator (menú lateral)
- [x] Navegación anidada (3 niveles)
- [x] Pasar parámetros entre pantallas
- [x] TypeScript en navegación

### State Management:

- [x] Context API
- [x] Custom hooks (useCart)
- [x] Estado global compartido
- [x] Actualización reactiva de UI

### UI/UX:

- [x] Componentes reutilizables
- [x] Diseño consistente
- [x] Loading states
- [x] Empty states
- [x] Feedback visual

### Buenas Prácticas:

- [x] Código limpio y organizado
- [x] TypeScript strict
- [x] Comentarios explicativos
- [x] Separación de responsabilidades
- [x] Nomenclatura en inglés

---

## 📊 Estructura del Proyecto

```
ecommerce-app/
├── App.tsx                                 # Entry point
├── package.json
├── babel.config.js
├── tsconfig.json
│
└── src/
    ├── navigation/                         # Navegación
    │   ├── types.ts                       # Tipos de navegación
    │   ├── DrawerNavigator.tsx            # Drawer principal
    │   ├── TabNavigator.tsx               # Bottom tabs
    │   └── stacks/
    │       ├── HomeStack.tsx
    │       ├── CartStack.tsx
    │       └── ProfileStack.tsx
    │
    ├── screens/                            # Pantallas (16 total)
    │   ├── home/
    │   │   ├── HomeScreen.tsx
    │   │   ├── ProductDetailScreen.tsx
    │   │   └── ReviewsScreen.tsx
    │   ├── cart/
    │   │   ├── CartScreen.tsx
    │   │   ├── ShippingScreen.tsx
    │   │   ├── PaymentScreen.tsx
    │   │   └── ConfirmationScreen.tsx
    │   ├── profile/
    │   │   ├── ProfileScreen.tsx
    │   │   ├── EditProfileScreen.tsx
    │   │   ├── OrdersScreen.tsx
    │   │   └── SettingsScreen.tsx
    │   └── category/
    │       └── CategoryScreen.tsx
    │
    ├── components/                         # Componentes UI
    │   ├── ProductCard.tsx
    │   ├── CartItem.tsx
    │   ├── ReviewCard.tsx
    │   └── CustomDrawer.tsx
    │
    ├── context/                            # State management
    │   └── CartContext.tsx
    │
    ├── data/                               # Mock data
    │   ├── products.ts                    # 21 productos
    │   ├── categories.ts                  # 5 categorías
    │   ├── reviews.ts                     # Reviews
    │   └── userData.ts                    # Usuario y pagos
    │
    ├── types/                              # TypeScript types
    │   └── index.ts
    │
    └── utils/                              # Utilidades
        └── formatters.ts
```

---

## 📈 Progreso del Proyecto

### Checklist General:

#### Setup y Configuración (Fase 1):

- [ ] Proyecto Expo creado
- [ ] Dependencias instaladas
- [ ] Babel configurado
- [ ] Estructura de carpetas completa
- [ ] Tipos TypeScript definidos
- [ ] Mock data creado (21 productos, 5 categorías)

#### State Management (Fase 2):

- [ ] CartContext implementado
- [ ] Funciones del carrito funcionando
- [ ] CartProvider integrado en App
- [ ] Utilidades de formateo creadas

#### Componentes (Fase 3):

- [ ] ProductCard
- [ ] CartItem
- [ ] ReviewCard
- [ ] CustomDrawer

#### Pantallas - Home (Fase 4):

- [ ] HomeScreen
- [ ] ProductDetailScreen
- [ ] ReviewsScreen

#### Pantallas - Cart (Fase 5):

- [ ] CartScreen
- [ ] ShippingScreen
- [ ] PaymentScreen
- [ ] ConfirmationScreen

#### Pantallas - Profile (Fase 6):

- [ ] ProfileScreen
- [ ] EditProfileScreen
- [ ] OrdersScreen
- [ ] SettingsScreen

#### Navegación (Fase 7):

- [ ] HomeStack
- [ ] CartStack
- [ ] ProfileStack
- [ ] TabNavigator con badge
- [ ] DrawerNavigator
- [ ] CategoryScreen
- [ ] Integración completa

#### Funcionalidad:

- [ ] Ver productos
- [ ] Ver detalles de producto
- [ ] Agregar al carrito
- [ ] Eliminar del carrito
- [ ] Actualizar cantidades
- [ ] Badge del carrito actualiza
- [ ] Flujo de checkout completo
- [ ] Navegación por categorías
- [ ] Ver reviews

#### Calidad:

- [ ] Sin errores TypeScript
- [ ] Sin warnings críticos
- [ ] Código en inglés
- [ ] Comentarios explicativos
- [ ] UI consistente y profesional

---

## 🎓 Evaluación

### Distribución de Puntos (100 pts):

| Criterio                  | Puntos  | Documento                                        |
| ------------------------- | ------- | ------------------------------------------------ |
| **Navegación**            | 25      | [README.md](./README.md#criterios-de-evaluación) |
| Drawer implementado       | 6       |                                                  |
| Tab con badge dinámico    | 6       |                                                  |
| Stacks anidados           | 7       |                                                  |
| Navegación fluida         | 6       |                                                  |
| **Funcionalidad**         | 30      |                                                  |
| Agregar al carrito        | 8       |                                                  |
| Eliminar del carrito      | 5       |                                                  |
| Actualizar cantidades     | 5       |                                                  |
| Cálculo de totales        | 6       |                                                  |
| Flujo checkout            | 6       |                                                  |
| **Context API**           | 15      |                                                  |
| Context implementado      | 7       |                                                  |
| Provider configurado      | 4       |                                                  |
| Estado compartido         | 4       |                                                  |
| **UI/UX**                 | 15      |                                                  |
| Diseño profesional        | 5       |                                                  |
| Componentes reutilizables | 4       |                                                  |
| Responsive                | 3       |                                                  |
| Feedback visual           | 3       |                                                  |
| **Código**                | 15      |                                                  |
| TypeScript correcto       | 5       |                                                  |
| Código limpio             | 4       |                                                  |
| Nomenclatura inglés       | 3       |                                                  |
| Comentarios               | 3       |                                                  |
| **TOTAL**                 | **100** |                                                  |

### Extras (+10 pts máximo):

- Búsqueda de productos: +3
- Filtros funcionales: +3
- Lista de favoritos: +2
- Animaciones: +2

---

## 🚀 Cómo Empezar

### 1. Leer Documentación:

```
1. README.md (visión general)
2. FASE-01-SETUP.md (setup inicial)
3. ESTRUCTURA-NAVEGACION.md (arquitectura)
4. Resto de fases en orden
```

### 2. Setup del Proyecto:

```bash
# Crear proyecto (usa pnpx, NO npx - 3x más rápido)
pnpx create-expo-app ecommerce-app
cd ecommerce-app

# Instalar dependencias
pnpm add @react-navigation/native
pnpm add @react-navigation/native-stack
pnpm add @react-navigation/bottom-tabs
pnpm add @react-navigation/drawer
pnpm add react-native-screens react-native-safe-area-context
pnpm add react-native-gesture-handler react-native-reanimated
pnpm add @expo/vector-icons nativewind
pnpm add --save-dev tailwindcss
```

### 3. Seguir Fases:

```
Fase 1 → Fase 2 → Fase 3 → Fase 4 → Fase 5 → Fase 6 → Fase 7
```

### 4. Probar Constantemente:

```bash
pnpm start
# Presiona 'a' para Android o 'i' para iOS
```

### 5. Commit Regular:

```bash
git add .
git commit -m "feat(phase-1): setup and mock data"
git push
```

---

## 📞 Soporte

### Durante el Proyecto:

**Documentación:**

- Revisa los archivos de fase correspondiente
- Consulta ESTRUCTURA-NAVEGACION.md para entender flujos

**Problemas Comunes:**

- Ver sección "Troubleshooting" en cada fase
- Revisar checklist de verificación

**Ayuda:**

- Foro del bootcamp
- Office hours virtuales
- Compañeros de estudio

---

## 📚 Recursos Adicionales

### Documentación Oficial:

- [React Navigation](https://reactnavigation.org)
- [React Native](https://reactnative.dev)
- [TypeScript](https://www.typescriptlang.org)
- [Expo](https://docs.expo.dev)

### Tutoriales:

- React Navigation 6 Guide
- Context API Deep Dive
- TypeScript for React Native

### Herramientas:

- [React Navigation Playground](https://reactnavigation.org/playground)
- [TypeScript Playground](https://www.typescriptlang.org/play)

---

## 📅 Entrega

### Fecha Límite:

**Viernes de Semana 2 - 23:59h**

### Qué Entregar:

1. **Repositorio GitHub:**

   - Código completo
   - README.md con instrucciones
   - Commits organizados por fase

2. **Video Demo (3-5 min):**

   - Navegación completa
   - Agregar/eliminar del carrito
   - Flujo de checkout
   - Explicación técnica breve

3. **Documento de Reflexión (Opcional +2 pts):**
   - Aprendizajes
   - Desafíos
   - Soluciones
   - Mejoras futuras

### Formato de Entrega:

```
Enviar por formulario del bootcamp:
├─ Link GitHub repo
├─ Link video demo (YouTube/Loom)
└─ PDF reflexión (opcional)
```

---

## 🎉 ¡Buena Suerte!

> _"El mejor proyecto es el que completas. No busques perfección, busca funcionalidad primero."_

**Tips Finales:**

- ✅ Empieza simple, agrega complejidad gradualmente
- ✅ Prueba cada fase antes de continuar
- ✅ Commit frecuentemente
- ✅ No te quedes atascado más de 30 min, pide ayuda
- ✅ Disfruta el proceso de aprendizaje

---

_Índice del Proyecto Integrador - E-Commerce App_  
_Semana 2: Navegación en React Native_  
_Bootcamp React Native 2025 - EPTI_
