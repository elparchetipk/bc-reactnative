# 03. Componentes Básicos de React Native

**Duración estimada:** 1.5 horas  
**Modalidad:** Teórico-práctica  
**Prerequisitos:** Haber completado la configuración del entorno

---

## 📋 Objetivos de Aprendizaje

Al finalizar este módulo, serás capaz de:

- ✅ Identificar y utilizar los componentes básicos de React Native
- ✅ Diferenciar entre componentes web y React Native
- ✅ Aplicar estilos con TailwindCSS (NativeWind) a cada componente
- ✅ Comprender las props fundamentales de cada componente
- ✅ Construir interfaces básicas combinando componentes
- ✅ Implementar componentes con TypeScript

---

## 🎯 ¿Qué son los Componentes Básicos?

### Definición

Los **componentes básicos** (o "core components") son los bloques fundamentales de construcción en React Native. Son equivalentes a los elementos HTML pero optimizados para móviles.

### Comparación con Web

| HTML Web           | React Native         | Propósito                         |
| ------------------ | -------------------- | --------------------------------- |
| `<div>`            | `<View>`             | Contenedor genérico               |
| `<p>`, `<span>`    | `<Text>`             | Mostrar texto                     |
| `<img>`            | `<Image>`            | Mostrar imágenes                  |
| `<button>`         | `<Button>`           | Botones básicos                   |
| `<input>`          | `<TextInput>`        | Entrada de texto                  |
| `<div>` scrollable | `<ScrollView>`       | Contenedor con scroll             |
| `<a>`              | `<TouchableOpacity>` | Elementos presionables (táctiles) |

**Diferencia clave:** En React Native NO usas HTML. Solo componentes de React Native.

---

## 📦 Componentes Esenciales

### 1. `<View>` - Contenedor Universal

#### ¿Qué hace?

`View` es el contenedor básico que soporta layout con Flexbox, estilos, gestos táctiles y controles de accesibilidad.

#### ¿Para qué sirve?

- Crear layouts y estructuras
- Agrupar otros componentes
- Aplicar estilos de fondo, bordes, espaciado
- Definir áreas interactivas

#### ¿Cómo funciona?

```tsx
/**
 * Ejemplo básico de View con TailwindCSS
 */
import { View, Text } from 'react-native'

export default function App(): JSX.Element {
  return (
    <View className="flex-1 bg-white">
      {/* Contenedor principal - flex-1 toma todo el espacio disponible */}

      <View className="bg-blue-500 p-5 m-3 rounded-lg">
        {/* Caja azul con padding, margin y bordes redondeados */}
        <Text className="text-white text-xl font-bold">
          Contenedor estilizado
        </Text>
      </View>

      <View className="flex-row justify-between items-center px-4">
        {/* Layout horizontal con espacio entre elementos */}
        <Text className="text-gray-800">Izquierda</Text>
        <Text className="text-gray-800">Centro</Text>
        <Text className="text-gray-800">Derecha</Text>
      </View>
    </View>
  )
}
```

#### Props Comunes con TailwindCSS

| Prop        | Clases Tailwind                         | Descripción           |
| ----------- | --------------------------------------- | --------------------- |
| Layout      | `flex-1`, `flex-row`, `flex-col`        | Dirección del Flexbox |
| Alineación  | `items-center`, `justify-between`       | Alinear hijos         |
| Espaciado   | `p-4`, `m-2`, `px-5`, `my-3`            | Padding y margin      |
| Fondo       | `bg-blue-500`, `bg-gray-100`            | Color de fondo        |
| Bordes      | `border`, `border-2`, `border-red`      | Bordes y colores      |
| Redondeo    | `rounded`, `rounded-lg`, `rounded-full` | Bordes redondeados    |
| Dimensiones | `w-full`, `h-20`, `w-1/2`               | Ancho y alto          |

**Ejemplo: Card Component**

```tsx
/**
 * Card - Componente reutilizable de tarjeta
 *
 * ¿Para qué? Crear cards visuales consistentes
 * ¿Cómo? Usa View con estilos predefinidos de Tailwind
 */
import { View, Text } from 'react-native'

interface CardProps {
  title: string
  description: string
}

function Card({ title, description }: CardProps): JSX.Element {
  return (
    <View className="bg-white rounded-xl shadow-lg p-5 m-3 border border-gray-200">
      <Text className="text-2xl font-bold text-gray-900 mb-2">{title}</Text>
      <Text className="text-base text-gray-600">{description}</Text>
    </View>
  )
}
```

---

### 2. `<Text>` - Mostrar Texto

#### ¿Qué hace?

`Text` es el componente para mostrar cualquier tipo de texto en pantalla.

#### ¿Para qué sirve?

- Mostrar títulos, párrafos, labels
- Aplicar estilos tipográficos
- Manejar texto seleccionable
- Formatear texto con múltiples estilos

