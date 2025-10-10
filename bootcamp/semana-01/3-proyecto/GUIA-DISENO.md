# 🎨 Guía de Diseño - Proyecto Semana 1

Esta guía te ayudará a crear una app visualmente atractiva y profesional.

---

## 🌈 Paletas de Colores Recomendadas

### Opción 1: Azul Profesional (Clásico)

```
Header/Primary:   bg-blue-600    (#2563eb)
Secondary:        bg-blue-100    (#dbeafe)
Text Primary:     text-gray-900  (#111827)
Text Secondary:   text-gray-600  (#4b5563)
Background:       bg-gray-50     (#f9fafb)
Cards:            bg-white       (#ffffff)
Borders:          border-gray-200 (#e5e7eb)
```

**Cuándo usar:** Portfolio profesional, apps corporativas

---

### Opción 2: Purple Creativo

```
Header/Primary:   bg-purple-600  (#9333ea)
Secondary:        bg-purple-100  (#f3e8ff)
Text Primary:     text-gray-900  (#111827)
Text Secondary:   text-gray-600  (#4b5563)
Background:       bg-gray-50     (#f9fafb)
Accent:           bg-pink-500    (#ec4899)
```

**Cuándo usar:** Portfolio creativo, apps de diseño

---

### Opción 3: Verde Fresco

```
Header/Primary:   bg-green-600   (#16a34a)
Secondary:        bg-green-100   (#dcfce7)
Text Primary:     text-gray-900  (#111827)
Text Secondary:   text-gray-600  (#4b5563)
Background:       bg-gray-50     (#f9fafb)
Accent:           bg-teal-500    (#14b8a6)
```

**Cuándo usar:** Apps de salud, productividad, naturaleza

---

### Opción 4: Naranja Energético

```
Header/Primary:   bg-orange-600  (#ea580c)
Secondary:        bg-orange-100  (#ffedd5)
Text Primary:     text-gray-900  (#111827)
Text Secondary:   text-gray-600  (#4b5563)
Background:       bg-gray-50     (#f9fafb)
Accent:           bg-amber-500   (#f59e0b)
```

**Cuándo usar:** Apps enérgicas, fitness, motivación

---

### Opción 5: Oscuro Elegante

```
Background:       bg-gray-900    (#111827)
Cards:            bg-gray-800    (#1f2937)
Text Primary:     text-white     (#ffffff)
Text Secondary:   text-gray-400  (#9ca3af)
Accent:           bg-blue-500    (#3b82f6)
Borders:          border-gray-700 (#374151)
```

**Cuándo usar:** Apps modernas, tech, gaming

---

## 📏 Espaciado y Tamaños

### Regla de 8pt Grid

Usa múltiplos de 4 para espaciado consistente:

```typescript
// Espaciado interno (padding)
p-2   = 8px   // Muy pequeño
p-3   = 12px  // Pequeño
p-4   = 16px  // Normal
p-5   = 20px  // Medio
p-6   = 24px  // Grande
p-8   = 32px  // Muy grande

// Espaciado entre elementos (margin)
mt-2  = 8px   // Muy pequeño
mt-3  = 12px  // Pequeño
mt-4  = 16px  // Normal
mt-6  = 24px  // Grande
mt-8  = 32px  // Muy grande
```

### Tamaños de Fuente

```typescript
// Títulos
text-3xl  = 30px  // Nombre principal
text-2xl  = 24px  // Títulos de sección
text-xl   = 20px  // Subtítulos

// Cuerpo
text-lg   = 18px  // Texto destacado
text-base = 16px  // Texto normal
text-sm   = 14px  // Texto secundario
text-xs   = 12px  // Labels, metadata
```

### Tamaños de Avatar/Imágenes

```typescript
// Avatares
w-32 h-32  = 128px × 128px  // Avatar principal (recomendado)
w-24 h-24  = 96px × 96px    // Avatar mediano
w-16 h-16  = 64px × 64px    // Avatar pequeño

// Iconos/Emojis
text-3xl   = 30px   // Emoji grande
text-2xl   = 24px   // Emoji normal
text-xl    = 20px   // Emoji pequeño
```

---

## 🎯 Jerarquía Visual

### Orden de Importancia

1. **Nivel 1 - Lo más importante:**

   ```typescript
   <Text className="text-3xl font-bold text-gray-900">Tu Nombre</Text>
   ```

