# 💡 Ejemplos de Datos para Tu Proyecto

Este archivo contiene ejemplos de cómo estructurar tus datos personales. **NO COPIES exactamente estos datos**, úsalos como inspiración para crear los TUYOS.

---

## 👤 Ejemplo 1: Desarrollador Frontend

```typescript
const personalInfo = {
  name: 'María González',
  title: 'Desarrolladora Frontend Junior',
  avatar: 'https://i.pravatar.cc/150?img=47',
  bio: 'Apasionada por crear interfaces hermosas y funcionales. Recientemente completé el bootcamp de React Native y estoy emocionada por construir aplicaciones móviles que mejoren la vida de las personas.',
}

const contacts: ContactInfo[] = [
  { icon: '📧', label: 'Email', value: 'maria.gonzalez@email.com' },
  { icon: '📍', label: 'Ubicación', value: 'Bogotá, Colombia' },
  { icon: '💼', label: 'LinkedIn', value: 'linkedin.com/in/mariagonzalez' },
]

const skills: Skill[] = [
  { id: '1', emoji: '⚛️', name: 'React Native' },
  { id: '2', emoji: '🎨', name: 'TailwindCSS' },
  { id: '3', emoji: '📘', name: 'TypeScript' },
  { id: '4', emoji: '📱', name: 'Expo' },
  { id: '5', emoji: '🔥', name: 'JavaScript ES6+' },
  { id: '6', emoji: '🌐', name: 'HTML & CSS' },
]

const projects: Project[] = [
  {
    id: '1',
    emoji: '🛒',
    title: 'E-commerce App',
    description:
      'Aplicación de tienda en línea con carrito de compras y pasarela de pagos',
    tags: ['React Native', 'Stripe'],
  },
  {
    id: '2',
    emoji: '📚',
    title: 'Biblioteca Personal',
    description:
      'App para organizar tu colección de libros con búsqueda y favoritos',
    tags: ['React Native', 'SQLite'],
  },
  {
    id: '3',
    emoji: '🍕',
    title: 'Food Delivery Clone',
    description:
      'Clon de app de delivery con menús, pedidos y tracking en tiempo real',
    tags: ['React Native', 'Firebase'],
  },
]
```

---

## 👨‍💻 Ejemplo 2: Desarrollador Full Stack

```typescript
const personalInfo = {
  name: 'Carlos Ramírez',
  title: 'Full Stack Developer',
  avatar: 'https://i.pravatar.cc/150?img=12',
  bio: 'Desarrollador con 2 años de experiencia en Node.js y React. Actualmente expandiendo mis habilidades al mundo móvil con React Native. Me encanta resolver problemas complejos y optimizar código.',
}

const contacts: ContactInfo[] = [
  { icon: '📧', label: 'Email', value: 'carlos.dev@gmail.com' },
  { icon: '🌍', label: 'Ubicación', value: 'Medellín, Colombia' },
  { icon: '💻', label: 'GitHub', value: 'github.com/carlosdev' },
  { icon: '🐦', label: 'Twitter', value: '@carlosdev' },
]

const skills: Skill[] = [
  { id: '1', emoji: '⚛️', name: 'React Native' },
  { id: '2', emoji: '🟢', name: 'Node.js' },
  { id: '3', emoji: '🐘', name: 'PostgreSQL' },
  { id: '4', emoji: '🔥', name: 'Express.js' },
  { id: '5', emoji: '📘', name: 'TypeScript' },
  { id: '6', emoji: '🐳', name: 'Docker' },
  { id: '7', emoji: '🔐', name: 'JWT & Auth' },
  { id: '8', emoji: '☁️', name: 'AWS' },
]

const projects: Project[] = [
  {
    id: '1',
    emoji: '💬',
    title: 'Chat en Tiempo Real',
    description:
      'Aplicación de mensajería instantánea con WebSockets y notificaciones push',
    tags: ['React Native', 'Socket.io', 'Node.js'],
  },
  {
    id: '2',
    emoji: '🏋️',
    title: 'Fitness Tracker',
    description:
      'App para registrar entrenamientos, calorías y progreso físico',
    tags: ['React Native', 'Charts', 'SQLite'],
  },
  {
    id: '3',
    emoji: '🎵',
    title: 'Music Player',
    description:
      'Reproductor de música offline con listas de reproducción personalizadas',
    tags: ['React Native', 'Audio API'],
  },
  {
    id: '4',
    emoji: '🗺️',
    title: 'Travel Planner',
    description:
      'Planificador de viajes con mapas, itinerarios y recomendaciones',
    tags: ['React Native', 'Maps', 'Firebase'],
  },
]
```

---

## 🎓 Ejemplo 3: Estudiante/Aprendiz

