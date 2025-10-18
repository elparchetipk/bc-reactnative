# 🐛 Bugs Resueltos - Semana [X]

> **Entrega obligatoria:** Este documento debe estar en la raíz de tu repositorio de proyecto semanal.

---

## 📋 Información del Estudiante

- **Nombre Completo:** [Tu nombre]
- **Ficha:** [Número de ficha]
- **Fecha de Entrega:** [DD/MM/YYYY]
- **Semana:** [Número]
- **Proyecto:** [Nombre del proyecto]
- **Repositorio:** [URL de tu repo en GitHub]

---

## 📊 Resumen de Bugs

| #   | Archivo      | Línea | Tipo                       | Severidad         | Estado |
| --- | ------------ | ----- | -------------------------- | ----------------- | ------ |
| 1   | [archivo.js] | XX    | [Sintaxis/Lógica/Práctica] | [Alta/Media/Baja] | ✅     |
| 2   | [archivo.js] | XX    | [Tipo]                     | [Severidad]       | ✅     |
| ... | ...          | ...   | ...                        | ...               | ...    |

**Total de bugs encontrados:** [X] de [Y] bugs intencionales

---

## 🔍 Bugs Detallados

### Bug #1: [Título Descriptivo del Bug]

**📍 Ubicación:**

- **Archivo:** `ruta/al/archivo.js`
- **Línea:** XX
- **Componente/Función:** [Nombre]

**🐛 Tipo de Bug:**

- [ ] Sintaxis
- [ ] Lógica
- [ ] Mejores Prácticas
- [ ] Performance
- [ ] Seguridad

**⚠️ Severidad:**

- [ ] Alta (rompe la app)
- [ ] Media (comportamiento incorrecto)
- [ ] Baja (mejora recomendada)

**📝 Descripción del Problema:**

[Explica en tus propias palabras qué estaba mal en el código original]

**❌ Código Incorrecto (ANTES):**

```javascript
// Pega aquí el código con el bug
const [count, setCount] = useState('0')

const handlePress = () => {
  setCount(count + 1) // Bug aquí
}
```

**✅ Código Corregido (DESPUÉS):**

```javascript
// Pega aquí tu solución
const [count, setCount] = useState(0)

const handlePress = () => {
  setCount((prevCount) => prevCount + 1)
}
```

**💡 Explicación de la Solución:**

[Explica por qué tu solución funciona y qué concepto aplicaste]

Ejemplo:

- El estado inicial debe ser un número, no un string
- Usar la forma funcional de setState para evitar problemas con closures
- Esto garantiza que siempre sumamos sobre el valor más reciente

**🎓 Lección Aprendida:**

[Qué aprendiste de este bug. ¿Cómo lo evitarás en el futuro?]

**📚 Recursos Consultados:**

- [Link a documentación oficial]
- [Link a Stack Overflow]
- [Video tutorial]
- [Artículo de blog]

---

### Bug #2: [Siguiente Bug]

[Repetir el mismo formato para cada bug]

---

## 📸 Evidencias de Funcionamiento

### Screenshot 1: App Funcionando

![App funcionando](./screenshots/app-working.png)

**Descripción:** [Qué muestra este screenshot]

### Screenshot 2: Consola sin Errores

![Consola limpia](./screenshots/console-clean.png)

**Descripción:** [Confirma que no hay errores]

### Screenshot 3: Funcionalidad Principal

![Feature principal](./screenshots/main-feature.png)

**Descripción:** [Muestra la funcionalidad clave]

### Video Demo (Opcional)

[Link a video en YouTube/Loom mostrando la app funcionando]

---

## 🔄 Proceso de Debugging

### Herramientas Utilizadas

- [ ] React Native Debugger
- [ ] Chrome DevTools
- [ ] Console.log
- [ ] Expo DevTools
- [ ] ESLint
- [ ] TypeScript (si aplica)
- [ ] VS Code Debugger
- [ ] Otra: [especificar]

### Estrategias Aplicadas

**¿Cómo encontraste los bugs?**

1. [Describe tu proceso]
2. [¿Leíste el código línea por línea?]
3. [¿Ejecutaste y observaste errores?]
4. [¿Usaste debugger?]
5. [¿Consultaste documentación?]

**Tiempo invertido:**

- Lectura de código: [X] horas
- Identificación de bugs: [X] horas
- Implementación de soluciones: [X] horas
- Testing y validación: [X] horas
- **Total:** [X] horas

---

## 🧪 Testing

### Tests Manuales Realizados

| Funcionalidad | Resultado | Notas         |
| ------------- | --------- | ------------- |
| [Feature 1]   | ✅ Pasa   | [Comentarios] |
| [Feature 2]   | ✅ Pasa   | [Comentarios] |
| [Feature 3]   | ✅ Pasa   | [Comentarios] |

### Casos Edge Testeados

