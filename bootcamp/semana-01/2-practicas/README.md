# 💻 Prácticas Guiadas - Semana 1

**⏱️ Tiempo Total:** 2 horas presenciales + 1 hora autónoma  
**👥 Modalidad:** Prácticas con instrucciones paso a paso en clase

---

## 🎯 Objetivo General

Estas prácticas se realizan **EN CLASE** junto con el instructor. No son para trabajo autónomo. El objetivo es aplicar inmediatamente los conceptos teóricos vistos en la primera parte de la sesión.

---

## 📋 Estructura de las Prácticas

### 🎓 Presenciales (2 horas en clase)

| #   | Práctica                                                         | Duración | Enfoque                        |
| --- | ---------------------------------------------------------------- | -------- | ------------------------------ |
| 1   | [Mi Primera App - Perfil Personal](./practica-01-primera-app.md) | 45 min   | Componentes básicos + Layouts  |
| 2   | [Card Component Reutilizable](./practica-02-card-component.md)   | 45 min   | Props + TypeScript + Variantes |
| 3   | [Lista de Contactos (inicio)](./practica-03-lista-contactos.md)  | 20 min   | Arrays + FlatList              |

**Total presencial:** 1h 50min

### 🏠 Autónomo (1 hora en casa)

- **Completar Práctica 3** (30 min): Agregar búsqueda y más contactos
- **Desafíos adicionales** (30 min): Mejoras opcionales de las 3 prácticas

---

## 🎓 Dinámica de Clase

### Reglas Importantes:

1. ✅ **Seguir al instructor paso a paso** - No adelantarse
2. ✅ **Preguntar inmediatamente** si algo no funciona
3. ✅ **Todos al mismo ritmo** - Esperamos a que todos completen cada paso
4. ✅ **Checkpoints frecuentes** - Verificamos que todos vayan bien
5. ❌ **NO trabajar en autónomo durante clase** - Enfocarse en lo guiado

### Estructura de Cada Práctica:

```
1. Explicación (5 min) → Instructor muestra resultado final
2. Setup (5-10 min) → Todos configuran juntos
3. Desarrollo (20-30 min) → Codear paso a paso
4. Review (5 min) → Verificar y resolver dudas
```

---

## 📝 Prácticas Detalladas

### 1️⃣ Mi Primera App - Perfil Personal (45 min)

**📂 Archivo:** [practica-01-primera-app.md](./practica-01-primera-app.md)

**🎯 Objetivo:** Crear una pantalla de perfil con avatar, información personal y biografía.

**💡 Conceptos:**

- SafeAreaView y ScrollView
- View, Text, Image
- Layouts con Flexbox
- TailwindCSS básico
- Estilos de tarjetas y espaciado

**✅ Completarás:**

- Header con fondo de color
- Avatar circular centrado
- Nombre y profesión
- Card con información de contacto
- Sección "Sobre mí"

---

### 2️⃣ Card Component Reutilizable (45 min)

**📂 Archivo:** [practica-02-card-component.md](./practica-02-card-component.md)

**🎯 Objetivo:** Crear un componente Card que acepte props y tenga diferentes variantes.

**💡 Conceptos:**

- Componentes personalizados
- Props con TypeScript (interfaces)
- Props opcionales vs requeridos
- Variantes de componentes (default, featured, compact)
- Reutilización de componentes

**✅ Completarás:**

- Interface TypeScript para props
- Card component básico
- Variante "default"
- Variante "featured" (destacada)
- Variante "compact" (compacta)
- Usar el componente en múltiples lugares

---

### 3️⃣ Lista de Contactos (20 min presencial + 30 min autónomo)

**📂 Archivo:** [practica-03-lista-contactos.md](./practica-03-lista-contactos.md)

**🎯 Objetivo:**

- **En clase:** Renderizar una lista de contactos con FlatList
- **En casa:** Agregar búsqueda y más contactos

**💡 Conceptos:**

- Arrays de objetos
- Renderizar con `.map()`
- FlatList optimizado
- Interfaces TypeScript para datos
- **En casa:** useState para búsqueda
- **En casa:** `.filter()` para filtrar datos

**✅ En Clase (20 min):**

