# 04. Estilos y Layouts con Flexbox

**Duración estimada:** 1.5 horas  
**Modalidad:** Teórico-práctica  
**Prerequisitos:** Componentes básicos de React Native

---

## 📋 Objetivos de Aprendizaje

Al finalizar este módulo, serás capaz de:

- ✅ Dominar el sistema de Flexbox en React Native
- ✅ Crear layouts responsive con TailwindCSS (NativeWind)
- ✅ Aplicar estilos condicionales y dinámicos
- ✅ Entender el modelo de caja en React Native
- ✅ Construir interfaces profesionales con layouts complejos
- ✅ Optimizar el diseño para diferentes tamaños de pantalla

---

## 🎨 Sistema de Estilos en React Native

### Diferencias con CSS Web

| Aspecto             | CSS Web                   | React Native                     |
| ------------------- | ------------------------- | -------------------------------- |
| **Sintaxis**        | kebab-case (`font-size`)  | camelCase (`fontSize`)           |
| **Valores**         | `"16px"`, `"1rem"`        | Números sin unidad: `16`         |
| **Display**         | `block`, `inline`, `flex` | Siempre Flexbox por defecto      |
| **Posicionamiento** | `static`, `relative`, etc | Limitado: `relative`, `absolute` |
| **Box Model**       | Incluye borders en width  | Borders no afectan dimensiones   |
| **Cascada**         | Estilos heredados         | No hay herencia (excepto Text)   |

### ¿Por qué TailwindCSS (NativeWind)?

```tsx
/**
 * Comparación: StyleSheet vs TailwindCSS
 */

// ❌ ANTES: Con StyleSheet.create()
import { View, StyleSheet } from 'react-native'

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#ffffff',
    padding: 16,
    justifyContent: 'center',
    alignItems: 'center',
  },
  card: {
    backgroundColor: '#3b82f6',
    borderRadius: 12,
    padding: 20,
    marginVertical: 10,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,
  },
})

// ✅ AHORA: Con TailwindCSS (más conciso y legible)
import { View } from 'react-native'

function Example(): JSX.Element {
  return (
    <View className="flex-1 bg-white p-4 justify-center items-center">
      <View className="bg-blue-500 rounded-xl p-5 my-2.5 shadow-lg">
        {/* Contenido */}
      </View>
    </View>
  )
}
```

**Ventajas de TailwindCSS:**

- 🚀 **Desarrollo más rápido** - menos código
- 🎯 **Diseño consistente** - sistema de espaciado/colores predefinido
- 📱 **Responsive fácil** - clases responsivas integradas
- 🔄 **Reutilizable** - sin necesidad de nombres de clases
- 📚 **Documentación** - misma sintaxis que Tailwind web

---

## 📐 Fundamentos de Flexbox

### Concepto Central

**Todo componente en React Native usa Flexbox por defecto**. No hay `display: block` ni `display: inline`.

```tsx
/**
 * Flexbox en React Native
 *
 * ¿Qué hace? Define cómo se distribuyen los elementos hijos
 * ¿Para qué? Crear layouts flexibles y responsive
 * ¿Cómo? A través de propiedades flex en el contenedor y los hijos
 */
```

### Ejes en Flexbox

```
Eje Principal (Main Axis)
────────────────────────────>
│  ┌────┐  ┌────┐  ┌────┐
│  │ 1  │  │ 2  │  │ 3  │
│  └────┘  └────┘  └────┘
↓
Eje Cruzado (Cross Axis)
```

- **Eje Principal:** Dirección en la que se colocan los hijos
- **Eje Cruzado:** Perpendicular al eje principal

---

## 🧩 Propiedades del Contenedor Flex

### 1. `flex-direction` - Dirección del Layout

Controla la dirección del eje principal.

```tsx
/**
 * Direcciones de Flexbox con Tailwind
 */
import { View, Text } from 'react-native'

export default function FlexDirectionExample(): JSX.Element {
  return (
    <View className="flex-1 bg-gray-50 p-5">
      {/* flex-col: Vertical (por defecto en React Native) */}
      <View className="mb-8">
        <Text className="text-xl font-bold mb-3">flex-col (columna)</Text>
        <View className="flex-col bg-white p-4 rounded-lg">
          <View className="bg-blue-500 p-4 mb-2 rounded">
            <Text className="text-white font-bold">Item 1</Text>
          </View>
          <View className="bg-blue-500 p-4 mb-2 rounded">
            <Text className="text-white font-bold">Item 2</Text>
          </View>
          <View className="bg-blue-500 p-4 rounded">
            <Text className="text-white font-bold">Item 3</Text>
          </View>
        </View>
      </View>

      {/* flex-row: Horizontal */}
      <View className="mb-8">
        <Text className="text-xl font-bold mb-3">flex-row (fila)</Text>
        <View className="flex-row bg-white p-4 rounded-lg">
          <View className="bg-green-500 p-4 mr-2 rounded">
            <Text className="text-white font-bold">1</Text>
          </View>
          <View className="bg-green-500 p-4 mr-2 rounded">
            <Text className="text-white font-bold">2</Text>
          </View>
          <View className="bg-green-500 p-4 rounded">
            <Text className="text-white font-bold">3</Text>
          </View>
        </View>
      </View>

      {/* flex-col-reverse: Vertical invertido */}
      <View className="mb-8">
        <Text className="text-xl font-bold mb-3">flex-col-reverse</Text>
        <View className="flex-col-reverse bg-white p-4 rounded-lg">
          <View className="bg-purple-500 p-4 mb-2 rounded">
            <Text className="text-white font-bold">Item 1 (abajo)</Text>
          </View>
          <View className="bg-purple-500 p-4 mb-2 rounded">
            <Text className="text-white font-bold">Item 2</Text>
          </View>
          <View className="bg-purple-500 p-4 mb-2 rounded">
            <Text className="text-white font-bold">Item 3 (arriba)</Text>
          </View>
        </View>
      </View>

      {/* flex-row-reverse: Horizontal invertido */}
      <View className="mb-8">
        <Text className="text-xl font-bold mb-3">flex-row-reverse</Text>
        <View className="flex-row-reverse bg-white p-4 rounded-lg">
          <View className="bg-orange-500 p-4 ml-2 rounded">
            <Text className="text-white font-bold">1</Text>
          </View>
          <View className="bg-orange-500 p-4 ml-2 rounded">
            <Text className="text-white font-bold">2</Text>
          </View>
          <View className="bg-orange-500 p-4 rounded">
            <Text className="text-white font-bold">3</Text>
          </View>
        </View>
      </View>
    </View>
  )
}
```

