# 📝 Changelog - Integración Política Anticopia y Dominios

**Fecha:** 9 de octubre de 2025  
**Versión:** 1.1.0  
**Cambio:** Integración del sistema de dominios personalizados

---

## 🎯 Resumen del Cambio

Se ha integrado completamente la **Política Anticopia y Asignación de Dominios Personalizados** en la documentación del bootcamp. Este sistema garantiza el aprendizaje genuino mediante la asignación de dominios de negocio únicos a cada estudiante.

---

## 📄 Archivos Modificados

### 1. `/_docs/README.md`

**Cambios realizados:**

- ✅ Agregada sección "Política Anticopia y Dominios" en el índice de contenidos
- ✅ Incluido link al documento completo `POLITICA_ANTICOPIA_DOMINIOS.md`
- ✅ Agregada referencia en la sección de Evaluación

**Ubicación:** Sección "Plan de Contenidos" y "Evaluación"

**Propósito:**

- Visibilizar la política desde el índice de documentación
- Facilitar acceso rápido para instructores y estudiantes

---

### 2. `/README.md` (Raíz del proyecto)

**Cambios realizados:**

- ✅ Actualizada estructura del repositorio para incluir `POLITICA_ANTICOPIA_DOMINIOS.md`
- ✅ Agregada sección "Política de Integridad Académica" en Sistema de Evaluación
- ✅ Incluidos beneficios del sistema de dominios

**Contenido agregado:**

```markdown
### 🔒 Política de Integridad Académica

Este bootcamp implementa un **sistema de dominios personalizados únicos**
para garantizar el aprendizaje genuino y evitar copias mecánicas.
Cada estudiante recibe un dominio de negocio personalizado
(ej: Restaurante, Veterinaria, Gimnasio) que debe aplicar en todos sus proyectos.

**Beneficios:**

- ✅ Fuerza la comprensión real del código
- ✅ Desarrolla pensamiento crítico y adaptación
- ✅ Facilita la detección de copias
- ✅ Crea portfolios únicos y profesionales

Ver [Política Anticopia y Dominios Completa](./_docs/POLITICA_ANTICOPIA_DOMINIOS.md)
```

**Propósito:**

- Informar a estudiantes desde el inicio del bootcamp
- Establecer expectativas claras sobre integridad académica

---

### 3. `.gitignore`

**Cambios realizados:**

- ✅ Agregada sección completa "DOMINIOS PERSONALIZADOS (POLÍTICA ANTICOPIA)"
- ✅ Configurado para ignorar asignaciones individuales (`aprendiz-*.md`)
- ✅ Permitir archivos de plantilla (README.md, TEMPLATE.md)
- ✅ Proteger archivos de tracking del instructor

**Reglas agregadas:**

```gitignore
# ============================================
# 🔒 DOMINIOS PERSONALIZADOS (POLÍTICA ANTICOPIA)
# ============================================

# Asignaciones individuales de dominios (PRIVADAS - NO SUBIR)
**/4-asignacion-dominios/*.md
**/4-asignacion-dominios/aprendiz-*.md
**/asignacion-dominios/*.md
**/asignacion-dominios/aprendiz-*.md

# EXCEPCIONES: Permitir archivos de plantilla y documentación
!**/4-asignacion-dominios/.gitkeep
!**/4-asignacion-dominios/README.md
!**/4-asignacion-dominios/TEMPLATE.md
!**/4-asignacion-dominios/INSTRUCCIONES.md

# Archivos de tracking de asignaciones (backup privado del instructor)
**/lista-asignaciones.json
**/domain-assignments.json
**/asignaciones-backup.*
```

**Propósito:**

- Proteger privacidad de asignaciones individuales
- Evitar que estudiantes vean dominios de compañeros
- Mantener plantillas accesibles en el repositorio
- Proteger archivos de tracking del instructor

---

### 4. `.github/copilot-instructions.md`

**Cambios realizados:**

- ✅ Actualizada estructura de carpetas semanal para incluir `4-asignacion-dominios/`
- ✅ Agregada sección "Dominio Personalizado" en template de README semanal
- ✅ Renumeradas carpetas de recursos (4→5) y glosario (5→6)

