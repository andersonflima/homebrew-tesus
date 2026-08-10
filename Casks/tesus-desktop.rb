# frozen_string_literal: true

cask "tesus-desktop" do
  version "0.1.25"

  # URL primaria = CDN do DigitalOcean Spaces (bucket tesus-space, prefixo dist/desktop/).
  # Espelho/fallback: GitHub Release do repo homebrew-tesus. O sha256 e o mesmo em ambos.
  on_arm do
    sha256 "537f966cb6bf78e771b1eda07fc199df8553daf2782b6e70728d7c9ea568d90a"
    url "https://tesus-space.nyc3.cdn.digitaloceanspaces.com/dist/desktop/#{version}/Tesus-Desktop-#{version}-arm64.dmg",
        verified: "tesus-space.nyc3.cdn.digitaloceanspaces.com/dist/desktop/"
  end

  on_intel do
    sha256 "b5526bd49d9027cff86296ea0cbb55a921355fa7827586bc8b7df2b05408ec7b"
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
