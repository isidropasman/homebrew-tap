cask "mactools" do
  version "0.1.0"
  sha256 "7ee504f4352cf1f8f2ad92a6d2d65100cf8937c2910ef32cb241efd06c7dd6d1"

  url "https://github.com/isidropasman/homebrew-tap/releases/download/v#{version}/MacTools-#{version}.dmg"
  name "MacTools"
  desc "Portapapeles, tareas, agenda y sesiones de agentes colgados de la notch"
  homepage "https://github.com/isidropasman/homebrew-tap"

  depends_on macos: ">= :sonoma"

  app "MacTools.app"

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