#### ¿Cómo funciona?

```tsx
/**
 * Ejemplos de Text con diferentes estilos de Tailwind
 */
import { View, Text } from 'react-native'

export default function TextExamples(): JSX.Element {
  return (
    <View className="flex-1 bg-gray-50 p-5">
      {/* Título principal */}
      <Text className="text-4xl font-bold text-gray-900 mb-4">
        Título Principal
      </Text>

      {/* Subtítulo */}
      <Text className="text-2xl font-semibold text-gray-700 mb-3">
        Subtítulo Secundario
      </Text>

      {/* Párrafo normal */}
      <Text className="text-base text-gray-600 mb-2">
        Este es un párrafo de texto normal con tamaño estándar. Puede contener
        varias líneas de texto.
      </Text>

      {/* Texto con color y peso */}
      <Text className="text-lg font-medium text-blue-600 mb-2">
        Texto destacado en azul
      </Text>

      {/* Texto centrado */}
      <Text className="text-center text-sm text-gray-500 mb-2">
        Texto centrado con tamaño pequeño
      </Text>

      {/* Texto con múltiples estilos anidados */}
      <Text className="text-base text-gray-800">
        Este texto tiene una palabra{' '}
        <Text className="font-bold text-red-500">destacada</Text> en rojo.
      </Text>

      {/* Texto con decoración */}
      <Text className="text-base text-gray-600 underline mb-2">
        Texto subrayado
      </Text>

      {/* Texto con mayúsculas */}
      <Text className="text-base text-gray-700 uppercase mb-2">
        Texto en mayúsculas
      </Text>

      {/* Texto seleccionable (prop nativa, no de Tailwind) */}
      <Text
        selectable
        className="text-base text-gray-800 bg-yellow-100 p-2 rounded"
      >
        Este texto es seleccionable (mantén presionado)
      </Text>
    </View>
  )
}
```

#### Props Importantes

| Prop            | Tipo       | Descripción                                        |
| --------------- | ---------- | -------------------------------------------------- |
| `numberOfLines` | `number`   | Limita el número de líneas                         |
| `selectable`    | `boolean`  | Permite seleccionar el texto                       |
| `ellipsizeMode` | `string`   | Modo de truncado: 'head', 'middle', 'tail', 'clip' |
| `onPress`       | `function` | Callback cuando se presiona el texto               |

**Ejemplo con Props:**

```tsx
import { Text } from 'react-native'

function LimitedText(): JSX.Element {
  return (
    <Text
      numberOfLines={2}
      ellipsizeMode="tail"
      className="text-base text-gray-700"
    >
      Este es un texto muy largo que será truncado después de dos líneas. El
      resto del contenido no se mostrará y aparecerán puntos suspensivos al
      final para indicar que hay más contenido.
    </Text>
  )
}
```

#### Clases Tailwind para Tipografía

| Utilidad Tailwind          | Efecto                 |
| -------------------------- | ---------------------- |
| `text-xs` - `text-9xl`     | Tamaños de texto       |
| `font-thin` - `font-black` | Peso del texto         |
| `text-gray-500`            | Color de texto         |
| `text-center`              | Alineación             |
| `underline`                | Subrayado              |
| `italic`                   | Cursiva                |
| `uppercase/lowercase`      | Transformación         |
| `tracking-wide`            | Espaciado entre letras |
| `leading-loose`            | Altura de línea        |

---

### 3. `<Image>` - Mostrar Imágenes

#### ¿Qué hace?

`Image` muestra imágenes desde diferentes fuentes: locales, remotas (URL), o base64.

#### ¿Para qué sirve?

- Mostrar logos, iconos, fotos
- Cargar imágenes desde internet
- Mostrar avatares de usuarios
- Crear fondos visuales

#### ¿Cómo funciona?

```tsx
/**
 * Ejemplos de Image - Imágenes locales y remotas
 */
import { View, Image, Text } from 'react-native'

export default function ImageExamples(): JSX.Element {
  return (
    <View className="flex-1 bg-white p-5">
      {/* Imagen local (desde assets) */}
      <View className="mb-5">
        <Text className="text-lg font-semibold mb-2">Imagen Local:</Text>
        <Image
          source={require('../assets/logo.png')}
          className="w-32 h-32 rounded-lg"
          resizeMode="contain"
        />
      </View>

      {/* Imagen remota (desde URL) */}
      <View className="mb-5">
        <Text className="text-lg font-semibold mb-2">Imagen Remota:</Text>
        <Image
          source={{
            uri: 'https://reactnative.dev/img/tiny_logo.png',
          }}
          className="w-20 h-20 rounded-full"
          resizeMode="cover"
        />
      </View>

      {/* Avatar circular */}
      <View className="mb-5">
        <Text className="text-lg font-semibold mb-2">Avatar:</Text>
        <Image
          source={{
            uri: 'https://i.pravatar.cc/150?img=12',
          }}
          className="w-24 h-24 rounded-full border-4 border-blue-500"
          resizeMode="cover"
        />
      </View>

      {/* Imagen con ancho completo */}
      <View className="mb-5">
        <Text className="text-lg font-semibold mb-2">Ancho Completo:</Text>
        <Image
          source={{
            uri: 'https://picsum.photos/400/200',
          }}
          className="w-full h-48 rounded-xl"
          resizeMode="cover"
        />
      </View>
    </View>
  )
}
```

