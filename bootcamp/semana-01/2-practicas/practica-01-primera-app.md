# Práctica 1: Mi Primera App

**Duración estimada:** 30 minutos  
**Dificultad:** ⭐ Fácil  
**Conceptos:** Componentes básicos, estilos con TailwindCSS

---

## 🎯 Objetivo

Crear tu primera aplicación de React Native: una **pantalla de perfil personal** que muestre tu información básica con una foto, nombre, descripción y algunos datos de contacto.

---

## 📚 Conceptos a Aplicar

- ✅ Componente funcional con TypeScript
- ✅ `View` para contenedores
- ✅ `Text` para mostrar texto
- ✅ `Image` para mostrar foto de perfil
- ✅ `ScrollView` para contenido scrollable
- ✅ Estilos con TailwindCSS (NativeWind)
- ✅ Layouts con Flexbox

---

## 🖼️ Resultado Esperado

Tu app debe verse similar a esto:

```
┌─────────────────────────┐
│                         │
│      ╔═══════╗         │  ← Banner de fondo
│      ║ Foto  ║         │  ← Avatar circular
│      ╚═══════╝         │
│                         │
│     Juan Pérez         │  ← Nombre
│   Desarrollador Mobile │  ← Título
│                         │
│  ┌─────────────────┐   │
│  │ 📧 Email        │   │  ← Sección de información
│  │ juan@email.com  │   │
│  ├─────────────────┤   │
│  │ 📱 Teléfono     │   │
│  │ +52 123 456 789 │   │
│  ├─────────────────┤   │
│  │ 📍 Ubicación    │   │
│  │ Ciudad de Méx.  │   │
│  └─────────────────┘   │
│                         │
│  ┌─────────────────┐   │
│  │ Acerca de mí    │   │  ← Bio
│  │ Lorem ipsum...  │   │
│  └─────────────────┘   │
│                         │
└─────────────────────────┘
```

---

## 📋 Requisitos

### Funcionales:

- [ ] Mostrar una imagen de perfil circular
- [ ] Nombre completo visible
- [ ] Título o profesión
- [ ] Email, teléfono y ubicación con iconos (emojis)
- [ ] Sección "Acerca de mí" con texto descriptivo
- [ ] Todo el contenido debe ser scrollable

### Técnicos:

- [ ] Usar TypeScript para el componente
- [ ] Usar TailwindCSS (NativeWind) para todos los estilos
- [ ] Implementar SafeAreaView para compatibilidad con notch
- [ ] Código limpio y bien comentado

---

## 🚀 Paso a Paso

### Paso 1: Crear el Proyecto (5 min)

```bash
# Crear proyecto nuevo
npx create-expo-app@latest practica-01-perfil --template blank-typescript

# Entrar al directorio
cd practica-01-perfil

# Instalar NativeWind
pnpm add nativewind
pnpm add -D tailwindcss

# Inicializar Tailwind
npx tailwindcss init
```

### Paso 2: Configurar NativeWind (5 min)

**Editar `tailwind.config.js`:**

```js
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./App.{js,jsx,ts,tsx}', './src/**/*.{js,jsx,ts,tsx}'],
  theme: {
    extend: {},
  },
  plugins: [],
}
```

**Editar `babel.config.js`:**

```js
module.exports = function (api) {
  api.cache(true)
  return {
    presets: ['babel-preset-expo'],
    plugins: ['nativewind/babel'],
  }
}
```

**Crear `nativewind-env.d.ts` en la raíz:**

```typescript
/// <reference types="nativewind/types" />
```

### Paso 3: Crear la Estructura Básica (5 min)

**Editar `App.tsx`:**

```tsx
import { ScrollView, View, Text, Image } from 'react-native'
import { SafeAreaView } from 'react-native-safe-area-context'

export default function App(): JSX.Element {
  return (
    <SafeAreaView className="flex-1 bg-white">
      <ScrollView>
        {/* Aquí irá nuestro contenido */}
        <Text className="text-2xl font-bold text-center mt-10">Mi Perfil</Text>
      </ScrollView>
    </SafeAreaView>
  )
}
```

**Instalar SafeAreaView:**

```bash
pnpm add react-native-safe-area-context
```

### Paso 4: Agregar Header con Avatar (5 min)

