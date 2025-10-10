#!/bin/bash

# ============================================
# Script: auto-commit.sh
# 
# ¿Qué hace?
# Realiza commits automáticos cada 5 minutos usando Conventional Commits
# 
# ¿Para qué sirve?
# - Guardar progreso automáticamente durante desarrollo del bootcamp
# - Mantener historial detallado de cambios
# - Evitar pérdida de trabajo por olvido de commits
# - Seguir estándar de Conventional Commits
# 
# ¿Cómo funciona?
# 1. Verifica si hay cambios en el repositorio
# 2. Detecta el tipo de cambio (docs, feat, fix, etc.)
# 3. Genera mensaje descriptivo en inglés
# 4. Hace commit y push si hay cambios
# 
# Impacto:
# Mejora la trazabilidad del trabajo y automatiza el control de versiones
# 
# Uso:
# ./auto-commit.sh
# 
# Cron (cada 5 minutos):
# */5 * * * * /path/to/auto-commit.sh >> /tmp/auto-commit.log 2>&1
# ============================================

set -e # Exit on error

# ============================================
# CONFIGURACIÓN
# ============================================

# Repositorio del bootcamp
REPO_PATH="/home/epti/Documentos/epti-dev/bc-channel/bc-reactnative"

# Branch principal
BRANCH="main"

# Archivo de log
LOG_FILE="/tmp/auto-commit.log"

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# ============================================
# FUNCIONES DE LOG
# ============================================

log_info() {
    echo -e "${GREEN}✓${NC} [$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log_error() {
    echo -e "${RED}✗${NC} [$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log_warning() {
    echo -e "${YELLOW}⚠${NC} [$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log_debug() {
    echo -e "${CYAN}ℹ${NC} [$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# ============================================
# FUNCIONES DE DETECCIÓN
# ============================================

# Detecta el tipo de cambio según archivos modificados
# What? Analiza extensiones y carpetas para determinar el tipo
# For? Generar el prefijo correcto de Conventional Commit
# Impact? Commits más descriptivos y mejor historial
detect_change_type() {
    local changed_files=$1
    
    # docs: Cambios en documentación
    if echo "$changed_files" | grep -qE '\.(md|txt)$|_docs/|README'; then
        echo "docs"
        return
    fi
    
    # feat: Nuevas funcionalidades (scripts, código nuevo)
    if echo "$changed_files" | grep -qE '\.sh$|\.js$|\.ts$|\.tsx$|_scripts/.*\.'; then
        if git diff --cached --name-status | grep -q "^A"; then
            echo "feat"
            return
        fi
    fi
    
    # fix: Correcciones
    if echo "$changed_files" | grep -qE 'fix|bug|error'; then
        echo "fix"
        return
    fi
    
    # style: Cambios de estilo (CSS, estilos)
    if echo "$changed_files" | grep -qE '\.(css|scss|sass)$|styles'; then
        echo "style"
        return
    fi
    
    # refactor: Refactorización de código
    if echo "$changed_files" | grep -qE 'refactor'; then
        echo "refactor"
        return
    fi
    
    # test: Pruebas
    if echo "$changed_files" | grep -qE 'test|spec|\.test\.|\.spec\.'; then
        echo "test"
        return
    fi
    
    # chore: Tareas de mantenimiento
    if echo "$changed_files" | grep -qE '\.gitignore|package\.json|pnpm-lock|config|\.env'; then
        echo "chore"
        return
    fi
    
    # build: Sistema de build
    if echo "$changed_files" | grep -qE 'build|webpack|babel|metro'; then
        echo "build"
        return
    fi
    
    # ci: Integración continua
    if echo "$changed_files" | grep -qE '\.github/|\.gitlab|ci|cd'; then
        echo "ci"
        return
    fi
    
    # perf: Mejoras de rendimiento
    if echo "$changed_files" | grep -qE 'performance|perf|optim'; then
        echo "perf"
        return
    fi
    
    # Default: chore (tareas generales)
    echo "chore"
}

# Detecta el scope basado en la carpeta principal modificada
# What? Identifica la carpeta/módulo afectado
# For? Añadir contexto al commit (ej: docs(semana-01): ...)
# Impact? Mayor claridad sobre qué parte del proyecto cambió
detect_scope() {
    local changed_files=$1
    
    # Detectar semana del bootcamp
    if echo "$changed_files" | grep -qE 'bootcamp/semana-0[1-6]'; then
        local week=$(echo "$changed_files" | grep -oE 'semana-0[1-6]' | head -1)
        echo "$week"
        return
    fi
    
    # Detectar carpetas principales
    if echo "$changed_files" | grep -q "_docs/"; then
        echo "docs"
        return
    fi
    
    if echo "$changed_files" | grep -q "_scripts/"; then
        echo "scripts"
        return
    fi
    
    if echo "$changed_files" | grep -q "_assets/"; then
        echo "assets"
        return
    fi
    
    if echo "$changed_files" | grep -q ".github/"; then
        echo "config"
        return
    fi
    
    # Sin scope específico
    echo ""
}

# Genera descripción del cambio
# What? Crea un mensaje descriptivo basado en archivos modificados
# For? Completar el commit message con información útil
# Impact? Commits auto-explicativos sin necesidad de revisar diff
generate_description() {
    local changed_files=$1
    local file_count=$(echo "$changed_files" | wc -l)
    
    # Si es un solo archivo, usar nombre del archivo
    if [ "$file_count" -eq 1 ]; then
        local filename=$(basename "$changed_files")
        echo "update $filename"
        return
    fi
    
    # Si son múltiples archivos, dar descripción general
    if echo "$changed_files" | grep -q "README.md"; then
        echo "update documentation"
        return
    fi
    
    if echo "$changed_files" | grep -qE '_docs/'; then
        echo "update documentation files"
        return
    fi
    
    if echo "$changed_files" | grep -qE '_scripts/'; then
        echo "update utility scripts"
        return
    fi
    
    if echo "$changed_files" | grep -qE '_assets/'; then
        echo "update visual assets"
        return
    fi
    
    if echo "$changed_files" | grep -qE 'bootcamp/'; then
        echo "update bootcamp content"
        return
    fi
    
    # Descripción genérica
    echo "update $file_count files"
}

# Genera el cuerpo del commit con detalles
# What? Crea mensaje extendido con qué cambió, para qué y el impacto
# For? Proporcionar contexto completo en el commit
# Impact? Mejor comprensión del historial sin revisar código
generate_commit_body() {
    local changed_files=$1
    local type=$2
    
    # Obtener estadísticas
    local additions=$(git diff --cached --numstat | awk '{sum+=$1} END {print sum}')
    local deletions=$(git diff --cached --numstat | awk '{sum+=$2} END {print sum}')
    local file_count=$(echo "$changed_files" | wc -l)
    
    # Construir cuerpo del mensaje
    local body=""
    
    # What? (Qué cambió)
    body+="What:\n"
    body+="- Modified $file_count file(s)\n"
    body+="- Added $additions line(s)\n"
    body+="- Removed $deletions line(s)\n"
    body+="\n"
    
    # For? (Para qué)
    body+="For:\n"
    case $type in
        docs)
            body+="- Improve documentation clarity and completeness\n"
            body+="- Keep content up to date\n"
            ;;
        feat)
            body+="- Add new functionality to the bootcamp\n"
            body+="- Enhance learning resources\n"
            ;;
        fix)
            body+="- Resolve issues and errors\n"
            body+="- Improve code quality\n"
            ;;
        chore)
            body+="- Maintain project organization\n"
            body+="- Keep dependencies updated\n"
            ;;
        *)
            body+="- Continuous improvement of bootcamp materials\n"
            ;;
    esac
    body+="\n"
    
    # Impact? (Impacto)
    body+="Impact:\n"
    case $type in
        docs)
            body+="- Better understanding for students\n"
            body+="- Clearer instructions and guidance\n"
            ;;
        feat)
            body+="- Enhanced learning experience\n"
            body+="- More comprehensive resources\n"
            ;;
        fix)
            body+="- Improved reliability\n"
            body+="- Better code examples\n"
            ;;
        chore)
            body+="- Easier project maintenance\n"
            body+="- Better organization\n"
            ;;
        *)
            body+="- Overall bootcamp quality improvement\n"
            ;;
    esac
    
    echo -e "$body"
}

