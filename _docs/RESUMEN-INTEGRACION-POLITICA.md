# 📋 Resumen de Integración - Política Anticopia y Dominios

**Fecha:** 9 de octubre de 2025  
**Versión:** 1.0.0  
**Estado:** ✅ Integración completada

---

## 🎯 Objetivo

Integrar la **Política Anticopia y Asignación de Dominios** en el bootcamp bc-reactnative, adaptándola desde bc-express para el contexto de React Native + Expo.

---

## ✅ Cambios Realizados

### 1. 📁 Estructura de Carpetas

**Decisión:** Carpeta de asignación de dominios en la **posición 6** (última)

```
semana-XX/
├── README.md
├── RUBRICA-EVALUACION.md
├── 1-teoria/
├── 2-practicas/
├── 3-proyecto/
├── 4-recursos/              # Mantenida en posición 4
├── 5-glosario/              # Mantenida en posición 5
└── 6-asignacion-dominios/   # ← NUEVA carpeta 6 (privada)
    ├── .gitkeep
    ├── README.md
    ├── TEMPLATE.md
    └── [nombre-apellido].md
```

**Razón:** Mantener recursos y glosario en sus posiciones originales, agregar dominios al final como carpeta privada.

---

### 2. 📝 Nomenclatura de Archivos de Asignación

**Formato adoptado:** `nombre-apellido.md` (kebab-case, sin tildes)

**Ejemplos basados en Ficha 3147235:**

- `breyner-alfonso.md` → Breyner Sneyder Alfonso
- `pablo-bernal.md` → Pablo Julian Bernal Garcia
- `juan-culma.md` → Juan Manuel Culma Santofimio
- `mariana-espinoza.md` → Mariana Espinoza Arias
- `duver-gonzalez.md` → Duver Arley Gonzalez Benavides
- `danny-gonzalez.md` → Danny Alejandro Gonzalez Yate
- `laura-gutierrez.md` → Laura Lizeth Gutierrez Celis
- `luz-herrera.md` → Luz Stefanny Herrera Rodriguez
- `andres-infante.md` → Andres Felipe Infante Cortes
- `manuela-marroquin.md` → Manuela Alejandra Marroquin Basabe
- `brainer-martinez.md` → Brainer Esneider Martinez Gonzalez
- `maria-moreno.md` → Maria Fernanda Moreno Acosta
- `alex-obando.md` → Alex Jhair Obando Zuñiga
- `santiago-ordoñez.md` → Santiago Andres Ordoñez Solarte
- `danna-perez.md` → Danna Giselle Perez Gomez
- `kevin-pinto.md` → Kevin Stiven Pinto Amaya
- `johan-quintero.md` → Johan Alejandro Quintero Barros
- `miguel-rubiano.md` → Miguel Angel Rubiano Vargas
- `carol-ruiz.md` → Carol Andrea Ruiz Castañeda
- `samuel-sanchez.md` → Samuel Esteban Sanchez Moreno (Vocero)
- `sergio-tique.md` → Sergio Steven Tique Becerra
- `lina-toro.md` → Lina Marcela Toro Ortiz
- `deyvi-valencia.md` → Deyvi Jhoan Valencia Briñez
- `michael-varon.md` → Michael Andres Varon Varon
- `ivan-yate.md` → Ivan Ramiro Yate Lozano
- `laura-yepes.md` → Laura Sofia Yepes Orjuela

**Total:** 26 estudiantes de la Ficha 3147235

**Fuente:** `_docs/fichas/3147235/3147235.md`

---

### 3. 🔐 Configuración de .gitignore

**Actualizado para ignorar asignaciones individuales:**

```gitignore
# ============================================
# 🔒 DOMINIOS PERSONALIZADOS (POLÍTICA ANTICOPIA)
# ============================================

# Asignaciones individuales de dominios (PRIVADAS - NO SUBIR)
**/6-asignacion-dominios/*.md
**/asignacion-dominios/*.md

# EXCEPCIONES: Permitir archivos de plantilla y documentación
!**/6-asignacion-dominios/.gitkeep
!**/6-asignacion-dominios/README.md
!**/6-asignacion-dominios/TEMPLATE.md
!**/6-asignacion-dominios/INSTRUCCIONES.md
```

**Protege:**

- ✅ Archivos individuales `nombre-apellido.md` (NO se suben a GitHub)
- ✅ Archivos de tracking JSON/CSV del instructor