**Estructura actualizada:**

```
semana-XX/
├── README.md
├── RUBRICA-EVALUACION.md
├── 1-teoria/
├── 2-practicas/
├── 3-proyecto/
├── 4-recursos/                 # Sin cambios
│   ├── ebooks-free/
│   ├── videografia/
│   └── webgrafia/
├── 5-glosario/                 # Sin cambios
└── 6-asignacion-dominios/      # 🔒 NUEVA carpeta 6
    ├── .gitkeep
    ├── README.md
    ├── TEMPLATE.md
    └── aprendiz-*.md          # Ignorados por Git
```

**Template README semanal actualizado:**

```markdown
## 🔒 Dominio Personalizado

[Tu asignación única](./6-asignacion-dominios/) -
Ver [Política Anticopia](./../_docs/POLITICA_ANTICOPIA_DOMINIOS.md)

## 📚 Recursos Adicionales

- [eBooks recomendados](./4-recursos/ebooks-free/)
- [Videos tutoriales](./4-recursos/videografia/)
- [Artículos y documentación](./4-recursos/webgrafia/)

## 📖 Glosario

[Términos clave de la semana](./5-glosario/README.md)
```

**Propósito:**

- Guiar a GitHub Copilot en generación correcta de estructura
- Asegurar consistencia en contenido generado automáticamente
- Incluir referencia a dominios en material semanal

---

## 📂 Archivo Nuevo

### `/_docs/POLITICA_ANTICOPIA_DOMINIOS.md`

**Documento nuevo agregado al repositorio.**

**Contenido:**

- 566 líneas de documentación completa
- Definición del problema y solución
- Reglas estrictas del bootcamp
- Banco de 40+ dominios categorizados
- Estructura de asignación individual
- Estrategia pedagógica completa
- Herramientas de detección de copias
- Script de asignación aleatoria
- Consideraciones legales y éticas

**Propósito:**

- Documento maestro de referencia para la política
- Guía completa para instructores
- Información clara para estudiantes
- Base para implementación del sistema

---

## 🔄 Cambios en Numeración de Carpetas

### Estructura Anterior

```
semana-XX/
├── 1-teoria/
├── 2-practicas/
├── 3-proyecto/
├── 4-recursos/
└── 5-glosario/
```

### Estructura Nueva

```
semana-XX/
├── 1-teoria/
├── 2-practicas/
├── 3-proyecto/
├── 4-recursos/              # Sin cambios
├── 5-glosario/              # Sin cambios
└── 6-asignacion-dominios/   # ← NUEVA carpeta 6
```

**Impacto:**

- ✅ No afecta contenido existente (carpetas están vacías)
- ✅ Mantiene orden lógico y numeración consecutiva
- ✅ Recursos y glosario mantienen sus posiciones originales
- ⚠️ Requiere actualizar scripts de generación si existen
- ⚠️ Requiere actualizar referencias en semana-01/README.md cuando se cree

---

## ✅ Checklist de Integración

### Documentación

- [x] Política completa documentada en `/_docs/POLITICA_ANTICOPIA_DOMINIOS.md`
- [x] Referencia agregada en `/_docs/README.md`
- [x] Sección en README principal del proyecto
- [x] Instrucciones actualizadas en Copilot guidelines

### Configuración

- [x] `.gitignore` configurado para proteger asignaciones
- [x] Excepciones definidas para plantillas
- [x] Archivos de tracking protegidos

### Estructura

- [x] Numeración de carpetas actualizada (4→5, 5→6)
- [x] Carpeta `4-asignacion-dominios/` definida
- [x] Templates y estructura especificada

### Pendiente

- [ ] Crear carpeta `6-asignacion-dominios/` en semana-01
- [ ] Crear README.md de la carpeta para instructores
- [ ] Crear TEMPLATE.md de asignación individual
- [ ] Implementar script `_scripts/utilities/assign-domains.js`
- [ ] Actualizar README de semana-01 con nueva estructura

---