#### Props Importantes

| Prop            | Tipo                                                        | Descripción                          |
| --------------- | ----------------------------------------------------------- | ------------------------------------ |
| `source`        | `require()` o `{ uri: string }`                             | Fuente de la imagen (local o remota) |
| `resizeMode`    | `'cover'`, `'contain'`, `'stretch'`, `'repeat'`, `'center'` | Modo de redimensionado               |
| `defaultSource` | `require()`                                                 | Imagen placeholder mientras carga    |

**Tipos de ResizeMode:**

```tsx
import { Image } from 'react-native'

// cover: Escala la imagen para cubrir todo el contenedor (puede recortar)
<Image source={{uri: 'url'}} resizeMode="cover" className="w-32 h-32" />

// contain: Escala para mostrar toda la imagen (puede dejar espacios)
<Image source={{uri: 'url'}} resizeMode="contain" className="w-32 h-32" />

// stretch: Estira la imagen para llenar el contenedor (distorsiona)
<Image source={{uri: 'url'}} resizeMode="stretch" className="w-32 h-32" />

// repeat: Repite la imagen como patrón
<Image source={{uri: 'url'}} resizeMode="repeat" className="w-32 h-32" />

// center: Centra la imagen sin escalar
<Image source={{uri: 'url'}} resizeMode="center" className="w-32 h-32" />
```

#### Componente de Avatar Reutilizable

```tsx
/**
 * Avatar - Componente de imagen de perfil
 *
 * ¿Para qué? Mostrar fotos de perfil consistentes
 * ¿Cómo? Usa Image con estilos circulares y fallback
 */
import { Image, View, Text } from 'react-native'

interface AvatarProps {
  uri?: string
  name: string
  size?: 'small' | 'medium' | 'large'
}

function Avatar({ uri, name, size = 'medium' }: AvatarProps): JSX.Element {
  const sizeClasses = {
    small: 'w-10 h-10',
    medium: 'w-16 h-16',
    large: 'w-24 h-24',
  }

  const textSizeClasses = {
    small: 'text-sm',
    medium: 'text-lg',
    large: 'text-2xl',
  }

  // Si no hay imagen, mostrar iniciales
  if (!uri) {
    const initials = name
      .split(' ')
      .map((n) => n[0])
      .join('')
      .toUpperCase()
    return (
      <View
        className={`${sizeClasses[size]} rounded-full bg-blue-500 items-center justify-center`}
      >
        <Text className={`${textSizeClasses[size]} font-bold text-white`}>
          {initials}
        </Text>
      </View>
    )
  }

  return (
    <Image
      source={{ uri }}
      className={`${sizeClasses[size]} rounded-full border-2 border-gray-300`}
      resizeMode="cover"
    />
  )
}

// Uso:
// <Avatar uri="https://..." name="Juan Perez" size="large" />
// <Avatar name="Maria Lopez" size="medium" /> {/* Sin imagen, muestra ML */}
```

---

### 4. `<ScrollView>` - Contenedor con Scroll

#### ¿Qué hace?

`ScrollView` permite hacer scroll en contenido que excede el tamaño de la pantalla.

#### ¿Para qué sirve?

- Mostrar listas o contenido largo
- Crear formularios extensos
- Permitir navegación vertical u horizontal

#### ¿Cómo funciona?

```tsx
/**
 * ScrollView - Ejemplos vertical y horizontal
 */
import { ScrollView, View, Text, Image } from 'react-native'

export default function ScrollExamples(): JSX.Element {
  return (
    <View className="flex-1 bg-white">
      {/* Scroll Vertical (por defecto) */}
      <ScrollView className="flex-1 p-5">
        <Text className="text-3xl font-bold text-gray-900 mb-4">
          Scroll Vertical
        </Text>

        {[1, 2, 3, 4, 5, 6, 7, 8].map((item) => (
          <View key={item} className="bg-blue-100 p-5 mb-3 rounded-lg">
            <Text className="text-xl font-semibold text-blue-900">
              Item #{item}
            </Text>
            <Text className="text-base text-blue-700 mt-2">
              Contenido del item {item}. Este texto puede ser largo y el
              ScrollView permitirá hacer scroll para verlo todo.
            </Text>
          </View>
        ))}
      </ScrollView>
    </View>
  )
}
```