**Tabla de Clases Tailwind:**

| Clase Tailwind     | Equivalente CSS                   | Dirección    |
| ------------------ | --------------------------------- | ------------ |
| `flex-row`         | `flexDirection: 'row'`            | Horizontal → |
| `flex-col`         | `flexDirection: 'column'`         | Vertical ↓   |
| `flex-row-reverse` | `flexDirection: 'row-reverse'`    | Horizontal ← |
| `flex-col-reverse` | `flexDirection: 'column-reverse'` | Vertical ↑   |

---

### 2. `justify-content` - Alineación en Eje Principal

Distribuye el espacio entre elementos en el eje principal.

```tsx
/**
 * Justify Content - Alineación horizontal (en flex-row)
 */
import { View, Text } from 'react-native'

export default function JustifyContentExample(): JSX.Element {
  return (
    <View className="flex-1 bg-gray-50 p-5">
      {/* justify-start: Al inicio */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">justify-start</Text>
        <View className="flex-row justify-start bg-white p-4 rounded-lg">
          <View className="bg-blue-500 w-16 h-16 rounded mr-2" />
          <View className="bg-blue-500 w-16 h-16 rounded mr-2" />
          <View className="bg-blue-500 w-16 h-16 rounded" />
        </View>
      </View>

      {/* justify-center: Al centro */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">justify-center</Text>
        <View className="flex-row justify-center bg-white p-4 rounded-lg">
          <View className="bg-green-500 w-16 h-16 rounded mr-2" />
          <View className="bg-green-500 w-16 h-16 rounded mr-2" />
          <View className="bg-green-500 w-16 h-16 rounded" />
        </View>
      </View>

      {/* justify-end: Al final */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">justify-end</Text>
        <View className="flex-row justify-end bg-white p-4 rounded-lg">
          <View className="bg-purple-500 w-16 h-16 rounded mr-2" />
          <View className="bg-purple-500 w-16 h-16 rounded mr-2" />
          <View className="bg-purple-500 w-16 h-16 rounded" />
        </View>
      </View>

      {/* justify-between: Espacio entre elementos */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">justify-between</Text>
        <View className="flex-row justify-between bg-white p-4 rounded-lg">
          <View className="bg-red-500 w-16 h-16 rounded" />
          <View className="bg-red-500 w-16 h-16 rounded" />
          <View className="bg-red-500 w-16 h-16 rounded" />
        </View>
      </View>

      {/* justify-around: Espacio alrededor */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">justify-around</Text>
        <View className="flex-row justify-around bg-white p-4 rounded-lg">
          <View className="bg-orange-500 w-16 h-16 rounded" />
          <View className="bg-orange-500 w-16 h-16 rounded" />
          <View className="bg-orange-500 w-16 h-16 rounded" />
        </View>
      </View>

      {/* justify-evenly: Espacio uniforme */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">justify-evenly</Text>
        <View className="flex-row justify-evenly bg-white p-4 rounded-lg">
          <View className="bg-pink-500 w-16 h-16 rounded" />
          <View className="bg-pink-500 w-16 h-16 rounded" />
          <View className="bg-pink-500 w-16 h-16 rounded" />
        </View>
      </View>
    </View>
  )
}
```

**Tabla de Clases:**

| Clase Tailwind    | Efecto                                 |
| ----------------- | -------------------------------------- |
| `justify-start`   | Elementos al inicio (izquierda en row) |
| `justify-center`  | Elementos al centro                    |
| `justify-end`     | Elementos al final (derecha en row)    |
| `justify-between` | Espacio igual ENTRE elementos          |
| `justify-around`  | Espacio alrededor (mitad en bordes)    |
| `justify-evenly`  | Espacio completamente uniforme         |

---

### 3. `align-items` - Alineación en Eje Cruzado

Alinea elementos en el eje perpendicular al principal.

