/**
 * 🐛 ADVERTENCIA: Este archivo contiene un BUG INTENCIONAL
 *
 * Card.js - Componente reutilizable de tarjeta
 *
 * Bug #2: Mutación directa del estado
 * Severidad: 🟠 Media (Sutil)
 * Tipo: Anti-patrón de React
 *
 * ¿Puedes encontrarlo? Pista: Revisa cómo se actualiza el estado
 */

import React, { useState } from 'react'
import { View, Text, StyleSheet, TouchableOpacity } from 'react-native'

/**
 * Componente Card
 *
 * ¿Qué hace?
 * Muestra una tarjeta con información y un contador de likes
 *
 * ¿Para qué?
 * Componente reutilizable para mostrar contenido con interactividad
 *
 * ¿Cómo funciona?
 * 1. Recibe título y descripción por props
 * 2. Mantiene estado local del contador de likes
 * 3. Permite incrementar likes con un botón
 *
 * @param {string} title - Título de la tarjeta
 * @param {string} description - Descripción del contenido
 */
export default function Card({ title, description }) {
  const [likes, setLikes] = useState(0)
  const [likeHistory, setLikeHistory] = useState([])

  /**
   * Maneja el evento de dar like
   *
   * 🐛 BUG #2: Mutación directa del estado
   * Este código muta el array directamente en lugar de crear uno nuevo
   * React no detecta el cambio y no re-renderiza correctamente
   */
  const handleLike = () => {
    setLikes(likes + 1)

    // 🐛 BUG AQUÍ: mutación directa del array
    likeHistory.push(new Date().toISOString())
    setLikeHistory(likeHistory) // React no detecta el cambio

    // ✅ SOLUCIÓN CORRECTA (comentada):
    // setLikeHistory([...likeHistory, new Date().toISOString()]);
  }

  return (
    <View style={styles.card}>
      <Text style={styles.title}>{title}</Text>
      <Text style={styles.description}>{description}</Text>

      <View style={styles.footer}>
        <TouchableOpacity style={styles.likeButton} onPress={handleLike}>
          <Text style={styles.likeText}>❤️ {likes}</Text>
        </TouchableOpacity>

        <Text style={styles.historyText}>
          Total de likes: {likeHistory.length}
        </Text>
      </View>
    </View>
  )
}

const styles = StyleSheet.create({
  card: {
    backgroundColor: 'white',
    borderRadius: 12,
    padding: 16,
    marginVertical: 8,
    marginHorizontal: 16,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  title: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#333',
    marginBottom: 8,
  },
  description: {
    fontSize: 16,
    color: '#666',
    marginBottom: 16,
    lineHeight: 24,
  },
  footer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginTop: 12,
    paddingTop: 12,
    borderTopWidth: 1,
    borderTopColor: '#e0e0e0',
  },
  likeButton: {
    backgroundColor: '#ff6b6b',
    paddingHorizontal: 16,
    paddingVertical: 8,
    borderRadius: 20,
  },
  likeText: {
    color: 'white',
    fontWeight: '600',
    fontSize: 14,
  },
  historyText: {
    fontSize: 12,
    color: '#999',
  },
})