2. **Nivel 2 - Importante:**

   ```typescript
   <Text className="text-xl font-semibold text-gray-800">
     Título de Sección
   </Text>
   ```

3. **Nivel 3 - Normal:**

   ```typescript
   <Text className="text-base font-medium text-gray-900">
     Nombre de Habilidad
   </Text>
   ```

4. **Nivel 4 - Secundario:**

   ```typescript
   <Text className="text-sm text-gray-600">Descripción o metadata</Text>
   ```

5. **Nivel 5 - Terciario:**
   ```typescript
   <Text className="text-xs text-gray-500">Labels, timestamps</Text>
   ```

---

## 🎨 Componentes Comunes - Recetas de Diseño

### Card Básico Profesional

```typescript
<View className="bg-white rounded-xl p-5 mb-4 border border-gray-200 shadow-sm">
  {/* Contenido */}
</View>
```

### Card con Hover Effect (más avanzado)

```typescript
<View className="bg-white rounded-xl p-5 mb-4 border border-gray-200 shadow-lg">
  {/* Contenido */}
</View>
```

### Header con Gradiente Simulado (sin librerías)

```typescript
<View className="bg-blue-600 h-48 items-center justify-end pb-10">
  {/* Contenido del header */}
</View>
```

### Avatar Circular con Borde

```typescript
<Image
  source={{ uri: avatarUrl }}
  className="w-32 h-32 rounded-full border-4 border-white"
  style={{ shadowColor: '#000', shadowOpacity: 0.1, shadowRadius: 10 }}
/>
```

### Tag/Badge

```typescript
<View className="bg-blue-100 rounded-full px-3 py-1 mr-2 mb-2">
  <Text className="text-sm text-blue-700 font-medium">React Native</Text>
</View>
```

### Separador Sutil

```typescript
<View className="h-px bg-gray-200 mx-5 my-6" />
```

### Separador con Texto

```typescript
<View className="flex-row items-center mx-5 my-6">
  <View className="flex-1 h-px bg-gray-200" />
  <Text className="mx-4 text-sm text-gray-500 font-medium">O</Text>
  <View className="flex-1 h-px bg-gray-200" />
</View>
```

---

## ✨ Efectos y Detalles

### Sombras

```typescript
// Sombra sutil (iOS/Android compatible)
style={{
  shadowColor: '#000',
  shadowOffset: { width: 0, height: 2 },
  shadowOpacity: 0.1,
  shadowRadius: 3,
  elevation: 3, // Para Android
}}

// Sombra media
style={{
  shadowColor: '#000',
  shadowOffset: { width: 0, height: 4 },
  shadowOpacity: 0.15,
  shadowRadius: 6,
  elevation: 5,
}}

// Sombra fuerte
style={{
  shadowColor: '#000',
  shadowOffset: { width: 0, height: 8 },
  shadowOpacity: 0.2,
  shadowRadius: 10,
  elevation: 8,
}}
```

### Bordes Redondeados

```typescript
rounded-none   // Sin redondeo
rounded-sm     // 2px  - Casi recto
rounded        // 4px  - Sutil
rounded-lg     // 8px  - Normal (recomendado para cards)
rounded-xl     // 12px - Moderno
rounded-2xl    // 16px - Muy redondeado
rounded-full   // 50%  - Círculo perfecto (avatares)
```

---

## 📐 Layouts Comunes

### Layout de Perfil con Header

```typescript
<SafeAreaView className="flex-1 bg-gray-50">
  <ScrollView>
    {/* Header */}
    <View className="bg-blue-600 h-48 items-center justify-end pb-10">
      <Text className="text-white text-3xl font-bold">MI APP</Text>
    </View>

    {/* Avatar superpuesto */}
    <View className="items-center -mt-16">
      <Image
        source={{ uri: avatar }}
        className="w-32 h-32 rounded-full border-4 border-white"
      />
    </View>

    {/* Contenido */}
    <View className="mt-4 px-5">{/* Resto del contenido */}</View>
  </ScrollView>
</SafeAreaView>
```

### Grid de 2 Columnas (para skills pequeños)

```typescript
<View className="flex-row flex-wrap justify-between px-5">
  {skills.map((skill) => (
    <View
      key={skill.id}
      className="w-[48%] bg-white rounded-lg p-4 mb-3 border border-gray-200"
    >
      <Text className="text-2xl mb-2">{skill.emoji}</Text>
      <Text className="text-base font-semibold">{skill.name}</Text>
    </View>
  ))}
</View>
```

