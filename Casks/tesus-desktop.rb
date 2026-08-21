# frozen_string_literal: true

cask "tesus-desktop" do
  version "0.1.27"

  # URL primaria = CDN do DigitalOcean Spaces (bucket tesus-space, prefixo dist/desktop/).
  # Espelho/fallback: GitHub Release do repo homebrew-tesus. O sha256 e o mesmo em ambos.
  on_arm do
    sha256 "4ffbe054e3160b6319908cec06398f26f925055e56d1da96f0ea5f99f3306dc4"
    url "https://tesus-space.nyc3.cdn.digitaloceanspaces.com/dist/desktop/#{version}/Tesus-Desktop-#{version}-arm64.dmg",
        verified: "tesus-space.nyc3.cdn.digitaloceanspaces.com/dist/desktop/"
  end

  on_intel do
    sha256 "9c5bc67ff8223bdc3afe580f88b0e28c2af1c559e97999bbb33be7a291d1f2a6"
    url "https://tesus-space.nyc3.cdn.digitaloceanspaces.com/dist/desktop/#{version}/Tesus-Desktop-#{version}-x64.dmg",
        verified: "tesus-space.nyc3.cdn.digitaloceanspaces.com/dist/desktop/"
  end

  name "Tesus Desktop"
  desc "Cliente nativo do Tesus"
  homepage "https://tesus.com.br/"

  app "Tesus Desktop.app"

  # Build assinado (Developer ID) mas SEM notarizacao: remove a quarentena apos instalar para abrir
  # sem o bloqueio do Gatekeeper — confianca na instalacao sem depender de flag/trust do usuario.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Tesus Desktop.app"],
                   sudo: false
  end

  uninstall quit: "com.andersonespindola.tesusdesktop"

  zap trash: [
    "~/Library/Application Support/Tesus Desktop",
    "~/Library/Application Support/tesus-desktop",
    "~/Library/Logs/Tesus Desktop",
    "~/Library/Logs/tesus-desktop",
    "~/Library/Preferences/com.andersonespindola.tesusdesktop.plist",
    "~/Library/Saved Application State/com.andersonespindola.tesusdesktop.savedState",
  ]
end