## 🎯 Próximos Pasos

### Para el Instructor

1. **Crear estructura en semana-01:**

   ```bash
   mkdir -p bootcamp/semana-01/6-asignacion-dominios
   touch bootcamp/semana-01/6-asignacion-dominios/.gitkeep
   ```

2. **Crear archivos de plantilla:**

   - `bootcamp/semana-01/6-asignacion-dominios/README.md` (guía instructor)
   - `bootcamp/semana-01/6-asignacion-dominios/TEMPLATE.md` (plantilla asignación)

3. **Implementar script de asignación:**

   - Crear `_scripts/utilities/assign-domains.js`
   - Basado en el código de ejemplo del documento de política

4. **Replicar estructura en semanas 2-6:**
   ```bash
   for i in {02..06}; do
     mkdir -p bootcamp/semana-$i/6-asignacion-dominios
     touch bootcamp/semana-$i/6-asignacion-dominios/.gitkeep
   done
   ```

### Para Estudiantes

- ✅ Leer la política completa en `/_docs/POLITICA_ANTICOPIA_DOMINIOS.md`
- ✅ Esperar asignación privada del instructor
- ✅ Aplicar dominio asignado en TODOS los proyectos
- ✅ NO compartir asignación con compañeros

---

## 📊 Impacto Esperado

### Beneficios Pedagógicos

1. **Comprensión forzada:**

   - No pueden copiar código mecánicamente
   - Deben adaptar conceptos a su contexto

2. **Pensamiento crítico:**

   - Relacionar teoría con aplicación real
   - Tomar decisiones de diseño propias

3. **Evaluación justa:**

   - Fácil detectar copias entre estudiantes
   - Evaluar comprensión genuina

4. **Portfolio único:**
   - Cada estudiante tiene proyectos diferentes
   - Valor agregado en portfolio profesional

### Métricas de Éxito

- ✅ **Diversidad:** Cada proyecto es único
- ✅ **Explicación:** Estudiantes pueden justificar su código
- ✅ **Adaptación:** Conceptos aplicados correctamente al dominio
- ✅ **Originalidad:** Soluciones personalizadas y creativas

---

## 🔗 Referencias Cruzadas

### Documentos Relacionados

- [Política Completa](./../POLITICA_ANTICOPIA_DOMINIOS.md)
- [Plan de Contenidos](./plan-contenidos.md)
- [Resumen Ejecutivo](./resumen-ejecutivo.md)
- [Copilot Instructions](./../.github/copilot-instructions.md)

### Archivos de Configuración

- [.gitignore](./../.gitignore) - Reglas de protección
- [README.md principal](./../README.md) - Información general

---

## 📝 Notas Adicionales

### Consideraciones Técnicas

- Las asignaciones se mantienen **localmente** en el entorno del instructor
- Solo se suben plantillas y documentación general al repositorio
- Los estudiantes reciben su asignación por canal privado (email, mensaje directo)
- El sistema es **retrocompatible** con contenido existente

### Consideraciones Pedagógicas

- La política aplica desde Semana 1 hasta Semana 6
- Los dominios tienen **complejidad equivalente**
- No hay dominios "fáciles" o "difíciles"
- Cambio de dominio solo por razón técnica válida

### Consideraciones Legales

- Las asignaciones son **información educativa privada**
- Cumplimiento de privacidad de datos educativos
- Estudiantes son dueños del código que desarrollan
- El dominio es contexto educativo, no restricción comercial

---

## ✨ Conclusión

La integración de la Política Anticopia y Dominios Personalizados está **completa a nivel de documentación y configuración**.

Los próximos pasos requieren:

1. Crear estructura física de carpetas
2. Implementar scripts de asignación
3. Generar plantillas específicas
4. Asignar dominios a estudiantes reales

El sistema está diseñado para **garantizar aprendizaje genuino** mientras mantiene la **privacidad** de las asignaciones y facilita la **evaluación justa**.

---

_Documento creado: 9 de octubre de 2025_  
_Versión: 1.0.0_  
_Autor: Sistema de documentación del bootcamp_
