# frozen_string_literal: true

cask "tesus-desktop" do
  version "0.1.23"

  on_arm do
    sha256 "7bec2241c81eb7f62e6699fb78559ccf55df42dc57463465eb5c04421e7d974a"
    url "https://github.com/andersonflima/homebrew-tesus/releases/download/desktop-v#{version}/Tesus-Desktop-#{version}-arm64.dmg",
        verified: "github.com/andersonflima/homebrew-tesus/"
  end

  on_intel do
    sha256 "5b32481aa9cab9e4e935869796c4149e5d60c1e0742b14e42ae5cb88a967dcf1"
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
