# 💻 Prácticas Guiadas - Semana 1

**✨ NUEVO ENFOQUE - Prácticas Presenciales Guiadas**

**⏱️ Duración:** 2 horas (PRESENCIAL)  
**Modalidad:** Instructor guía paso a paso, TODOS codean juntos  
**Prerequisitos:** Haber completado las 3 sesiones de teoría

---

## 🎯 Objetivo de las Prácticas Presenciales

**NO son tutoriales para hacer solo.** Son ejercicios que haremos **TODOS JUNTOS en clase** con el instructor:

✅ El instructor escribe código en vivo  
✅ TODOS siguen el mismo ritmo  
✅ Resolvemos dudas en tiempo real  
✅ Nadie se queda atrás  
✅ Aprendemos de los errores juntos

---

## 📊 Nueva Estructura (3 Prácticas Guiadas)

### ⏱️ Distribución del Tiempo Presencial

| Práctica                 | Tiempo | Modalidad           | Dificultad        |
| ------------------------ | ------ | ------------------- | ----------------- |
| **1. Card de Perfil**    | 45 min | Guiada en clase     | ⭐ Fácil          |
| **2. Lista Interactiva** | 45 min | Guiada en clase     | ⭐⭐ Medio        |
| **3. Mini TODO List**    | 30 min | Guiada en clase     | ⭐⭐⭐ Medio-Alto |
| **TOTAL**                | **2h** | **100% presencial** |                   |

---

## 📚 Prácticas Presenciales Guiadas

### Práctica 1: Card de Perfil Completa (45 min)

**📁 Archivo:** [practica-01-card-perfil.md](./practica-01-card-perfil.md)

**🎯 Qué haremos TODOS JUNTOS:**

1. Crear proyecto desde cero
2. Configurar NativeWind paso a paso
3. Construir layout con header + avatar superpuesto
4. Agregar información de contacto
5. Aplicar estilos profesionales

**Componentes que usaremos:**

- View (containers)
- Text (títulos, descripciones)
- Image (avatar circular)
- ScrollView (contenido scrollable)

**Resultado final:**

```
┌──────────────────┐
│   Header Azul    │
│      Avatar      │ ← Circular superpuesto
│   Nombre Grande  │
│   Profesión      │
│                  │
│ 📧 Email         │
│ 📱 Teléfono     │
│ 📍 Ubicación    │
│                  │
│ [Acerca de mí]   │
└──────────────────┘
```

**⏱️ Desglose:**

- 10 min: Setup proyecto + NativeWind
- 15 min: Header + Avatar
- 10 min: Información de contacto
- 10 min: Estilos finales y ajustes

---

### Práctica 2: Lista de Contactos Interactiva (45 min)

**📁 Archivo:** [practica-02-lista-contactos.md](./practica-02-lista-contactos.md)

**🎯 Qué haremos TODOS JUNTOS:**

1. Crear array de datos (6-8 contactos)
2. Renderizar lista con .map()
3. Crear componente ContactCard
4. Agregar TouchableOpacity para interacción
5. Mostrar Alert al presionar contacto

**Componentes que usaremos:**

- ScrollView (lista scrollable)
- TouchableOpacity (cards presionables)
- Alert (mostrar información)
- Array.map() (renderizar múltiples items)

**Resultado final:**

```
┌────────────────────┐
│ 👥 Contactos (8)  │
├────────────────────┤
│ [Avatar] Juan P.  →│
│         Developer  │
├────────────────────┤
│ [Avatar] María L. →│
│         Designer   │
├────────────────────┤
│ [Avatar] Carlos R.→│
│         Backend    │
└────────────────────┘
```

**⏱️ Desglose:**

- 10 min: Crear datos mock
- 15 min: Componente ContactCard
- 10 min: Renderizar lista con .map()
- 10 min: Agregar interacción y Alert

---

### Práctica 3: Mini TODO List (30 min)