```tsx
/**
 * Align Items - Alineación vertical (en flex-row)
 */
import { View, Text } from 'react-native'

export default function AlignItemsExample(): JSX.Element {
  return (
    <View className="flex-1 bg-gray-50 p-5">
      {/* items-start: Al inicio del eje cruzado */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">items-start</Text>
        <View className="flex-row items-start bg-white p-4 rounded-lg h-40">
          <View className="bg-blue-500 w-16 h-12 rounded mr-2" />
          <View className="bg-blue-500 w-16 h-16 rounded mr-2" />
          <View className="bg-blue-500 w-16 h-20 rounded" />
        </View>
      </View>

      {/* items-center: Al centro del eje cruzado */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">items-center</Text>
        <View className="flex-row items-center bg-white p-4 rounded-lg h-40">
          <View className="bg-green-500 w-16 h-12 rounded mr-2" />
          <View className="bg-green-500 w-16 h-16 rounded mr-2" />
          <View className="bg-green-500 w-16 h-20 rounded" />
        </View>
      </View>

      {/* items-end: Al final del eje cruzado */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">items-end</Text>
        <View className="flex-row items-end bg-white p-4 rounded-lg h-40">
          <View className="bg-purple-500 w-16 h-12 rounded mr-2" />
          <View className="bg-purple-500 w-16 h-16 rounded mr-2" />
          <View className="bg-purple-500 w-16 h-20 rounded" />
        </View>
      </View>

      {/* items-stretch: Estirar para llenar */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">items-stretch</Text>
        <View className="flex-row items-stretch bg-white p-4 rounded-lg h-40">
          <View className="bg-red-500 w-16 rounded mr-2" />
          <View className="bg-red-500 w-16 rounded mr-2" />
          <View className="bg-red-500 w-16 rounded" />
        </View>
      </View>

      {/* items-baseline: Alinear por línea base de texto */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">items-baseline</Text>
        <View className="flex-row items-baseline bg-white p-4 rounded-lg">
          <Text className="text-2xl font-bold bg-orange-500 text-white px-3 mr-2">
            Aa
          </Text>
          <Text className="text-4xl font-bold bg-orange-500 text-white px-3 mr-2">
            Bb
          </Text>
          <Text className="text-xl font-bold bg-orange-500 text-white px-3">
            Cc
          </Text>
        </View>
      </View>
    </View>
  )
}
```

**Tabla de Clases:**

| Clase Tailwind   | Efecto                                    |
| ---------------- | ----------------------------------------- |
| `items-start`    | Alinear al inicio (arriba en row)         |
| `items-center`   | Alinear al centro verticalmente           |
| `items-end`      | Alinear al final (abajo en row)           |
| `items-stretch`  | Estirar para llenar el espacio disponible |
| `items-baseline` | Alinear según la línea base del texto     |

---

### 4. `flex` - Tamaño Flexible

Controla cómo crece o se encoge un elemento para llenar el espacio.

```tsx
/**
 * Flex - Distribución proporcional del espacio
 */
import { View, Text } from 'react-native'

export default function FlexExample(): JSX.Element {
  return (
    <View className="flex-1 bg-gray-50 p-5">
      {/* Ejemplo 1: flex-1 igual para todos */}
      <View className="mb-8">
        <Text className="text-xl font-bold mb-3">Todos con flex-1</Text>
        <View className="flex-row h-20 bg-white rounded-lg overflow-hidden">
          <View className="flex-1 bg-blue-500 items-center justify-center">
            <Text className="text-white font-bold">flex-1</Text>
          </View>
          <View className="flex-1 bg-green-500 items-center justify-center">
            <Text className="text-white font-bold">flex-1</Text>
          </View>
          <View className="flex-1 bg-purple-500 items-center justify-center">
            <Text className="text-white font-bold">flex-1</Text>
          </View>
        </View>
      </View>

      {/* Ejemplo 2: Proporciones diferentes */}
      <View className="mb-8">
        <Text className="text-xl font-bold mb-3">Proporciones: 1:2:3</Text>
        <View className="flex-row h-20 bg-white rounded-lg overflow-hidden">
          <View className="flex-1 bg-red-500 items-center justify-center">
            <Text className="text-white font-bold">flex-1</Text>
          </View>
          <View
            style={{ flex: 2 }}
            className="bg-orange-500 items-center justify-center"
          >
            <Text className="text-white font-bold">flex-2</Text>
          </View>
          <View
            style={{ flex: 3 }}
            className="bg-yellow-500 items-center justify-center"
          >
            <Text className="text-white font-bold">flex-3</Text>
          </View>
        </View>
      </View>

      {/* Ejemplo 3: Uno flex, otros fijos */}
      <View className="mb-8">
        <Text className="text-xl font-bold mb-3">Uno flexible, dos fijos</Text>
        <View className="flex-row h-20 bg-white rounded-lg overflow-hidden">
          <View className="w-20 bg-blue-500 items-center justify-center">
            <Text className="text-white font-bold text-xs">Fijo 80</Text>
          </View>
          <View className="flex-1 bg-green-500 items-center justify-center">
            <Text className="text-white font-bold">flex-1</Text>
          </View>
          <View className="w-20 bg-blue-500 items-center justify-center">
            <Text className="text-white font-bold text-xs">Fijo 80</Text>
          </View>
        </View>
      </View>

      {/* Ejemplo 4: Layout típico de app */}
      <View className="mb-8">
        <Text className="text-xl font-bold mb-3">Layout típico</Text>
        <View className="h-80 bg-white rounded-lg overflow-hidden">
          {/* Header fijo */}
          <View className="h-16 bg-blue-600 items-center justify-center">
            <Text className="text-white font-bold text-lg">Header (fijo)</Text>
          </View>

          {/* Contenido flexible */}
          <View className="flex-1 bg-gray-100 items-center justify-center">
            <Text className="text-gray-700 font-bold">Contenido (flex-1)</Text>
            <Text className="text-gray-500 text-sm mt-2">
              Ocupa todo el espacio disponible
            </Text>
          </View>

          {/* Footer fijo */}
          <View className="h-16 bg-blue-600 items-center justify-center">
            <Text className="text-white font-bold text-lg">Footer (fijo)</Text>
          </View>
        </View>
      </View>
    </View>
  )
}
```

**Cómo funciona `flex`:**

```
flex-1 + flex-1 + flex-1 = cada uno toma 1/3 del espacio
flex-1 + flex-2 + flex-3 = toman 1/6, 2/6, 3/6 respectivamente
flex-1 + ancho fijo = flex-1 toma el espacio restante
```

**⚠️ Nota:** Para `flex-2`, `flex-3`, etc., usa el estilo inline:

```tsx
<View style={{ flex: 2 }} className="bg-blue-500">
```

---

### 5. `align-self` - Alineación Individual

Sobrescribe `align-items` para un elemento específico.