```typescript
const personalInfo = {
  name: 'Ana Martínez',
  title: 'Estudiante de Desarrollo Mobile',
  avatar: 'https://i.pravatar.cc/150?img=25',
  bio: 'Estudiante apasionada por la tecnología móvil. Cursando bootcamp de React Native y buscando mi primera oportunidad como desarrolladora. Me encanta aprender y enfrentar nuevos desafíos cada día.',
}

const contacts: ContactInfo[] = [
  { icon: '📧', label: 'Email', value: 'ana.martinez.dev@email.com' },
  { icon: '📍', label: 'Ubicación', value: 'Cali, Colombia' },
  { icon: '🔗', label: 'Portfolio', value: 'anamartinez.dev' },
]

const skills: Skill[] = [
  { id: '1', emoji: '⚛️', name: 'React Native (Aprendiendo)' },
  { id: '2', emoji: '📘', name: 'TypeScript (Básico)' },
  { id: '3', emoji: '🎨', name: 'TailwindCSS' },
  { id: '4', emoji: '📱', name: 'Expo' },
  { id: '5', emoji: '💻', name: 'HTML & CSS' },
  { id: '6', emoji: '🔧', name: 'Git & GitHub' },
]

const projects: Project[] = [
  {
    id: '1',
    emoji: '✅',
    title: 'Mi Primera TODO App',
    description:
      'Aplicación de lista de tareas con funcionalidad CRUD y almacenamiento local',
    tags: ['React Native', 'AsyncStorage'],
  },
  {
    id: '2',
    emoji: '📝',
    title: 'Notas Rápidas',
    description: 'App para tomar notas rápidas con categorías y búsqueda',
    tags: ['React Native', 'TypeScript'],
  },
  {
    id: '3',
    emoji: '🎨',
    title: 'Galería de Fotos',
    description: 'App para visualizar y organizar fotos del dispositivo',
    tags: ['React Native', 'Expo ImagePicker'],
  },
]
```

---

## 🎨 Ejemplo 4: Diseñador UI/UX que aprende desarrollo

```typescript
const personalInfo = {
  name: 'Luis Fernández',
  title: 'UI/UX Designer & Desarrollador Mobile Junior',
  avatar: 'https://i.pravatar.cc/150?img=68',
  bio: 'Diseñador UI/UX con 3 años de experiencia ahora aprendiendo a convertir mis diseños en aplicaciones reales. Amante del buen diseño, las animaciones sutiles y las interfaces intuitivas.',
}

const contacts: ContactInfo[] = [
  { icon: '📧', label: 'Email', value: 'luis.design@email.com' },
  { icon: '📍', label: 'Ubicación', value: 'Ciudad de México, México' },
  { icon: '🎨', label: 'Behance', value: 'behance.net/luisdesign' },
  { icon: '💼', label: 'Dribbble', value: 'dribbble.com/luisf' },
]

const skills: Skill[] = [
  { id: '1', emoji: '🎨', name: 'UI/UX Design' },
  { id: '2', emoji: '✏️', name: 'Figma' },
  { id: '3', emoji: '⚛️', name: 'React Native' },
  { id: '4', emoji: '🎭', name: 'Prototyping' },
  { id: '5', emoji: '🌈', name: 'Color Theory' },
  { id: '6', emoji: '📱', name: 'Mobile Design' },
  { id: '7', emoji: '✨', name: 'Animations' },
  { id: '8', emoji: '📘', name: 'TypeScript' },
]

const projects: Project[] = [
  {
    id: '1',
    emoji: '🏠',
    title: 'Real Estate App',
    description:
      'App de bienes raíces con galería de fotos, mapas y filtros avanzados',
    tags: ['React Native', 'Design System'],
  },
  {
    id: '2',
    emoji: '☕',
    title: 'Coffee Shop Loyalty',
    description:
      'App de lealtad para cafetería con recompensas y pedidos móviles',
    tags: ['React Native', 'Animations'],
  },
  {
    id: '3',
    emoji: '💰',
    title: 'Personal Finance',
    description: 'App de finanzas personales con gráficas y presupuestos',
    tags: ['React Native', 'Charts'],
  },
]
```

---

## 🚀 Ejemplo 5: Career Changer (Cambio de Carrera)

```typescript
const personalInfo = {
  name: 'Patricia Rojas',
  title: 'Desarrolladora Mobile en Formación',
  avatar: 'https://i.pravatar.cc/150?img=44',
  bio: 'Después de 5 años en marketing digital, decidí dar el salto al desarrollo de software. Combinando mi experiencia en UX y análisis de datos con mis nuevas habilidades en React Native para crear apps que realmente importan.',
}

const contacts: ContactInfo[] = [
  { icon: '📧', label: 'Email', value: 'patricia.rojas.dev@email.com' },
  { icon: '📍', label: 'Ubicación', value: 'Buenos Aires, Argentina' },
  { icon: '💼', label: 'LinkedIn', value: 'linkedin.com/in/patriciarojas' },
  { icon: '📝', label: 'Blog', value: 'patriciarodev.blog' },
]

const skills: Skill[] = [
  { id: '1', emoji: '⚛️', name: 'React Native' },
  { id: '2', emoji: '📊', name: 'Data Analysis' },
  { id: '3', emoji: '🎯', name: 'UX Research' },
  { id: '4', emoji: '📱', name: 'Mobile First Design' },
  { id: '5', emoji: '📘', name: 'TypeScript' },
  { id: '6', emoji: '📈', name: 'Analytics' },
]

const projects: Project[] = [
  {
    id: '1',
    emoji: '📊',
    title: 'Analytics Dashboard',
    description:
      'Dashboard móvil para visualizar métricas de marketing en tiempo real',
    tags: ['React Native', 'Charts', 'API'],
  },
  {
    id: '2',
    emoji: '🎯',
    title: 'Habit Tracker',
    description:
      'App para seguir hábitos diarios con estadísticas y motivación',
    tags: ['React Native', 'Gamification'],
  },
  {
    id: '3',
    emoji: '🛍️',
    title: 'Price Comparison',
    description: 'App para comparar precios de productos en diferentes tiendas',
    tags: ['React Native', 'Web Scraping'],
  },
]
```

