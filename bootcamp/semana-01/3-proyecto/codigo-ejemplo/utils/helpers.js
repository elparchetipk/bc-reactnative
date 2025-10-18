/**
 * 🐛 ADVERTENCIA: Este archivo contiene un BUG INTENCIONAL
 *
 * helpers.js - Funciones auxiliares reutilizables
 *
 * Bug #5: Función sin return statement
 * Severidad: 🔴 Alta (Obvio)
 * Tipo: Error lógico
 *
 * ¿Puedes encontrarlo? Pista: La función no devuelve nada
 */

/**
 * Formatea un nombre completo
 *
 * ¿Qué hace?
 * Toma un nombre y apellido y los formatea en un string
 *
 * ¿Para qué?
 * Centralizar la lógica de formateo de nombres
 *
 * ¿Cómo funciona?
 * 1. Capitaliza la primera letra de cada palabra
 * 2. Combina nombre y apellido con espacio
 *
 * @param {string} firstName - Nombre de la persona
 * @param {string} lastName - Apellido de la persona
 * @returns {string} Nombre completo formateado
 */
export function formatFullName(firstName, lastName) {
  const capitalizedFirst =
    firstName.charAt(0).toUpperCase() + firstName.slice(1).toLowerCase()
  const capitalizedLast =
    lastName.charAt(0).toUpperCase() + lastName.slice(1).toLowerCase()

  // 🐛 BUG #5: Falta el return
  // La función procesa los datos pero no devuelve nada
  // Esto causará que cualquier código que use esta función reciba 'undefined'
  ;`${capitalizedFirst} ${capitalizedLast}`

  // ✅ SOLUCIÓN CORRECTA:
  // return `${capitalizedFirst} ${capitalizedLast}`;
}

/**
 * Valida un email
 *
 * ¿Qué hace?
 * Verifica si un string tiene formato de email válido
 *
 * @param {string} email - Email a validar
 * @returns {boolean} true si es válido, false si no
 */
export function isValidEmail(email) {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
  return emailRegex.test(email)
}

/**
 * Formatea una fecha a texto legible
 *
 * ¿Qué hace?
 * Convierte un objeto Date a formato "DD/MM/YYYY"
 *
 * @param {Date} date - Fecha a formatear
 * @returns {string} Fecha formateada
 */
export function formatDate(date) {
  const day = String(date.getDate()).padStart(2, '0')
  const month = String(date.getMonth() + 1).padStart(2, '0')
  const year = date.getFullYear()

  return `${day}/${month}/${year}`
}

/**
 * Trunca un texto si excede cierta longitud
 *
 * ¿Qué hace?
 * Corta un string largo y agrega "..." al final
 *
 * @param {string} text - Texto a truncar
 * @param {number} maxLength - Longitud máxima permitida
 * @returns {string} Texto truncado
 */
export function truncateText(text, maxLength = 50) {
  if (text.length <= maxLength) {
    return text
  }

  return text.slice(0, maxLength) + '...'
}

/**
 * Genera un ID único simple
 *
 * ¿Qué hace?
 * Crea un string único basado en timestamp y random
 *
 * @returns {string} ID único
 */
export function generateId() {
  return `${Date.now()}-${Math.random().toString(36).substr(2, 9)}`
}

/**
 * Calcula el tiempo transcurrido desde una fecha
 *
 * ¿Qué hace?
 * Retorna un string tipo "hace 5 minutos", "hace 2 horas"
 *
 * @param {Date} date - Fecha de referencia
 * @returns {string} Texto de tiempo transcurrido
 */
export function getTimeAgo(date) {
  const seconds = Math.floor((new Date() - date) / 1000)

  const intervals = {
    año: 31536000,
    mes: 2592000,
    semana: 604800,
    día: 86400,
    hora: 3600,
    minuto: 60,
    segundo: 1,
  }

  for (const [name, value] of Object.entries(intervals)) {
    const interval = Math.floor(seconds / value)

    if (interval >= 1) {
      return `hace ${interval} ${name}${interval > 1 ? 's' : ''}`
    }
  }

  return 'justo ahora'
}

/**
 * Capitaliza la primera letra de cada palabra
 *
 * ¿Qué hace?
 * Convierte "hola mundo" en "Hola Mundo"
 *
 * @param {string} text - Texto a capitalizar
 * @returns {string} Texto capitalizado
 */
export function capitalizeWords(text) {
  return text
    .toLowerCase()
    .split(' ')
    .map((word) => word.charAt(0).toUpperCase() + word.slice(1))
    .join(' ')
}