```tsx
/**
 * Align Self - Alineación individual de elementos
 */
import { View, Text } from 'react-native'

export default function AlignSelfExample(): JSX.Element {
  return (
    <View className="flex-1 bg-gray-50 p-5 justify-center">
      <Text className="text-2xl font-bold mb-4">Align Self</Text>

      <View className="flex-row items-center bg-white p-4 rounded-lg h-60">
        <View className="self-start bg-blue-500 w-20 h-16 rounded items-center justify-center mr-2">
          <Text className="text-white font-bold text-xs">self-start</Text>
        </View>

        <View className="self-center bg-green-500 w-20 h-16 rounded items-center justify-center mr-2">
          <Text className="text-white font-bold text-xs">self-center</Text>
        </View>

        <View className="self-end bg-purple-500 w-20 h-16 rounded items-center justify-center mr-2">
          <Text className="text-white font-bold text-xs">self-end</Text>
        </View>

        <View className="self-stretch bg-red-500 w-20 rounded items-center justify-center">
          <Text className="text-white font-bold text-xs">self-stretch</Text>
        </View>
      </View>

      <Text className="text-sm text-gray-600 mt-3">
        Todos los elementos tienen items-center en el contenedor, pero cada uno
        sobrescribe con su propio self-*
      </Text>
    </View>
  )
}
```

**Tabla de Clases:**

| Clase Tailwind | Efecto                          |
| -------------- | ------------------------------- |
| `self-auto`    | Usar align-items del contenedor |
| `self-start`   | Alinear al inicio               |
| `self-center`  | Alinear al centro               |
| `self-end`     | Alinear al final                |
| `self-stretch` | Estirar para llenar             |

---

## 📏 Sistema de Espaciado

### Padding y Margin con Tailwind

```tsx
/**
 * Espaciado con Tailwind
 *
 * Escala: 0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 5, 6, 8, 10, 12, 16, 20, 24, 32, 40, 48, 56, 64
 * Cada unidad = 4px (p-4 = 16px)
 */
import { View, Text, ScrollView } from 'react-native'

export default function SpacingExample(): JSX.Element {
  return (
    <ScrollView className="flex-1 bg-gray-50 p-5">
      {/* Padding uniforme */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">Padding uniforme</Text>
        <View className="bg-white rounded-lg">
          <View className="p-2 bg-blue-100 mb-2 rounded">
            <Text className="text-blue-900">p-2 (8px)</Text>
          </View>
          <View className="p-4 bg-blue-200 mb-2 rounded">
            <Text className="text-blue-900">p-4 (16px)</Text>
          </View>
          <View className="p-6 bg-blue-300 mb-2 rounded">
            <Text className="text-blue-900">p-6 (24px)</Text>
          </View>
          <View className="p-8 bg-blue-400 rounded">
            <Text className="text-white font-bold">p-8 (32px)</Text>
          </View>
        </View>
      </View>

      {/* Padding direccional */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">Padding direccional</Text>
        <View className="bg-white p-4 rounded-lg">
          <View className="pt-6 bg-green-200 mb-2 rounded">
            <Text className="text-green-900">pt-6 (padding-top: 24px)</Text>
          </View>
          <View className="pb-6 bg-green-200 mb-2 rounded">
            <Text className="text-green-900">pb-6 (padding-bottom: 24px)</Text>
          </View>
          <View className="pl-6 bg-green-200 mb-2 rounded">
            <Text className="text-green-900">pl-6 (padding-left: 24px)</Text>
          </View>
          <View className="pr-6 bg-green-200 rounded">
            <Text className="text-green-900">pr-6 (padding-right: 24px)</Text>
          </View>
        </View>
      </View>

      {/* Padding por eje */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">Padding por eje</Text>
        <View className="bg-white p-4 rounded-lg">
          <View className="px-8 bg-purple-200 mb-2 rounded">
            <Text className="text-purple-900">px-8 (horizontal: 32px)</Text>
          </View>
          <View className="py-6 bg-purple-200 rounded">
            <Text className="text-purple-900">py-6 (vertical: 24px)</Text>
          </View>
        </View>
      </View>

      {/* Margin uniforme */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">Margin</Text>
        <View className="bg-white p-4 rounded-lg">
          <View className="m-2 bg-red-500 p-2 rounded">
            <Text className="text-white">m-2</Text>
          </View>
          <View className="m-4 bg-red-500 p-2 rounded">
            <Text className="text-white">m-4</Text>
          </View>
          <View className="mt-8 bg-red-500 p-2 rounded">
            <Text className="text-white">mt-8 (margin-top grande)</Text>
          </View>
        </View>
      </View>

      {/* Margin negativo */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">Margin negativo</Text>
        <View className="bg-white p-4 rounded-lg">
          <View className="bg-orange-300 p-4 rounded">
            <Text className="text-orange-900 mb-2">Contenedor padre</Text>
            <View className="-mt-6 bg-orange-600 p-3 rounded">
              <Text className="text-white font-bold">
                -mt-6 (sale del padre)
              </Text>
            </View>
          </View>
        </View>
      </View>

      {/* Gap (espacio entre hijos) */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">
          Gap (espacio entre elementos)
        </Text>
        <View className="flex-row gap-4 bg-white p-4 rounded-lg">
          <View className="flex-1 bg-indigo-500 p-4 rounded">
            <Text className="text-white font-bold">1</Text>
          </View>
          <View className="flex-1 bg-indigo-500 p-4 rounded">
            <Text className="text-white font-bold">2</Text>
          </View>
          <View className="flex-1 bg-indigo-500 p-4 rounded">
            <Text className="text-white font-bold">3</Text>
          </View>
        </View>
        <Text className="text-sm text-gray-600 mt-2">
          gap-4 aplica espacio de 16px entre todos los hijos
        </Text>
      </View>
    </ScrollView>
  )
}
```