**Scroll Horizontal:**

```tsx
import { ScrollView, View, Image, Text } from 'react-native'

function HorizontalScrollExample(): JSX.Element {
  const images = [
    'https://picsum.photos/200/300?random=1',
    'https://picsum.photos/200/300?random=2',
    'https://picsum.photos/200/300?random=3',
    'https://picsum.photos/200/300?random=4',
  ]

  return (
    <View className="bg-white p-5">
      <Text className="text-2xl font-bold text-gray-900 mb-3">
        Scroll Horizontal
      </Text>

      <ScrollView
        horizontal
        showsHorizontalScrollIndicator={false}
        className="flex-row"
      >
        {images.map((uri, index) => (
          <View key={index} className="mr-3">
            <Image
              source={{ uri }}
              className="w-40 h-60 rounded-xl"
              resizeMode="cover"
            />
            <Text className="text-center mt-2 text-gray-700">
              Imagen {index + 1}
            </Text>
          </View>
        ))}
      </ScrollView>
    </View>
  )
}
```

#### Props Importantes

| Prop                             | Tipo      | Descripción                                |
| -------------------------------- | --------- | ------------------------------------------ |
| `horizontal`                     | `boolean` | Scroll horizontal en lugar de vertical     |
| `showsVerticalScrollIndicator`   | `boolean` | Mostrar/ocultar barra de scroll vertical   |
| `showsHorizontalScrollIndicator` | `boolean` | Mostrar/ocultar barra de scroll horizontal |
| `bounces`                        | `boolean` | Efecto de rebote al llegar al final (iOS)  |
| `scrollEnabled`                  | `boolean` | Habilitar/deshabilitar scroll              |

**⚠️ Nota Importante:** `ScrollView` renderiza TODO su contenido de inmediato. Para listas largas (100+ items), usa `FlatList` en su lugar (lo veremos en semanas futuras).

---

### 5. `<TextInput>` - Entrada de Texto

#### ¿Qué hace?

`TextInput` permite al usuario ingresar texto mediante el teclado.

#### ¿Para qué sirve?

- Crear formularios
- Búsquedas
- Login/registro
- Comentarios y mensajes

#### ¿Cómo funciona?

```tsx
/**
 * TextInput - Ejemplos de entrada de texto
 */
import { View, Text, TextInput } from 'react-native'
import { useState } from 'react'

export default function InputExamples(): JSX.Element {
  const [name, setName] = useState<string>('')
  const [email, setEmail] = useState<string>('')
  const [password, setPassword] = useState<string>('')
  const [message, setMessage] = useState<string>('')

  return (
    <View className="flex-1 bg-white p-5">
      <Text className="text-3xl font-bold text-gray-900 mb-5">
        Formulario de Ejemplo
      </Text>

      {/* Input básico */}
      <View className="mb-4">
        <Text className="text-base font-semibold text-gray-700 mb-2">
          Nombre completo:
        </Text>
        <TextInput
          value={name}
          onChangeText={setName}
          placeholder="Ingresa tu nombre"
          className="border border-gray-300 rounded-lg px-4 py-3 text-base text-gray-900"
        />
      </View>

      {/* Input con tipo email */}
      <View className="mb-4">
        <Text className="text-base font-semibold text-gray-700 mb-2">
          Email:
        </Text>
        <TextInput
          value={email}
          onChangeText={setEmail}
          placeholder="tu@email.com"
          keyboardType="email-address"
          autoCapitalize="none"
          autoCorrect={false}
          className="border border-gray-300 rounded-lg px-4 py-3 text-base text-gray-900 bg-gray-50"
        />
      </View>

      {/* Input de contraseña */}
      <View className="mb-4">
        <Text className="text-base font-semibold text-gray-700 mb-2">
          Contraseña:
        </Text>
        <TextInput
          value={password}
          onChangeText={setPassword}
          placeholder="••••••••"
          secureTextEntry
          className="border border-gray-300 rounded-lg px-4 py-3 text-base text-gray-900"
        />
      </View>

      {/* Input multilinea */}
      <View className="mb-4">
        <Text className="text-base font-semibold text-gray-700 mb-2">
          Mensaje:
        </Text>
        <TextInput
          value={message}
          onChangeText={setMessage}
          placeholder="Escribe tu mensaje aquí..."
          multiline
          numberOfLines={4}
          textAlignVertical="top"
          className="border border-gray-300 rounded-lg px-4 py-3 text-base text-gray-900 h-32"
        />
      </View>

      {/* Mostrar valores ingresados */}
      <View className="mt-5 bg-gray-100 p-4 rounded-lg">
        <Text className="text-lg font-bold text-gray-900 mb-2">
          Valores actuales:
        </Text>
        <Text className="text-base text-gray-700">Nombre: {name}</Text>
        <Text className="text-base text-gray-700">Email: {email}</Text>
        <Text className="text-base text-gray-700">
          Password: {password ? '•'.repeat(password.length) : ''}
        </Text>
        <Text className="text-base text-gray-700">Mensaje: {message}</Text>
      </View>
    </View>
  )
}
```

