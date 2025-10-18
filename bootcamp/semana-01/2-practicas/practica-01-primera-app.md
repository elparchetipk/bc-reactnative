# 💻 Práctica 1: Mi Primera App - Perfil Personal

**⏱️ Duración:** 45 minutos  
**👥 Modalidad:** 🎓 **PRESENCIAL - Con instrucciones paso a paso**  
**📊 Dificultad:** ⭐ Fácil  
**🎯 Conceptos:** Componentes básicos, estilos con TailwindCSS, Layouts

---

## 🎯 Objetivo

Crear juntos (instructor + estudiantes) tu primera aplicación de React Native: una **pantalla de perfil personal** con foto, nombre, información de contacto y biografía.

**Importante:** Esta práctica se hace **EN CLASE, PASO A PASO** con el instructor. No es para trabajo autónomo.

---

## 📚 Conceptos que Aplicaremos Juntos

Durante esta práctica guiada veremos:

- ✅ Estructura de un componente funcional con TypeScript
- ✅ `View` y `SafeAreaView` para contenedores seguros
- ✅ `Text` con diferentes estilos tipográficos
- ✅ `Image` para mostrar avatar circular
- ✅ `ScrollView` para contenido scrollable
- ✅ Estilos con TailwindCSS (NativeWind)
- ✅ Layouts con Flexbox (column, center, spacing)
- ✅ Organización de código limpio y comentado

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
---

## 🖼️ Resultado que Construiremos Juntos

```

┌─────────────────────────┐
│ [Fondo color] │ ← Header con gradiente
│ ╔═══════╗ │
│ ║ Foto ║ │ ← Avatar circular 120x120
│ ╚═══════╝ │
│ │
│ Tu Nombre │ ← Texto grande y bold
│ Tu Profesión │ ← Subtítulo gris
│ │
│ 📧 tu@email.com │ ← Info de contacto
│ 📱 +1 234 567 890 │
│ 📍 Tu Ciudad │
│ │
│ ┌─────────────────┐ │
│ │ Sobre Mí │ │ ← Card con biografía
│ │ Tu descripción │ │
│ │ personal aquí │ │
│ └─────────────────┘ │
└─────────────────────────┘

````

---

## �‍🏫 Dinámica de la Clase (45 minutos)

### Estructura:
1. **Introducción (5 min):** Instructor explica el objetivo y muestra resultado final
2. **Setup inicial (10 min):** Todos configuran el proyecto juntos
3. **Desarrollo guiado (25 min):** Codear paso a paso con el instructor
4. **Review y Q&A (5 min):** Resolver dudas y mostrar resultados

### Reglas:
- ✅ **Seguir al instructor** paso a paso
- ✅ **Preguntar inmediatamente** si algo no funciona
- ✅ **Experimentar después** con tu propia información
- ❌ **NO adelantarse** (esperamos que todos estén en el mismo punto)

---

## �️ Preparación (El instructor guiará esto)

**NOTA:** Ya deberías tener instalado en la sesión anterior:
- Node.js 22.20+
- pnpm 9+
- Expo Go en tu celular
- Editor VS Code

El instructor iniciará el proyecto base y todos seguirán los mismos pasos.

---

## 👨‍💻 Desarrollo Guiado - Paso a Paso

> **Instructor:** Lee cada paso en voz alta y espera a que todos completen antes de avanzar.

### Paso 1: Estructura Base (5 min)

**El instructor proyecta y explica:**

```typescript
// App.tsx
import { SafeAreaView, ScrollView, View, Text, Image } from 'react-native'

export default function App() {
  return (
    <SafeAreaView className="flex-1 bg-gray-50">
      <ScrollView>
        {/* Aquí construiremos el perfil */}
        <Text>Hola Mundo!</Text>
      </ScrollView>
    </SafeAreaView>
  )
}
````

**Todos escriben esto juntos.**

**✅ Checkpoint:** Todos deben ver "Hola Mundo!" en pantalla antes de continuar.

---

### Paso 2: Header con Avatar (10 min)

**El instructor explica y codea:**