**Tabla Completa de Espaciado:**

| Clase   | Espaciado | Píxeles |
| ------- | --------- | ------- |
| `p-0`   | 0         | 0px     |
| `p-0.5` | 0.125rem  | 2px     |
| `p-1`   | 0.25rem   | 4px     |
| `p-2`   | 0.5rem    | 8px     |
| `p-3`   | 0.75rem   | 12px    |
| `p-4`   | 1rem      | 16px    |
| `p-5`   | 1.25rem   | 20px    |
| `p-6`   | 1.5rem    | 24px    |
| `p-8`   | 2rem      | 32px    |
| `p-10`  | 2.5rem    | 40px    |
| `p-12`  | 3rem      | 48px    |
| `p-16`  | 4rem      | 64px    |

**Direcciones disponibles:**

- `p` - padding (todos los lados)
- `px` - padding horizontal (left + right)
- `py` - padding vertical (top + bottom)
- `pt`, `pr`, `pb`, `pl` - padding individual
- `m`, `mx`, `my`, `mt`, `mr`, `mb`, `ml` - margin (mismo sistema)

---

## 📦 Dimensiones y Tamaños

```tsx
/**
 * Width y Height con Tailwind
 */
import { View, Text, ScrollView } from 'react-native'

export default function DimensionsExample(): JSX.Element {
  return (
    <ScrollView className="flex-1 bg-gray-50 p-5">
      {/* Tamaños fijos */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">Tamaños fijos</Text>
        <View className="bg-white p-4 rounded-lg">
          <View className="w-20 h-20 bg-blue-500 mb-2 rounded" />
          <Text className="text-sm text-gray-600">w-20 h-20 (80x80px)</Text>
        </View>
      </View>

      {/* Ancho completo */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">Ancho completo</Text>
        <View className="w-full h-16 bg-green-500 rounded" />
        <Text className="text-sm text-gray-600 mt-1">w-full (100%)</Text>
      </View>

      {/* Ancho por porcentaje */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">Anchos porcentuales</Text>
        <View className="bg-white p-4 rounded-lg">
          <View className="w-1/4 h-12 bg-purple-500 mb-2 rounded" />
          <Text className="text-sm text-gray-600 mb-3">w-1/4 (25%)</Text>

          <View className="w-1/2 h-12 bg-purple-500 mb-2 rounded" />
          <Text className="text-sm text-gray-600 mb-3">w-1/2 (50%)</Text>

          <View className="w-3/4 h-12 bg-purple-500 mb-2 rounded" />
          <Text className="text-sm text-gray-600 mb-3">w-3/4 (75%)</Text>

          <View className="w-full h-12 bg-purple-500 rounded" />
          <Text className="text-sm text-gray-600">w-full (100%)</Text>
        </View>
      </View>

      {/* Altura mínima y máxima */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">Min/Max Height</Text>
        <View className="min-h-40 bg-red-200 rounded p-4 mb-2">
          <Text className="text-red-900">min-h-40 (mínimo 160px de alto)</Text>
        </View>
        <View className="max-h-20 bg-red-300 rounded p-4 overflow-hidden">
          <Text className="text-red-900">
            max-h-20 (máximo 80px, el resto se oculta) Este texto es más largo y
            se cortará...
          </Text>
        </View>
      </View>

      {/* Ancho/alto de pantalla completa */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-2">Tamaños de viewport</Text>
        <View className="w-screen h-32 bg-orange-500 -mx-5 px-5 items-center justify-center">
          <Text className="text-white font-bold">
            w-screen (ancho completo de pantalla)
          </Text>
        </View>
      </View>
    </ScrollView>
  )
}
```

**Tabla de Dimensiones:**

| Clase            | Valor         | Uso                           |
| ---------------- | ------------- | ----------------------------- |
| `w-auto`         | auto          | Ancho automático              |
| `w-full`         | 100%          | Ancho completo del contenedor |
| `w-screen`       | 100vw         | Ancho completo de pantalla    |
| `w-1/2`, `w-1/3` | 50%, 33.33%   | Fracciones                    |
| `w-20`           | 5rem (80px)   | Tamaño fijo                   |
| `h-full`         | 100%          | Alto completo                 |
| `min-h-screen`   | 100vh         | Mínimo alto de pantalla       |
| `max-w-md`       | 28rem (448px) | Ancho máximo                  |

---

## 🎨 Bordes y Redondeo

