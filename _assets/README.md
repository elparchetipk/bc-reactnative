# 🎨 Assets del Bootcamp

Esta carpeta contiene recursos visuales y assets generales del bootcamp.

---

## 📂 Contenido

### 🖼️ Banner Principal
- **`banner.svg`** - Banner para el README principal
  - Dimensiones: 1200x300px
  - Formato: SVG vectorial escalable
  - Optimizado para tema dark de GitHub
  - Sin degradados (compatibilidad máxima)

### 🎨 Características del Banner

**Colores utilizados (tema dark):**
- Fondo principal: `#0d1117` (GitHub dark background)
- Texto principal: `#e6edf3` (GitHub text primary)
- Texto secundario: `#8b949e` (GitHub text secondary)
- Acento React: `#61dafb` (React cyan)
- Acento éxito: `#3fb950` (GitHub green)
- Acento info: `#58a6ff` (GitHub blue)
- Acento warning: `#ff7b72` (GitHub red-orange)

**Elementos visuales:**
- Logo de React (simplificado con órbitas)
- Ícono de dispositivo móvil con código
- Badges informativos (6 semanas, nivel, gestor)
- Líneas decorativas de código
- Brackets `</>` sutiles

---

## 📁 Organización Sugerida

```
_assets/
├── README.md                  # Este archivo
├── banner.svg                 # Banner principal
├── logos/                     # Logos del bootcamp
│   ├── logo-light.svg
│   ├── logo-dark.svg
│   └── logo-square.png
├── badges/                    # Badges personalizados
│   ├── semana-1.svg
│   ├── semana-2.svg
│   └── ...
├── screenshots/               # Capturas de ejemplo
│   ├── proyecto-semana-1.png
│   └── ...
├── diagrams/                  # Diagramas y flowcharts
│   ├── arquitectura.svg
│   └── flujo-navegacion.svg
└── icons/                     # Iconos del bootcamp
    ├── react-native.svg
    ├── expo.svg
    └── pnpm.svg
```

---

## 🎨 Guía de Uso

### Banner en README

```markdown
<div align="center">
  <img src="./_assets/banner.svg" alt="Bootcamp React Native Banner" width="100%">
</div>
```

### Logo en Documentos

```markdown
![Bootcamp Logo](./_assets/logos/logo-dark.svg)
```

### Screenshots de Proyectos

```markdown
![Proyecto Semana 1](./_assets/screenshots/proyecto-semana-1.png)
```

---

## 🔧 Creación de Assets

### SVG Óptimos
- Usar colores sólidos (no degradados)
- Minimizar el código
- Usar viewBox para escalabilidad
- Comentar secciones del código
- Exportar sin metadatos innecesarios

### PNG/JPG
- Usar resoluciones apropiadas (2x para retina)
- Optimizar peso de archivos
- Nombrar descriptivamente
- Incluir versiones light/dark cuando aplique

### Iconos
- Formato SVG preferido
- Tamaños estándar: 16x16, 24x24, 32x32, 48x48
- Usar mismo estilo visual
- Incluir versiones monocromáticas

---

## 📏 Especificaciones

### Banner Principal
- **Ancho:** 1200px (máximo para GitHub)
- **Alto:** 300px
- **Aspect Ratio:** 4:1
- **Formato:** SVG
- **Peso:** < 50KB

### Logos
- **Formatos:** SVG (principal), PNG (fallback)
- **Tamaños PNG:** 256x256, 512x512, 1024x1024
- **Fondo:** Transparente
- **Colores:** Tema light y dark

### Screenshots
- **Formato:** PNG
- **Ancho máximo:** 1200px
- **Calidad:** Alta pero optimizada
- **Peso:** < 500KB por imagen

---

## 🎨 Paleta de Colores del Bootcamp

### Tema Dark (Principal)
```css
--bg-primary: #0d1117;      /* Fondo principal */
--bg-secondary: #161b22;    /* Fondo secundario */
--bg-tertiary: #30363d;     /* Elementos UI */

--text-primary: #e6edf3;    /* Texto principal */
--text-secondary: #8b949e;  /* Texto secundario */
--text-tertiary: #6e7681;   /* Texto terciario */

--accent-react: #61dafb;    /* React/Cyan */
--accent-success: #3fb950;  /* Verde/Success */
--accent-info: #58a6ff;     /* Azul/Info */
--accent-warning: #ff7b72;  /* Naranja/Warning */
```

### Tema Light (Opcional)
```css
--bg-primary: #ffffff;
--bg-secondary: #f6f8fa;
--bg-tertiary: #d0d7de;

--text-primary: #24292f;
--text-secondary: #57606a;
--text-tertiary: #6e7781;

--accent-react: #61dafb;
--accent-success: #1a7f37;
--accent-info: #0969da;
--accent-warning: #cf222e;
```

---

## 📝 Nomenclatura de Archivos

### Formato Estándar
```
[tipo]-[nombre]-[variante].[extension]

Ejemplos:
banner-principal-dark.svg
logo-square-light.png
badge-semana-01.svg
icon-react-native.svg
screenshot-proyecto-chat-app.png
diagram-arquitectura-app.svg
```

### Reglas
- Usar kebab-case
- Ser descriptivo pero conciso
- Incluir variante si aplica (light/dark)
- Usar extensión apropiada

---

## 🔒 Licencias

### Assets Propios
Todos los assets creados específicamente para este bootcamp están bajo la misma licencia del proyecto.

### Assets de Terceros
- Logos oficiales (React, Expo, etc.) - Propiedad de sus respectivos dueños
- Usar solo con propósitos educativos
- Incluir atribución cuando sea requerido

---

## 🤝 Contribuir

Para agregar nuevos assets:

1. Seguir la estructura de carpetas establecida
2. Usar nomenclatura consistente
3. Optimizar peso de archivos
4. Documentar en este README
5. Incluir versiones light/dark si aplica
6. Abrir Pull Request con ejemplos de uso

---

## 📦 Herramientas Recomendadas

### Para SVG
- [Figma](https://www.figma.com/) - Diseño vectorial
- [SVGOMG](https://jakearchibald.github.io/svgomg/) - Optimización SVG
- [Inkscape](https://inkscape.org/) - Editor vectorial gratuito

### Para Imágenes
- [TinyPNG](https://tinypng.com/) - Compresión PNG/JPG
- [Squoosh](https://squoosh.app/) - Optimización de imágenes

### Para Iconos
- [Feather Icons](https://feathericons.com/) - Iconos SVG simples
- [Heroicons](https://heroicons.com/) - Iconos modernos
- [Lucide](https://lucide.dev/) - Fork mejorado de Feather

---

[← Volver al README principal](../README.md)
