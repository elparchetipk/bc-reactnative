# 💻 Práctica 3: Lista de Contactos

**⏱️ Duración:** 20 minutos presencial + 30 minutos autónomo  
**👥 Modalidad:** 🎓 **PRESENCIAL (inicio)** + 🏠 **AUTÓNOMO (completar)**  
**📊 Dificultad:** ⭐⭐ Intermedio  
**🎯 Conceptos:** Arrays, map(), FlatList, Estado local

---

## 🎯 Objetivo

**En clase (20 min):** Iniciarás la lista de contactos y aprenderás el renderizado de arrays siguiendo esta guía.  
**En casa (30 min):** Completarás la funcionalidad de búsqueda y agregarás más contactos.

---

## 📚 Conceptos que Veremos

### En Clase (Presencial):

- ✅ Renderizar arrays con `.map()`
- ✅ Usar `FlatList` para listas optimizadas
- ✅ Crear datos mock (contactos falsos)
- ✅ TypeScript interfaces para objetos

### En Casa (Autónomo):

- ✅ Implementar búsqueda/filtrado
- ✅ Agregar más contactos
- ✅ Personalizar estilos

---

## 🖼️ Resultado Esperado

```
┌─────────────────────────────┐
│ 👥 Mis Contactos (12)      │  ← Header
├─────────────────────────────┤
│                             │
│  ┌─────────────────────┐   │
│  │  👤  Juan Pérez    │→  │  ← Contacto 1
│  │      Frontend Dev   │   │
│  │      📱 555-0101   │   │
│  └─────────────────────┘   │
│                             │
│  ┌─────────────────────┐   │
│  │  👤  María López   │→  │  ← Contacto 2
│  │      Designer      │   │
│  │      📱 555-0102   │   │
│  └─────────────────────┘   │
│                             │
│  ┌─────────────────────┐   │
│  │  👤  Carlos Ruiz   │→  │  ← Contacto 3
│  │      Backend Dev   │   │
│  │      📱 555-0103   │   │
│  └─────────────────────┘   │
│                             │
│         ... más ...         │
│                             │
└─────────────────────────────┘
```

---

## 📋 Requisitos

### Funcionales:

- [ ] Mostrar lista de al menos 10 contactos
- [ ] Cada contacto muestra: avatar, nombre, profesión, teléfono
- [ ] Lista debe ser scrollable
- [ ] Al tocar un contacto, mostrar Alert con información
- [ ] Header con contador de contactos
- [ ] Búsqueda básica (opcional)

### Técnicos:

- [ ] Interface TypeScript para Contact
- [ ] Componente ContactCard reutilizable
- [ ] Datos mockups en un array
- [ ] Uso correcto de keys en listas
- [ ] TailwindCSS para estilos
- [ ] Código organizado en componentes

---

## 🚀 Paso a Paso

### Paso 1: Configuración Inicial (5 min)

```bash
# Crear proyecto
npx create-expo-app@latest practica-03-contactos --template blank-typescript
cd practica-03-contactos

# Instalar dependencias
pnpm add nativewind react-native-safe-area-context
pnpm add -D tailwindcss

# Configurar Tailwind
npx tailwindcss init
```

**Configurar `tailwind.config.js`, `babel.config.js` y `nativewind-env.d.ts` como en prácticas anteriores.**

### Paso 2: Definir el Modelo de Datos (5 min)

**`types/Contact.ts`:**

```typescript
/**
 * Interface Contact - Define la estructura de un contacto
 *
 * ¿Para qué? Asegurar que todos los contactos tengan la misma estructura
 * ¿Cómo? TypeScript interface con propiedades requeridas
 */
export interface Contact {
  id: number
  name: string
  profession: string
  phone: string
  email: string
  avatar: string
  company?: string // Opcional
}
```

### Paso 3: Crear Datos Mockup (5 min)

**`data/contacts.ts`:**