```tsx
/**
 * Bordes, redondeo y sombras
 */
import { View, Text, ScrollView } from 'react-native'

export default function BordersExample(): JSX.Element {
  return (
    <ScrollView className="flex-1 bg-gray-50 p-5">
      {/* Bordes básicos */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-3">Bordes</Text>
        <View className="border border-gray-300 p-4 mb-2 rounded">
          <Text>border (1px)</Text>
        </View>
        <View className="border-2 border-blue-500 p-4 mb-2 rounded">
          <Text>border-2 (2px) azul</Text>
        </View>
        <View className="border-4 border-red-500 p-4 rounded">
          <Text>border-4 (4px) rojo</Text>
        </View>
      </View>

      {/* Bordes direccionales */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-3">Bordes direccionales</Text>
        <View className="border-t-4 border-blue-500 bg-white p-4 mb-2">
          <Text>border-t-4 (solo arriba)</Text>
        </View>
        <View className="border-b-4 border-green-500 bg-white p-4 mb-2">
          <Text>border-b-4 (solo abajo)</Text>
        </View>
        <View className="border-l-4 border-purple-500 bg-white p-4 mb-2">
          <Text>border-l-4 (solo izquierda)</Text>
        </View>
        <View className="border-r-4 border-orange-500 bg-white p-4">
          <Text>border-r-4 (solo derecha)</Text>
        </View>
      </View>

      {/* Redondeo */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-3">Border Radius</Text>
        <View className="flex-row flex-wrap gap-2">
          <View className="rounded-none bg-blue-500 w-20 h-20 items-center justify-center">
            <Text className="text-white text-xs">none</Text>
          </View>
          <View className="rounded-sm bg-blue-500 w-20 h-20 items-center justify-center">
            <Text className="text-white text-xs">sm</Text>
          </View>
          <View className="rounded bg-blue-500 w-20 h-20 items-center justify-center">
            <Text className="text-white text-xs">rounded</Text>
          </View>
          <View className="rounded-md bg-blue-500 w-20 h-20 items-center justify-center">
            <Text className="text-white text-xs">md</Text>
          </View>
          <View className="rounded-lg bg-blue-500 w-20 h-20 items-center justify-center">
            <Text className="text-white text-xs">lg</Text>
          </View>
          <View className="rounded-xl bg-blue-500 w-20 h-20 items-center justify-center">
            <Text className="text-white text-xs">xl</Text>
          </View>
          <View className="rounded-2xl bg-blue-500 w-20 h-20 items-center justify-center">
            <Text className="text-white text-xs">2xl</Text>
          </View>
          <View className="rounded-full bg-blue-500 w-20 h-20 items-center justify-center">
            <Text className="text-white text-xs">full</Text>
          </View>
        </View>
      </View>

      {/* Redondeo por esquina */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-3">Redondeo individual</Text>
        <View className="rounded-tl-3xl bg-green-500 p-4 mb-2">
          <Text className="text-white">rounded-tl-3xl (top-left)</Text>
        </View>
        <View className="rounded-tr-3xl bg-green-500 p-4 mb-2">
          <Text className="text-white">rounded-tr-3xl (top-right)</Text>
        </View>
        <View className="rounded-bl-3xl bg-green-500 p-4 mb-2">
          <Text className="text-white">rounded-bl-3xl (bottom-left)</Text>
        </View>
        <View className="rounded-br-3xl bg-green-500 p-4">
          <Text className="text-white">rounded-br-3xl (bottom-right)</Text>
        </View>
      </View>

      {/* Sombras */}
      <View className="mb-6">
        <Text className="text-lg font-bold mb-3">Sombras</Text>
        <View className="shadow-sm bg-white p-4 mb-3 rounded-lg">
          <Text>shadow-sm (sombra pequeña)</Text>
        </View>
        <View className="shadow bg-white p-4 mb-3 rounded-lg">
          <Text>shadow (sombra normal)</Text>
        </View>
        <View className="shadow-md bg-white p-4 mb-3 rounded-lg">
          <Text>shadow-md (sombra mediana)</Text>
        </View>
        <View className="shadow-lg bg-white p-4 mb-3 rounded-lg">
          <Text>shadow-lg (sombra grande)</Text>
        </View>
        <View className="shadow-xl bg-white p-4 mb-3 rounded-lg">
          <Text>shadow-xl (sombra extra grande)</Text>
        </View>
        <View className="shadow-2xl bg-white p-4 rounded-lg">
          <Text>shadow-2xl (sombra máxima)</Text>
        </View>
      </View>
    </ScrollView>
  )
}
```

---

## 🎯 Posicionamiento

```tsx
/**
 * Position - Absolute y Relative
 */
import { View, Text, ScrollView } from 'react-native'

export default function PositionExample(): JSX.Element {
  return (
    <ScrollView className="flex-1 bg-gray-50 p-5">
      {/* Relative (por defecto) */}
      <View className="mb-8">
        <Text className="text-lg font-bold mb-3">Relative (por defecto)</Text>
        <View className="relative bg-white p-4 rounded-lg h-40">
          <View className="bg-blue-500 w-20 h-20 rounded" />
          <Text className="mt-2 text-gray-600">
            Posición normal en el flujo
          </Text>
        </View>
      </View>

      {/* Absolute */}
      <View className="mb-8">
        <Text className="text-lg font-bold mb-3">Absolute</Text>
        <View className="relative bg-white rounded-lg h-60">
          <Text className="p-4">Contenedor relativo</Text>

          {/* Top-left */}
          <View className="absolute top-0 left-0 bg-blue-500 w-16 h-16 rounded-br-xl items-center justify-center">
            <Text className="text-white text-xs">TL</Text>
          </View>

          {/* Top-right */}
          <View className="absolute top-0 right-0 bg-green-500 w-16 h-16 rounded-bl-xl items-center justify-center">
            <Text className="text-white text-xs">TR</Text>
          </View>

          {/* Bottom-left */}
          <View className="absolute bottom-0 left-0 bg-purple-500 w-16 h-16 rounded-tr-xl items-center justify-center">
            <Text className="text-white text-xs">BL</Text>
          </View>

          {/* Bottom-right */}
          <View className="absolute bottom-0 right-0 bg-red-500 w-16 h-16 rounded-tl-xl items-center justify-center">
            <Text className="text-white text-xs">BR</Text>
          </View>

          {/* Centrado absoluto */}
          <View className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 bg-orange-500 w-24 h-24 rounded-full items-center justify-center">
            <Text className="text-white font-bold">Centro</Text>
          </View>
        </View>
      </View>

      {/* Inset */}
      <View className="mb-8">
        <Text className="text-lg font-bold mb-3">Inset (todos los lados)</Text>
        <View className="relative bg-white rounded-lg h-60">
          <View className="absolute inset-0 bg-blue-500 m-4 rounded-lg items-center justify-center">
            <Text className="text-white font-bold">inset-0 + m-4</Text>
            <Text className="text-white text-xs mt-1">
              Ocupa todo menos márgenes
            </Text>
          </View>
        </View>
      </View>

      {/* Z-index */}
      <View className="mb-8">
        <Text className="text-lg font-bold mb-3">Z-Index (capas)</Text>
        <View className="relative bg-white p-4 rounded-lg h-40">
          <View className="absolute top-10 left-10 z-30 bg-red-500 w-24 h-24 rounded-lg items-center justify-center">
            <Text className="text-white font-bold">z-30</Text>
          </View>
          <View className="absolute top-16 left-16 z-20 bg-green-500 w-24 h-24 rounded-lg items-center justify-center">
            <Text className="text-white font-bold">z-20</Text>
          </View>
          <View className="absolute top-22 left-22 z-10 bg-blue-500 w-24 h-24 rounded-lg items-center justify-center">
            <Text className="text-white font-bold">z-10</Text>
          </View>
        </View>
      </View>
    </ScrollView>
  )
}
```

