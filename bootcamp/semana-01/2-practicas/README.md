# Prácticas Guiadas - Semana 1

**Duración estimada:** 2-3 horas  
**Modalidad:** Práctica hands-on  
**Prerequisitos:** Haber completado la teoría de la semana 1

---

## 🎯 Objetivos

Las prácticas guiadas te permitirán:

- ✅ Aplicar los conceptos teóricos en ejercicios reales
- ✅ Desarrollar habilidades de resolución de problemas
- ✅ Familiarizarte con patrones comunes de React Native
- ✅ Construir componentes reutilizables y profesionales
- ✅ Practicar TypeScript y TailwindCSS en contexto real

---

## 📚 Lista de Prácticas

### Práctica 1: Mi Primera App (30 minutos)

**Archivo:** [practica-01-primera-app.md](./practica-01-primera-app.md)

**Conceptos:**

- Crear proyecto con Expo
- Estructura de archivos básica
- Componentes View, Text, Image
- Estilos con TailwindCSS

**Resultado:** App de perfil personal con foto, nombre y descripción

---

### Práctica 2: Componente Card Reutilizable (30 minutos)

**Archivo:** [practica-02-card-component.md](./practica-02-card-component.md)

**Conceptos:**

- Props y TypeScript interfaces
- Componentes reutilizables
- Layouts con Flexbox
- Estilos condicionales

**Resultado:** Componente Card con variantes (default, featured, compact)

---

### Práctica 3: Lista de Contactos (40 minutos)

**Archivo:** [practica-03-lista-contactos.md](./practica-03-lista-contactos.md)

**Conceptos:**

- ScrollView y renderizado de listas
- Manejo de arrays de datos
- Componentes anidados
- TouchableOpacity para interacción

**Resultado:** Lista de contactos con avatares y acciones

---

### Práctica 4: Formulario de Login (40 minutos)

**Archivo:** [practica-04-formulario-login.md](./practica-04-formulario-login.md)

**Conceptos:**

- TextInput controlado con useState
- Validación de formularios
- Manejo de eventos
- Feedback visual de errores

**Resultado:** Pantalla de login funcional con validación

---

### Práctica 5: Contador Interactivo (30 minutos)

**Archivo:** [practica-05-contador-interactivo.md](./practica-05-contador-interactivo.md)

**Conceptos:**

- useState para estado local
- Eventos onPress
- Actualización de estado
- Estilos dinámicos

**Resultado:** Contador con incremento, decremento y reset

---

### Práctica 6: TODO List (50 minutos)

**Archivo:** [practica-06-todo-list.md](./practica-06-todo-list.md)

**Conceptos:**

- Estado complejo (array de objetos)
- CRUD operations
- useEffect para logging
- Renderizado condicional

**Resultado:** App de tareas completa con agregar, completar y eliminar

---

## 📊 Distribución de Tiempo

| Práctica            | Tiempo Estimado | Dificultad     | Conceptos Clave       |
| ------------------- | --------------- | -------------- | --------------------- |
| 1. Primera App      | 30 min          | ⭐ Fácil       | Componentes básicos   |
| 2. Card Component   | 30 min          | ⭐⭐ Medio     | Props, reutilización  |
| 3. Lista Contactos  | 40 min          | ⭐⭐ Medio     | Arrays, ScrollView    |
| 4. Formulario Login | 40 min          | ⭐⭐⭐ Difícil | Validación, estado    |
| 5. Contador         | 30 min          | ⭐ Fácil       | useState, eventos     |
| 6. TODO List        | 50 min          | ⭐⭐⭐ Difícil | Estado complejo, CRUD |
| **TOTAL**           | **3h 40min**    |                |                       |

---

## 🛠️ Metodología de Trabajo

### Paso 1: Leer el Ejercicio

- Lee completamente la descripción
- Identifica los conceptos a aplicar
- Revisa los mockups o capturas de pantalla

### Paso 2: Planificar

- Identifica componentes necesarios
- Define el estado que necesitas
- Piensa en la estructura de archivos

### Paso 3: Implementar

- Sigue los pasos guiados
- Implementa una funcionalidad a la vez
- Prueba cada paso antes de continuar

### Paso 4: Validar

- Compara con la solución propuesta
- Verifica que cumple los requisitos
- Prueba casos extremos (edge cases)

### Paso 5: Mejorar

- Implementa los desafíos adicionales
- Refactoriza para mejor legibilidad
- Agrega tus propias mejoras

---

## 📁 Estructura de Cada Práctica

Cada archivo de práctica contiene:

