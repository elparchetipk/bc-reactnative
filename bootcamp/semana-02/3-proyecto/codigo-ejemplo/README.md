# 🐛 Código de Ejemplo con Bugs - Semana 2

> **ADVERTENCIA:** Este código contiene **7 bugs intencionales** que debes identificar y corregir como parte de tu aprendizaje.

## 📋 Instrucciones

1. **NO copies este código directamente** - contiene errores a propósito
2. **Lee el código cuidadosamente** para identificar los bugs
3. **Corrige cada bug** en tu propio proyecto
4. **Documenta tus correcciones** en `BUGS-RESUELTOS.md`

## 🎯 Objetivo

Este ejercicio te enseña a:

- ✅ Identificar errores de navegación
- ✅ Detectar anti-patrones en Context API
- ✅ Encontrar bugs sutiles de configuración
- ✅ Aplicar mejores prácticas de TypeScript

## 📂 Estructura del Código

```
src/
├── navigation/
│   ├── TabNavigator.tsx         # 🐛 Bug #2: Configuración incorrecta
│   └── DrawerContent.tsx        # 🐛 Bug #3: Nombres en español
├── screens/
│   ├── HomeScreen.js            # 🐛 Bug #1: Import incorrectos
│   └── ProductDetailScreen.js   # 🐛 Bug #4: Navigation params mal usados
├── context/
│   └── CartContext.tsx          # 🐛 Bug #5: Mutación directa estado
├── components/
│   └── ProductList.tsx          # 🐛 Bug #6: FlatList sin keyExtractor
└── types/
    └── types.ts                 # 🐛 Bug #7: Interfaces incompletas
```

## 🔍 Pistas Generales

**Sin spoilers específicos:**

- 1 bug es **obvio** (import incorrecto, error de compilación)
- 4 bugs son **sutiles** (lógica incorrecta, funciona pero mal)
- 2 bugs son de **mejores prácticas** (warnings, TypeScript)

## 📊 Distribución de Bugs

- **14% Obvios** → App no compila o crashea
- **57% Sutiles** → App funciona pero comportamiento incorrecto
- **29% Mejores Prácticas** → Warnings o types incorrectos

## ⚠️ Importante

- Estos bugs son típicos en apps de navegación reales
- Aprenderás a detectar problemas antes de producción
- La documentación y los debuggers son tus aliados

---

**¡Buena suerte encontrando los 7 bugs!** 🕵️‍♂️