### Lista con Iconos a la Izquierda

```typescript
<View className="flex-row items-center mb-4">
  <Text className="text-2xl mr-3">{icon}</Text>
  <View className="flex-1">
    <Text className="text-sm text-gray-500">{label}</Text>
    <Text className="text-base text-gray-900 font-medium">{value}</Text>
  </View>
</View>
```

---

## 🚀 Tips Pro de Diseño

### 1. Consistencia es Clave

- Usa el mismo espaciado en todas partes (ej: siempre `p-5` en cards)
- Mantén el mismo estilo de bordes (ej: siempre `rounded-xl`)
- Usa la misma paleta de colores en toda la app

### 2. Menos es Más

- No uses más de 3 colores principales
- No mezcles muchos estilos de cards diferentes
- Mantén el espaciado generoso (no aprietes todo)

### 3. Contraste Adecuado

- Texto oscuro (`text-gray-900`) sobre fondo claro
- Texto claro (`text-white`) sobre fondo oscuro
- Evita gris sobre gris claro (difícil de leer)

### 4. Alineación

- Alinea elementos visualmente relacionados
- Usa `items-center` para centrar verticalmente
- Usa `justify-center` para centrar horizontalmente

### 5. Espaciado Respiratorio

```typescript
// ❌ Muy apretado
<View className="p-2 m-1">

// ✅ Espacioso y cómodo
<View className="p-5 mb-4">
```

### 6. Tipografía Clara

```typescript
// ❌ Difícil de leer
<Text className="text-xs text-gray-400">
  Texto muy pequeño y poco contraste
</Text>

// ✅ Fácil de leer
<Text className="text-base text-gray-700 leading-6">
  Texto con buen tamaño y espaciado
</Text>
```

---

## 🎭 Ejemplos de Variantes

### Card Skill - Variante 1 (Simple)

```typescript
<View className="bg-white rounded-lg p-4 mb-3 flex-row items-center border border-gray-200">
  <Text className="text-3xl mr-3">{emoji}</Text>
  <Text className="text-lg font-semibold text-gray-800">{name}</Text>
</View>
```

### Card Skill - Variante 2 (Con Badge de Nivel)

```typescript
<View className="bg-white rounded-lg p-4 mb-3 border border-gray-200">
  <View className="flex-row items-center justify-between mb-2">
    <View className="flex-row items-center flex-1">
      <Text className="text-3xl mr-3">{emoji}</Text>
      <Text className="text-lg font-semibold text-gray-800">{name}</Text>
    </View>
    <View className="bg-green-100 rounded-full px-2 py-1">
      <Text className="text-xs text-green-700 font-medium">Avanzado</Text>
    </View>
  </View>
</View>
```

### Card Skill - Variante 3 (Con Barra de Progreso)

```typescript
<View className="bg-white rounded-lg p-4 mb-3 border border-gray-200">
  <View className="flex-row items-center mb-3">
    <Text className="text-3xl mr-3">{emoji}</Text>
    <Text className="text-lg font-semibold text-gray-800 flex-1">{name}</Text>
  </View>

  {/* Barra de progreso */}
  <View className="h-2 bg-gray-200 rounded-full overflow-hidden">
    <View
      className="h-full bg-blue-500 rounded-full"
      style={{ width: '80%' }}
    />
  </View>
</View>
```

### Card Proyecto - Variante Destacada

```typescript
<View className="bg-gradient-to-r from-blue-500 to-purple-600 rounded-xl p-5 mb-4">
  <View className="flex-row items-center mb-3">
    <Text className="text-3xl mr-3">{emoji}</Text>
    <Text className="text-xl font-bold text-white flex-1">{title}</Text>
    <View className="bg-white bg-opacity-20 rounded-full px-2 py-1">
      <Text className="text-xs text-white font-medium">Destacado</Text>
    </View>
  </View>

  <Text className="text-base text-white opacity-90 mb-3 leading-5">
    {description}
  </Text>

  <View className="flex-row flex-wrap">
    {tags.map((tag, index) => (
      <View
        key={index}
        className="bg-white bg-opacity-20 rounded-full px-3 py-1 mr-2 mb-2"
      >
        <Text className="text-sm text-white font-medium">{tag}</Text>
      </View>
    ))}
  </View>
</View>
```

