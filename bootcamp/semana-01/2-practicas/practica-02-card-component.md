# 💻 Práctica 2: Card Component Reutilizable

**⏱️ Duración:** 45 minutos  
**👥 Modalidad:** 🎓 **PRESENCIAL - Con documentación detallada**  
**📊 Dificultad:** ⭐⭐ Intermedio  
**🎯 Conceptos:** Componentes reutilizables, Props, TypeScript, Variants

---

## 🎯 Objetivo

Crear juntos un **componente Card reutilizable** con TypeScript que acepte diferentes variantes (default, featured, compact) y pueda usarse en cualquier parte de la app.

**Importante:** Esta práctica se hace **EN CLASE, PASO A PASO** con el instructor.

---

## 📚 Conceptos que Aprenderemos Juntos

- ✅ Crear componentes personalizados
- ✅ Usar props con TypeScript (interfaces)
- ✅ Implementar variantes de componentes
- ✅ Props opcionales vs requeridos
- ✅ Reutilización de componentes
- ✅ Composición de componentes

---

## 🖼️ Resultado Esperado

Crearás 3 variantes de Card:

### Variante 1: Default (básica)

```
┌────────────────────────┐
│ 📱                     │
│                        │
│ Título de la Card     │
│ Descripción breve...  │
│                        │
│ [Botón de acción]     │
└────────────────────────┘
```

### Variante 2: Featured (destacada)

```
┌────────────────────────┐
│ ⭐ DESTACADO          │
├────────────────────────┤
│ 🎨                     │
│                        │
│ Título Destacado      │
│ Contenido especial... │
│                        │
│ [Acción Principal]    │
└────────────────────────┘
```

### Variante 3: Compact (compacta)

```
┌──────────────────────┐
│ 📌 Título  [Acción] │
│ Breve descripción   │
└──────────────────────┘
```

---

## 📋 Requisitos

### Funcionales:

- [ ] Componente `Card` que acepte props configurables
- [ ] 3 variantes: `default`, `featured`, `compact`
- [ ] Props para título, descripción, icono
- [ ] Acción presionable (onPress)
- [ ] Estilos diferentes según variante

### Técnicos:

- [ ] TypeScript interface para las props
- [ ] Valores por defecto para props opcionales
- [ ] Código reutilizable y limpio
- [ ] TailwindCSS para todos los estilos
- [ ] Componente exportable para usar en otros archivos

---

## 🚀 Paso a Paso

### Paso 1: Configuración Inicial (5 min)

```bash
# Crear nuevo proyecto
npx create-expo-app@latest practica-02-card --template blank-typescript
cd practica-02-card

# Instalar dependencias
pnpm add nativewind react-native-safe-area-context
pnpm add -D tailwindcss

# Configurar Tailwind (como en práctica 1)
npx tailwindcss init
```

**Configurar `tailwind.config.js`, `babel.config.js` y `nativewind-env.d.ts` como en la práctica 1.**

### Paso 2: Crear la Estructura de Carpetas (2 min)

```
practica-02-card/
├── components/
│   └── Card.tsx          ← Nuestro componente
├── App.tsx
└── ... (archivos de config)
```

### Paso 3: Definir el Interface de Props (3 min)

**`components/Card.tsx`:**

```tsx
import { View, Text, TouchableOpacity } from 'react-native'

/**
 * Props del componente Card
 *
 * ¿Para qué? Definir qué datos puede recibir el componente
 * ¿Cómo? Interface de TypeScript con propiedades tipadas
 */
interface CardProps {
  title: string // Obligatorio
  description: string // Obligatorio
  icon?: string // Opcional
  variant?: 'default' | 'featured' | 'compact' // Opcional
  onPress?: () => void // Opcional
  actionLabel?: string // Opcional
}
```

### Paso 4: Implementar el Componente Básico (5 min)

Continuando en `Card.tsx`:

```tsx
/**
 * Card Component
 *
 * ¿Qué hace? Muestra información en formato de tarjeta
 * ¿Para qué? Reutilizar el mismo diseño en múltiples lugares
 * ¿Cómo? Recibe props y renderiza diferentes variantes
 */
export function Card({
  title,
  description,
  icon = '📄', // Valor por defecto
  variant = 'default', // Valor por defecto
  onPress,
  actionLabel = 'Ver más', // Valor por defecto
}: CardProps): JSX.Element {
  // Renderizar variante default
  if (variant === 'default') {
    return (
      <View className="bg-white rounded-xl p-5 shadow-md m-3">
        {/* Icono */}
        <Text className="text-4xl mb-3">{icon}</Text>

        {/* Título */}
        <Text className="text-xl font-bold text-gray-900 mb-2">{title}</Text>

        {/* Descripción */}
        <Text className="text-base text-gray-600 mb-4">{description}</Text>

        {/* Botón de acción */}
        {onPress && (
          <TouchableOpacity
            onPress={onPress}
            className="bg-blue-600 py-3 rounded-lg"
          >
            <Text className="text-white text-center font-bold">
              {actionLabel}
            </Text>
          </TouchableOpacity>
        )}
      </View>
    )
  }

  // Por ahora, las otras variantes retornan lo mismo
  return <View />
}
```

### Paso 5: Implementar Variante Featured (5 min)

Agrega dentro del componente, después del primer `if`:

```tsx
// Variante featured (destacada)
if (variant === 'featured') {
  return (
    <View className="bg-gradient-to-br from-purple-600 to-blue-600 rounded-xl overflow-hidden m-3 shadow-lg">
      {/* Badge "DESTACADO" */}
      <View className="bg-yellow-400 py-1 px-3">
        <Text className="text-xs font-bold text-gray-900">⭐ DESTACADO</Text>
      </View>

      <View className="p-5">
        {/* Icono más grande */}
        <Text className="text-6xl mb-3">{icon}</Text>

        {/* Título en blanco */}
        <Text className="text-2xl font-bold text-white mb-2">{title}</Text>

        {/* Descripción en blanco */}
        <Text className="text-base text-white/90 mb-4">{description}</Text>

        {/* Botón con fondo blanco */}
        {onPress && (
          <TouchableOpacity
            onPress={onPress}
            className="bg-white py-3 rounded-lg"
          >
            <Text className="text-purple-600 text-center font-bold">
              {actionLabel}
            </Text>
          </TouchableOpacity>
        )}
      </View>
    </View>
  )
}
```

### Paso 6: Implementar Variante Compact (5 min)

Agrega después de la variante featured:

```tsx
// Variante compact (compacta)
if (variant === 'compact') {
  return (
    <TouchableOpacity
      onPress={onPress}
      disabled={!onPress}
      className="bg-gray-50 rounded-lg p-4 m-2 border border-gray-200"
    >
      <View className="flex-row items-center justify-between mb-1">
        {/* Icono + Título */}
        <View className="flex-row items-center flex-1">
          <Text className="text-2xl mr-2">{icon}</Text>
          <Text className="text-lg font-bold text-gray-900 flex-1">
            {title}
          </Text>
        </View>

        {/* Arrow (indicador de acción) */}
        <Text className="text-gray-400 text-xl">›</Text>
      </View>

      {/* Descripción breve */}
      <Text className="text-sm text-gray-600 ml-9" numberOfLines={1}>
        {description}
      </Text>
    </TouchableOpacity>
  )
}
```

### Paso 7: Usar el Componente en App.tsx (5 min)

**`App.tsx`:**

