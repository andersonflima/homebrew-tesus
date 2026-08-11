cask "tesus-browser" do
  version "0.1.262"
  sha256 "b839361f3e77041a4ea313a07a468d4e387a1663f9873b6130d40698a193ed83"

  # Servido pelo CDN do DigitalOcean Spaces (bucket tesus-space, prefixo dist/browser/).
  # Espelho/fallback: GitHub Release do repo homebrew-tesus.
  # Espelho/fallback: GitHub Release do repo homebrew-tesus.
  # Espelho/fallback: GitHub Release do repo homebrew-tesus.
  # Espelho/fallback: GitHub Release do repo homebrew-tesus.
  # Espelho/fallback: GitHub Release do repo homebrew-tesus.
  # Espelho/fallback: GitHub Release do repo homebrew-tesus.
  # Espelho/fallback: GitHub Release do repo homebrew-tesus.
  # Espelho/fallback: GitHub Release do repo homebrew-tesus.
  # Espelho/fallback: GitHub Release do repo homebrew-tesus.
  # Espelho/fallback: GitHub Release do repo homebrew-tesus.
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