Reemplaza el contenido del `ScrollView`:

```tsx
<ScrollView className="flex-1">
  {/* Header con fondo azul */}
  <View className="bg-blue-600 h-48 items-center justify-end pb-16">
    <Text className="text-white text-2xl font-bold">Mi Perfil</Text>
  </View>

  {/* Avatar circular superpuesto */}
  <View className="items-center -mt-16">
    <Image
      source={{ uri: 'https://i.pravatar.cc/150?img=12' }}
      className="w-32 h-32 rounded-full border-4 border-white"
    />
  </View>

  {/* Nombre y título */}
  <View className="items-center mt-4 px-5">
    <Text className="text-3xl font-bold text-gray-900">Juan Pérez</Text>
    <Text className="text-lg text-gray-600 mt-1">Desarrollador Mobile</Text>
  </View>
</ScrollView>
```

### Paso 5: Agregar Información de Contacto (5 min)

Después de la sección de nombre, agrega:

```tsx
{
  /* Información de contacto */
}
;<View className="mx-5 mt-6 bg-gray-50 rounded-xl p-5">
  {/* Email */}
  <View className="flex-row items-center mb-4">
    <Text className="text-2xl mr-3">📧</Text>
    <View className="flex-1">
      <Text className="text-sm text-gray-500">Email</Text>
      <Text className="text-base text-gray-900 font-medium">
        juan@email.com
      </Text>
    </View>
  </View>

  {/* Teléfono */}
  <View className="flex-row items-center mb-4">
    <Text className="text-2xl mr-3">📱</Text>
    <View className="flex-1">
      <Text className="text-sm text-gray-500">Teléfono</Text>
      <Text className="text-base text-gray-900 font-medium">
        +52 123 456 7890
      </Text>
    </View>
  </View>

  {/* Ubicación */}
  <View className="flex-row items-center">
    <Text className="text-2xl mr-3">📍</Text>
    <View className="flex-1">
      <Text className="text-sm text-gray-500">Ubicación</Text>
      <Text className="text-base text-gray-900 font-medium">
        Ciudad de México, México
      </Text>
    </View>
  </View>
</View>
```

### Paso 6: Agregar Sección "Acerca de mí" (5 min)

Después de la información de contacto:

```tsx
{
  /* Acerca de mí */
}
;<View className="mx-5 mt-6 mb-8">
  <Text className="text-xl font-bold text-gray-900 mb-3">Acerca de mí</Text>
  <View className="bg-white p-5 rounded-xl border border-gray-200">
    <Text className="text-base text-gray-700 leading-6">
      Desarrollador apasionado por crear experiencias móviles increíbles. Me
      encanta aprender nuevas tecnologías y compartir conocimiento con la
      comunidad. Especializado en React Native, TypeScript y desarrollo
      cross-platform.
    </Text>
  </View>
</View>
```

---

## ✅ Solución Completa

**`App.tsx` completo:**