---

## 💡 Ideas de Habilidades por Categoría

### Frontend

- ⚛️ React / React Native
- 🎨 TailwindCSS / CSS
- 📘 TypeScript / JavaScript
- 🖼️ HTML5
- 🎭 Sass / SCSS
- ✨ Animations (Framer Motion, React Spring)

### Backend

- 🟢 Node.js
- 🔥 Express.js
- 🐍 Python
- ☕ Java
- 🔷 C#
- 🐘 PHP

### Bases de Datos

- 🍃 MongoDB
- 🐘 PostgreSQL
- 🔵 MySQL
- 🔴 Redis
- 🔥 Firebase Firestore
- 💾 SQLite

### DevOps & Tools

- 🐳 Docker
- ☁️ AWS / Azure / GCP
- 🔧 Git & GitHub
- 🚀 CI/CD
- 📦 npm / yarn / pnpm
- 🔐 JWT & Auth

### Design & UX

- 🎨 Figma
- ✏️ Adobe XD
- 🖌️ Sketch
- 🎭 Prototyping
- 🌈 Color Theory
- 📱 Mobile Design
- 💻 Responsive Design

### Otras Habilidades

- 📊 Data Analysis
- 🤖 Machine Learning (básico)
- 🌐 APIs REST
- 🔌 GraphQL
- 🧪 Testing (Jest, RTL)
- 📈 SEO
- ♿ Accesibilidad

---

## 🎯 Ideas de Proyectos por Categoría

### E-commerce / Retail

- 🛒 Tienda en línea
- 💳 Sistema de pagos
- 📦 Tracking de pedidos
- 🎁 Lista de deseos
- 🔍 Comparador de precios

### Redes Sociales

- 📱 Red social simple
- 💬 Chat en tiempo real
- 📸 Compartir fotos/videos
- 👥 Sistema de amigos/seguidores
- 💌 Sistema de mensajería

### Productividad

- ✅ TODO List avanzada
- 📝 App de notas
- 📅 Calendario/Agenda
- ⏰ Pomodoro Timer
- 🎯 Gestor de objetivos

### Salud & Fitness

- 🏋️ Contador de calorías
- 💪 Seguimiento de ejercicios
- 💧 Recordatorio de agua
- 😴 Sleep tracker
- 🧘 Meditación/Mindfulness

### Entretenimiento

- 🎵 Reproductor de música
- 🎬 Lista de películas/series
- 📚 Biblioteca personal
- 🎮 Catálogo de videojuegos
- 🎨 Galería de arte

### Educación

- 📖 App de aprendizaje
- 🧠 Flashcards
- 📊 Seguimiento de progreso
- 🎓 Cursos online
- 📝 Toma de notas académicas

### Viajes & Mapas

- 🗺️ Planificador de viajes
- ✈️ Bucket list de destinos
- 📍 Lugares visitados
- 💰 Calculadora de gastos de viaje
- 📷 Diario de viaje con fotos

### Finanzas

- 💰 Control de gastos
- 📊 Presupuesto personal
- 💳 Gestor de tarjetas
- 📈 Seguimiento de inversiones
- 🧾 Escáner de recibos

---

## ✨ Tips para Personalizar Tu Proyecto

1. **Usa emojis relevantes:** Elige emojis que representen bien tus skills y proyectos
2. **Sé auténtico:** Escribe tu bio con tu propia voz
3. **Proyectos reales:** Si tienes proyectos reales, úsalos. Si no, describe proyectos que QUIERES hacer
4. **Datos actuales:** Usa tu email real, ubicación real, links reales
5. **Agregar contexto:** En la descripción de proyectos, menciona qué problema resuelven
6. **Nivel de experiencia:** Es OK ser honesto si eres principiante ("Aprendiendo", "Básico", "Junior")

---

## 🚫 Evita Estos Errores

❌ Copiar exactamente los datos de ejemplo  
❌ Usar "Lorem ipsum" o textos placeholder  
❌ Mentir sobre tus habilidades o experiencia  
❌ Dejar emails o links de ejemplo (nombre@ejemplo.com)  
❌ Usar avatares de ejemplo en producción  
❌ Listar habilidades que no conoces en absoluto

✅ Sé honesto sobre tu nivel  
✅ Usa tus datos reales  
✅ Describe proyectos que has hecho o quieres hacer  
✅ Muestra tu personalidad única

---

**Recuerda:** Este proyecto es TU portfolio personal. Hazlo único, auténtico y profesional.