```typescript
// Agregar después del <Text>Hola Mundo!</Text>

{
  /* Header con color de fondo */
}
;<View className="bg-blue-600 h-40 items-center justify-end pb-10">
  <Text className="text-white text-2xl font-bold">Mi Perfil</Text>
</View>

{
  /* Avatar circular */
}
;<View className="items-center -mt-16">
  <Image
    source={{ uri: 'https://i.pravatar.cc/150?img=12' }}
    className="w-32 h-32 rounded-full border-4 border-white"
  />
</View>

{
  /* Nombre y profesión */
}
;<View className="items-center mt-4 px-5">
  <Text className="text-3xl font-bold text-gray-900">Tu Nombre Aquí</Text>
  <Text className="text-lg text-gray-600 mt-1">Tu Profesión</Text>
</View>
```

**✅ Checkpoint:** Todos deben ver el header azul, avatar circular y nombre antes de continuar.

---

### Paso 3: Información de Contacto (10 min)

**El instructor continúa:**

```typescript
{
  /* Agregar después de la sección de nombre */
}

{
  /* Card de información */
}
;<View className="mx-5 mt-6 bg-gray-50 rounded-xl p-5">
  {/* Email */}
  <View className="flex-row items-center mb-4">
    <Text className="text-2xl mr-3">📧</Text>
    <View className="flex-1">
      <Text className="text-sm text-gray-500">Email</Text>
      <Text className="text-base text-gray-900 font-medium">tu@email.com</Text>
    </View>
  </View>

  {/* Teléfono */}
  <View className="flex-row items-center mb-4">
    <Text className="text-2xl mr-3">📱</Text>
    <View className="flex-1">
      <Text className="text-sm text-gray-500">Teléfono</Text>
      <Text className="text-base text-gray-900 font-medium">
        +1 234 567 890
      </Text>
    </View>
  </View>

  {/* Ubicación */}
  <View className="flex-row items-center">
    <Text className="text-2xl mr-3">📍</Text>
    <View className="flex-1">
      <Text className="text-sm text-gray-500">Ubicación</Text>
      <Text className="text-base text-gray-900 font-medium">Tu Ciudad</Text>
    </View>
  </View>
</View>
```

**✅ Checkpoint:** Verificar que todos tienen la card con la info de contacto.

---

### Paso 4: Sección "Sobre Mí" (5 min)

**Último paso guiado:**

```typescript
{
  /* Agregar al final, antes de cerrar ScrollView */
}

{
  /* Sobre mí */
}
;<View className="mx-5 mt-6 mb-10 bg-white rounded-xl p-5 border border-gray-200">
  <Text className="text-xl font-bold text-gray-900 mb-3">Sobre Mí</Text>
  <Text className="text-base text-gray-600 leading-6">
    Escribe aquí una breve descripción sobre ti. Qué te gusta hacer, tus
    hobbies, tu experiencia, etc. Puedes escribir varias líneas.
  </Text>
</View>
```

**✅ Checkpoint Final:** ¡Todos deben tener la app completa funcionando!

---

## ✅ Código Completo Final

<details>
<summary>👉 Ver código completo del App.tsx</summary>