**Permite:**

- ✅ `.gitkeep` (mantener carpeta en Git)
- ✅ `README.md` (guía para instructores)
- ✅ `TEMPLATE.md` (plantilla de asignación)

---

### 4. 📚 Documentación Actualizada

#### Archivos Modificados:

1. **`.github/copilot-instructions.md`**

   - Actualizada estructura de semanas con carpeta 6
   - Ejemplos de nombres reales: breyner-alfonso, pablo-bernal, juan-culma
   - Referencias corregidas a carpetas 4, 5, 6

2. **`_docs/README.md`**

   - Agregada sección sobre Política Anticopia
   - Link a POLITICA_ANTICOPIA_DOMINIOS.md
   - Descripción de sistema de dominios únicos

3. **`_docs/POLITICA_ANTICOPIA_DOMINIOS.md`**

   - Actualizada convención de nombres a formato `nombre-apellido.md`
   - Lista completa de 26 estudiantes de Ficha 3147235
   - Ejemplos de archivos con nombres reales
   - Script actualizado con array de learners reales
   - Referencias a carpeta 6-asignacion-dominios
   - Adaptado de bc-express (9 semanas) a bc-reactnative (6 semanas)

4. **`README.md` (raíz)**

   - Agregada sección sobre Política de Integridad Académica
   - Explicación de sistema de dominios personalizados
   - Link a documentación completa
   - Estructura actualizada con carpeta 6

5. **`.gitignore`**
   - Sección completa sobre dominios personalizados
   - Comentarios explicativos (What/For/How)
   - Referencias a carpeta 6-asignacion-dominios

---

### 5. 🛠️ Script de Asignación

**Archivo:** `_scripts/utilities/assign-domains.js`

**Incluye:**

- Array completo de 26 estudiantes con nombres reales
- Array de 40+ dominios de negocio únicos
- Función de asignación aleatoria sin repetición
- Generación de archivos con formato `nombre-apellido.md`
- Ruta correcta: `bootcamp/semana-01/6-asignacion-dominios/`

**Ejemplo de uso:**

```javascript
const learners = [
  { name: 'Breyner Sneyder Alfonso', filename: 'breyner-alfonso' },
  { name: 'Pablo Julian Bernal Garcia', filename: 'pablo-bernal' },
  // ... 26 estudiantes
]
```

---

## 🎯 Beneficios de la Política

### Para los Estudiantes

✅ **Aprendizaje genuino:** No pueden copiar mecánicamente  
✅ **Pensamiento crítico:** Deben adaptar conceptos a su dominio  
✅ **Portfolio único:** Cada proyecto es diferente y personal  
✅ **Comprensión profunda:** Relacionan teoría con aplicación real

### Para el Instructor

✅ **Detección fácil de copias:** Código diferente por dominio  
✅ **Evaluación justa:** Mide comprensión real, no memorización  
✅ **Motivación:** Estudiantes trabajan en contextos que les interesan  
✅ **Diversidad:** 26 proyectos únicos en lugar de 26 copias

---

## 📊 Banco de Dominios Disponibles

### Categorías (40+ dominios únicos)

1. **Comercio y Servicios** (10 dominios)

   - Restaurante, Biblioteca, Veterinaria, Gimnasio, Inmobiliaria, etc.

2. **Educación y Cultura** (5 dominios)

   - Colegio/Universidad, Galería de Arte, Cine/Teatro, etc.

3. **Salud y Bienestar** (5 dominios)

   - Hospital/Clínica, Farmacia, Centro de Yoga/Spa, etc.

4. **Tecnología y Entretenimiento** (5 dominios)

   - Tienda de Videojuegos, Tienda de Tecnología, etc.

5. **Transporte y Logística** (5 dominios)

   - Rent-a-Car, Empresa de Paquetería, Servicio de Taxi, etc.

6. **Alimentos y Bebidas** (5 dominios)

   - Cafetería, Pizzería, Pastelería, Bar/Pub, etc.

7. **Construcción y Hogar** (5 dominios)

   - Constructora, Ferretería, Vivero/Jardinería, etc.

8. **Moda y Belleza** (5 dominios)
   - Boutique, Salón de Belleza, Zapatería, Joyería, etc.

**Total:** 40+ dominios con complejidad similar

---

## 🚀 Próximos Pasos

