# Asignación de Dominios - Semana 7: Optimización y Performance

## FICHA 3147246 ⚡

| Apellido           | 🏢 **Dominio Optimización** | 📦 **Entidad Principal** | 🔑 **Prefijo** | 🎯 **Foco Performance**   |
| ------------------ | --------------------------- | ------------------------ | -------------- | ------------------------- |
| AMAYA BEJARANO     | **Veterinaria**             | mascota                  | `vet_`         | Historiales médicos       |
| BAYONA RODRIGUEZ   | **Academia Música**         | clase                    | `edu_`         | Horarios y disponibilidad |
| BERNAL RODRIGUEZ   | **Gimnasio**                | rutina                   | `gym_`         | Plans y membresías        |
| BOHORQUEZ MEDINA   | **Farmacia**                | producto                 | `pharma_`      | Inventario y stock        |
| CARO CASTILLO      | **Restaurante**             | pedido                   | `resto_`       | Menús y disponibilidad    |
| DIAZ SARMIENTO     | **Librería**                | libro                    | `book_`        | Catálogo y búsquedas      |
| DUQUE URIBE        | **Taller Mecánico**         | servicio                 | `mech_`        | Diagnósticos y repuestos  |
| GAONA PRADA        | **Clínica Estética**        | tratamiento              | `beauty_`      | Citas y procedimientos    |
| GUZMAN ALVAREZ     | **Agencia Viajes**          | reserva                  | `travel_`      | Destinos y disponibilidad |
| GUZMAN GARZON      | **Tienda Ropa**             | prenda                   | `fashion_`     | Inventario y tallas       |
| GUZMAN MARTINEZ    | **Panadería**               | producto                 | `bakery_`      | Stock y producción        |
| LADINO MARTINEZ    | **Centro Deportivo**        | actividad                | `sports_`      | Reservas y equipamiento   |
| LEON ROLDAN        | **Floristería**             | arreglo                  | `flower_`      | Inventario y eventos      |
| MARTINEZ CARDENAS  | **Lavandería**              | servicio                 | `laundry_`     | Órdenes y equipos         |
| MEDINA VARGAS      | **Óptica**                  | producto                 | `optic_`       | Catálogo y recetas        |
| MOSQUERA ABADIA    | **Peluquería**              | cita                     | `salon_`       | Agenda y servicios        |
| NAVAS LOPEZ        | **Joyería**                 | producto                 | `jewelry_`     | Inventario y valoraciones |
| OLAYA RIOS         | **Centro Masajes**          | sesion                   | `massage_`     | Terapeutas y horarios     |
| PRATO BARON        | **Ferretería**              | producto                 | `hardware_`    | Stock y categorías        |
| QUINTERO MARTINEZ  | **Academia Idiomas**        | curso                    | `lang_`        | Niveles y grupos          |
| RAMOS GOMEZ        | **Pastelería**              | pedido                   | `cake_`        | Productos y eventos       |
| RODRIGUEZ MARTINEZ | **Carpintería**             | proyecto                 | `wood_`        | Materiales y tiempos      |
| ROJAS BURBANO      | **Centro Estético**         | tratamiento              | `spa_`         | Servicios y equipos       |
| SANCHEZ CASTAÑO    | **Inmobiliaria**            | propiedad                | `real_`        | Búsquedas y filtros       |
| SANDON GUARIN      | **Funeraria**               | servicio                 | `funeral_`     | Servicios y ceremonias    |

---

## 🎯 **OBJETIVOS DE OPTIMIZACIÓN POR DOMINIO**

### **📊 Métricas Específicas por Industria**

#### **� Ejemplo: Dominio Tipo A (Estudiante A)**

- **Cache Priority:** Registros principales frecuentes, datos de configuración
- **DB Optimization:** Índices en búsquedas por entidad principal y propietario
- **Rate Limiting:** 100 consultas/min para operaciones críticas
- **Monitoring:** Tiempo de carga de registros principales

#### **📚 Ejemplo: Dominio Tipo B (Estudiante B)**

- **Cache Priority:** Horarios de clases, disponibilidad de instrumentos
- **DB Optimization:** Consultas de disponibilidad por fecha/hora
- **Rate Limiting:** 50 consultas/min para reservas de aulas
- **Monitoring:** Tiempo de respuesta en búsquedas de horarios

