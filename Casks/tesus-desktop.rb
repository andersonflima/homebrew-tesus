# frozen_string_literal: true

cask "tesus-desktop" do
  version "0.1.8"

  on_arm do
    sha256 "d7601840112f237e80bb045d5e0faf800c49f5763561890308c9517038c285bb"
    url "https://github.com/andersonflima/homebrew-tesus/releases/download/desktop-v#{version}/Tesus-Desktop-#{version}-arm64.dmg",
        verified: "github.com/andersonflima/homebrew-tesus/"
  end

  on_intel do
    sha256 "d170a764a4962c1722ac880a191890a8b180e28ab6f98a115f34f21c5176a13c"
    url "https://github.com/andersonflima/homebrew-tesus/releases/download/desktop-v#{version}/Tesus-Desktop-#{version}-x64.dmg",
        verified: "github.com/andersonflima/homebrew-tesus/"
  end

  name "Tesus Desktop"
  desc "Cliente nativo do Tesus"
  homepage "https://tesus.com.br/"

  app "Tesus Desktop.app"

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