---

## 📱 Responsive Tips

### Usar Porcentajes para Anchos

```typescript
// 2 columnas
<View className="w-[48%]">

// 3 columnas
<View className="w-[31%]">

// Contenedor con padding lateral proporcional
<View className="px-5"> {/* 5% en cada lado aprox */}
```

### SafeAreaView Siempre

```typescript
// ✅ Correcto
<SafeAreaView className="flex-1">
  <ScrollView>
    {/* Contenido */}
  </ScrollView>
</SafeAreaView>

// ❌ Incorrecto (se corta con el notch)
<View className="flex-1">
  <ScrollView>
    {/* Contenido */}
  </ScrollView>
</View>
```

---

## 🎨 Inspiración de Diseño

### Dribbble - Búsquedas Recomendadas

- "mobile profile app"
- "portfolio app design"
- "mobile personal app"
- "profile card design"

### Apps Reales para Inspirarse

- LinkedIn (perfil profesional)
- Instagram (perfil visual)
- GitHub Mobile (perfil de desarrollador)
- Behance (portfolio creativo)

---

## ✅ Checklist de Diseño

Antes de dar tu proyecto por terminado, verifica:

### Colores:

- [ ] Paleta consistente (máximo 3-4 colores)
- [ ] Buen contraste texto/fondo
- [ ] Colores armoniosos (no al azar)

### Espaciado:

- [ ] Padding interno consistente en cards (p-4 o p-5)
- [ ] Margin entre elementos (mb-3, mb-4, mb-6)
- [ ] Espaciado generoso, no apretado

### Tipografía:

- [ ] Jerarquía clara (nombre > títulos > texto)
- [ ] Tamaños legibles (mínimo text-sm)
- [ ] Font weights apropiados (bold para títulos)

### Componentes:

- [ ] Bordes redondeados consistentes
- [ ] Borders sutiles en cards
- [ ] Avatar circular y bien proporcionado

### Layout:

- [ ] SafeAreaView implementado
- [ ] ScrollView funcional
- [ ] Elementos alineados correctamente
- [ ] No hay overflow (contenido cortado)

### Detalles:

- [ ] Emojis/iconos apropiados
- [ ] Sombras sutiles (opcional)
- [ ] Separadores donde sea necesario
- [ ] Tags/badges con buen estilo

---

## 🚫 Errores Comunes a Evitar

### ❌ Demasiados Colores

```typescript
// Mal: Cada card un color diferente
<View className="bg-red-500">...</View>
<View className="bg-green-500">...</View>
<View className="bg-yellow-500">...</View>
```

### ✅ Consistencia

```typescript
// Bien: Todos los cards iguales
<View className="bg-white border border-gray-200">...</View>
<View className="bg-white border border-gray-200">...</View>
<View className="bg-white border border-gray-200">...</View>
```

---

### ❌ Texto Ilegible

```typescript
// Mal: Poco contraste
<View className="bg-gray-100">
  <Text className="text-gray-300">Texto difícil de leer</Text>
</View>
```

### ✅ Buen Contraste

```typescript
// Bien: Alto contraste
<View className="bg-white">
  <Text className="text-gray-900">Texto fácil de leer</Text>
</View>
```

---

### ❌ Espaciado Inconsistente

```typescript
// Mal: Diferentes espaciados
<View className="p-2 mb-1">...</View>
<View className="p-5 mb-6">...</View>
<View className="p-3 mb-2">...</View>
```

### ✅ Espaciado Consistente

```typescript
// Bien: Mismo espaciado
<View className="p-5 mb-4">...</View>
<View className="p-5 mb-4">...</View>
<View className="p-5 mb-4">...</View>
```

---

## 🎯 Resultado Final

Tu app debe verse:

- ✨ **Profesional:** Limpia, organizada, consistente
- 🎨 **Atractiva:** Buenos colores, buen espaciado
- 📖 **Legible:** Texto claro, jerarquía obvia
- 💎 **Pulida:** Detalles cuidados (bordes, sombras, alineación)
- 📱 **Funcional:** Todo visible, nada cortado

---

**Recuerda:** El buen diseño es invisible. Si algo te llama la atención de forma negativa, probablemente necesita ajuste.

¡Suerte con tu proyecto! 🚀