```tsx
/**
 * Mi Primera App - Perfil Personal
 *
 * ¿Qué hace?
 * Muestra una pantalla de perfil con información personal
 *
 * ¿Para qué?
 * Practicar componentes básicos, layouts y estilos con TailwindCSS
 *
 * ¿Cómo funciona?
 * 1. SafeAreaView asegura que el contenido no se superponga con notch
 * 2. ScrollView permite hacer scroll si el contenido es largo
 * 3. View como contenedores para organizar el layout
 * 4. Text para mostrar información
 * 5. Image para el avatar con estilo circular
 */

import { ScrollView, View, Text, Image } from 'react-native'
import { SafeAreaView } from 'react-native-safe-area-context'

export default function App(): JSX.Element {
  // Datos del perfil (podrían venir de un API más adelante)
  const profileData = {
    name: 'Juan Pérez',
    title: 'Desarrollador Mobile',
    avatar: 'https://i.pravatar.cc/150?img=12',
    email: 'juan@email.com',
    phone: '+52 123 456 7890',
    location: 'Ciudad de México, México',
    bio: 'Desarrollador apasionado por crear experiencias móviles increíbles. Me encanta aprender nuevas tecnologías y compartir conocimiento con la comunidad. Especializado en React Native, TypeScript y desarrollo cross-platform.',
  }

  return (
    <SafeAreaView className="flex-1 bg-white">
      <ScrollView className="flex-1">
        {/* Header con fondo azul */}
        <View className="bg-blue-600 h-48 items-center justify-end pb-16">
          <Text className="text-white text-2xl font-bold">Mi Perfil</Text>
        </View>

        {/* Avatar circular superpuesto */}
        <View className="items-center -mt-16">
          <Image
            source={{ uri: profileData.avatar }}
            className="w-32 h-32 rounded-full border-4 border-white shadow-lg"
          />
        </View>

        {/* Nombre y título */}
        <View className="items-center mt-4 px-5">
          <Text className="text-3xl font-bold text-gray-900">
            {profileData.name}
          </Text>
          <Text className="text-lg text-gray-600 mt-1">
            {profileData.title}
          </Text>
        </View>

        {/* Información de contacto */}
        <View className="mx-5 mt-6 bg-gray-50 rounded-xl p-5">
          {/* Email */}
          <View className="flex-row items-center mb-4">
            <Text className="text-2xl mr-3">📧</Text>
            <View className="flex-1">
              <Text className="text-sm text-gray-500">Email</Text>
              <Text className="text-base text-gray-900 font-medium">
                {profileData.email}
              </Text>
            </View>
          </View>

          {/* Divider */}
          <View className="h-px bg-gray-200 mb-4" />

          {/* Teléfono */}
          <View className="flex-row items-center mb-4">
            <Text className="text-2xl mr-3">📱</Text>
            <View className="flex-1">
              <Text className="text-sm text-gray-500">Teléfono</Text>
              <Text className="text-base text-gray-900 font-medium">
                {profileData.phone}
              </Text>
            </View>
          </View>

          {/* Divider */}
          <View className="h-px bg-gray-200 mb-4" />

          {/* Ubicación */}
          <View className="flex-row items-center">
            <Text className="text-2xl mr-3">📍</Text>
            <View className="flex-1">
              <Text className="text-sm text-gray-500">Ubicación</Text>
              <Text className="text-base text-gray-900 font-medium">
                {profileData.location}
              </Text>
            </View>
          </View>
        </View>

        {/* Acerca de mí */}
        <View className="mx-5 mt-6 mb-8">
          <Text className="text-xl font-bold text-gray-900 mb-3">
            Acerca de mí
          </Text>
          <View className="bg-white p-5 rounded-xl border border-gray-200">
            <Text className="text-base text-gray-700 leading-6">
              {profileData.bio}
            </Text>
          </View>
        </View>

        {/* Estadísticas (opcional) */}
        <View className="mx-5 mb-8">
          <Text className="text-xl font-bold text-gray-900 mb-3">
            Estadísticas
          </Text>
          <View className="flex-row gap-3">
            <View className="flex-1 bg-blue-50 p-5 rounded-xl items-center">
              <Text className="text-3xl font-bold text-blue-600">12</Text>
              <Text className="text-sm text-blue-900 mt-1">Proyectos</Text>
            </View>
            <View className="flex-1 bg-green-50 p-5 rounded-xl items-center">
              <Text className="text-3xl font-bold text-green-600">5</Text>
              <Text className="text-sm text-green-900 mt-1">AñosExp.</Text>
            </View>
            <View className="flex-1 bg-purple-50 p-5 rounded-xl items-center">
              <Text className="text-3xl font-bold text-purple-600">150+</Text>
              <Text className="text-sm text-purple-900 mt-1">Commits</Text>
            </View>
          </View>
        </View>
      </ScrollView>
    </SafeAreaView>
  )
}
```

---

## 🎨 Desafíos Adicionales

### Nivel 1: Personalización

- [ ] Cambia todos los datos por tu información real
- [ ] Usa tu propia foto (puedes usar una URL de tu GitHub/LinkedIn)
- [ ] Cambia los colores del tema (ej: de azul a verde)
- [ ] Agrega más información (sitio web, redes sociales)

### Nivel 2: Componentes

- [ ] Extrae el componente de "Info Item" (email, teléfono, ubicación) para reutilizarlo
- [ ] Crea un componente separado para las estadísticas
- [ ] Organiza el código en múltiples archivos (componentes separados)

### Nivel 3: Interactividad