```tsx
import { ScrollView, View, Text, Alert } from 'react-native'
import { SafeAreaView } from 'react-native-safe-area-context'
import { Card } from './components/Card'

export default function App(): JSX.Element {
  const handlePress = (title: string): void => {
    Alert.alert('Card presionada', `Presionaste: ${title}`)
  }

  return (
    <SafeAreaView className="flex-1 bg-gray-100">
      <ScrollView>
        {/* Header */}
        <View className="bg-white p-5 border-b border-gray-200">
          <Text className="text-3xl font-bold text-gray-900">
            Componentes Card
          </Text>
          <Text className="text-base text-gray-600 mt-1">
            Ejemplos de variantes
          </Text>
        </View>

        {/* Sección: Default Cards */}
        <View className="mt-5">
          <Text className="text-lg font-bold text-gray-900 px-5 mb-2">
            Default Cards
          </Text>

          <Card
            icon="📱"
            title="React Native"
            description="Framework para crear apps móviles nativas con React"
            actionLabel="Aprender más"
            onPress={() => handlePress('React Native')}
          />

          <Card
            icon="💻"
            title="TypeScript"
            description="JavaScript con tipos estáticos para código más seguro"
            actionLabel="Ver documentación"
            onPress={() => handlePress('TypeScript')}
          />
        </View>

        {/* Sección: Featured Cards */}
        <View className="mt-5">
          <Text className="text-lg font-bold text-gray-900 px-5 mb-2">
            Featured Cards
          </Text>

          <Card
            variant="featured"
            icon="🚀"
            title="Expo Framework"
            description="La mejor manera de construir apps con React Native"
            actionLabel="Comenzar ahora"
            onPress={() => handlePress('Expo')}
          />
        </View>

        {/* Sección: Compact Cards */}
        <View className="mt-5 mb-8">
          <Text className="text-lg font-bold text-gray-900 px-5 mb-2">
            Compact Cards
          </Text>

          <Card
            variant="compact"
            icon="⚙️"
            title="Configuración"
            description="Ajusta las preferencias de tu aplicación"
            onPress={() => handlePress('Configuración')}
          />

          <Card
            variant="compact"
            icon="👤"
            title="Perfil"
            description="Ver y editar tu información personal"
            onPress={() => handlePress('Perfil')}
          />

          <Card
            variant="compact"
            icon="📊"
            title="Estadísticas"
            description="Revisa tus métricas y progreso"
            onPress={() => handlePress('Estadísticas')}
          />
        </View>
      </ScrollView>
    </SafeAreaView>
  )
}
```

---

## ✅ Solución Completa

**`components/Card.tsx` (versión final):**