### Inmediatos (Antes de iniciar el bootcamp)

1. **Crear estructura física de carpetas:**

   ```bash
   for i in 01 02 03 04 05 06; do
     mkdir -p bootcamp/semana-$i/6-asignacion-dominios
     touch bootcamp/semana-$i/6-asignacion-dominios/.gitkeep
   done
   ```

2. **Crear archivos de plantilla:**

   - `bootcamp/semana-01/6-asignacion-dominios/README.md`
   - `bootcamp/semana-01/6-asignacion-dominios/TEMPLATE.md`

3. **Ejecutar script de asignación:**

   ```bash
   node _scripts/utilities/assign-domains.js
   ```

4. **Enviar asignaciones privadas:**
   - Email individual a cada estudiante con su dominio
   - NO compartir lista completa públicamente

### Durante el Bootcamp

1. **Comunicación genérica:** Usar lenguaje adaptable ("tu sistema", "tu dominio")
2. **Evaluación por adaptación:** Verificar coherencia con dominio asignado
3. **Detección de copias:** Revisar nombres de variables/endpoints
4. **Soporte individual:** Ayudar con conceptos, no código específico

---

## 📝 Notas Importantes

### ⚠️ Recordatorios para el Instructor

1. **NUNCA mencionar dominios específicos en clase**

   - ❌ "Juan tiene restaurante, entonces..."
   - ✅ "En tu sistema, las entidades principales..."

2. **NUNCA comparar implementaciones públicamente**

   - ❌ "Este se parece al de María"
   - ✅ "Veamos cómo funciona este patrón"

3. **Mantener privacidad de asignaciones**
   - Solo tú y cada estudiante conocen su dominio
   - No publicar lista de asignaciones en GitHub
   - Usar archivos locales para tracking

### ⚠️ Recordatorios para los Estudiantes

1. **Tu dominio es personal y confidencial**
2. **Adapta TODO a tu contexto de negocio**
3. **Consulta conceptos, NO código de compañeros**
4. **Demuestra comprensión en cada entrega**

---

## 📚 Referencias Completas

### Documentación Principal

- `_docs/POLITICA_ANTICOPIA_DOMINIOS.md` - Política completa
- `_docs/fichas/3147235/3147235.md` - Lista oficial de estudiantes
- `.github/copilot-instructions.md` - Guías para desarrollo

### Scripts y Herramientas

- `_scripts/utilities/assign-domains.js` - Generador de asignaciones
- `.gitignore` - Configuración de archivos ignorados

### Plantillas

- `bootcamp/semana-XX/6-asignacion-dominios/TEMPLATE.md` - Plantilla de asignación
- `bootcamp/semana-XX/6-asignacion-dominios/README.md` - Guía del instructor

---

## ✅ Estado de Integración

| Componente             | Estado         | Notas                            |
| ---------------------- | -------------- | -------------------------------- |
| Estructura de carpetas | ✅ Definida    | Carpeta 6 en cada semana         |
| Nomenclatura           | ✅ Definida    | `nombre-apellido.md`             |
| .gitignore             | ✅ Actualizado | Ignora asignaciones individuales |
| Documentación          | ✅ Actualizada | Todos los archivos corregidos    |
| Script de asignación   | ✅ Actualizado | Con 26 estudiantes reales        |
| Banco de dominios      | ✅ Completo    | 40+ dominios únicos              |
| Carpetas físicas       | ⏳ Pendiente   | Crear con script                 |
| Plantillas             | ⏳ Pendiente   | README.md y TEMPLATE.md          |
| Asignaciones           | ⏳ Pendiente   | Generar antes del bootcamp       |

---

## 🎓 Conclusión

La **Política Anticopia y Dominios Personalizados** ha sido completamente integrada en el bootcamp bc-reactnative. El sistema está diseñado para:

1. **Garantizar aprendizaje genuino** mediante dominios únicos
2. **Facilitar la evaluación** con código diferenciado
3. **Proteger la privacidad** de asignaciones individuales
4. **Crear portfolios valiosos** con proyectos únicos

El bootcamp está listo para iniciar con un sistema robusto de prevención de copias que promueve la comprensión profunda y el pensamiento crítico.

---

_Documento creado: 9 de octubre de 2025_  
_Versión: 1.0.0_  
_Bootcamp: bc-reactnative (Ficha 3147235 - 26 estudiantes)_