#### Props Importantes

| Prop              | Tipo                                               | Descripción                         |
| ----------------- | -------------------------------------------------- | ----------------------------------- |
| `value`           | `string`                                           | Valor controlado del input          |
| `onChangeText`    | `(text: string) => void`                           | Callback al cambiar texto           |
| `placeholder`     | `string`                                           | Texto placeholder cuando está vacío |
| `keyboardType`    | `'default'`, `'email-address'`, `'numeric'`, etc.  | Tipo de teclado                     |
| `secureTextEntry` | `boolean`                                          | Ocultar texto (para contraseñas)    |
| `multiline`       | `boolean`                                          | Permitir múltiples líneas           |
| `autoCapitalize`  | `'none'`, `'sentences'`, `'words'`, `'characters'` | Mayúsculas automáticas              |
| `autoCorrect`     | `boolean`                                          | Habilitar autocorrección            |
| `editable`        | `boolean`                                          | Permitir/bloquear edición           |

#### Tipos de Teclado (`keyboardType`)

```tsx
// Teclado numérico
<TextInput keyboardType="numeric" />

// Teclado de email
<TextInput keyboardType="email-address" />

// Teclado de teléfono
<TextInput keyboardType="phone-pad" />

// Teclado con números y símbolos
<TextInput keyboardType="numbers-and-punctuation" />

// Teclado de URL
<TextInput keyboardType="url" />

// Teclado decimal
<TextInput keyboardType="decimal-pad" />
```

#### Input Reutilizable con Validación

```tsx
/**
 * FormInput - Input reutilizable con validación visual
 *
 * ¿Para qué? Crear inputs consistentes con feedback visual
 * ¿Cómo? Combina TextInput con estilos condicionales
 */
import { View, Text, TextInput } from 'react-native'

interface FormInputProps {
  label: string
  value: string
  onChangeText: (text: string) => void
  placeholder?: string
  error?: string
  secureTextEntry?: boolean
  keyboardType?: 'default' | 'email-address' | 'numeric' | 'phone-pad'
}

function FormInput({
  label,
  value,
  onChangeText,
  placeholder,
  error,
  secureTextEntry = false,
  keyboardType = 'default',
}: FormInputProps): JSX.Element {
  const borderColor = error ? 'border-red-500' : 'border-gray-300'
  const bgColor = error ? 'bg-red-50' : 'bg-white'

  return (
    <View className="mb-4">
      <Text className="text-base font-semibold text-gray-700 mb-2">
        {label}
      </Text>
      <TextInput
        value={value}
        onChangeText={onChangeText}
        placeholder={placeholder}
        secureTextEntry={secureTextEntry}
        keyboardType={keyboardType}
        className={`border ${borderColor} ${bgColor} rounded-lg px-4 py-3 text-base text-gray-900`}
      />
      {error && <Text className="text-sm text-red-600 mt-1">{error}</Text>}
    </View>
  )
}

// Uso:
// <FormInput
//   label="Email"
//   value={email}
//   onChangeText={setEmail}
//   error={emailError}
//   keyboardType="email-address"
// />
```

---

### 6. `<Button>` - Botón Básico

#### ¿Qué hace?

`Button` es un botón básico proporcionado por React Native.

#### ¿Para qué sirve?

- Acciones simples
- Envío de formularios
- Confirmaciones

#### Limitaciones

- ⚠️ **Difícil de estilizar** con TailwindCSS (tiene estilos nativos predefinidos)
- ⚠️ **Apariencia diferente** en iOS vs Android
- ⚠️ **Opciones limitadas** de personalización

**Por eso, normalmente usamos `TouchableOpacity` en su lugar.**

```tsx
/**
 * Button - Ejemplo básico (limitado)
 */
import { View, Button, Alert } from 'react-native'

export default function ButtonExample(): JSX.Element {
  const handlePress = (): void => {
    Alert.alert('¡Presionado!', 'El botón fue presionado')
  }

  return (
    <View className="flex-1 justify-center items-center bg-white p-5">
      <Button
        title="Presionar"
        onPress={handlePress}
        color="#3B82F6" // Solo color, no más estilos
      />
    </View>
  )
}
```

---

### 7. `<TouchableOpacity>` - Elemento Presionable

#### ¿Qué hace?

`TouchableOpacity` hace cualquier componente presionable con efecto de opacidad.

#### ¿Para qué sirve?

- Crear botones personalizados
- Hacer cards presionables
- Navegar entre pantallas
- Cualquier interacción táctil

