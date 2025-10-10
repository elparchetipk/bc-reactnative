# 🤖 Auto-Commit System for Fedora 42

Sistema automatizado de commits con Conventional Commits para el bootcamp.

---

## 📋 ¿Qué hace?

Este sistema realiza commits automáticos cada 5 minutos siguiendo el estándar de Conventional Commits, incluyendo información detallada sobre:

- **What?** - Qué cambió
- **For?** - Para qué sirve el cambio
- **Impact?** - Cuál es el impacto

---

## 🎯 Características

### ✅ Conventional Commits

Mensajes estructurados según el estándar:

```
type(scope): description

What:
- What changed in detail

For:
- Purpose of the changes

Impact:
- Impact on the project

Auto-committed at YYYY-MM-DD HH:MM:SS
```

### 📦 Tipos de Commit Detectados

| Tipo       | Descripción           | Detecta                              |
| ---------- | --------------------- | ------------------------------------ |
| `docs`     | Documentación         | `.md`, `.txt`, `_docs/`, `README`    |
| `feat`     | Nueva funcionalidad   | Scripts nuevos, código nuevo         |
| `fix`      | Corrección de errores | Archivos con "fix", "bug", "error"   |
| `style`    | Estilos               | `.css`, `.scss`, archivos de estilos |
| `refactor` | Refactorización       | Archivos con "refactor"              |
| `test`     | Pruebas               | Archivos de test                     |
| `chore`    | Mantenimiento         | Config, `.gitignore`, `package.json` |
| `build`    | Sistema de build      | Build configs, webpack, babel        |
| `ci`       | CI/CD                 | `.github/`, archivos CI              |
| `perf`     | Performance           | Archivos con "performance", "optim"  |

### 🎯 Scopes Detectados

| Scope                     | Carpeta               |
| ------------------------- | --------------------- |
| `semana-01` a `semana-06` | `bootcamp/semana-XX/` |
| `docs`                    | `_docs/`              |
| `scripts`                 | `_scripts/`           |
| `assets`                  | `_assets/`            |
| `config`                  | `.github/`            |

---

## 🚀 Instalación

### 1. Dar Permisos de Ejecución

```bash
cd /home/epti/Documentos/epti-dev/bc-channel/bc-reactnative/_scripts/utils
chmod +x auto-commit.sh setup-cron.sh remove-cron.sh
```

### 2. Configurar Cron Job

```bash
# Ejecutar el script de configuración
./setup-cron.sh
```

El script automáticamente:

- ✅ Instala `cronie` si no está instalado
- ✅ Configura el cron job para ejecutarse cada 5 minutos
- ✅ Inicia y habilita el servicio `crond`
- ✅ Valida la configuración

---

## 📝 Uso

### Ver Logs en Tiempo Real

```bash
tail -f /tmp/auto-commit.log
```

### Ver Crontab Actual

```bash
crontab -l
```

### Editar Crontab Manualmente

```bash
crontab -e
```

### Verificar Estado del Servicio

```bash
sudo systemctl status crond
```

### Ejecutar Manualmente (Test)

```bash
./auto-commit.sh
```

---

## 🗑️ Desinstalación

### Eliminar Cron Job

```bash
./remove-cron.sh
```

O manualmente:

```bash
crontab -l | grep -v auto-commit.sh | crontab -
```

---

## 📊 Ejemplo de Commit Generado

```
docs(semana-01): update README.md

What:
- Modified 1 file(s)
- Added 45 line(s)
- Removed 12 line(s)

For:
- Improve documentation clarity and completeness
- Keep content up to date

Impact:
- Better understanding for students
- Clearer instructions and guidance

Auto-committed at 2025-10-09 15:30:00
```

---

## ⚙️ Configuración Personalizada

### Cambiar Frecuencia del Cron

Editar el crontab:

```bash
crontab -e
```

Modificar la frecuencia:

| Expresión      | Descripción             |
| -------------- | ----------------------- |
| `*/5 * * * *`  | Cada 5 minutos (actual) |
| `*/10 * * * *` | Cada 10 minutos         |
| `*/15 * * * *` | Cada 15 minutos         |
| `0 * * * *`    | Cada hora               |
| `0 */2 * * *`  | Cada 2 horas            |
| `0 9-17 * * *` | Cada hora de 9am a 5pm  |

### Cambiar Repositorio

Editar `auto-commit.sh`:

```bash
# Línea 36
REPO_PATH="/ruta/a/tu/repositorio"
```

### Deshabilitar Push Automático

Comentar las líneas 353-359 en `auto-commit.sh`:

```bash
# Intentar push (opcional, comentar si no se desea)
# log_info "Pushing to remote..."
# if git push origin "$BRANCH" 2>&1 | tee -a "$LOG_FILE"; then
#     log_info "Push completed successfully"
# else
#     log_warning "Push failed. Will retry in next cycle."
# fi
```

---

## 🔍 Troubleshooting

### El cron no se ejecuta

1. Verificar que crond esté corriendo:

```bash
sudo systemctl status crond
```

2. Revisar logs del sistema:

```bash
sudo journalctl -u crond -f
```

3. Verificar sintaxis del crontab:

```bash
crontab -l
```

### No se hacen commits

1. Verificar que hay cambios:

```bash
cd /home/epti/Documentos/epti-dev/bc-channel/bc-reactnative
git status
```

2. Revisar logs:

```bash
tail -n 50 /tmp/auto-commit.log
```

3. Ejecutar manualmente:

```bash
./_scripts/utils/auto-commit.sh
```

### Error de permisos

```bash
chmod +x /home/epti/Documentos/epti-dev/bc-channel/bc-reactnative/_scripts/utils/auto-commit.sh
```

### Push falla constantemente

1. Verificar autenticación:

```bash
git remote -v
ssh -T git@github.com  # Para GitHub SSH
```

2. Configurar credenciales:

```bash
git config --global credential.helper store
```

---

## 🎓 Para el Bootcamp

### Cuándo Usar

✅ **Recomendado durante:**

- Desarrollo activo de contenido
- Creación de documentación
- Sesiones presenciales largas
- Trabajo en múltiples archivos

❌ **No recomendado para:**

- Commits importantes que requieren mensajes específicos
- Cambios críticos que necesitan revisión manual
- Código en producción

### Mejores Prácticas

1. **Commits manuales para hitos importantes:**

   ```bash
   git commit -m "feat(semana-01): complete week 1 content and projects"
   ```

2. **Revisar historial periódicamente:**

   ```bash
   git log --oneline --graph
   ```

3. **Squash de commits antes de merge:**

   ```bash
   git rebase -i HEAD~10
   ```

4. **Deshabilitar antes de presentaciones:**
   ```bash
   ./remove-cron.sh
   ```

---

## 📚 Referencias

- [Conventional Commits](https://www.conventionalcommits.org/)
- [Cron Expression Guide](https://crontab.guru/)
- [Git Best Practices](https://git-scm.com/book/en/v2/Distributed-Git-Contributing-to-a-Project)
- [Fedora Cron Documentation](https://docs.fedoraproject.org/en-US/quick-docs/automating-tasks-with-cron/)

---

## 📄 Archivos del Sistema

```
_scripts/utils/
├── auto-commit.sh          # Script principal de auto-commit
├── setup-cron.sh          # Configuración del cron job
├── remove-cron.sh         # Eliminación del cron job
└── AUTO-COMMIT-README.md  # Esta documentación
```

---

## 🤝 Contribuir

Para mejorar el sistema de auto-commit:

1. Fork del repositorio
2. Crear branch: `git checkout -b feature/improve-auto-commit`
3. Hacer cambios en `_scripts/utils/`
4. Commit: `git commit -m "feat(scripts): improve auto-commit detection"`
5. Push y Pull Request

---

[← Volver a Scripts](./../README.md) | [← Volver al README principal](./../../README.md)