- [ ] App funciona en iOS
- [ ] App funciona en Android
- [ ] Funciona sin conexión (si aplica)
- [ ] Maneja errores correctamente
- [ ] Valida inputs de usuario
- [ ] No hay memory leaks
- [ ] Performance aceptable

---

## 📝 Mejoras Adicionales (Opcionales)

**Más allá de los bugs, ¿qué mejoras implementaste?**

### Mejora #1: [Título]

**Descripción:**
[Qué mejoraste]

**Código:**

```javascript
// Tu mejora
```

**Beneficio:**
[Por qué es mejor]

---

## 🤔 Reflexión Personal

### ¿Qué fue lo más difícil?

[Tu respuesta]

### ¿Qué aprendiste que no sabías?

[Tu respuesta]

### ¿Qué harías diferente la próxima vez?

[Tu respuesta]

### ¿Cómo te ayudó esta actividad a entender mejor React Native?

[Tu respuesta]

---

## 📚 Recursos Adicionales Consultados

### Documentación Oficial

1. [React Native Docs - Tema específico]
2. [Expo Docs - Feature específica]
3. [React Docs - Hooks]

### Tutoriales y Artículos

1. [Título del artículo] - [URL]
2. [Título del tutorial] - [URL]

### Videos

1. [Título del video] - [URL]

### Comunidad

1. [Stack Overflow - Link a pregunta]
2. [GitHub Issue - Link]
3. [Discord/Foro - Link]

---

## ✅ Checklist de Entrega

Verifica antes de entregar:

### Código

- [ ] Todos los bugs identificados y corregidos
- [ ] App ejecuta sin errores
- [ ] App ejecuta sin warnings críticos
- [ ] Código formateado correctamente
- [ ] Commits descriptivos en GitHub
- [ ] README.md actualizado con instrucciones

### Documentación

- [ ] Todos los bugs documentados
- [ ] Explicaciones claras y completas
- [ ] Screenshots incluidos
- [ ] Código antes/después en cada bug
- [ ] Reflexión personal completada

### Repositorio GitHub

- [ ] Repositorio público o compartido con instructor
- [ ] BUGS-RESUELTOS.md en la raíz
- [ ] Carpeta /screenshots con evidencias
- [ ] .gitignore configurado correctamente
- [ ] No hay node_modules en el repo
- [ ] README con instrucciones de instalación

### Extra

- [ ] Video demo (opcional)
- [ ] Tests automatizados (opcional)
- [ ] Mejoras adicionales documentadas

---

## 📧 Información de Entrega

**Método de Entrega:**

- [ ] Link al repositorio GitHub en plataforma del bootcamp
- [ ] Email al instructor: [email]
- [ ] Presentación en clase (si aplica)

**Fecha Límite:** [DD/MM/YYYY - HH:MM]

**Penalización por entrega tardía:**

- 1 día tarde: -10%
- 2 días tarde: -20%
- 3+ días tarde: No se acepta

---

## 🎯 Autoevaluación

**Antes de entregar, califica tu trabajo:**

| Criterio              | Auto-calificación (0-10) | Comentarios |
| --------------------- | ------------------------ | ----------- |
| Bugs encontrados      | [X]/10                   |             |
| Calidad de soluciones | [X]/10                   |             |
| Documentación         | [X]/10                   |             |
| Explicaciones         | [X]/10                   |             |
| Evidencias            | [X]/10                   |             |
| Reflexión             | [X]/10                   |             |
| **Promedio**          | **[X]/10**               |             |

---

## 📞 Dudas y Consultas

Si tienes dudas sobre:

- **Los bugs:** Consulta las pistas en el material de la semana
- **La entrega:** Revisa este template y la rúbrica
- **Conceptos técnicos:** Office hours del instructor o Discord

**Contacto del Instructor:**

- Email: [email]
- Discord: [username]
- Office Hours: [horarios]

---

## 🏆 Criterios de Evaluación

Este documento se evaluará según:

| Criterio                    | Peso     | Puntos   |
| --------------------------- | -------- | -------- |
| Bugs identificados (X de Y) | 40%      | /40      |
| Soluciones correctas        | 30%      | /30      |
| Calidad de explicaciones    | 20%      | /20      |
| Documentación y evidencias  | 10%      | /10      |
| **TOTAL**                   | **100%** | **/100** |

Ver [Rúbrica Completa](../../RUBRICA-EVALUACION.md) para detalles.

---

## 💬 Notas del Instructor

[Espacio reservado para feedback del instructor]

**Calificación Final:** [X]/100

**Comentarios:**
[Feedback detallado]

**Fortalezas:**

- [Punto fuerte 1]
- [Punto fuerte 2]

**Áreas de Mejora:**

- [Sugerencia 1]
- [Sugerencia 2]

---

**¡Éxito en tu debugging!** 🚀

_Template BUGS-RESUELTOS.md - Bootcamp React Native 2025_
