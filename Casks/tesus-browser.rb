cask "tesus-browser" do
  version "0.1.15"
  sha256 "c9b0de373f3b85283d756b8ffe8c9b12b69a42da44dc37a3b9a586abc3d98578"

  # Servido pelo release do GitHub (CDN rápido). Espelho: https://tesus.com.br/dist/Tesus-Browser-#{version}-arm64.dmg
  url "https://github.com/andersonflima/homebrew-tesus/releases/download/v#{version}/Tesus-Browser-#{version}-arm64.dmg"
  name "Tesus Browser"
  desc "Navegador com o agente Aura embutido (Electron)"
  homepage "https://tesus.com.br/"

  # Build v0.1 é só arm64 e não é assinada/notarizada.
  depends_on arch: :arm64

  app "Tesus Browser.app"

  # App unsigned: remove a quarentena após instalar pra abrir sem o bloqueio do Gatekeeper
  # (equivalente a instalar com --no-quarantine, sem depender da flag do usuário).
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Tesus Browser.app"],
                   sudo: false
  end

  uninstall quit: "com.andersonespindola.tesusbrowser"

  zap trash: [
    "~/Library/Application Support/tesus-browser",
    "~/Library/Preferences/com.andersonespindola.tesusbrowser.plist",
    "~/Library/Saved Application State/com.andersonespindola.tesusbrowser.savedState",
    "~/Library/Logs/tesus-browser",
  ]
end
