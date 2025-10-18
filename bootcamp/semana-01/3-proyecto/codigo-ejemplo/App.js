/**
 * 🐛 ADVERTENCIA: Este archivo contiene un BUG INTENCIONAL
 * 
 * App.js - Componente principal de la aplicación
 * 
 * Bug #1: Import incorrecto de React Native
 * Severidad: 🔴 Alta (Obvio)
 * Tipo: Error de sintaxis
 * 
 * ¿Puedes encontrarlo? Pista: Revisa los imports
 */

import React from 'react';
// 🐛 BUG #1: Import incorrecto - falta especificar componentes
import { react-native } from 'react-native';

/**
 * Componente principal de la aplicación
 * 
 * ¿Qué hace?
 * - Renderiza la pantalla de inicio (Home)
 * - Configura el contenedor principal con SafeAreaView
 * - Aplica estilos globales
 * 
 * ¿Para qué?
 * - Punto de entrada de la aplicación
 * - Estructura base de la app
 * 
 * ¿Cómo funciona?
 * - React renderiza este componente al iniciar
 * - Home.js se renderiza dentro del SafeAreaView
 */
export default function App() {
  return (
    <SafeAreaView style={styles.container}>
      <Home />
    </SafeAreaView>
  );
}

// Estilos del componente principal
const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
});
