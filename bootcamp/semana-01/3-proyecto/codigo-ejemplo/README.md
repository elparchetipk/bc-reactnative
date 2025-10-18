# 🐛 Código de Ejemplo con Bugs - Semana 1

> **ADVERTENCIA:** Este código contiene **5 bugs intencionales** que debes identificar y corregir como parte de tu aprendizaje.

## 📋 Instrucciones

1. **NO copies este código directamente** - contiene errores a propósito
2. **Lee el código cuidadosamente** para identificar los bugs
3. **Corrige cada bug** en tu propio proyecto
4. **Documenta tus correcciones** en `BUGS-RESUELTOS.md`

## 🎯 Objetivo

Este ejercicio te enseña a:

- ✅ Leer código críticamente
- ✅ Identificar errores comunes
- ✅ Aplicar mejores prácticas
- ✅ Desarrollar habilidades de debugging

## 📂 Estructura del Código

```
src/
├── App.js                    # 🐛 Bug #1: Import incorrecto
├── components/
│   └── Card.js              # 🐛 Bug #2: Mutación directa de estado
├── screens/
│   └── Home.js              # 🐛 Bug #3: FlatList sin keyExtractor
├── styles/
│   └── theme.js             # 🐛 Bug #4: Colores hardcodeados
└── utils/
    └── helpers.js           # 🐛 Bug #5: Función sin return
```

## 🔍 Pistas Generales

**Sin spoilers específicos:**

- 2 bugs son **obvios** (la app no funcionará correctamente)
- 2 bugs son **sutiles** (la app funciona pero con comportamiento incorrecto)
- 1 bug es de **mejores prácticas** (funciona pero genera warnings)

## ⚠️ Importante

- **No busques las soluciones en internet primero**
- **Intenta identificar los bugs por ti mismo**
- **Usa las herramientas de debugging** (console.log, React DevTools)
- **Lee los mensajes de error cuidadosamente**

## 📚 Recursos de Ayuda

Si estás atascado:

1. Revisa la [teoría de la semana](../1-teoria/)
2. Consulta el [glosario](../5-glosario/)
3. Lee la documentación oficial de React Native
4. Pregunta en clase o en el foro del bootcamp

---

**Recuerda:** El objetivo NO es tener código perfecto desde el inicio, sino **aprender a identificar y corregir errores**. ¡Ese es un skill crítico para cualquier desarrollador!

🎓 **¡Buena suerte encontrando los bugs!**