```tsx
/**
 * Card Component - Tarjeta reutilizable con variantes
 *
 * ¿Para qué?
 * Mostrar información de forma consistente en toda la app
 *
 * ¿Cómo?
 * Recibe props y renderiza diferentes variantes según configuración
 *
 * Variantes disponibles:
 * - default: Tarjeta estándar con botón de acción
 * - featured: Tarjeta destacada con gradiente
 * - compact: Tarjeta compacta para listas
 */

import { View, Text, TouchableOpacity } from 'react-native'

interface CardProps {
  title: string
  description: string
  icon?: string
  variant?: 'default' | 'featured' | 'compact'
  onPress?: () => void
  actionLabel?: string
}

export function Card({
  title,
  description,
  icon = '📄',
  variant = 'default',
  onPress,
  actionLabel = 'Ver más',
}: CardProps): JSX.Element {
  // Variante default (estándar)
  if (variant === 'default') {
    return (
      <View className="bg-white rounded-xl p-5 shadow-md m-3">
        <Text className="text-4xl mb-3">{icon}</Text>

        <Text className="text-xl font-bold text-gray-900 mb-2">{title}</Text>

        <Text className="text-base text-gray-600 mb-4">{description}</Text>

        {onPress && (
          <TouchableOpacity
            onPress={onPress}
            activeOpacity={0.7}
            className="bg-blue-600 py-3 rounded-lg"
          >
            <Text className="text-white text-center font-bold">
              {actionLabel}
            </Text>
          </TouchableOpacity>
        )}
      </View>
    )
  }

  // Variante featured (destacada)
  if (variant === 'featured') {
    return (
      <View className="bg-gradient-to-br from-purple-600 to-blue-600 rounded-xl overflow-hidden m-3 shadow-xl">
        {/* Badge destacado */}
        <View className="bg-yellow-400 py-1 px-3 self-start">
          <Text className="text-xs font-bold text-gray-900">⭐ DESTACADO</Text>
        </View>

        <View className="p-5">
          <Text className="text-6xl mb-3">{icon}</Text>

          <Text className="text-2xl font-bold text-white mb-2">{title}</Text>

          <Text className="text-base text-white/90 mb-4 leading-6">
            {description}
          </Text>

          {onPress && (
            <TouchableOpacity
              onPress={onPress}
              activeOpacity={0.8}
              className="bg-white py-3 rounded-lg shadow-lg"
            >
              <Text className="text-purple-600 text-center font-bold text-base">
                {actionLabel}
              </Text>
            </TouchableOpacity>
          )}
        </View>
      </View>
    )
  }

  // Variante compact (compacta)
  if (variant === 'compact') {
    return (
      <TouchableOpacity
        onPress={onPress}
        disabled={!onPress}
        activeOpacity={0.7}
        className="bg-gray-50 rounded-lg p-4 m-2 border border-gray-200 active:bg-gray-100"
      >
        <View className="flex-row items-center justify-between mb-1">
          <View className="flex-row items-center flex-1">
            <Text className="text-2xl mr-2">{icon}</Text>
            <Text
              className="text-lg font-bold text-gray-900 flex-1"
              numberOfLines={1}
            >
              {title}
            </Text>
          </View>

          {onPress && <Text className="text-gray-400 text-xl ml-2">›</Text>}
        </View>

        <Text className="text-sm text-gray-600 ml-9" numberOfLines={1}>
          {description}
        </Text>
      </TouchableOpacity>
    )
  }

  // Fallback (no debería llegar aquí)
  return null as any
}
```

---

## 🎨 Desafíos Adicionales

### Nivel 1: Nuevas Props

- [ ] Agregar prop `badge` opcional para mostrar un badge de color
- [ ] Agregar prop `imageUrl` para mostrar una imagen en lugar de emoji
- [ ] Agregar prop `footer` para contenido adicional al final
- [ ] Implementar prop `loading` que muestre un skeleton loader

### Nivel 2: Nuevas Variantes

- [ ] Crear variante `horizontal` con imagen a la izquierda
- [ ] Crear variante `minimal` ultra simple (solo título + descripción)
- [ ] Crear variante `error` para mostrar mensajes de error
- [ ] Crear variante `success` para confirmaciones

### Nivel 3: Funcionalidades Avanzadas

- [ ] Implementar animación al presionar (scale)
- [ ] Agregar swipe actions (deslizar para ver acciones)
- [ ] Implementar modo oscuro con prop `theme`
- [ ] Agregar prop `children` para contenido personalizado

---

## 📝 Código de Variante Horizontal (Nivel 2)

```tsx
// Agregar a CardProps:
imageUrl?: string

// Agregar variante en el componente:
if (variant === 'horizontal') {
  return (
    <View className="bg-white rounded-xl overflow-hidden m-3 shadow-md flex-row">
      {/* Imagen */}
      {imageUrl && (
        <Image
          source={{ uri: imageUrl }}
          className="w-32 h-full"
          resizeMode="cover"
        />
      )}

      {/* Contenido */}
      <View className="flex-1 p-4 justify-between">
        <View>
          <Text className="text-lg font-bold text-gray-900 mb-1">
            {title}
          </Text>
          <Text className="text-sm text-gray-600" numberOfLines={2}>
            {description}
          </Text>
        </View>

        {onPress && (
          <TouchableOpacity
            onPress={onPress}
            className="bg-blue-600 py-2 px-4 rounded-lg self-start mt-2"
          >
            <Text className="text-white font-bold text-sm">
              {actionLabel}
            </Text>
          </TouchableOpacity>
        )}
      </View>
    </View>
  )
}
```

