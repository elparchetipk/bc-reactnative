#!/bin/bash

# ============================================
# Script: setup-cron.sh
# 
# ¿Qué hace?
# Configura un cron job en Fedora 42 para ejecutar auto-commits cada 5 minutos
# 
# ¿Para qué sirve?
# - Automatizar la configuración del cron job
# - Instalar dependencias necesarias (cronie)
# - Configurar permisos y paths correctos
# - Validar la instalación
# 
# ¿Cómo funciona?
# 1. Verifica que cronie esté instalado
# 2. Crea el cron job con la configuración correcta
# 3. Configura permisos del script de auto-commit
# 4. Inicia y habilita el servicio crond
# 5. Valida que el cron esté funcionando
# 
# Impacto:
# Automatización completa del control de versiones durante el desarrollo
# 
# Uso:
# sudo ./setup-cron.sh
# ============================================

set -e # Exit on error

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Configuración
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AUTO_COMMIT_SCRIPT="$SCRIPT_DIR/auto-commit.sh"
CRON_LOG="/tmp/auto-commit.log"
USER=$(whoami)

# ============================================
# FUNCIONES DE LOG
# ============================================

log_info() {
    echo -e "${GREEN}✓${NC} $1"
}

log_error() {
    echo -e "${RED}✗${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

log_step() {
    echo -e "${BLUE}▶${NC} $1"
}

# ============================================
# FUNCIONES DE VALIDACIÓN
# ============================================

check_root() {
    if [ "$EUID" -eq 0 ]; then
        log_error "Do not run this script as root. Run as regular user."
        exit 1
    fi
}

check_dependencies() {
    log_step "Checking dependencies..."
    
    # Verificar si cronie está instalado
    if ! command -v crontab &> /dev/null; then
        log_warning "cronie not installed. Installing..."
        sudo dnf install -y cronie
        log_info "cronie installed successfully"
    else
        log_info "cronie is already installed"
    fi
    
    # Verificar si git está instalado
    if ! command -v git &> /dev/null; then
        log_error "git is not installed. Please install git first:"
        echo "  sudo dnf install -y git"
        exit 1
    fi
    
    log_info "All dependencies are satisfied"
}

check_script_exists() {
    if [ ! -f "$AUTO_COMMIT_SCRIPT" ]; then
        log_error "Auto-commit script not found: $AUTO_COMMIT_SCRIPT"
        exit 1
    fi
    log_info "Auto-commit script found"
}

# ============================================
# FUNCIONES DE CONFIGURACIÓN
# ============================================

setup_permissions() {
    log_step "Setting up permissions..."
    
    # Hacer el script ejecutable
    chmod +x "$AUTO_COMMIT_SCRIPT"
    log_info "Made auto-commit.sh executable"
    
    # Crear archivo de log si no existe
    touch "$CRON_LOG"
    chmod 644 "$CRON_LOG"
    log_info "Log file created: $CRON_LOG"
}

setup_cron_job() {
    log_step "Setting up cron job..."
    
    # Crear entrada del cron
    # Formato: */5 * * * * = cada 5 minutos
    CRON_ENTRY="*/5 * * * * $AUTO_COMMIT_SCRIPT >> $CRON_LOG 2>&1"
    
    # Verificar si ya existe el cron job
    if crontab -l 2>/dev/null | grep -q "$AUTO_COMMIT_SCRIPT"; then
        log_warning "Cron job already exists. Removing old entry..."
        crontab -l 2>/dev/null | grep -v "$AUTO_COMMIT_SCRIPT" | crontab -
    fi
    
    # Añadir nuevo cron job
    (crontab -l 2>/dev/null; echo "$CRON_ENTRY") | crontab -
    log_info "Cron job added successfully"
    
    # Mostrar crontab actual
    echo ""
    log_info "Current crontab:"
    echo "---"
    crontab -l
    echo "---"
}

start_crond_service() {
    log_step "Starting crond service..."
    
    # Iniciar servicio crond
    sudo systemctl start crond
    log_info "crond service started"
    
    # Habilitar para inicio automático
    sudo systemctl enable crond
    log_info "crond service enabled for auto-start"
    
    # Verificar estado
    if sudo systemctl is-active --quiet crond; then
        log_info "crond service is running"
    else
        log_error "crond service failed to start"
        sudo systemctl status crond
        exit 1
    fi
}

# ============================================
# FUNCIONES DE VALIDACIÓN POST-INSTALACIÓN
# ============================================

validate_installation() {
    log_step "Validating installation..."
    
    # Verificar cron job
    if crontab -l | grep -q "$AUTO_COMMIT_SCRIPT"; then
        log_info "Cron job is configured correctly"
    else
        log_error "Cron job configuration failed"
        exit 1
    fi
    
    # Verificar servicio crond
    if sudo systemctl is-enabled --quiet crond; then
        log_info "crond service is enabled"
    else
        log_warning "crond service is not enabled for auto-start"
    fi
    
    # Test del script (dry run)
    log_step "Testing auto-commit script..."
    if bash "$AUTO_COMMIT_SCRIPT"; then
        log_info "Auto-commit script executed successfully"
    else
        log_warning "Auto-commit script test had warnings (this is normal if no changes exist)"
    fi
}

# ============================================
# FUNCIÓN PRINCIPAL
# ============================================

main() {
    echo ""
    echo "=========================================="
    echo "  Auto-Commit Cron Setup for Fedora 42"
    echo "=========================================="
    echo ""
    
    # Validaciones
    check_root
    check_dependencies
    check_script_exists
    
    # Configuración
    setup_permissions
    setup_cron_job
    start_crond_service
    
    # Validación
    validate_installation
    
    echo ""
    echo "=========================================="
    log_info "Setup completed successfully!"
    echo "=========================================="
    echo ""
    echo "📝 Configuration details:"
    echo "   - Cron schedule: Every 5 minutes"
    echo "   - Script: $AUTO_COMMIT_SCRIPT"
    echo "   - Log file: $CRON_LOG"
    echo ""
    echo "🔍 Useful commands:"
    echo "   - View crontab: crontab -l"
    echo "   - Edit crontab: crontab -e"
    echo "   - View logs: tail -f $CRON_LOG"
    echo "   - Remove cron: crontab -l | grep -v auto-commit.sh | crontab -"
    echo "   - Check crond status: sudo systemctl status crond"
    echo ""
    echo "⚠️  Note: First auto-commit will run in the next 5-minute interval"
    echo ""
}

# ============================================
# EJECUTAR
# ============================================

main "$@"