```typescript
import { SafeAreaView, ScrollView, View, Text, Image } from 'react-native'

export default function App() {
  return (
    <SafeAreaView className="flex-1 bg-gray-50">
      <ScrollView>
        {/* Header */}
        <View className="bg-blue-600 h-40 items-center justify-end pb-10">
          <Text className="text-white text-2xl font-bold">Mi Perfil</Text>
        </View>

        {/* Avatar */}
        <View className="items-center -mt-16">
          <Image
            source={{ uri: 'https://i.pravatar.cc/150?img=12' }}
            className="w-32 h-32 rounded-full border-4 border-white"
          />
        </View>

        {/* Nombre */}
        <View className="items-center mt-4 px-5">
          <Text className="text-3xl font-bold text-gray-900">Juan Pérez</Text>
          <Text className="text-lg text-gray-600 mt-1">
            Desarrollador Mobile
          </Text>
        </View>

        {/* Info de contacto */}
        <View className="mx-5 mt-6 bg-gray-50 rounded-xl p-5">
          <View className="flex-row items-center mb-4">
            <Text className="text-2xl mr-3">📧</Text>
            <View className="flex-1">
              <Text className="text-sm text-gray-500">Email</Text>
              <Text className="text-base text-gray-900 font-medium">
                juan@email.com
              </Text>
            </View>
          </View>

          <View className="flex-row items-center mb-4">
            <Text className="text-2xl mr-3">📱</Text>
            <View className="flex-1">
              <Text className="text-sm text-gray-500">Teléfono</Text>
              <Text className="text-base text-gray-900 font-medium">
                +52 123 456 7890
              </Text>
            </View>
          </View>

          <View className="flex-row items-center">
            <Text className="text-2xl mr-3">📍</Text>
            <View className="flex-1">
              <Text className="text-sm text-gray-500">Ubicación</Text>
              <Text className="text-base text-gray-900 font-medium">
                Ciudad de México
              </Text>
            </View>
          </View>
        </View>

        {/* Sobre mí */}
        <View className="mx-5 mt-6 mb-10 bg-white rounded-xl p-5 border border-gray-200">
          <Text className="text-xl font-bold text-gray-900 mb-3">Sobre Mí</Text>
          <Text className="text-base text-gray-600 leading-6">
            Soy un desarrollador apasionado por crear aplicaciones móviles. Me
            encanta aprender nuevas tecnologías y compartir conocimiento.
          </Text>
        </View>
      </ScrollView>
    </SafeAreaView>
  )
}
```

</details>

---

## 🎨 Personalización (Tiempo Libre en Clase)

Si terminas antes que los demás, personaliza tu app:

1. **Cambia los colores:** `bg-blue-600` → `bg-purple-600`, `bg-green-600`, etc.
2. **Usa tu foto:** Cambia el URI de la imagen por tu foto
3. **Agrega más secciones:** Habilidades, redes sociales, etc.
4. **Experimenta con tamaños:** `text-3xl` → `text-4xl`, `w-32` → `w-40`, etc.

---

## 🏠 Tarea Opcional (Autónoma - 30min)

Para reforzar lo aprendido en casa:

### Desafío 1: Agrega Redes Sociales

Crea una nueva sección con iconos de redes sociales (GitHub, LinkedIn, Twitter)

### Desafío 2: Modo Oscuro

Cambia los colores para crear una versión dark mode

### Desafío 3: Botón de Contacto

Agrega un botón al final que diga "Enviar Mensaje"

---

## 🐛 Problemas Comunes (Troubleshooting)

### ❌ Error: "className is not defined"

**Solución:** Verifica que hayas configurado NativeWind correctamente en `babel.config.js`

### ❌ La imagen no se ve

**Solución:** Asegúrate de tener conexión a internet. Prueba con otra URL.

### ❌ Los estilos no se aplican

**Solución:** Reinicia el servidor: `Ctrl+C` y luego `pnpm start` de nuevo

### ❌ Safe Area no funciona

**Solución:** Verifica que instalaste `react-native-safe-area-context`

---

## 📚 Recursos Adicionales

- [React Native Docs - View](https://reactnative.dev/docs/view)
- [React Native Docs - Text](https://reactnative.dev/docs/text)
- [React Native Docs - Image](https://reactnative.dev/docs/image)
- [NativeWind Docs](https://www.nativewind.dev/)
- [TailwindCSS Colors](https://tailwindcss.com/docs/customizing-colors)

---

## ✅ Checklist de Completación

Antes de terminar la clase, verifica que:

- [ ] Tu app muestra el header con color de fondo
- [ ] El avatar se ve circular y centrado
- [ ] El nombre y profesión están visibles
- [ ] La información de contacto se muestra correctamente
- [ ] La sección "Sobre mí" está completa
- [ ] Todo el contenido es scrollable
- [ ] La app se ve bien en tu dispositivo
- [ ] El código está limpio y comentado

---

**🎉 ¡Felicidades! Has creado tu primera app de React Native.**

**🔜 Siguiente:** Práctica 2 - Card Component Reutilizable
</View>
</View>

````

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
````

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