#### ¿Cómo funciona?

```tsx
/**
 * TouchableOpacity - Botones personalizados
 */
import { View, Text, TouchableOpacity, Alert } from 'react-native'

export default function TouchableExamples(): JSX.Element {
  const handlePress = (message: string): void => {
    Alert.alert('Acción', message)
  }

  return (
    <View className="flex-1 justify-center items-center bg-white p-5">
      {/* Botón primario */}
      <TouchableOpacity
        onPress={() => handlePress('Botón primario presionado')}
        activeOpacity={0.7}
        className="bg-blue-600 px-8 py-4 rounded-lg mb-4 w-full"
      >
        <Text className="text-white text-center text-lg font-bold">
          Botón Primario
        </Text>
      </TouchableOpacity>

      {/* Botón secundario (outline) */}
      <TouchableOpacity
        onPress={() => handlePress('Botón secundario presionado')}
        activeOpacity={0.7}
        className="border-2 border-blue-600 px-8 py-4 rounded-lg mb-4 w-full"
      >
        <Text className="text-blue-600 text-center text-lg font-bold">
          Botón Secundario
        </Text>
      </TouchableOpacity>

      {/* Botón de peligro */}
      <TouchableOpacity
        onPress={() => handlePress('¡Acción peligrosa!')}
        activeOpacity={0.7}
        className="bg-red-600 px-8 py-4 rounded-lg mb-4 w-full"
      >
        <Text className="text-white text-center text-lg font-bold">
          Eliminar
        </Text>
      </TouchableOpacity>

      {/* Botón deshabilitado */}
      <TouchableOpacity
        disabled
        className="bg-gray-300 px-8 py-4 rounded-lg mb-4 w-full"
      >
        <Text className="text-gray-500 text-center text-lg font-bold">
          Deshabilitado
        </Text>
      </TouchableOpacity>

      {/* Botón con icono (simulado con emoji) */}
      <TouchableOpacity
        onPress={() => handlePress('¡Me gusta!')}
        activeOpacity={0.7}
        className="bg-pink-500 px-8 py-4 rounded-full flex-row items-center justify-center w-full"
      >
        <Text className="text-white text-2xl mr-2">❤️</Text>
        <Text className="text-white text-lg font-bold">Me gusta</Text>
      </TouchableOpacity>
    </View>
  )
}
```

#### Props Importantes

| Prop            | Tipo           | Descripción                           |
| --------------- | -------------- | ------------------------------------- |
| `onPress`       | `() => void`   | Callback al presionar                 |
| `activeOpacity` | `number` (0-1) | Opacidad al presionar (default: 0.2)  |
| `disabled`      | `boolean`      | Deshabilitar el componente            |
| `onLongPress`   | `() => void`   | Callback al presionar prolongadamente |

#### Componente de Botón Reutilizable

```tsx
/**
 * CustomButton - Botón personalizado reutilizable
 *
 * ¿Para qué? Crear botones consistentes en toda la app
 * ¿Cómo? Usa TouchableOpacity con variantes de estilo
 */
import { Text, TouchableOpacity } from 'react-native'

interface CustomButtonProps {
  title: string
  onPress: () => void
  variant?: 'primary' | 'secondary' | 'danger'
  disabled?: boolean
  fullWidth?: boolean
}

function CustomButton({
  title,
  onPress,
  variant = 'primary',
  disabled = false,
  fullWidth = false,
}: CustomButtonProps): JSX.Element {
  const baseClasses = 'px-6 py-3 rounded-lg'
  const widthClass = fullWidth ? 'w-full' : ''

  const variantClasses = {
    primary: disabled ? 'bg-gray-300' : 'bg-blue-600',
    secondary: disabled
      ? 'border-2 border-gray-300'
      : 'border-2 border-blue-600',
    danger: disabled ? 'bg-gray-300' : 'bg-red-600',
  }

  const textClasses = {
    primary: disabled ? 'text-gray-500' : 'text-white',
    secondary: disabled ? 'text-gray-500' : 'text-blue-600',
    danger: disabled ? 'text-gray-500' : 'text-white',
  }

  return (
    <TouchableOpacity
      onPress={onPress}
      disabled={disabled}
      activeOpacity={0.7}
      className={`${baseClasses} ${variantClasses[variant]} ${widthClass}`}
    >
      <Text className={`text-center text-lg font-bold ${textClasses[variant]}`}>
        {title}
      </Text>
    </TouchableOpacity>
  )
}

// Uso:
// <CustomButton title="Guardar" onPress={handleSave} variant="primary" />
// <CustomButton title="Cancelar" onPress={handleCancel} variant="secondary" />
// <CustomButton title="Eliminar" onPress={handleDelete} variant="danger" />
```

---

## 🎨 Ejemplo Completo: Formulario de Contacto

