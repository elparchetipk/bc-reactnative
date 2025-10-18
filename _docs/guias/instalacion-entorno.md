# 🛠️ Guía de Instalación del Entorno de Desarrollo

> **Configuración completa paso a paso** para iniciar el Bootcamp React Native con las mejores herramientas.

---

## 📋 Índice

1. [Requisitos del Sistema](#-requisitos-del-sistema)
2. [Instalación de Node.js](#-instalación-de-nodejs)
3. [Instalación de pnpm](#-instalación-de-pnpm-obligatorio)
4. [Instalación de Expo CLI](#-instalación-de-expo-cli)
5. [Editor de Código (VS Code)](#-editor-de-código-vs-code)
6. [Git y GitHub](#-git-y-github)
7. [Expo Go App](#-expo-go-app-en-tu-móvil)
8. [Verificación Final](#-verificación-final)
9. [Troubleshooting](#-troubleshooting)

---

## 💻 Requisitos del Sistema

### Mínimos

| Componente | Requisito Mínimo                       |
| ---------- | -------------------------------------- |
| **OS**     | Windows 10, macOS 10.15, Ubuntu 20.04+ |
| **RAM**    | 8 GB                                   |
| **Disco**  | 10 GB libres                           |
| **CPU**    | Dual-core 2.0 GHz                      |

### Recomendados

| Componente | Recomendado                           |
| ---------- | ------------------------------------- |
| **OS**     | Windows 11, macOS 12+, Ubuntu 22.04+  |
| **RAM**    | 16 GB                                 |
| **Disco**  | SSD con 20 GB libres                  |
| **CPU**    | Quad-core 2.5 GHz+                    |

---

## 📦 Instalación de Node.js

Node.js es el runtime de JavaScript que necesitas para ejecutar React Native y todas sus herramientas.

### Versión Requerida

- **Mínimo:** Node.js 18.x
- **Recomendado:** Node.js 20.x LTS

### Windows

#### Opción 1: Instalador Oficial (Recomendado)

1. Ve a [nodejs.org](https://nodejs.org/)
2. Descarga la versión **LTS** (Long Term Support)
3. Ejecuta el instalador `.msi`
4. Sigue el asistente (deja todas las opciones por defecto)
5. Marca la opción **"Automatically install necessary tools"**

#### Opción 2: Con Chocolatey

```powershell
# Instalar Chocolatey primero (si no lo tienes)
# Ver: https://chocolatey.org/install

# Instalar Node.js
choco install nodejs-lts
```

#### Opción 3: Con Winget

```powershell
winget install OpenJS.NodeJS.LTS
```

### macOS

#### Opción 1: Con Homebrew (Recomendado)

```bash
# Instalar Homebrew primero (si no lo tienes)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Instalar Node.js
brew install node@20

# Agregar a PATH
echo 'export PATH="/opt/homebrew/opt/node@20/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

#### Opción 2: Instalador Oficial

1. Ve a [nodejs.org](https://nodejs.org/)
2. Descarga el instalador `.pkg` para macOS
3. Ejecuta el instalador
4. Sigue las instrucciones

#### Opción 3: Con nvm (Node Version Manager)

```bash
# Instalar nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Recargar shell
source ~/.zshrc

# Instalar Node.js LTS
nvm install --lts
nvm use --lts
nvm alias default node
```

### Linux (Ubuntu/Debian)

#### Opción 1: Con NodeSource (Recomendado)

```bash
# Actualizar sistema
sudo apt update && sudo apt upgrade -y

# Instalar dependencias
sudo apt install -y curl

# Agregar repositorio NodeSource para Node.js 20
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -

# Instalar Node.js
sudo apt install -y nodejs

# Verificar
node --version
npm --version
```

#### Opción 2: Con nvm

```bash
# Instalar nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Recargar shell
source ~/.bashrc

# Instalar Node.js LTS
nvm install --lts
nvm use --lts
nvm alias default node
```

### Verificar Instalación

```bash
# Verificar versión de Node.js
node --version
# Salida esperada: v20.x.x (o v18.x.x mínimo)

# Verificar versión de npm
npm --version
# Salida esperada: 10.x.x o superior
```

---

## ⚡ Instalación de pnpm (OBLIGATORIO)

> **⚠️ IMPORTANTE:** En este bootcamp **NO usamos npm**. Usamos **pnpm exclusivamente** por ser 3x más rápido y 80% más eficiente. Lee [¿Por qué pnpm?](./por-que-pnpm.md)

### ¿Qué es pnpm?

pnpm es un gestor de paquetes moderno que:

- ⚡ Instala paquetes **3x más rápido** que npm
- 💾 Usa **80% menos espacio** en disco
- 🔒 Es **más seguro** (sin dependencias fantasma)
- 🌍 Es usado por Microsoft, Google, Vercel, etc.

### Windows

#### Opción 1: Con npm (Recomendado)

```powershell
# Instalar pnpm globalmente (última vez que usarás npm)
npm install -g pnpm

# Verificar instalación
pnpm --version
# Salida esperada: 8.x.x o 9.x.x
```

#### Opción 2: Con PowerShell

```powershell
# Ejecutar como Administrador
iwr https://get.pnpm.io/install.ps1 -useb | iex
```

#### Opción 3: Con Chocolatey

```powershell
choco install pnpm
```

### macOS

#### Opción 1: Con npm (Recomendado)

```bash
# Instalar pnpm globalmente
npm install -g pnpm

# Verificar instalación
pnpm --version
```

#### Opción 2: Con Homebrew

```bash
brew install pnpm
```

#### Opción 3: Con curl

```bash
curl -fsSL https://get.pnpm.io/install.sh | sh -
```

### Linux (Ubuntu/Debian)

#### Opción 1: Con npm (Recomendado)

```bash
# Instalar pnpm globalmente
sudo npm install -g pnpm

# Verificar instalación
pnpm --version
```

#### Opción 2: Con curl

```bash
curl -fsSL https://get.pnpm.io/install.sh | sh -
```

#### Opción 3: Con Homebrew (si lo tienes)

```bash
brew install pnpm
```

### Configuración Inicial de pnpm

```bash
# Ver configuración actual
pnpm config list

# (Opcional) Configurar almacén global
pnpm config set store-dir ~/.pnpm-store

# (Opcional) Habilitar auto-instalación de peers
pnpm config set auto-install-peers true
```

### Verificar Instalación

```bash
# Verificar versión
pnpm --version
# Salida esperada: 8.15.0 o superior

# Verificar que funciona
pnpm --help

# Ver estadísticas del store
pnpm store status
```

---

## 🚀 Instalación de Expo CLI

Expo es la plataforma que usaremos para desarrollar nuestras aplicaciones React Native.

### Instalación Global con pnpm

```bash
# Instalar Expo CLI globalmente
pnpm add -g expo-cli

# Verificar instalación
expo --version
# Salida esperada: 6.x.x o superior
```

### Crear Cuenta de Expo

```bash
# Crear cuenta desde CLI
expo register

# O iniciar sesión si ya tienes cuenta
expo login
```

### Verificar Instalación

```bash
# Ver comandos disponibles
expo --help

# Verificar cuenta
expo whoami
# Debe mostrar tu usuario de Expo
```

---

## 💻 Editor de Código: VS Code

Visual Studio Code es el editor recomendado para este bootcamp.

### Instalación

#### Windows

1. Ve a [code.visualstudio.com](https://code.visualstudio.com/)
2. Descarga el instalador para Windows
3. Ejecuta el instalador
4. **Importante:** Marca todas las opciones:
   - ✅ Add "Open with Code" to context menu
   - ✅ Add to PATH

#### macOS

```bash
# Con Homebrew
brew install --cask visual-studio-code

# O descarga desde code.visualstudio.com
```

#### Linux (Ubuntu/Debian)

```bash
# Agregar repositorio de Microsoft
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# Instalar
sudo apt update
sudo apt install code
```

### Extensiones Esenciales

Instala estas extensiones en VS Code:

```bash
# Desde la terminal (con VS Code en PATH)
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension msjsdiag.vscode-react-native
code --install-extension mgmcdermott.vscode-language-babel
code --install-extension christian-kohler.path-intellisense
code --install-extension formulahendry.auto-rename-tag
```

#### O instalar manualmente:

1. Abre VS Code
2. Ve a Extensions (Ctrl+Shift+X o Cmd+Shift+X)
3. Busca e instala:
   - **ES7+ React/Redux/React-Native snippets** (dsznajder)
   - **Prettier - Code formatter** (esbenp)
   - **ESLint** (dbaeumer)
   - **React Native Tools** (msjsdiag)
   - **Babel JavaScript** (mgmcdermott)
   - **Path Intellisense** (christian-kohler)
   - **Auto Rename Tag** (formulahendry)

### Configuración Recomendada

Crea/edita `.vscode/settings.json` en tu proyecto:

```json
{
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true
  },
  "javascript.updateImportsOnFileMove.enabled": "always",
  "typescript.updateImportsOnFileMove.enabled": "always",
  "emmet.includeLanguages": {
    "javascript": "javascriptreact"
  }
}
```

---

## 🔧 Git y GitHub

### Instalar Git

#### Windows

```powershell
# Con Winget
winget install Git.Git

# O con Chocolatey
choco install git

# O descarga desde git-scm.com
```

#### macOS

```bash
# Con Homebrew
brew install git

# O viene preinstalado, verifica:
git --version
```

#### Linux (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install git
```

### Configurar Git

```bash
# Configurar nombre
git config --global user.name "Tu Nombre"

# Configurar email
git config --global user.email "tu.email@ejemplo.com"

# Configurar editor (VS Code)
git config --global core.editor "code --wait"

# Ver configuración
git config --list
```

### Crear Cuenta de GitHub

1. Ve a [github.com](https://github.com/)
2. Regístrate con tu email
3. Verifica tu cuenta

### Configurar SSH (Opcional pero Recomendado)

```bash
# Generar clave SSH
ssh-keygen -t ed25519 -C "tu.email@ejemplo.com"

# Presiona Enter para todo (usa valores por defecto)

# Copiar clave pública
# En macOS/Linux:
cat ~/.ssh/id_ed25519.pub | pbcopy
# En Windows:
cat ~/.ssh/id_ed25519.pub | clip

# Ve a GitHub → Settings → SSH Keys → New SSH Key
# Pega la clave y guarda
```

---

## 📱 Expo Go App (En tu Móvil)

### Android

1. Abre **Google Play Store**
2. Busca **"Expo Go"**
3. Instala la app
4. Abre y crea cuenta / inicia sesión

### iOS

1. Abre **App Store**
2. Busca **"Expo Go"**
3. Instala la app
4. Abre y crea cuenta / inicia sesión

### Vincular con Cuenta

- Inicia sesión en Expo Go con la misma cuenta que creaste en la CLI
- Esto permitirá que tus proyectos aparezcan automáticamente

---

## ✅ Verificación Final

Ejecuta estos comandos para verificar que todo está instalado correctamente:

```bash
# Node.js
node --version
# Esperado: v18.x.x o v20.x.x

# npm (viene con Node)
npm --version
# Esperado: 9.x.x o 10.x.x

# pnpm (OBLIGATORIO)
pnpm --version
# Esperado: 8.x.x o 9.x.x

# Expo CLI
expo --version
# Esperado: 6.x.x

# Git
git --version
# Esperado: 2.x.x

# VS Code
code --version
# Esperado: 1.x.x

# Verificar cuenta de Expo
expo whoami
# Esperado: tu nombre de usuario
```

### Script de Verificación Completo

```bash
# Crear script de verificación
cat > check-setup.sh << 'EOF'
#!/bin/bash

echo "🔍 Verificando Entorno de Desarrollo..."
echo ""

# Node.js
echo -n "Node.js: "
if command -v node &> /dev/null; then
    node --version
else
    echo "❌ NO INSTALADO"
fi

# npm
echo -n "npm: "
if command -v npm &> /dev/null; then
    npm --version
else
    echo "❌ NO INSTALADO"
fi

# pnpm
echo -n "pnpm: "
if command -v pnpm &> /dev/null; then
    pnpm --version
else
    echo "❌ NO INSTALADO (OBLIGATORIO)"
fi

# Expo
echo -n "Expo CLI: "
if command -v expo &> /dev/null; then
    expo --version
else
    echo "❌ NO INSTALADO"
fi

# Git
echo -n "Git: "
if command -v git &> /dev/null; then
    git --version
else
    echo "❌ NO INSTALADO"
fi

# VS Code
echo -n "VS Code: "
if command -v code &> /dev/null; then
    code --version | head -n 1
else
    echo "❌ NO INSTALADO"
fi

echo ""
echo "✅ Verificación completa"
EOF

# Dar permisos y ejecutar
chmod +x check-setup.sh
./check-setup.sh
```

---

## 🧪 Probar la Instalación

### Crear Proyecto de Prueba

```bash
# Crear proyecto de prueba
pnpx create-expo-app test-app

# Entrar al directorio
cd test-app

# Instalar dependencias
pnpm install

# Iniciar proyecto
pnpm start
```

### Verificar en Expo Go

1. Escanea el QR que aparece en la terminal con:
   - **Android:** App de cámara o Expo Go
   - **iOS:** App de cámara nativa
2. Debería abrir en Expo Go
3. Si ves "Open up App.js to start working...", ¡funciona! ✅

---

## ⚠️ Troubleshooting

### Error: "command not found: node"

**Solución:**

```bash
# Verificar que Node.js se instaló
which node

# Si no aparece, reinstalar Node.js
# Ver sección de instalación arriba

# Verificar PATH
echo $PATH
```

### Error: "command not found: pnpm"

**Solución:**

```bash
# Reinstalar pnpm
npm install -g pnpm

# Verificar PATH
# macOS/Linux:
echo $PATH | grep pnpm

# Agregar a PATH si es necesario
# En ~/.zshrc o ~/.bashrc:
export PATH="$HOME/.local/share/pnpm:$PATH"
```

### Error: "Expo CLI not found"

**Solución:**

```bash
# Reinstalar Expo CLI
pnpm add -g expo-cli

# Verificar instalación
expo --version

# Si sigue fallando, usar npx
npx expo --version
```

### Error: "Cannot connect to Metro"

**Solución:**

```bash
# Limpiar caché de Metro
pnpm start -- --clear

# O limpiar completamente
rm -rf node_modules
rm -rf .expo
pnpm install
pnpm start
```

### Error: Expo Go no conecta

**Soluciones:**

1. Asegúrate de estar en la **misma red WiFi**
2. Desactiva VPN si tienes una
3. Reinicia Expo Go
4. Usa modo túnel: `pnpm start --tunnel`

### Problemas de Permisos (Linux/macOS)

```bash
# Si tienes errores de permisos con npm/pnpm
# Cambiar propietario del directorio global
sudo chown -R $USER:$GROUP ~/.npm
sudo chown -R $USER:$GROUP ~/.pnpm-store

# O usar nvm para Node.js (recomendado)
```

### VS Code no Reconoce Comandos

**Windows:** Asegúrate de haber marcado "Add to PATH" en la instalación

**macOS/Linux:**

```bash
# Agregar VS Code a PATH
# En ~/.zshrc o ~/.bashrc:
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
```

---

## 📚 Recursos Adicionales

### Documentación Oficial

- [Node.js Documentation](https://nodejs.org/docs/)
- [pnpm Documentation](https://pnpm.io/)
- [Expo Documentation](https://docs.expo.dev/)
- [React Native Documentation](https://reactnative.dev/)
- [VS Code Documentation](https://code.visualstudio.com/docs)

### Guías del Bootcamp

- [¿Por qué pnpm?](./por-que-pnpm.md) - Ventajas detalladas
- [Comandos pnpm](../referencias/comandos-pnpm.md) - Cheat sheet
- [Configuración de VS Code](./configuracion-vscode.md) - Setup completo
- [Primeros Pasos con Expo](./primeros-pasos-expo.md) - Tutorial inicial

---

## ✅ Checklist de Instalación

Marca cuando completes cada paso:

### Requisitos Básicos

- [ ] Sistema operativo compatible
- [ ] Suficiente espacio en disco (10+ GB)
- [ ] Conexión a internet estable

### Instalaciones

- [ ] Node.js 18+ instalado y verificado
- [ ] pnpm instalado globalmente
- [ ] Expo CLI instalado y configurado
- [ ] VS Code instalado
- [ ] Extensiones de VS Code instaladas
- [ ] Git instalado y configurado
- [ ] Cuenta de GitHub creada
- [ ] Cuenta de Expo creada

### Móvil

- [ ] Expo Go instalado en móvil
- [ ] Cuenta de Expo vinculada

### Verificación

- [ ] Todos los comandos funcionan
- [ ] Proyecto de prueba creado exitosamente
- [ ] App se ve en Expo Go

---

## 🎓 Siguiente Paso

Una vez completada la instalación:

1. ✅ Lee [¿Por qué pnpm?](./por-que-pnpm.md) para entender las ventajas
2. ✅ Revisa [Comandos pnpm](../referencias/comandos-pnpm.md) esenciales
3. ✅ Configura [VS Code](./configuracion-vscode.md) con snippets
4. ✅ Empieza [Semana 1](../../bootcamp/semana-01/) del bootcamp

---

## 💬 Soporte

¿Problemas con la instalación?

- 📧 Email del instructor: [contacto bootcamp]
- 💬 Discord del bootcamp: [link del servidor]
- 📚 Documentación: Revisa [Troubleshooting](./troubleshooting.md)
- 🌐 Stack Overflow: Tag `react-native` + `expo`

---

**¡Felicidades por completar la instalación!** 🎉

Ahora estás listo para comenzar el bootcamp.

---

_Bootcamp React Native 2025_  
_Última actualización: Octubre 2025_  
_Versión: 1.0_