---

## 🧪 Testing del Componente

### Casos de Prueba:

```tsx
// Test 1: Card sin acción
<Card
  title="Solo Lectura"
  description="Esta card no tiene botón"
/>

// Test 2: Card sin icono (usa default)
<Card
  title="Sin Icono"
  description="Usa el icono por defecto"
  onPress={() => {}}
/>

// Test 3: Título y descripción largos
<Card
  title="Este es un título muy muy largo que podría causar problemas de layout"
  description="Esta descripción también es extremadamente larga y necesitamos ver cómo se comporta el componente cuando recibe mucho texto..."
  onPress={() => {}}
/>

// Test 4: Todas las variantes juntas
{['default', 'featured', 'compact'].map(variant => (
  <Card
    key={variant}
    variant={variant as any}
    title={`Variante ${variant}`}
    description="Descripción de prueba"
    onPress={() => {}}
  />
))}
```

---

## 🐛 Problemas Comunes y Soluciones

### Problema 1: Gradiente no funciona en React Native

**Causa:** React Native no soporta gradientes CSS nativamente

**Solución:** Usar `expo-linear-gradient`:

```bash
pnpm add expo-linear-gradient
```

```tsx
import { LinearGradient } from 'expo-linear-gradient'

// Reemplazar View con gradiente:
;<LinearGradient
  colors={['#9333ea', '#2563eb']} // purple-600 to blue-600
  className="rounded-xl overflow-hidden m-3 shadow-xl"
>
  {/* contenido */}
</LinearGradient>
```

### Problema 2: Props opcionales causan error

**Causa:** Intentar usar prop undefined

**Solución:** Usar valores por defecto o conditional rendering:

```tsx
// Opción 1: Valor por defecto en parámetros
function Card({ icon = '📄', ... }: CardProps)

// Opción 2: Conditional rendering
{icon && <Text>{icon}</Text>}
```

### Problema 3: TouchableOpacity no responde

**Causa:** Elemento padre captura el evento

**Solución:** Agregar `activeOpacity` y verificar que onPress está definido:

```tsx
<TouchableOpacity
  onPress={onPress}
  activeOpacity={0.7}
  disabled={!onPress}
>
```

---

## ✅ Checklist de Verificación

- [ ] El componente acepta todas las props definidas
- [ ] Las 3 variantes se renderizan correctamente
- [ ] Los valores por defecto funcionan
- [ ] Las props opcionales no causan errores
- [ ] Los eventos onPress funcionan
- [ ] El código está tipado con TypeScript
- [ ] Los estilos usan TailwindCSS
- [ ] El componente es exportable y reutilizable
- [ ] Funciona en diferentes tamaños de pantalla

---

## 📚 Recursos

### Documentación

- [TypeScript Interfaces](https://www.typescriptlang.org/docs/handbook/interfaces.html)
- [React Props](https://react.dev/learn/passing-props-to-a-component)
- [TouchableOpacity](https://reactnative.dev/docs/touchableopacity)
- [Expo Linear Gradient](https://docs.expo.dev/versions/latest/sdk/linear-gradient/)

### Patrones de Diseño

- [Component Composition](https://react.dev/learn/passing-props-to-a-component#forwarding-props-with-the-jsx-spread-syntax)
- [Variants Pattern](https://www.joshwcomeau.com/react/styling-react-components/)

---

## 🎉 ¡Felicitaciones!

Has creado un componente profesional y reutilizable. Ahora sabes:

- ✅ Definir interfaces de TypeScript para props
- ✅ Usar valores por defecto en props
- ✅ Implementar variantes con estilos condicionales
- ✅ Hacer componentes verdaderamente reutilizables
- ✅ Manejar props opcionales correctamente

**Siguiente paso:** [Práctica 3 - Lista de Contactos](./practica-03-lista-contactos.md)

---

**Tiempo estimado completado:** 30 minutos ✓
