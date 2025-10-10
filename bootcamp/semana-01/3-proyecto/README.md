# 🚀 Proyecto Integrador - Semana 1

**📱 Nombre del Proyecto:** Mi App Personal

**⏱️ Tiempo Total:** 2.5 horas (30min presencial + 2h autónomo)  
**🎯 Dificultad:** ⭐⭐ Intermedio  
**📊 Peso en Evaluación:** 50% de la nota semanal

---

## 🎯 Objetivo del Proyecto

Crear una **aplicación personal completa** que combine todos los conceptos aprendidos en la Semana 1:

- Componentes básicos
- Layouts con Flexbox
- Estilos con TailwindCSS
- Componentes reutilizables
- Renderizado de listas
- Estado local básico

---

## 📋 Descripción del Proyecto

Crearás una **app personal** con 3 pantallas principales (dentro de una misma vista scrollable):

1. **Sección Perfil** - Información personal con avatar y bio
2. **Sección Habilidades** - Lista de tus habilidades/tecnologías
3. **Sección Proyectos** - Cards de proyectos que has hecho o quieres hacer

### Resultado Visual Esperado:

```
┌────────────────────────────┐
│  ╔═══════════════════╗    │ ← Header con gradiente
│  ║  MI APP PERSONAL  ║    │
│  ╚═══════════════════╝    │
│                            │
│      ╭────────╮           │ ← Avatar circular
│      │ Foto   │           │
│      ╰────────╯           │
│                            │
│    Tu Nombre Completo     │ ← Nombre grande
│    Tu Profesión           │ ← Subtítulo
│                            │
│  ┌──────────────────────┐ │
│  │ 📧 email@ejemplo.com │ │ ← Info contacto
│  │ 📍 Tu Ciudad         │ │
│  │ 🔗 GitHub/LinkedIn   │ │
│  └──────────────────────┘ │
│                            │
│  ╔══════════════════════╗ │
│  ║  Sobre Mí            ║ │ ← Biografía
│  ╚══════════════════════╝ │
│  Tu descripción aquí...   │
│                            │
│  ─────────────────────── │ ← Separador
│                            │
│  ╔══════════════════════╗ │
│  ║  Mis Habilidades     ║ │ ← Lista de skills
│  ╚══════════════════════╝ │
│                            │
│  [💻 React Native      ] │ ← Cards de skills
│  [⚛️  TypeScript       ] │   (con emojis)
│  [🎨 TailwindCSS      ] │
│  [📱 Expo             ] │
│                            │
│  ─────────────────────── │
│                            │
│  ╔══════════════════════╗ │
│  ║  Mis Proyectos       ║ │ ← Lista proyectos
│  ╚══════════════════════╝ │
│                            │
│  ┌──────────────────────┐ │
│  │ 🎯 Proyecto 1        │ │ ← Card proyecto
│  │ Descripción...       │ │
│  │ [React Native]       │ │ ← Tags
│  └──────────────────────┘ │
│                            │
│  ┌──────────────────────┐ │
│  │ 🌟 Proyecto 2        │ │
│  │ Descripción...       │ │
│  │ [TypeScript][Expo]   │ │
│  └──────────────────────┘ │
│                            │
└────────────────────────────┘
```

---

## 🎓 Parte Presencial (30 minutos en clase)

### ¿Qué haremos en clase?

El instructor explicará:

1. **Estructura del proyecto** (10 min)

   - Revisión de requisitos
   - Demostración del resultado final
   - Explicación de la rúbrica de evaluación

2. **Setup inicial** (15 min)

   - Crear proyecto base
   - Configurar NativeWind
   - Estructura de carpetas recomendada

3. **Q&A y Asignación** (5 min)
   - Resolver dudas sobre el proyecto
   - Fecha de entrega
   - Forma de entrega (GitHub)

### Fecha Límite:

**📅 Entregar antes de la próxima sesión (Semana 2)**

---

## 🏠 Trabajo Autónomo (2 horas)

### Requisitos Funcionales:

#### 1. Sección Perfil (Obligatorio - 30 min)

- [ ] Header con color de fondo personalizado
- [ ] Avatar circular (puede ser foto o placeholder)
- [ ] Nombre completo
- [ ] Título/Profesión
- [ ] Al menos 3 datos de contacto (email, ubicación, link)
- [ ] Sección "Sobre mí" con biografía (mínimo 3 líneas)

#### 2. Sección Habilidades (Obligatorio - 30 min)