**Clases de posicionamiento:**

| Clase              | Efecto                              |
| ------------------ | ----------------------------------- |
| `relative`         | Posición relativa (por defecto)     |
| `absolute`         | Posición absoluta (sale del flujo)  |
| `top-0`, `right-0` | Posicionar desde los bordes         |
| `inset-0`          | top-0 + right-0 + bottom-0 + left-0 |
| `z-10`, `z-20`     | Orden de apilamiento (z-index)      |

---

## 🖼️ Layouts Comunes

### Layout 1: Header + Contenido + Footer

```tsx
/**
 * Layout clásico de aplicación móvil
 */
import { View, Text, ScrollView } from 'react-native'
import { SafeAreaView } from 'react-native-safe-area-context'

export default function AppLayout(): JSX.Element {
  return (
    <SafeAreaView className="flex-1 bg-white">
      {/* Header fijo */}
      <View className="bg-blue-600 px-5 py-4 border-b border-blue-700">
        <Text className="text-white text-2xl font-bold">Mi App</Text>
      </View>

      {/* Contenido scrollable */}
      <ScrollView className="flex-1 bg-gray-50">
        <View className="p-5">
          {[1, 2, 3, 4, 5].map((item) => (
            <View key={item} className="bg-white p-4 mb-3 rounded-lg shadow">
              <Text className="text-lg font-bold text-gray-900">
                Item {item}
              </Text>
              <Text className="text-gray-600 mt-1">
                Descripción del item {item}
              </Text>
            </View>
          ))}
        </View>
      </ScrollView>

      {/* Footer/TabBar fijo */}
      <View className="flex-row bg-white border-t border-gray-200">
        <View className="flex-1 items-center py-3">
          <Text className="text-2xl">🏠</Text>
          <Text className="text-xs text-blue-600 font-semibold mt-1">
            Inicio
          </Text>
        </View>
        <View className="flex-1 items-center py-3">
          <Text className="text-2xl">🔍</Text>
          <Text className="text-xs text-gray-500 mt-1">Buscar</Text>
        </View>
        <View className="flex-1 items-center py-3">
          <Text className="text-2xl">👤</Text>
          <Text className="text-xs text-gray-500 mt-1">Perfil</Text>
        </View>
      </View>
    </SafeAreaView>
  )
}
```

### Layout 2: Lista de Cards con Imagen

```tsx
/**
 * Card horizontal con imagen
 */
import { View, Text, Image, ScrollView, TouchableOpacity } from 'react-native'

interface Product {
  id: number
  name: string
  price: number
  image: string
}

export default function ProductList(): JSX.Element {
  const products: Product[] = [
    {
      id: 1,
      name: 'Producto 1',
      price: 29.99,
      image: 'https://picsum.photos/200/200?random=1',
    },
    {
      id: 2,
      name: 'Producto 2',
      price: 39.99,
      image: 'https://picsum.photos/200/200?random=2',
    },
    {
      id: 3,
      name: 'Producto 3',
      price: 49.99,
      image: 'https://picsum.photos/200/200?random=3',
    },
  ]

  return (
    <ScrollView className="flex-1 bg-gray-50">
      <View className="p-4">
        {products.map((product) => (
          <TouchableOpacity
            key={product.id}
            className="flex-row bg-white rounded-xl overflow-hidden mb-4 shadow-md"
            activeOpacity={0.7}
          >
            {/* Imagen */}
            <Image
              source={{ uri: product.image }}
              className="w-28 h-28"
              resizeMode="cover"
            />

            {/* Contenido */}
            <View className="flex-1 p-4 justify-between">
              <View>
                <Text className="text-lg font-bold text-gray-900">
                  {product.name}
                </Text>
                <Text className="text-sm text-gray-500 mt-1">
                  Descripción del producto
                </Text>
              </View>

              <View className="flex-row items-center justify-between">
                <Text className="text-xl font-bold text-blue-600">
                  ${product.price}
                </Text>
                <View className="bg-blue-600 px-4 py-2 rounded-lg">
                  <Text className="text-white font-bold text-sm">Comprar</Text>
                </View>
              </View>
            </View>
          </TouchableOpacity>
        ))}
      </View>
    </ScrollView>
  )
}
```

### Layout 3: Grid de Imágenes

```tsx
/**
 * Grid responsive de 2 columnas
 */
import { View, Image, ScrollView, Dimensions } from 'react-native'

export default function ImageGrid(): JSX.Element {
  const images = Array.from(
    { length: 12 },
    (_, i) => `https://picsum.photos/300/300?random=${i + 1}`
  )

  return (
    <ScrollView className="flex-1 bg-gray-900">
      <View className="flex-row flex-wrap p-1">
        {images.map((uri, index) => (
          <View key={index} className="w-1/2 p-1">
            <Image
              source={{ uri }}
              className="w-full aspect-square rounded-lg"
              resizeMode="cover"
            />
          </View>
        ))}
      </View>
    </ScrollView>
  )
}
```

### Layout 4: Formulario Centrado

```tsx
/**
 * Formulario centrado verticalmente
 */
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  ScrollView,
} from 'react-native'
import { useState } from 'react'