```tsx
/**
 * ContactForm - Formulario completo con todos los componentes
 *
 * ¿Para qué? Demostrar uso integrado de componentes básicos
 * ¿Cómo? Combina View, Text, TextInput, TouchableOpacity, ScrollView, Image
 */
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  ScrollView,
  Image,
  Alert,
} from 'react-native'
import { useState } from 'react'

export default function ContactForm(): JSX.Element {
  const [name, setName] = useState<string>('')
  const [email, setEmail] = useState<string>('')
  const [phone, setPhone] = useState<string>('')
  const [message, setMessage] = useState<string>('')

  const handleSubmit = (): void => {
    if (!name || !email || !message) {
      Alert.alert('Error', 'Por favor completa todos los campos obligatorios')
      return
    }

    Alert.alert(
      'Formulario Enviado',
      `Nombre: ${name}\nEmail: ${email}\nTeléfono: ${phone}\nMensaje: ${message}`,
      [
        {
          text: 'OK',
          onPress: () => {
            setName('')
            setEmail('')
            setPhone('')
            setMessage('')
          },
        },
      ]
    )
  }

  return (
    <ScrollView className="flex-1 bg-white">
      {/* Header con logo */}
      <View className="bg-blue-600 pt-12 pb-8 px-5 items-center">
        <Image
          source={{ uri: 'https://reactnative.dev/img/tiny_logo.png' }}
          className="w-20 h-20 mb-3"
          resizeMode="contain"
        />
        <Text className="text-3xl font-bold text-white">Contáctanos</Text>
        <Text className="text-base text-blue-100 mt-2 text-center">
          Completa el formulario y te responderemos pronto
        </Text>
      </View>

      {/* Formulario */}
      <View className="p-5">
        {/* Nombre */}
        <View className="mb-4">
          <Text className="text-base font-semibold text-gray-700 mb-2">
            Nombre completo *
          </Text>
          <TextInput
            value={name}
            onChangeText={setName}
            placeholder="Juan Pérez"
            className="border border-gray-300 rounded-lg px-4 py-3 text-base text-gray-900 bg-gray-50"
          />
        </View>

        {/* Email */}
        <View className="mb-4">
          <Text className="text-base font-semibold text-gray-700 mb-2">
            Correo electrónico *
          </Text>
          <TextInput
            value={email}
            onChangeText={setEmail}
            placeholder="juan@ejemplo.com"
            keyboardType="email-address"
            autoCapitalize="none"
            autoCorrect={false}
            className="border border-gray-300 rounded-lg px-4 py-3 text-base text-gray-900 bg-gray-50"
          />
        </View>

        {/* Teléfono */}
        <View className="mb-4">
          <Text className="text-base font-semibold text-gray-700 mb-2">
            Teléfono (opcional)
          </Text>
          <TextInput
            value={phone}
            onChangeText={setPhone}
            placeholder="+52 123 456 7890"
            keyboardType="phone-pad"
            className="border border-gray-300 rounded-lg px-4 py-3 text-base text-gray-900 bg-gray-50"
          />
        </View>

        {/* Mensaje */}
        <View className="mb-4">
          <Text className="text-base font-semibold text-gray-700 mb-2">
            Mensaje *
          </Text>
          <TextInput
            value={message}
            onChangeText={setMessage}
            placeholder="Cuéntanos en qué podemos ayudarte..."
            multiline
            numberOfLines={6}
            textAlignVertical="top"
            className="border border-gray-300 rounded-lg px-4 py-3 text-base text-gray-900 bg-gray-50 h-40"
          />
        </View>

        {/* Botones */}
        <TouchableOpacity
          onPress={handleSubmit}
          activeOpacity={0.7}
          className="bg-blue-600 py-4 rounded-lg mb-3"
        >
          <Text className="text-white text-center text-lg font-bold">
            Enviar Mensaje
          </Text>
        </TouchableOpacity>

        <TouchableOpacity
          onPress={() => {
            setName('')
            setEmail('')
            setPhone('')
            setMessage('')
          }}
          activeOpacity={0.7}
          className="border-2 border-gray-300 py-4 rounded-lg"
        >
          <Text className="text-gray-600 text-center text-lg font-bold">
            Limpiar Formulario
          </Text>
        </TouchableOpacity>
      </View>

      {/* Footer */}
      <View className="bg-gray-100 p-5 mt-5">
        <Text className="text-center text-sm text-gray-600">
          * Campos obligatorios
        </Text>
        <Text className="text-center text-xs text-gray-500 mt-2">
          Tus datos están protegidos y no serán compartidos
        </Text>
      </View>
    </ScrollView>
  )
}
```

---

## 📊 Tabla Resumen de Componentes