#### **⚡ Ejemplo: Dominio Tipo C (Estudiante C)**

- **Cache Priority:** Planes de membresía, rutinas populares
- **DB Optimization:** Índices en búsquedas por usuario y rutina
- **Rate Limiting:** 200 consultas/min para check-ins de miembros
- **Monitoring:** Performance en carga de rutinas y planes

#### **� Ejemplo: Dominio Tipo D (Estudiante D)**

- **Cache Priority:** Inventario de medicamentos, precios actuales
- **DB Optimization:** Búsquedas por principio activo y laboratorio
- **Rate Limiting:** 300 consultas/min para consultas de stock
- **Monitoring:** Tiempo de respuesta en búsquedas de productos

---

## 🔧 **TÉCNICAS DE OPTIMIZACIÓN ESPECÍFICAS**

### **📈 Patrones de Caching por Dominio**

#### **Datos de Alta Consulta**

- **Ejemplo Tipo A:** Elementos estándar, procedimientos comunes
- **Ejemplo Tipo B:** Horarios fijos, responsables disponibles
- **Ejemplo Tipo C:** Elementos asignados, recursos disponibles
- **Ejemplo Tipo D:** Productos frecuentes, precios estándar

#### **Datos de Consulta Media**

- **Ejemplo Tipo A:** Historiales específicos por entidad
- **Ejemplo Tipo B:** Horarios personalizados por usuario
- **Ejemplo Tipo C:** Asignaciones personalizadas por usuario
- **Ejemplo Tipo D:** Historial de transacciones por cliente

### **🗃️ Estrategias de Base de Datos**

#### **Índices Prioritarios**

```python
# Ejemplos genéricos por tipo de dominio

# Para dominios con entidades principales (vet, gym, etc.)
CREATE INDEX idx_entidad_usuario ON tabla_principal(usuario_id, fecha_creacion);
CREATE INDEX idx_entidad_estado ON tabla_principal(estado, fecha_actualizacion);

# Para dominios con inventario (productos, catálogos, etc.)
CREATE INDEX idx_producto_categoria ON productos(categoria_id, disponible);
CREATE INDEX idx_producto_busqueda ON productos(nombre, descripcion);

# Para dominios con horarios (programación, reservas, etc.)
CREATE INDEX idx_horario_fecha ON horarios(fecha, hora_inicio, disponible);
```

### **⚡ Rate Limiting Contextual**

#### **Límites por Tipo de Operación**

- **Consultas frecuentes:** 100-300 req/min según industria
- **Operaciones críticas:** 50-100 req/min para datos sensibles
- **Búsquedas complejas:** 20-50 req/min para consultas pesadas
- **Operaciones administrativas:** 10-20 req/min para configuración

---

## 📋 **INSTRUCCIONES PARA ESTUDIANTES**

### **🔍 PASO 1: Identifica tu Dominio**

1. Busca tu apellido en la tabla de asignaciones
2. Anota tu **dominio específico** y **entidad principal**
3. Identifica tu **prefijo único** y **foco de optimización**

### **🎯 PASO 2: Personaliza las Técnicas**

1. Adapta el caching a TU tipo de datos específicos
2. Optimiza las consultas que son críticas en TU industria
3. Configura rate limiting apropiado para TU caso de uso
4. Define métricas relevantes para TU negocio

### **💻 PASO 3: Implementa las Optimizaciones**

1. Sigue las 4 prácticas personalizadas en orden
2. Usa siempre TU prefijo y TU contexto específico
3. Verifica que las optimizaciones son apropiadas para TU dominio
4. Documenta el impacto en TU caso de uso específico

---

## ⚠️ **IMPORTANTE: METODOLOGÍA ANTI-COPIA**

Cada dominio requiere optimizaciones completamente diferentes:

- **Los datos a cachear son específicos** de cada industria
- **Las consultas críticas varían** según el tipo de negocio
- **Los límites de rate limiting deben ser apropiados** para cada contexto
- **Las métricas relevantes son únicas** por dominio

**NO es posible copiar entre dominios porque las necesidades de performance son completamente diferentes.**

---

**FICHA 3147246 - SEMANA 7: OPTIMIZACIÓN Y PERFORMANCE**  
_Asignaciones personalizadas para 25 dominios únicos_
