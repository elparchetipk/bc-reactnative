#!/bin/bash

# ============================================
# Script: remove-cron.sh
# 
# ¿Qué hace?
# Elimina el cron job de auto-commits configurado
# 
# ¿Para qué sirve?
# - Desactivar auto-commits cuando ya no sean necesarios
# - Limpiar configuración de cron
# - Mantener el sistema ordenado
# 
# ¿Cómo funciona?
# 1. Verifica que existe el cron job
# 2. Lo elimina del crontab
# 3. Confirma la eliminación
# 
# Impacto:
# Detiene la automatización de commits, útil cuando se termina el desarrollo activo
# 
# Uso:
# ./remove-cron.sh
# ============================================

set -e

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info() {
    echo -e "${GREEN}✓${NC} $1"
}

log_error() {
    echo -e "${RED}✗${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

main() {
    echo ""
    echo "=========================================="
    echo "  Remove Auto-Commit Cron Job"
    echo "=========================================="
    echo ""
    
    # Verificar si existe el cron job
    if ! crontab -l 2>/dev/null | grep -q "auto-commit.sh"; then
        log_warning "No auto-commit cron job found"
        exit 0
    fi
    
    # Mostrar cron job actual
    echo "Current cron job:"
    echo "---"
    crontab -l 2>/dev/null | grep "auto-commit.sh"
    echo "---"
    echo ""
    
    # Confirmar eliminación
    read -p "Remove this cron job? (y/N): " -n 1 -r
    echo ""
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        # Eliminar cron job
        crontab -l 2>/dev/null | grep -v "auto-commit.sh" | crontab -
        log_info "Cron job removed successfully"
        
        echo ""
        echo "Remaining crontab:"
        echo "---"
        crontab -l 2>/dev/null || echo "(empty)"
        echo "---"
    else
        log_info "Operation cancelled"
    fi
    
    echo ""
}

main "$@"