- Interface Contact
- Array de 5 contactos mock
- Renderizar con FlatList
- Estilos de cada item

**✅ En Casa (30 min):**

- Agregar 7 contactos más (total 12)
- Implementar TextInput para búsqueda
- Filtrar contactos en tiempo real
- Agregar contador de resultados

---

## 🏆 Criterios de Evaluación

### Presencial (Participación en clase):

- ✅ Seguir instrucciones del instructor
- ✅ Completar cada checkpoint
- ✅ Hacer preguntas cuando sea necesario
- ✅ Ayudar a compañeros si terminan antes
- ✅ App funcionando al final de cada práctica

### Autónomo (Tarea Práctica 3):

- ✅ Práctica 3 completada con búsqueda funcionando
- ✅ Mínimo 12 contactos en la lista
- ✅ Código limpio y comentado
- ✅ Sin errores en consola

---

## 🐛 Problemas Comunes

### Durante las Prácticas:

**❌ Error: "Cannot find module..."**

- ✅ Verifica que instalaste todas las dependencias con `pnpm install`

**❌ Los estilos TailwindCSS no funcionan**

- ✅ Revisa `babel.config.js` y `tailwind.config.js`
- ✅ Reinicia el servidor: Ctrl+C y `pnpm start`

**❌ La app no se actualiza en Expo Go**

- ✅ Agita el celular y presiona "Reload"
- ✅ Cierra y vuelve a abrir Expo Go

**❌ TypeScript marca errores**

- ✅ Asegúrate de haber definido las interfaces correctamente
- ✅ Verifica que los tipos de props coincidan

---

## 📱 Requisitos Técnicos

Antes de las prácticas, asegúrate de tener:

- ✅ Node.js 22.20+ instalado
- ✅ pnpm 9+ instalado
- ✅ Expo Go en tu celular
- ✅ VS Code con extensiones recomendadas
- ✅ Conexión a internet estable
- ✅ Celular y computadora en la misma red WiFi

---

## 🎯 Resultados de Aprendizaje

Al completar estas prácticas, serás capaz de:

1. ✅ Crear interfaces básicas con componentes de React Native
2. ✅ Aplicar estilos con TailwindCSS/NativeWind
3. ✅ Usar Flexbox para layouts responsivos
4. ✅ Crear componentes reutilizables con props
5. ✅ Definir interfaces TypeScript para props y datos
6. ✅ Renderizar listas con FlatList
7. ✅ Implementar búsqueda/filtrado en tiempo real
8. ✅ Manejar estado local con useState

---

## 📚 Recursos Adicionales

### Documentación Oficial:

- [React Native - Core Components](https://reactnative.dev/docs/components-and-apis)
- [React Native - FlatList](https://reactnative.dev/docs/flatlist)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/handbook/intro.html)
- [NativeWind Docs](https://www.nativewind.dev/)

### Cheat Sheets:

- [TailwindCSS Cheat Sheet](https://nerdcave.com/tailwind-cheat-sheet)
- [Flexbox Guide](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)

---

## 🔜 Siguiente Paso

Después de completar estas prácticas y la tarea autónoma, estarás listo para:

**📂 [Proyecto Integrador Semana 1](../3-proyecto/README.md)**

El proyecto integrador combina todos los conceptos vistos en teoría y prácticas para crear una aplicación más completa.

---

## ✅ Checklist de Completación

### Al Final de la Sesión Presencial:

- [ ] Práctica 1 completada y funcionando
- [ ] Práctica 2 completada con las 3 variantes
- [ ] Práctica 3 iniciada (lista básica renderizando)
- [ ] Código pusheado a GitHub personal
- [ ] Sin errores críticos en consola

### Para Entregar (Autónomo):

- [ ] Práctica 3 completada con búsqueda
- [ ] Mínimo 12 contactos en la lista
- [ ] Búsqueda funcionando en tiempo real
- [ ] Código limpio y comentado
- [ ] Screenshots de las 3 apps funcionando

---

**⏭️ Próxima sesión:** Navegación y Routing con React Navigation

---

_Documentación actualizada: 9 de octubre de 2025_  
_Versión: 2.0.0 (Reestructurado para modelo presencial)_
