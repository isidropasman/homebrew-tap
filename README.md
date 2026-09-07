# Notchbox

Portapapeles con historial, tareas, agenda, estante de archivos y el estado de tus
sesiones de Claude, Codex y Conductor — todo colgado de la notch.

## Instalar

```sh
brew install --cask isidropasman/tap/notchbox
```

Eso es todo: instala y abre sin advertencias. Si no tenés Homebrew, primero:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Requiere **macOS 14 (Sonoma) o más nuevo**.

## La primera vez

Notchbox vive en la barra de menú, no en el Dock. Al abrirla aparece una **guía de
inicio** que pide los permisos de a uno, con un botón cada uno:

| Permiso | Para qué | ¿Obligatorio? |
|---|---|---|
| Accesibilidad | Pegar solo lo que elegís del historial | sí |
| Notificaciones | Avisarte cuando vence una tarea | sí |
| Calendario | Ver tus próximos eventos en la notch | opcional |

Podés saltear los opcionales y activarlos después desde **Configuración → Resumen**.

## Qué trae

| | Atajo |
|---|---|
| **Portapapeles** — todo lo que copiaste, con búsqueda, fijados y favoritos | `⇧⌘V` |
| **Tareas** — proyecto, prioridad y recordatorio en una sola línea | `⇧⌥T` |
| **Notch** — música, agenda, batería y archivos | pasar el mouse por el recorte |
| **Estante** — arrastrá archivos a la notch y sacalos donde los necesites | |
| **Agentes** — qué corre en Claude, Codex y Conductor, y cuál te espera | |

Los atajos se cambian en **Configuración → Atajos**.

### Dictado (opcional)

El dictado corre en [FluidVoice](https://github.com/altic-dev/FluidVoice), que se
instala aparte:

```sh
brew install --cask fluidvoice
```

Notchbox lo detecta, lo configura desde **Configuración → Dictado** y guarda cada
dictado en el historial del portapapeles.

### Agentes (opcional)

Conductor y Claude Desktop se leen solos. Para las sesiones de terminal y las
pestañas del navegador hay que instalar una pieza, y hay un botón para cada una en
**Configuración → Agentes**.

## Actualizar

```sh
brew upgrade --cask mactools
```

## Desinstalar

```sh
brew uninstall --cask mactools          # saca la app
brew uninstall --zap --cask mactools    # y también el historial y las preferencias
```

## Sin Homebrew

Bajá el `.dmg` de [Releases](https://github.com/isidropasman/homebrew-tap/releases).

Notchbox no está notarizada con una cuenta de Apple Developer, así que por este
camino macOS la bloquea la primera vez con *"Apple no ha podido verificar que no
contenga software malicioso"*. Para abrirla igual:

1. Arrastrá Notchbox a **Aplicaciones**.
2. Abrila. Cuando salga el cartel, apretá **Aceptar**.
3. Andá a **Ajustes del Sistema → Privacidad y Seguridad**, bajá hasta *Seguridad*
   y apretá **Abrir igualmente** al lado de Notchbox.
4. Confirmá con **Abrir**.

Solo la primera vez. Desde macOS 15 el viejo truco del clic derecho ya no alcanza.

**Por eso conviene Homebrew**: hace ese paso por vos.

## Privacidad

Todo queda en tu Mac: el historial en una base SQLite local, las tareas y los
proyectos en archivos JSON. No hay servidor ni cuenta.

El único puerto que se abre es `127.0.0.1:7717`, y solo para que la extensión de
Chrome informe el estado de tus pestañas. No es accesible desde fuera de tu Mac.

La notch y el historial se excluyen de capturas y de pantalla compartida, así que
no aparecen en Zoom, Meet ni en una grabación.