export default function LoginScreen(): JSX.Element {
  const [email, setEmail] = useState<string>('')
  const [password, setPassword] = useState<string>('')

  return (
    <View className="flex-1 bg-gradient-to-br from-blue-500 to-purple-600">
      <ScrollView
        contentContainerClassName="flex-1 justify-center px-6"
        keyboardShouldPersistTaps="handled"
      >
        {/* Logo */}
        <View className="items-center mb-10">
          <View className="w-24 h-24 bg-white rounded-full items-center justify-center mb-4">
            <Text className="text-5xl">🚀</Text>
          </View>
          <Text className="text-white text-3xl font-bold">Mi App</Text>
          <Text className="text-blue-100 text-base mt-2">
            Inicia sesión para continuar
          </Text>
        </View>

        {/* Formulario */}
        <View className="bg-white rounded-2xl p-6 shadow-2xl">
          <Text className="text-2xl font-bold text-gray-900 mb-6">
            Iniciar Sesión
          </Text>

          <View className="mb-4">
            <Text className="text-sm font-semibold text-gray-700 mb-2">
              Email
            </Text>
            <TextInput
              value={email}
              onChangeText={setEmail}
              placeholder="tu@email.com"
              keyboardType="email-address"
              autoCapitalize="none"
              className="border border-gray-300 rounded-lg px-4 py-3 text-base"
            />
          </View>

          <View className="mb-6">
            <Text className="text-sm font-semibold text-gray-700 mb-2">
              Contraseña
            </Text>
            <TextInput
              value={password}
              onChangeText={setPassword}
              placeholder="••••••••"
              secureTextEntry
              className="border border-gray-300 rounded-lg px-4 py-3 text-base"
            />
          </View>

          <TouchableOpacity className="bg-blue-600 py-4 rounded-lg mb-3">
            <Text className="text-white text-center text-lg font-bold">
              Entrar
            </Text>
          </TouchableOpacity>

          <TouchableOpacity>
            <Text className="text-blue-600 text-center text-sm">
              ¿Olvidaste tu contraseña?
            </Text>
          </TouchableOpacity>
        </View>

        {/* Registro */}
        <View className="flex-row justify-center mt-6">
          <Text className="text-white">¿No tienes cuenta? </Text>
          <TouchableOpacity>
            <Text className="text-white font-bold underline">Regístrate</Text>
          </TouchableOpacity>
        </View>
      </ScrollView>
    </View>
  )
}
```

---

## 🧪 Ejercicios Prácticos

### Ejercicio 1: Dashboard Layout (20 minutos)

Crea una pantalla de dashboard que incluya:

- Header con título y botón de menú
- Grid de 2x2 con estadísticas (número grande + label)
- Lista de items recientes
- Bottom navigation bar

**Requisitos:**

- Usar Flexbox para el layout
- Aplicar Tailwind para todos los estilos
- Responsive y visualmente atractivo

### Ejercicio 2: Profile Screen (25 minutos)

Crea una pantalla de perfil con:

- Cover image (banner superior)
- Avatar circular superpuesto al banner (position absolute)
- Información del usuario (nombre, bio, ubicación)
- Grid de estadísticas (posts, followers, following)
- Tabs de navegación (Posts, Media, Likes)

**Pistas:**

- Usa `position: absolute` para el avatar
- `z-index` para superposiciones
- `flex-row` para estadísticas

### Ejercicio 3: Card Complex Layout (30 minutos)

Crea una card de restaurante que incluya:

- Imagen principal con badge de "Nuevo" (absolute top-right)
- Rating con estrellas (flex-row)
- Nombre del restaurante y categoría
- Información adicional (distancia, tiempo, precio) en iconos
- Botón de reserva

**Desafío:** Hacer que la imagen tenga un gradient overlay oscuro en la parte inferior para mejorar la legibilidad.

---

## ✅ Checklist de Verificación

Antes de continuar, asegúrate de:

- [ ] Entender la diferencia entre CSS web y React Native
- [ ] Dominar las 4 direcciones de Flexbox
- [ ] Aplicar justify-content y align-items correctamente
- [ ] Usar flex para distribución proporcional
- [ ] Aplicar sistema de espaciado con padding y margin
- [ ] Crear layouts responsive con anchos porcentuales
- [ ] Usar position absolute para superposiciones
- [ ] Combinar múltiples propiedades para layouts complejos
- [ ] Conocer las clases de Tailwind más comunes

---

## 📚 Recursos Adicionales

### Documentación Oficial

- [React Native Layout Props](https://reactnative.dev/docs/layout-props)
- [Flexbox en React Native](https://reactnative.dev/docs/flexbox)
- [TailwindCSS Documentation](https://tailwindcss.com/docs)
- [NativeWind Styling Guide](https://www.nativewind.dev/quick-starts/react-native-cli)

### Guías Interactivas

- [Flexbox Froggy](https://flexboxfroggy.com/) - Juego para aprender Flexbox
- [Flexbox Defense](http://www.flexboxdefense.com/) - Otro juego interactivo
- [A Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)

### Herramientas

- [Tailwind CSS Cheat Sheet](https://nerdcave.com/tailwind-cheat-sheet)
- [Can I use... React Native](https://caniuse.com/)

---

## 🔗 Navegación

- ⬅️ [Anterior: Componentes Básicos](./03-componentes-basicos.md)
- ➡️ [Siguiente: Estado y Eventos](./05-estado-eventos.md)
- 🏠 [Volver al índice de teoría](./README.md)

---

**Tiempo total completado:** ~4.5 horas (de 6 horas de la sesión presencial)  
**Próximo tema:** Estado con Hooks y manejo de eventos