- [ ] Título de sección "Mis Habilidades"
- [ ] Lista de al menos 6 habilidades/tecnologías
- [ ] Cada habilidad debe tener:
  - Emoji representativo
  - Nombre de la tecnología
  - Card con estilo consistente
- [ ] Renderizado con `.map()` desde un array

#### 3. Sección Proyectos (Obligatorio - 45 min)

- [ ] Título de sección "Mis Proyectos"
- [ ] Al menos 3 proyectos
- [ ] Cada proyecto debe mostrar:
  - Emoji/ícono
  - Nombre del proyecto
  - Descripción breve (2-3 líneas)
  - Tags de tecnologías usadas
- [ ] Usar componente `ProjectCard` reutilizable
- [ ] Renderizado con `.map()` desde un array

#### 4. Requisitos Técnicos (Transversal - 15 min)

- [ ] TypeScript en todos los componentes
- [ ] TailwindCSS/NativeWind para estilos
- [ ] Interfaces TypeScript para datos
- [ ] SafeAreaView implementado
- [ ] ScrollView para contenido scrollable
- [ ] Código limpio y comentado
- [ ] Sin errores en consola

---

## 📐 Estructura de Carpetas Recomendada

```
proyecto-semana-01/
├── App.tsx                    # Componente principal
├── babel.config.js            # Config Babel + NativeWind
├── tailwind.config.js         # Config TailwindCSS
├── nativewind-env.d.ts        # Types NativeWind
├── package.json
├── tsconfig.json
└── components/                # Componentes reutilizables
    ├── ProfileSection.tsx     # Sección de perfil
    ├── SkillCard.tsx          # Card de habilidad
    └── ProjectCard.tsx        # Card de proyecto
```

---

## 💻 Guía de Implementación

### Paso 1: Setup Inicial (10 min)

```bash
# Crear proyecto
npx create-expo-app@latest mi-app-personal --template blank-typescript

cd mi-app-personal

# Instalar NativeWind
pnpm add nativewind
pnpm add -D tailwindcss@3.3.2

# Inicializar Tailwind
npx tailwindcss init
```

**Configurar archivos:**

<details>
<summary>📄 babel.config.js</summary>

```js
module.exports = function (api) {
  api.cache(true)
  return {
    presets: ['babel-preset-expo'],
    plugins: ['nativewind/babel'],
  }
}
```

</details>

<details>
<summary>📄 tailwind.config.js</summary>

```js
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./App.{js,jsx,ts,tsx}', './components/**/*.{js,jsx,ts,tsx}'],
  theme: {
    extend: {},
  },
  plugins: [],
}
```

</details>

<details>
<summary>📄 nativewind-env.d.ts</summary>

```typescript
/// <reference types="nativewind/types" />
```

</details>

---

### Paso 2: Definir Datos (15 min)

Crea tus datos en `App.tsx`:

```typescript
// Interfaces TypeScript
interface ContactInfo {
  icon: string
  label: string
  value: string
}

interface Skill {
  id: string
  emoji: string
  name: string
  level?: string
}

interface Project {
  id: string
  emoji: string
  title: string
  description: string
  tags: string[]
}

// Datos personales (CAMBIA CON TU INFORMACIÓN REAL)
const personalInfo = {
  name: 'Tu Nombre Completo',
  title: 'Desarrollador React Native',
  avatar: 'https://i.pravatar.cc/150?img=33',
  bio: 'Soy un desarrollador apasionado por crear aplicaciones móviles increíbles. Me encanta aprender nuevas tecnologías y resolver problemas complejos.',
}

const contacts: ContactInfo[] = [
  { icon: '📧', label: 'Email', value: 'tu@email.com' },
  { icon: '📍', label: 'Ubicación', value: 'Tu Ciudad, País' },
  { icon: '🔗', label: 'GitHub', value: 'github.com/tu-usuario' },
]

const skills: Skill[] = [
  { id: '1', emoji: '⚛️', name: 'React Native' },
  { id: '2', emoji: '📘', name: 'TypeScript' },
  { id: '3', emoji: '🎨', name: 'TailwindCSS' },
  { id: '4', emoji: '📱', name: 'Expo' },
  { id: '5', emoji: '🔥', name: 'JavaScript' },
  { id: '6', emoji: '🎯', name: 'Git & GitHub' },
]

const projects: Project[] = [
  {
    id: '1',
    emoji: '👤',
    title: 'App de Perfil Personal',
    description:
      'Aplicación para mostrar información personal con diseño moderno',
    tags: ['React Native', 'TypeScript'],
  },
  {
    id: '2',
    emoji: '📋',
    title: 'Lista de Contactos',
    description: 'App para gestionar contactos con búsqueda en tiempo real',
    tags: ['React Native', 'FlatList'],
  },
  {
    id: '3',
    emoji: '🎯',
    title: 'TODO List',
    description: 'Gestor de tareas con funcionalidad CRUD completa',
    tags: ['React Native', 'useState'],
  },
]
```

