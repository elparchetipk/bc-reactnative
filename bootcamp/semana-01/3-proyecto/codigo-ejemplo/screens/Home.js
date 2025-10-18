/**
 * 🐛 ADVERTENCIA: Este archivo contiene un BUG INTENCIONAL
 *
 * Home.js - Pantalla principal con lista de contactos
 *
 * Bug #3: FlatList sin keyExtractor
 * Severidad: 🟡 Baja (Mejores Prácticas)
 * Tipo: Warning de performance
 *
 * ¿Puedes encontrarlo? Pista: Revisa el FlatList
 */

import React, { useState } from 'react'
import { View, Text, FlatList, StyleSheet, TextInput } from 'react-native'
import Card from '../components/Card'

// Mock data de contactos
const CONTACTS_DATA = [
  { id: '1', name: 'Juan Pérez', email: 'juan@example.com' },
  { id: '2', name: 'María García', email: 'maria@example.com' },
  { id: '3', name: 'Carlos López', email: 'carlos@example.com' },
  { id: '4', name: 'Ana Martínez', email: 'ana@example.com' },
  { id: '5', name: 'Luis Rodríguez', email: 'luis@example.com' },
]

/**
 * Componente Home - Pantalla principal
 *
 * ¿Qué hace?
 * Muestra una lista de contactos con buscador
 *
 * ¿Para qué?
 * Demostrar el uso de FlatList y filtrado de datos
 *
 * ¿Cómo funciona?
 * 1. Mantiene estado de búsqueda
 * 2. Filtra contactos según texto de búsqueda
 * 3. Renderiza lista con FlatList
 */
export default function Home() {
  const [searchText, setSearchText] = useState('')

  /**
   * Filtra contactos según el texto de búsqueda
   */
  const filteredContacts = CONTACTS_DATA.filter((contact) =>
    contact.name.toLowerCase().includes(searchText.toLowerCase())
  )

  /**
   * Renderiza cada item de la lista
   */
  const renderContact = ({ item }) => (
    <Card title={item.name} description={item.email} />
  )

  return (
    <View style={styles.container}>
      {/* Header */}
      <View style={styles.header}>
        <Text style={styles.title}>Mis Contactos</Text>
        <Text style={styles.subtitle}>{filteredContacts.length} contactos</Text>
      </View>

      {/* Buscador */}
      <TextInput
        style={styles.searchInput}
        placeholder="Buscar contacto..."
        value={searchText}
        onChangeText={setSearchText}
      />

      {/* Lista de contactos */}
      {/* 🐛 BUG #3: FlatList sin keyExtractor */}
      {/* Esto genera un warning y puede causar problemas de performance */}
      <FlatList
        data={filteredContacts}
        renderItem={renderContact}
        contentContainerStyle={styles.listContent}
        // 🐛 FALTA: keyExtractor={(item) => item.id}
        // Sin keyExtractor, React usa el índice del array como key
        // Esto puede causar bugs cuando la lista cambia
      />

      {/* Empty state */}
      {filteredContacts.length === 0 && (
        <View style={styles.emptyState}>
          <Text style={styles.emptyText}>No se encontraron contactos</Text>
        </View>
      )}
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  header: {
    backgroundColor: 'white',
    padding: 20,
    paddingTop: 60,
    borderBottomWidth: 1,
    borderBottomColor: '#e0e0e0',
  },
  title: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#333',
    marginBottom: 4,
  },
  subtitle: {
    fontSize: 14,
    color: '#666',
  },
  searchInput: {
    backgroundColor: 'white',
    margin: 16,
    padding: 12,
    borderRadius: 8,
    fontSize: 16,
    borderWidth: 1,
    borderColor: '#e0e0e0',
  },
  listContent: {
    paddingBottom: 20,
  },
  emptyState: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 40,
  },
  emptyText: {
    fontSize: 16,
    color: '#999',
    textAlign: 'center',
  },
})