```typescript
import { Contact } from '../types/Contact'

/**
 * Contactos de ejemplo
 *
 * En una app real, estos datos vendrían de:
 * - API REST
 * - Base de datos local
 * - AsyncStorage
 */
export const contactsData: Contact[] = [
  {
    id: 1,
    name: 'Juan Pérez',
    profession: 'Frontend Developer',
    phone: '+52 555 0101',
    email: 'juan.perez@email.com',
    avatar: 'https://i.pravatar.cc/150?img=12',
    company: 'Tech Corp',
  },
  {
    id: 2,
    name: 'María López',
    profession: 'UX/UI Designer',
    phone: '+52 555 0102',
    email: 'maria.lopez@email.com',
    avatar: 'https://i.pravatar.cc/150?img=5',
    company: 'Design Studio',
  },
  {
    id: 3,
    name: 'Carlos Ruiz',
    profession: 'Backend Developer',
    phone: '+52 555 0103',
    email: 'carlos.ruiz@email.com',
    avatar: 'https://i.pravatar.cc/150?img=33',
    company: 'Tech Corp',
  },
  {
    id: 4,
    name: 'Ana García',
    profession: 'Product Manager',
    phone: '+52 555 0104',
    email: 'ana.garcia@email.com',
    avatar: 'https://i.pravatar.cc/150?img=9',
    company: 'StartupXYZ',
  },
  {
    id: 5,
    name: 'Luis Martínez',
    profession: 'DevOps Engineer',
    phone: '+52 555 0105',
    email: 'luis.martinez@email.com',
    avatar: 'https://i.pravatar.cc/150?img=15',
    company: 'Cloud Services',
  },
  {
    id: 6,
    name: 'Sofia Hernández',
    profession: 'Data Scientist',
    phone: '+52 555 0106',
    email: 'sofia.hernandez@email.com',
    avatar: 'https://i.pravatar.cc/150?img=20',
    company: 'AI Labs',
  },
  {
    id: 7,
    name: 'Diego Torres',
    profession: 'Mobile Developer',
    phone: '+52 555 0107',
    email: 'diego.torres@email.com',
    avatar: 'https://i.pravatar.cc/150?img=51',
    company: 'App Factory',
  },
  {
    id: 8,
    name: 'Laura Sánchez',
    profession: 'QA Engineer',
    phone: '+52 555 0108',
    email: 'laura.sanchez@email.com',
    avatar: 'https://i.pravatar.cc/150?img=32',
    company: 'Quality First',
  },
  {
    id: 9,
    name: 'Roberto Díaz',
    profession: 'Tech Lead',
    phone: '+52 555 0109',
    email: 'roberto.diaz@email.com',
    avatar: 'https://i.pravatar.cc/150?img=68',
    company: 'Tech Corp',
  },
  {
    id: 10,
    name: 'Patricia Morales',
    profession: 'Scrum Master',
    phone: '+52 555 0110',
    email: 'patricia.morales@email.com',
    avatar: 'https://i.pravatar.cc/150?img=24',
    company: 'Agile Team',
  },
  {
    id: 11,
    name: 'Fernando Castro',
    profession: 'Security Engineer',
    phone: '+52 555 0111',
    email: 'fernando.castro@email.com',
    avatar: 'https://i.pravatar.cc/150?img=70',
    company: 'CyberSec',
  },
  {
    id: 12,
    name: 'Gabriela Flores',
    profession: 'Marketing Manager',
    phone: '+52 555 0112',
    email: 'gabriela.flores@email.com',
    avatar: 'https://i.pravatar.cc/150?img=48',
    company: 'Growth Co',
  },
]
```

### Paso 4: Crear Componente ContactCard (10 min)

**`components/ContactCard.tsx`:**