---

### Paso 3: Crear Componentes Reutilizables (30 min)

#### SkillCard.tsx

```typescript
import { View, Text } from 'react-native'

interface SkillCardProps {
  emoji: string
  name: string
}

export function SkillCard({ emoji, name }: SkillCardProps) {
  return (
    <View className="bg-white rounded-lg p-4 mb-3 flex-row items-center border border-gray-200">
      <Text className="text-3xl mr-3">{emoji}</Text>
      <Text className="text-lg font-semibold text-gray-800">{name}</Text>
    </View>
  )
}
```

#### ProjectCard.tsx

```typescript
import { View, Text } from 'react-native'

interface ProjectCardProps {
  emoji: string
  title: string
  description: string
  tags: string[]
}

export function ProjectCard({
  emoji,
  title,
  description,
  tags,
}: ProjectCardProps) {
  return (
    <View className="bg-white rounded-xl p-5 mb-4 border border-gray-200">
      {/* Header */}
      <View className="flex-row items-center mb-3">
        <Text className="text-3xl mr-3">{emoji}</Text>
        <Text className="text-xl font-bold text-gray-900 flex-1">{title}</Text>
      </View>

      {/* Descripción */}
      <Text className="text-base text-gray-600 mb-3 leading-5">
        {description}
      </Text>

      {/* Tags */}
      <View className="flex-row flex-wrap">
        {tags.map((tag, index) => (
          <View
            key={index}
            className="bg-blue-100 rounded-full px-3 py-1 mr-2 mb-2"
          >
            <Text className="text-sm text-blue-700 font-medium">{tag}</Text>
          </View>
        ))}
      </View>
    </View>
  )
}
```

---

### Paso 4: Implementar App.tsx (45 min)

```typescript
import { SafeAreaView, ScrollView, View, Text, Image } from 'react-native'
import { SkillCard } from './components/SkillCard'
import { ProjectCard } from './components/ProjectCard'

// Interfaces y datos aquí (del Paso 2)
// ...

export default function App() {
  return (
    <SafeAreaView className="flex-1 bg-gray-50">
      <ScrollView showsVerticalScrollIndicator={false}>
        {/* HEADER */}
        <View className="bg-gradient-to-r from-blue-600 to-purple-600 h-48 items-center justify-end pb-10">
          <Text className="text-white text-3xl font-bold">MI APP PERSONAL</Text>
        </View>

        {/* AVATAR */}
        <View className="items-center -mt-16">
          <Image
            source={{ uri: personalInfo.avatar }}
            className="w-32 h-32 rounded-full border-4 border-white"
          />
        </View>

        {/* NOMBRE Y TÍTULO */}
        <View className="items-center mt-4 px-5">
          <Text className="text-3xl font-bold text-gray-900">
            {personalInfo.name}
          </Text>
          <Text className="text-lg text-gray-600 mt-1">
            {personalInfo.title}
          </Text>
        </View>

        {/* CONTACTO */}
        <View className="mx-5 mt-6 bg-white rounded-xl p-5 border border-gray-200">
          {contacts.map((contact, index) => (
            <View
              key={index}
              className={`flex-row items-center ${
                index < contacts.length - 1 ? 'mb-4' : ''
              }`}
            >
              <Text className="text-2xl mr-3">{contact.icon}</Text>
              <View className="flex-1">
                <Text className="text-sm text-gray-500">{contact.label}</Text>
                <Text className="text-base text-gray-900 font-medium">
                  {contact.value}
                </Text>
              </View>
            </View>
          ))}
        </View>

        {/* SOBRE MÍ */}
        <View className="mx-5 mt-6 bg-white rounded-xl p-5 border border-gray-200">
          <Text className="text-xl font-bold text-gray-900 mb-3">Sobre Mí</Text>
          <Text className="text-base text-gray-600 leading-6">
            {personalInfo.bio}
          </Text>
        </View>

        {/* SEPARADOR */}
        <View className="h-px bg-gray-300 mx-5 my-8" />

        {/* MIS HABILIDADES */}
        <View className="mx-5">
          <Text className="text-2xl font-bold text-gray-900 mb-4">
            💪 Mis Habilidades
          </Text>
          {skills.map((skill) => (
            <SkillCard key={skill.id} emoji={skill.emoji} name={skill.name} />
          ))}
        </View>

        {/* SEPARADOR */}
        <View className="h-px bg-gray-300 mx-5 my-8" />

        {/* MIS PROYECTOS */}
        <View className="mx-5 mb-10">
          <Text className="text-2xl font-bold text-gray-900 mb-4">
            🚀 Mis Proyectos
          </Text>
          {projects.map((project) => (
            <ProjectCard
              key={project.id}
              emoji={project.emoji}
              title={project.title}
              description={project.description}
              tags={project.tags}
            />
          ))}
        </View>
      </ScrollView>
    </SafeAreaView>
  )
}
```