- [ ] Agrega botones "Editar Perfil" y "Compartir"
- [ ] Implementa TouchableOpacity en la foto para cambiarla
- [ ] Agrega un modal para editar la biografía
- [ ] Implementa modo oscuro (dark mode)

---

## 📝 Código del Componente Reutilizable (Nivel 2)

**`components/InfoItem.tsx`:**

```tsx
import { View, Text } from 'react-native'

interface InfoItemProps {
  icon: string
  label: string
  value: string
  showDivider?: boolean
}

export function InfoItem({
  icon,
  label,
  value,
  showDivider = true,
}: InfoItemProps): JSX.Element {
  return (
    <>
      <View className="flex-row items-center mb-4">
        <Text className="text-2xl mr-3">{icon}</Text>
        <View className="flex-1">
          <Text className="text-sm text-gray-500">{label}</Text>
          <Text className="text-base text-gray-900 font-medium">{value}</Text>
        </View>
      </View>
      {showDivider && <View className="h-px bg-gray-200 mb-4" />}
    </>
  )
}

// Uso:
// <InfoItem icon="📧" label="Email" value="juan@email.com" />
// <InfoItem icon="📱" label="Teléfono" value="+52 123" showDivider={false} />
```

---

## 🐛 Problemas Comunes y Soluciones

### Problema 1: La imagen no se muestra

**Causa:** URL inválida o sin conexión a internet

**Solución:**

```tsx
// Usar una imagen local como fallback
import { Image } from 'react-native'

;<Image
  source={require('./assets/avatar.png')} // Imagen local
  className="w-32 h-32 rounded-full"
/>
```

### Problema 2: Los estilos de TailwindCSS no funcionan

**Causa:** NativeWind no configurado correctamente

**Solución:**

```bash
# 1. Limpiar caché
pnpm start --clear

# 2. Verificar que exista nativewind-env.d.ts
# 3. Verificar babel.config.js incluye el plugin
# 4. Reiniciar el servidor de desarrollo
```

### Problema 3: El avatar no es circular

**Causa:** Falta clase `rounded-full` o dimensiones diferentes

**Solución:**

```tsx
// Asegurar que width y height sean iguales
<Image
  source={{ uri: 'url' }}
  className="w-32 h-32 rounded-full" // rounded-full hace el círculo
/>
```

### Problema 4: Contenido se superpone con notch

**Causa:** No usar SafeAreaView

**Solución:**

```tsx
import { SafeAreaView } from 'react-native-safe-area-context'

// Envolver todo en SafeAreaView
;<SafeAreaView className="flex-1">{/* contenido */}</SafeAreaView>
```

---

## ✅ Checklist de Verificación

Antes de dar por completada la práctica:

- [ ] La app compila sin errores
- [ ] El avatar se muestra correctamente y es circular
- [ ] Todos los textos son legibles
- [ ] El contenido es scrollable
- [ ] Los colores son consistentes
- [ ] El código usa TypeScript
- [ ] Los estilos usan TailwindCSS
- [ ] El código está comentado
- [ ] La app se ve bien en diferentes tamaños de pantalla

---

## 📚 Recursos

### Documentación

- [Image Component](https://reactnative.dev/docs/image)
- [ScrollView](https://reactnative.dev/docs/scrollview)
- [SafeAreaView](https://reactnative.dev/docs/safeareaview)
- [TailwindCSS - Flexbox](https://tailwindcss.com/docs/flex)
- [TailwindCSS - Sizing](https://tailwindcss.com/docs/width)

### Herramientas

- [Avatar Generator](https://pravatar.cc/) - Avatares aleatorios
- [Unsplash](https://unsplash.com/) - Imágenes gratis
- [Emojipedia](https://emojipedia.org/) - Buscar emojis

---

## 🎉 ¡Felicitaciones!

Has completado tu primera app de React Native. Ahora sabes:

- ✅ Crear componentes funcionales con TypeScript
- ✅ Usar componentes básicos (View, Text, Image)
- ✅ Aplicar estilos con TailwindCSS
- ✅ Crear layouts con Flexbox
- ✅ Hacer contenido scrollable

**Siguiente paso:** [Práctica 2 - Card Component](./practica-02-card-component.md)

---

**Tiempo estimado completado:** 30 minutos ✓
