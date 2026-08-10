cask "tesus-browser" do
  version "0.1.252"
  sha256 "394c3c5af2ef284bcaa86d4a4f36198127475383a19de592652ea4519f68aff0"

  # Servido pelo CDN do DigitalOcean Spaces (bucket tesus-space, prefixo dist/browser/).
  # Espelho/fallback: GitHub Release do repo homebrew-tesus.
  # Espelho/fallback: GitHub Release do repo homebrew-tesus.
  # Espelho/fallback: GitHub Release do repo homebrew-tesus.
  # Espelho/fallback: GitHub Release do repo homebrew-tesus.
  # Espelho/fallback: GitHub Release do repo homebrew-tesus.
  # Espelho/fallback: GitHub Release do repo homebrew-tesus.
  # Espelho/fallback: GitHub Release do repo homebrew-tesus.
  url "https://tesus-space.nyc3.cdn.digitaloceanspaces.com/dist/browser/#{version}/Tesus-Browser-#{version}-arm64.dmg",
      verified: "tesus-space.nyc3.cdn.digitaloceanspaces.com/dist/browser/"
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
