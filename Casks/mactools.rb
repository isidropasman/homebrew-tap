cask "mactools" do
  version "0.1.2"
  sha256 "1ff872b5151df1a04d9bdc6b3025262e6c7020c73d01f7968108658dae8c3ad7"

  url "https://github.com/isidropasman/homebrew-tap/releases/download/v#{version}/MacTools-#{version}.dmg"
  name "MacTools"
  desc "Portapapeles, tareas, agenda y sesiones de agentes colgados de la notch"
  homepage "https://github.com/isidropasman/homebrew-tap"

  depends_on macos: :sonoma

  app "MacTools.app"

  # MacTools no esta notarizada: sin esto macOS la bloquea al abrirla y hay que ir a
  # Ajustes > Privacidad y Seguridad > "Abrir igualmente". Es lo mismo que harias a mano,
  # hecho por el instalador. Cuando la app este notarizada esto se borra.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/MacTools.app"],
                   sudo: false
  end

  uninstall quit: "dev.isidropasman.pila"

  zap trash: [
    "~/Library/Application Support/Pila",
    "~/Library/Preferences/dev.isidropasman.pila.plist",
  ]

  caveats <<~EOS
    MacTools vive en la barra de menú y en la notch.

    La primera vez pide permisos de Accesibilidad, Notificaciones y Calendario;
    la guía de inicio los va pidiendo de a uno con un botón cada uno.

    El dictado es opcional y corre en FluidVoice, que se instala aparte:
      brew install --cask fluidvoice
  EOS
end