| Componente         | Propósito Principal  | Cuándo Usarlo                  | Tailwind Key Classes               |
| ------------------ | -------------------- | ------------------------------ | ---------------------------------- |
| `View`             | Contenedor           | Siempre (como `<div>`)         | `flex-1`, `bg-`, `p-`, `m-`        |
| `Text`             | Mostrar texto        | Todo texto                     | `text-`, `font-`, `text-center`    |
| `Image`            | Mostrar imágenes     | Logos, fotos, iconos           | `w-`, `h-`, `rounded-`             |
| `ScrollView`       | Contenido con scroll | Listas cortas, formularios     | `flex-1`, `p-`                     |
| `TextInput`        | Entrada de texto     | Formularios, búsquedas         | `border`, `rounded-`, `px-`, `py-` |
| `Button`           | Botón básico         | ⚠️ Raramente (poco flexible)   | N/A (difícil de estilizar)         |
| `TouchableOpacity` | Elemento presionable | Botones custom, cards táctiles | `bg-`, `rounded-`, `px-`, `py-`    |

---

## 🧪 Ejercicios Prácticos

### Ejercicio 1: Card de Producto (15 minutos)

Crea un componente `ProductCard` que muestre:

- Imagen del producto
- Nombre del producto
- Precio
- Botón "Agregar al carrito"

**Requisitos:**

- Usar TypeScript
- Estilizar con TailwindCSS
- Hacer presionable con `TouchableOpacity`

**Template:**

```tsx
import { View, Text, Image, TouchableOpacity } from 'react-native'

interface ProductCardProps {
  name: string
  price: number
  imageUrl: string
  onAddToCart: () => void
}

function ProductCard({
  name,
  price,
  imageUrl,
  onAddToCart,
}: ProductCardProps): JSX.Element {
  // Tu código aquí
  return (
    <View className="bg-white rounded-xl shadow-md p-4 m-3">
      {/* Implementa el diseño */}
    </View>
  )
}
```

### Ejercicio 2: Lista de Tareas (20 minutos)

Crea una app simple de TODO list que permita:

- Agregar nuevas tareas (TextInput + Button)
- Mostrar lista de tareas en un ScrollView
- Marcar tareas como completadas (TouchableOpacity)

**Pistas:**

- Usa `useState` para la lista de tareas
- Usa un array de objetos: `{ id: number, text: string, completed: boolean }`
- Aplica estilos condicionales con Tailwind (tachado para completadas)

### Ejercicio 3: Perfil de Usuario (25 minutos)

Crea una pantalla de perfil que incluya:

- Avatar circular (Image)
- Nombre y bio del usuario (Text)
- Estadísticas (seguidores, siguiendo, posts) en una fila (View con flex-row)
- Botones de acción: "Seguir", "Mensaje" (TouchableOpacity)
- Galería horizontal de fotos (ScrollView horizontal)

**Estilo:** Inspírate en Instagram/Twitter

---

## ✅ Checklist de Verificación

Antes de continuar, asegúrate de:

- [ ] Comprender la diferencia entre HTML y componentes de React Native
- [ ] Poder usar View para crear layouts básicos
- [ ] Aplicar estilos de Tailwind a Text (tamaños, colores, peso)
- [ ] Cargar imágenes locales y remotas con Image
- [ ] Implementar scroll vertical y horizontal con ScrollView
- [ ] Crear formularios funcionales con TextInput
- [ ] Construir botones personalizados con TouchableOpacity
- [ ] Combinar componentes para crear interfaces completas
- [ ] Usar TypeScript en todos los componentes

---

## 📚 Recursos Adicionales

### Documentación Oficial

- [React Native Core Components](https://reactnative.dev/docs/components-and-apis)
- [View Component](https://reactnative.dev/docs/view)
- [Text Component](https://reactnative.dev/docs/text)
- [Image Component](https://reactnative.dev/docs/image)
- [TextInput Component](https://reactnative.dev/docs/textinput)
- [ScrollView Component](https://reactnative.dev/docs/scrollview)
- [Touchable Components](https://reactnative.dev/docs/touchableopacity)

### TailwindCSS con NativeWind

- [NativeWind Components Guide](https://www.nativewind.dev/core-concepts/components)
- [TailwindCSS Cheat Sheet](https://tailwindcomponents.com/cheatsheet/)

### Ejemplos y Tutoriales

- [React Native Express - Core Components](http://www.reactnativeexpress.com/core_components)
- [React Native School](https://www.reactnativeschool.com/)

---

## 🔗 Navegación

- ⬅️ [Anterior: Configuración del Entorno](./02-configuracion-entorno.md)
- ➡️ [Siguiente: Estilos y Layouts con Flexbox](./04-estilos-layouts.md)
- 🏠 [Volver al índice de teoría](./README.md)

---

**Tiempo total completado:** ~3 horas (de 6 horas de la sesión presencial)  
**Próximo tema:** Estilos avanzados y Flexbox con TailwindCSS