**📁 Archivo:** [practica-03-mini-todo.md](./practica-03-mini-todo.md)

**🎯 Qué haremos TODOS JUNTOS:**

1. Crear estado para array de tareas
2. Input + botón para agregar tarea
3. Renderizar lista de tareas
4. Marcar como completada (toggle)
5. Eliminar tarea

**Componentes que usaremos:**

- useState (estado complejo)
- TextInput (agregar tarea)
- TouchableOpacity (checkbox custom)
- Array operations (add, update, delete)

**Resultado final:**

```
┌──────────────────────┐
│ Mis Tareas 📝       │
│ [Input] [+Agregar]   │
├──────────────────────┤
│ ☑ Tarea completada  │
│ □ Tarea pendiente   │
│ □ Otra tarea        │
└──────────────────────┘
```

**⏱️ Desglose:**

- 5 min: Setup estado y input
- 10 min: Agregar tareas
- 10 min: Toggle completado
- 5 min: Eliminar tareas

---

## 🎓 Metodología de la Clase Presencial

### Cómo Funcionan las Prácticas Guiadas:

#### 1. **Instructor Proyecta su Pantalla**

- Escribimos código todos juntos
- Explicamos cada línea antes de escribirla
- Vemos el resultado inmediato en Expo Go

#### 2. **Todos Siguen el Mismo Ritmo**

- Nadie avanza solo
- Esperamos a que todos tengan el código funcionando
- Resolvemos errores en grupo

#### 3. **Debugging en Vivo**

- Si algo falla, lo resolvemos juntos
- Aprendemos de los errores comunes
- Entendemos los mensajes de error

#### 4. **Pausas para Preguntas**

- Cada 10-15 minutos: "¿Dudas hasta aquí?"
- Todos pueden compartir pantalla si tienen problemas
- Ayuda entre compañeros

---

## ✅ Checklist Durante la Clase

### Antes de Comenzar:

- [ ] Todos tienen VS Code abierto
- [ ] Todos tienen Expo Go instalado en su celular
- [ ] Todos ven la proyección del instructor
- [ ] Todos tienen internet estable

### Durante Cada Práctica:

- [ ] Escribir código línea por línea con el instructor
- [ ] Guardar archivo después de cada cambio
- [ ] Ver cambios en Expo Go inmediatamente
- [ ] Levantar la mano si algo no funciona
- [ ] Tomar captura si todo funciona

### Al Finalizar Cada Práctica:

- [ ] El código funciona sin errores
- [ ] La app se ve igual que la del instructor
- [ ] Entiendes qué hace cada parte del código
- [ ] Has tomado notas de conceptos clave

---

## 📝 Material de Apoyo (Para Referencia)

Los archivos de las prácticas incluyen:

✅ **Código Completo Comentado** - Para revisar después  
✅ **Explicación Paso a Paso** - Qué hace cada parte  
✅ **Troubleshooting** - Solución a errores comunes  
✅ **Desafíos Adicionales** - Para trabajo autónomo (opcional)

**⚠️ IMPORTANTE:** Los archivos NO son para seguir solos. Son para:

- Repasar después de clase
- Completar si te quedaste atrás
- Ver la solución si algo no funcionó

---

## 🏠 Trabajo Autónomo Opcional (~1h)

### Después de clase puedes (opcional):

1. **Personalizar las prácticas:**

   - Cambiar colores y estilos
   - Agregar tus propios datos
   - Mejorar el diseño

2. **Hacer los desafíos adicionales:**

   - Cada práctica tiene 2-3 desafíos extra
   - Son opcionales pero recomendados
   - Te preparan para el proyecto integrador

3. **Experimentar libremente:**
   - Combinar elementos de diferentes prácticas
   - Crear variaciones
   - Probar cosas nuevas

> **Nota:** El trabajo autónomo NO es obligatorio. Es para quien quiera practicar más.

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