```tsx
/**
 * ContactCard - Tarjeta individual de contacto
 *
 * ¿Para qué? Mostrar información de un contacto de forma visual
 * ¿Cómo? Recibe datos del contacto como props y los renderiza
 */
import { View, Text, Image, TouchableOpacity } from 'react-native'
import { Contact } from '../types/Contact'

interface ContactCardProps {
  contact: Contact
  onPress: (contact: Contact) => void
}

export function ContactCard({
  contact,
  onPress,
}: ContactCardProps): JSX.Element {
  return (
    <TouchableOpacity
      onPress={() => onPress(contact)}
      activeOpacity={0.7}
      className="bg-white mx-4 mb-3 p-4 rounded-xl shadow-sm border border-gray-100"
    >
      <View className="flex-row items-center">
        {/* Avatar */}
        <Image
          source={{ uri: contact.avatar }}
          className="w-16 h-16 rounded-full mr-4"
        />

        {/* Información */}
        <View className="flex-1">
          {/* Nombre */}
          <Text className="text-lg font-bold text-gray-900 mb-1">
            {contact.name}
          </Text>

          {/* Profesión */}
          <View className="flex-row items-center mb-1">
            <Text className="text-sm text-gray-600">
              💼 {contact.profession}
            </Text>
          </View>

          {/* Teléfono */}
          <View className="flex-row items-center">
            <Text className="text-sm text-gray-500">📱 {contact.phone}</Text>
          </View>
        </View>

        {/* Arrow indicator */}
        <Text className="text-gray-400 text-2xl ml-2">›</Text>
      </View>

      {/* Empresa (si existe) */}
      {contact.company && (
        <View className="mt-3 pt-3 border-t border-gray-100">
          <Text className="text-xs text-gray-500">🏢 {contact.company}</Text>
        </View>
      )}
    </TouchableOpacity>
  )
}
```

### Paso 5: Crear la Pantalla Principal (10 min)

**`App.tsx`:**

```tsx
import { ScrollView, View, Text, Alert } from 'react-native'
import { SafeAreaView } from 'react-native-safe-area-context'
import { ContactCard } from './components/ContactCard'
import { contactsData } from './data/contacts'
import { Contact } from './types/Contact'

export default function App(): JSX.Element {
  // Handler para cuando se presiona un contacto
  const handleContactPress = (contact: Contact): void => {
    Alert.alert(
      contact.name,
      `📱 ${contact.phone}\n📧 ${contact.email}\n💼 ${contact.profession}${
        contact.company ? `\n🏢 ${contact.company}` : ''
      }`,
      [
        {
          text: 'Llamar',
          onPress: () => console.log('Llamar:', contact.phone),
        },
        { text: 'Email', onPress: () => console.log('Email:', contact.email) },
        { text: 'Cerrar', style: 'cancel' },
      ]
    )
  }

  return (
    <SafeAreaView className="flex-1 bg-gray-50">
      {/* Header */}
      <View className="bg-blue-600 px-5 py-6">
        <View className="flex-row items-center justify-between">
          <View>
            <Text className="text-white text-3xl font-bold">Contactos</Text>
            <Text className="text-blue-100 mt-1">
              {contactsData.length} contactos guardados
            </Text>
          </View>
          <View className="bg-white/20 w-12 h-12 rounded-full items-center justify-center">
            <Text className="text-white text-2xl">👥</Text>
          </View>
        </View>
      </View>

      {/* Lista de contactos */}
      <ScrollView className="flex-1 pt-4">
        {contactsData.map((contact) => (
          <ContactCard
            key={contact.id}
            contact={contact}
            onPress={handleContactPress}
          />
        ))}

        {/* Footer */}
        <View className="items-center py-8">
          <Text className="text-gray-400 text-sm">Fin de la lista</Text>
        </View>
      </ScrollView>
    </SafeAreaView>
  )
}
```

### Paso 6: Agregar Búsqueda (5 min - Opcional)

Agregar estado y funcionalidad de búsqueda:

```tsx
import { useState } from 'react'
import { TextInput } from 'react-native'

export default function App(): JSX.Element {
  const [searchQuery, setSearchQuery] = useState<string>('')

  // Filtrar contactos según búsqueda
  const filteredContacts = contactsData.filter(
    (contact) =>
      contact.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
      contact.profession.toLowerCase().includes(searchQuery.toLowerCase())
  )

  return (
    <SafeAreaView className="flex-1 bg-gray-50">
      {/* Header */}
      <View className="bg-blue-600 px-5 py-6">
        {/* ... header existente ... */}

        {/* Barra de búsqueda */}
        <View className="mt-4">
          <TextInput
            value={searchQuery}
            onChangeText={setSearchQuery}
            placeholder="Buscar contactos..."
            placeholderTextColor="#93c5fd"
            className="bg-white/20 text-white px-4 py-3 rounded-lg"
          />
        </View>
      </View>

      {/* Lista de contactos filtrados */}
      <ScrollView className="flex-1 pt-4">
        {filteredContacts.length > 0 ? (
          filteredContacts.map((contact) => (
            <ContactCard
              key={contact.id}
              contact={contact}
              onPress={handleContactPress}
            />
          ))
        ) : (
          <View className="items-center justify-center py-20">
            <Text className="text-6xl mb-4">🔍</Text>
            <Text className="text-xl text-gray-500">
              No se encontraron contactos
            </Text>
          </View>
        )}
      </ScrollView>
    </SafeAreaView>
  )
}
```

---

## ✅ Solución Completa

La estructura final del proyecto:

```
practica-03-contactos/
├── components/
│   └── ContactCard.tsx
├── data/
│   └── contacts.ts
├── types/
│   └── Contact.ts
├── App.tsx
└── ... (archivos de config)
```

**Código completo en pasos anteriores.** ✓

---

## 🎨 Desafíos Adicionales

### Nivel 1: Mejoras Visuales

- [ ] Agregar indicador de contactos favoritos (estrella)
- [ ] Implementar diferentes colores de avatar según inicial del nombre
- [ ] Agregar badges para mostrar estado (online/offline)
- [ ] Mejorar el diseño con gradientes o sombras

### Nivel 2: Funcionalidad

- [ ] Implementar ordenamiento (por nombre, profesión, empresa)
- [ ] Agregar filtros por empresa
- [ ] Implementar secciones alfabéticas (A, B, C...)
- [ ] Agregar botones de acción rápida (llamar, email)

### Nivel 3: Avanzado

- [ ] Implementar FlatList en lugar de ScrollView para mejor performance
- [ ] Agregar paginación (cargar más contactos al hacer scroll)
- [ ] Implementar swipe para eliminar contacto
- [ ] Agregar formulario para crear nuevos contactos
- [ ] Persistir contactos con AsyncStorage

---

## 📝 Implementación con FlatList (Nivel 3)

**Por qué FlatList:**

- ✅ Mejor performance con listas largas (100+ items)
- ✅ Renderizado lazy (solo elementos visibles)
- ✅ Pull-to-refresh integrado
- ✅ Optimizado para móviles

```tsx
import { FlatList } from 'react-native'

export default function App(): JSX.Element {
  // ... estados ...

  return (
    <SafeAreaView className="flex-1 bg-gray-50">
      <View className="bg-blue-600 px-5 py-6">{/* Header */}</View>

      <FlatList
        data={filteredContacts}
        keyExtractor={(item) => item.id.toString()}
        renderItem={({ item }) => (
          <ContactCard contact={item} onPress={handleContactPress} />
        )}
        contentContainerClassName="pt-4"
        ListEmptyComponent={() => (
          <View className="items-center justify-center py-20">
            <Text className="text-6xl mb-4">🔍</Text>
            <Text className="text-xl text-gray-500">
              No se encontraron contactos
            </Text>
          </View>
        )}
        ListFooterComponent={() => (
          <View className="items-center py-8">
            <Text className="text-gray-400 text-sm">Fin de la lista</Text>
          </View>
        )}
      />
    </SafeAreaView>
  )
}
```

---

## 🧪 Testing

### Casos de Prueba:

```tsx
// Test 1: Lista vacía
const emptyList: Contact[] = []

// Test 2: Un solo contacto
const singleContact: Contact[] = [contactsData[0]]

// Test 3: Búsqueda que no da resultados
setSearchQuery('xyz123')

// Test 4: Contacto sin empresa
const noCompanyContact: Contact = {
  id: 99,
  name: 'Test User',
  profession: 'Tester',
  phone: '+00 000 0000',
  email: 'test@test.com',
  avatar: 'https://i.pravatar.cc/150?img=1',
  // company: undefined
}

// Test 5: Nombre muy largo
const longNameContact: Contact = {
  ...contactsData[0],
  name: 'Juan Pérez García Rodríguez Martínez López',
}
```

---

## 🐛 Problemas Comunes y Soluciones

### Problema 1: Warning sobre keys en listas

**Causa:** No usar prop `key` único en elementos de lista

**Solución:**

```tsx
// ✅ BIEN: Usar ID único
{
  contacts.map((contact) => <ContactCard key={contact.id} contact={contact} />)
}

// ❌ MAL: Usar index
{
  contacts.map((contact, index) => (
    <ContactCard key={index} contact={contact} />
  ))
}
```

### Problema 2: Imágenes no cargan

**Causa:** URLs inválidas o sin conexión

**Solución:**

```tsx
// Agregar fallback con avatar de iniciales
{
  contact.avatar ? (
    <Image source={{ uri: contact.avatar }} />
  ) : (
    <View className="w-16 h-16 bg-blue-500 rounded-full items-center justify-center">
      <Text className="text-white font-bold text-xl">
        {contact.name.charAt(0)}
      </Text>
    </View>
  )
}
```

### Problema 3: ScrollView lento con muchos contactos

**Causa:** Renderiza todos los elementos a la vez

**Solución:** Usar FlatList (ver sección anterior)

### Problema 4: Búsqueda con acentos

**Causa:** 'José' no coincide con 'jose'

**Solución:**

```typescript
// Función para normalizar texto
const normalizeText = (text: string): string => {
  return text
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
}

// Usar en filtro
const filteredContacts = contacts.filter((contact) =>
  normalizeText(contact.name).includes(normalizeText(searchQuery))
)
```

---

## ✅ Checklist de Verificación

- [ ] Lista muestra todos los contactos
- [ ] Cada contacto tiene toda la información visible
- [ ] Avatares se cargan correctamente
- [ ] ScrollView funciona suavemente
- [ ] Al tocar un contacto, muestra el Alert correcto
- [ ] Búsqueda filtra correctamente
- [ ] No hay warnings en la consola
- [ ] El código usa TypeScript correctamente
- [ ] Los componentes están bien organizados
- [ ] Funciona en diferentes tamaños de pantalla

---

## 📚 Recursos

### Documentación

- [ScrollView vs FlatList](https://reactnative.dev/docs/scrollview#flatlist)
- [Array.map()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)
- [Array.filter()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter)
- [Keys in Lists](https://react.dev/learn/rendering-lists#keeping-list-items-in-order-with-key)

### Datos de Prueba

- [Random User API](https://randomuser.me/) - API para generar usuarios
- [JSONPlaceholder](https://jsonplaceholder.typicode.com/) - API de prueba
- [Pravatar](https://pravatar.cc/) - Avatares aleatorios

---

## 🎉 ¡Felicitaciones!

Has creado una lista de contactos funcional. Ahora sabes:

- ✅ Trabajar con arrays de datos
- ✅ Renderizar listas con `.map()`
- ✅ Filtrar datos con búsqueda
- ✅ Pasar datos entre componentes con props
- ✅ Usar keys correctamente en listas
- ✅ Organizar código en múltiples archivos
- ✅ Manejar eventos en listas

**Siguiente paso:** [Práctica 4 - Formulario de Login](./practica-04-formulario-login.md)

---

**Tiempo estimado completado:** 40 minutos ✓