# ============================================
# FUNCIÓN PRINCIPAL
# ============================================

main() {
    log_info "=========================================="
    log_info "Starting auto-commit process"
    log_info "=========================================="
    
    # Verificar si estamos en un repositorio git
    if [ ! -d "$REPO_PATH/.git" ]; then
        log_error "Not a git repository: $REPO_PATH"
        exit 1
    fi
    
    # Cambiar al directorio del repositorio
    cd "$REPO_PATH" || exit 1
    log_debug "Working directory: $(pwd)"
    
    # Verificar si hay cambios
    if [ -z "$(git status --porcelain)" ]; then
        log_info "No changes detected. Nothing to commit."
        exit 0
    fi
    
    log_info "Changes detected. Preparing commit..."
    
    # Añadir todos los cambios al staging area
    git add -A
    
    # Obtener lista de archivos modificados
    changed_files=$(git diff --cached --name-only)
    log_debug "Changed files:\n$changed_files"
    
    # Detectar tipo de cambio
    commit_type=$(detect_change_type "$changed_files")
    log_debug "Detected commit type: $commit_type"
    
    # Detectar scope
    commit_scope=$(detect_scope "$changed_files")
    if [ -n "$commit_scope" ]; then
        log_debug "Detected scope: $commit_scope"
        scope_part="($commit_scope)"
    else
        scope_part=""
    fi
    
    # Generar descripción
    commit_description=$(generate_description "$changed_files")
    log_debug "Description: $commit_description"
    
    # Construir mensaje del commit
    commit_subject="${commit_type}${scope_part}: ${commit_description}"
    
    # Generar cuerpo del commit
    commit_body=$(generate_commit_body "$changed_files" "$commit_type")
    
    # Mensaje completo
    commit_message="${commit_subject}

${commit_body}

Auto-committed at $(date '+%Y-%m-%d %H:%M:%S')"
    
    log_info "Commit message:"
    log_info "---"
    echo "$commit_message" | tee -a "$LOG_FILE"
    log_info "---"
    
    # Hacer commit
    if git commit -m "$commit_message"; then
        log_info "Commit created successfully"
        
        # Intentar push (opcional, comentar si no se desea)
        log_info "Pushing to remote..."
        if git push origin "$BRANCH" 2>&1 | tee -a "$LOG_FILE"; then
            log_info "Push completed successfully"
        else
            log_warning "Push failed. Will retry in next cycle."
        fi
    else
        log_error "Commit failed"
        exit 1
    fi
    
    log_info "=========================================="
    log_info "Auto-commit process completed"
    log_info "=========================================="
}

# ============================================
# EJECUTAR
# ============================================

main "$@"