---

## 🎨 Personalización (Desafíos Opcionales)

Si terminas antes y quieres mejorar tu proyecto:

### Nivel 1 - Estilos (15 min)

- [ ] Cambia los colores del header (gradientes diferentes)
- [ ] Experimenta con diferentes diseños de cards
- [ ] Agrega sombras (shadow) a los componentes
- [ ] Usa diferentes fuentes de peso (font-bold, font-semibold)

### Nivel 2 - Contenido (20 min)

- [ ] Agrega una sección de "Experiencia Laboral"
- [ ] Agrega sección de "Educación"
- [ ] Incluye iconos de redes sociales con links
- [ ] Agrega más proyectos (mínimo 5)

### Nivel 3 - Funcionalidad (30 min)

- [ ] Agrega un contador de proyectos completados
- [ ] Implementa filtrado de proyectos por tecnología
- [ ] Agrega botones interactivos en cada proyecto
- [ ] Crea una sección colapsable con useState

### Nivel 4 - Componentes Avanzados (45 min)

- [ ] Crea un componente `SectionHeader` reutilizable
- [ ] Implementa un componente `ContactButton` con enlaces
- [ ] Crea variantes del `ProjectCard` (featured, compact)
- [ ] Agrega animaciones sutiles

---

## 📊 Rúbrica de Evaluación

### Funcionalidad (30 puntos)

| Criterio                     | Puntos | Descripción                               |
| ---------------------------- | ------ | ----------------------------------------- |
| Sección Perfil completa      | 10     | Avatar, nombre, contacto, bio funcionando |
| Sección Habilidades completa | 8      | Mínimo 6 skills con emoji y estilo        |
| Sección Proyectos completa   | 10     | Mínimo 3 proyectos con ProjectCard        |
| ScrollView funcional         | 2      | Todo el contenido scrollable              |

### Calidad del Código (25 puntos)

| Criterio                   | Puntos | Descripción                           |
| -------------------------- | ------ | ------------------------------------- |
| TypeScript correcto        | 8      | Interfaces definidas, tipos correctos |
| Componentes reutilizables  | 7      | SkillCard y ProjectCard implementados |
| Código limpio y organizado | 5      | Indentación, nombres descriptivos     |
| Comentarios explicativos   | 5      | Secciones comentadas adecuadamente    |

### Diseño y UX (25 puntos)

| Criterio             | Puntos | Descripción                          |
| -------------------- | ------ | ------------------------------------ |
| Estilos consistentes | 8      | TailwindCSS aplicado correctamente   |
| Diseño atractivo     | 8      | Colores, espaciado, jerarquía visual |
| Responsive           | 5      | Se ve bien en diferentes pantallas   |
| Detalles visuales    | 4      | Bordes, sombras, iconos apropiados   |

### Mejores Prácticas (10 puntos)

| Criterio                       | Puntos | Descripción                        |
| ------------------------------ | ------ | ---------------------------------- |
| SafeAreaView implementado      | 3      | Protección para notch/barra        |
| Arrays renderizados con .map() | 3      | No código duplicado manualmente    |
| Sin errores en consola         | 2      | App funciona sin warnings críticos |
| Estructura de carpetas         | 2      | Componentes en carpeta separada    |

### Creatividad y Extras (10 puntos)

| Criterio              | Puntos | Descripción                    |
| --------------------- | ------ | ------------------------------ |
| Personalización única | 5      | Diseño propio, no copia exacta |
| Desafíos opcionales   | 5      | Implementó mejoras adicionales |

**Total: 100 puntos**

---

## 📤 Forma de Entrega

### Requisitos de Entrega:

1. **Repositorio GitHub:**

   - Crear repositorio público: `bc-reactnative-semana01-proyecto`
   - Subir todo el código del proyecto
   - Incluir README con:
     - Screenshots de la app funcionando
     - Instrucciones de instalación
     - Tu nombre y fecha

2. **Screenshots:**

   - Tomar al menos 3 capturas de pantalla de la app
   - Mostrar: perfil, habilidades y proyectos
   - Guardar en carpeta `/screenshots` del repo

3. **Video (opcional pero recomendado):**
   - Grabar video corto (30-60 seg) de la app funcionando
   - Mostrar scroll y todas las secciones
   - Subir a Google Drive o similar y agregar link al README

### Envío:

**📧 Enviar por el canal de Slack/Discord:**

- Link del repositorio GitHub
- Breve descripción de lo que implementaste
- Mencionar si hiciste desafíos opcionales

**📅 Fecha límite:** [El instructor definirá en clase]

---

## 🐛 Troubleshooting

### Problemas Comunes:

**❌ Error: "Gradient not working"**

```
Solución: Los gradientes CSS no funcionan directamente en RN.
Usa colores sólidos o instalá react-native-linear-gradient.
Alternativa simple: Usa bg-blue-600 (color sólido).
```

**❌ Error: "Image not showing"**

```
Solución:
1. Verifica conexión a internet
2. Prueba con otra URL de imagen
3. Usa placeholder: https://i.pravatar.cc/150
```

**❌ TypeScript marca errores en components**

```
Solución:
1. Verifica que las interfaces estén bien definidas
2. Asegúrate de exportar los componentes con 'export function'
3. Importa correctamente: import { SkillCard } from './components/SkillCard'
```

**❌ Estilos TailwindCSS no funcionan**

```
Solución:
1. Revisa babel.config.js (debe tener plugin nativewind/babel)
2. Revisa tailwind.config.js (content debe incluir App.tsx y components/)
3. Reinicia servidor: Ctrl+C y pnpm start --clear
```

---

## 📚 Recursos de Ayuda

### Documentación:

- [React Native - Components](https://reactnative.dev/docs/components-and-apis)
- [TypeScript - Interfaces](https://www.typescriptlang.org/docs/handbook/interfaces.html)
- [NativeWind - Docs](https://www.nativewind.dev/)
- [TailwindCSS - Colors](https://tailwindcss.com/docs/customizing-colors)

### Inspiración de Diseño:

- [Dribbble - Profile Apps](https://dribbble.com/search/profile-app)
- [Behance - Mobile UI](https://www.behance.net/search/projects?search=mobile%20profile)

### Donde Conseguir Avatares:

- [Pravatar](https://pravatar.cc/) - Avatares aleatorios
- [UI Avatars](https://ui-avatars.com/) - Avatares generados
- [Unsplash](https://unsplash.com/) - Fotos reales

---

## ✅ Checklist Final

Antes de entregar, verifica:

### Funcionalidad:

- [ ] App corre sin errores con `pnpm start`
- [ ] Todas las secciones están implementadas
- [ ] Los datos son TUS DATOS REALES (no los del ejemplo)
- [ ] El scroll funciona correctamente
- [ ] Los componentes reutilizables están separados

### Código:

- [ ] TypeScript en todos los archivos
- [ ] Interfaces definidas correctamente
- [ ] Componentes exportados e importados bien
- [ ] Código comentado donde sea necesario
- [ ] Sin console.log() olvidados

### Diseño:

- [ ] Estilos aplicados consistentemente
- [ ] Colores armoniosos
- [ ] Espaciado apropiado (padding, margin)
- [ ] Se ve profesional y atractivo

### Entrega:

- [ ] Repositorio GitHub creado
- [ ] README con screenshots
- [ ] Código pusheado
- [ ] Link compartido en el canal

---

## 🎯 Consejos Finales

1. **Empieza simple:** Implementa primero lo básico, luego mejora
2. **Usa tus datos reales:** Hazlo personal y auténtico
3. **Itera:** Primera versión funcional, luego refina estilos
4. **Pide ayuda:** Si te atascas más de 15 min, pregunta
5. **Diviértete:** Este proyecto es TU portfolio personal

---

## 🌟 Inspiración

> "Tu primera app no tiene que ser perfecta, solo tiene que estar terminada."

Este proyecto será parte de tu portfolio. Ponle amor y creatividad. ¡Es TU carta de presentación como desarrollador React Native!

---

**🔜 Próxima Semana:** Navegación y Múltiples Pantallas

---

_Proyecto Integrador - Semana 1 - Fundamentos de React Native_  
_Bootcamp React Native 2025_