```markdown
# Título de la Práctica

## 🎯 Objetivo

Descripción clara de qué construirás

## 📚 Conceptos a Aplicar

Lista de conceptos teóricos

## 🖼️ Resultado Esperado

Mockup o descripción visual

## 📋 Requisitos

Lista de funcionalidades obligatorias

## 🚀 Paso a Paso

Guía detallada para implementar

## ✅ Solución Completa

Código completo comentado

## 🎨 Desafíos Adicionales

Mejoras opcionales para practicar más

## 📚 Recursos

Links a documentación relevante
```

---

## 💡 Consejos Generales

### Para Aprovechar las Prácticas:

1. **No copies y pegues inmediatamente**

   - Intenta implementar primero por tu cuenta
   - Usa la solución como referencia si te atoras

2. **Experimenta con variaciones**

   - Cambia colores, tamaños, textos
   - Prueba diferentes layouts
   - Agrega tus propias funcionalidades

3. **Lee los comentarios del código**

   - Los comentarios explican el "por qué"
   - Contienen tips y mejores prácticas

4. **Consulta la documentación**

   - Usa los recursos proporcionados
   - Investiga más sobre los conceptos

5. **Comparte tus dudas**
   - Pregunta en clase o foros
   - Ayuda a otros compañeros

---

## 🔧 Configuración Inicial

Antes de comenzar las prácticas, asegúrate de tener:

### ✅ Checklist Pre-Prácticas

- [ ] Node.js 22.20+ instalado
- [ ] pnpm instalado globalmente
- [ ] Expo CLI configurado
- [ ] VS Code con extensiones requeridas
- [ ] Expo Go en tu dispositivo móvil
- [ ] Proyecto de Expo creado y funcionando
- [ ] NativeWind configurado correctamente

### Crear Proyecto Base (si no lo has hecho)

```bash
# Crear nuevo proyecto
npx create-expo-app@latest semana-01-practicas --template blank-typescript

# Entrar al directorio
cd semana-01-practicas

# Instalar NativeWind
pnpm add nativewind
pnpm add -D tailwindcss

# Inicializar Tailwind
npx tailwindcss init

# Ejecutar proyecto
pnpm start
```

---

## 📖 Orden Recomendado

### Ruta de Aprendizaje Sugerida:

#### Para Principiantes:

1. Práctica 1: Primera App (calentamiento)
2. Práctica 5: Contador (estado básico)
3. Práctica 2: Card Component (componentes)
4. Práctica 3: Lista Contactos (listas)
5. Práctica 4: Formulario Login (formularios)
6. Práctica 6: TODO List (integración)

#### Para Intermedios:

- Todas en orden numérico
- Salta los pasos básicos si ya los dominas
- Enfócate en los desafíos adicionales

---

## 🎯 Criterios de Éxito

Has completado exitosamente las prácticas si:

- ✅ Cada app funciona sin errores
- ✅ El código usa TypeScript correctamente
- ✅ Los estilos usan TailwindCSS (NativeWind)
- ✅ Sigues las mejores prácticas de React Native
- ✅ El código está limpio y bien comentado
- ✅ Entiendes qué hace cada línea de código

---

## 🚨 Solución de Problemas Comunes

### Error: "NativeWind classes not working"

```bash
# Solución: Limpiar caché y reiniciar
pnpm start --clear
```

### Error: "Cannot find module"

```bash
# Solución: Reinstalar dependencias
rm -rf node_modules
pnpm install
```

### Error: TypeScript types

```bash
# Solución: Verificar nativewind-env.d.ts existe
# Reiniciar TypeScript server en VS Code: Cmd+Shift+P → "Restart TS Server"
```

---

## 📚 Recursos Complementarios

### Documentación Oficial

- [React Native Docs](https://reactnative.dev/docs/getting-started)
- [Expo Documentation](https://docs.expo.dev/)
- [NativeWind Docs](https://www.nativewind.dev/)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/handbook/intro.html)

### Herramientas Útiles

- [React DevTools](https://reactnative.dev/docs/debugging#react-devtools)
- [Expo Snack](https://snack.expo.dev/) - Editor online
- [Tailwind Cheat Sheet](https://nerdcave.com/tailwind-cheat-sheet)

---

## 🔗 Navegación

- ⬅️ [Volver a teoría](../1-teoria/README.md)
- ➡️ [Proyecto integrador](../3-proyecto/README.md)
- 🏠 [Inicio Semana 1](../README.md)

---

**¡Buena suerte con las prácticas! 🚀**

Recuerda: **La práctica hace al maestro**. No te desanimes si algo no funciona a la primera. Debugging es parte fundamental del aprendizaje en programación.
