cask "notchbox" do
  version "0.2.0"
  sha256 "893e98b58b8f681001851bd5c28b387c2eb0b806021bef1eb4a097092307b68d"

  url "https://github.com/isidropasman/homebrew-tap/releases/download/v#{version}/Notchbox-#{version}.dmg"
  name "Notchbox"
  desc "Portapapeles, tareas, agenda y sesiones de agentes colgados de la notch"
  homepage "https://github.com/isidropasman/homebrew-tap"

  depends_on macos: :sonoma

  app "Notchbox.app"

  uninstall quit: "dev.isidropasman.pila"

  # postflight_steps es un DSL restringido que no deja correr comandos, asi que sigue siendo
  # postflight aunque avise que esta deprecado.
  #
  # Notchbox no esta notarizada: sin esto macOS la bloquea al abrirla y hay que ir a
  # Ajustes > Privacidad y Seguridad > "Abrir igualmente". Es lo mismo que harias a mano,
  # hecho por el instalador. Cuando la app este notarizada esto se borra.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Notchbox.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Pila",
    "~/Library/Preferences/dev.isidropasman.pila.plist",
  ]

  caveats <<~EOS
    Notchbox vive en la barra de menú y en la notch.

    La primera vez pide permisos de Accesibilidad, Notificaciones y Calendario;
    la guía de inicio los va pidiendo de a uno con un botón cada uno.

    El dictado es opcional y corre en FluidVoice, que se instala aparte:
      brew install --cask fluidvoice
  EOS
end
