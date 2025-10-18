/**
 * 🐛 ADVERTENCIA: Este archivo contiene un BUG INTENCIONAL
 *
 * theme.js - Configuración de colores y estilos globales
 *
 * Bug #4: Colores hardcodeados en múltiples lugares
 * Severidad: 🟠 Media (Sutil)
 * Tipo: Mejores prácticas / Mantenibilidad
 *
 * ¿Puedes encontrarlo? Pista: ¿Qué pasa si quiero cambiar el color primario?
 */

/**
 * Tema de la aplicación
 *
 * ¿Qué hace?
 * Define los colores y estilos globales de la app
 *
 * ¿Para qué?
 * Centralizar la configuración visual para mantener consistencia
 *
 * ¿Cómo funciona?
 * Exporta constantes que se importan en otros componentes
 *
 * 🐛 BUG #4: Colores hardcodeados
 * Los colores están repetidos en vez de usar constantes
 * Esto dificulta el mantenimiento y la consistencia
 */

// 🐛 BUG: Estos colores deberían estar en constantes
// pero están hardcodeados en múltiples archivos

export const theme = {
  // Colores principales - pero no se usan consistentemente
  colors: {
    // Estos están definidos aquí...
    primary: '#007AFF',
    secondary: '#5856D6',
    success: '#34C759',
    danger: '#FF3B30',
    warning: '#FF9500',

    // ...pero en otros archivos se usa '#ff6b6b', 'white', '#333', etc.
    // directamente en los estilos en lugar de estas constantes
  },

  // 🐛 PROBLEMA: En Card.js se usa '#ff6b6b' directamente
  // 🐛 PROBLEMA: En Home.js se usa 'white', '#333', '#666' directamente
  // 🐛 PROBLEMA: En App.js se usa '#f5f5f5' directamente

  // Espaciado
  spacing: {
    xs: 4,
    sm: 8,
    md: 16,
    lg: 24,
    xl: 32,
  },

  // Tipografía
  typography: {
    h1: {
      fontSize: 28,
      fontWeight: 'bold',
    },
    h2: {
      fontSize: 24,
      fontWeight: 'bold',
    },
    h3: {
      fontSize: 20,
      fontWeight: '600',
    },
    body: {
      fontSize: 16,
    },
    caption: {
      fontSize: 12,
      color: '#999',
    },
  },

  // Bordes
  borderRadius: {
    sm: 4,
    md: 8,
    lg: 12,
    xl: 20,
    full: 9999,
  },
}

/**
 * ✅ SOLUCIÓN CORRECTA:
 *
 * 1. Definir TODOS los colores aquí como constantes
 * 2. Usar estas constantes en TODOS los archivos
 * 3. NO hardcodear colores en StyleSheet.create()
 *
 * Ejemplo correcto:
 *
 * export const colors = {
 *   background: '#f5f5f5',
 *   cardBackground: '#ffffff',
 *   textPrimary: '#333333',
 *   textSecondary: '#666666',
 *   textTertiary: '#999999',
 *   like: '#ff6b6b',
 *   border: '#e0e0e0',
 * };
 *
 * Y en los componentes:
 * import { colors } from './theme';
 *
 * backgroundColor: colors.cardBackground, // en vez de 'white'
 * color: colors.textPrimary,              // en vez de '#333'
 */

export default theme
