# frozen_string_literal: true

cask "tesus-desktop" do
  version "0.1.6"

  on_arm do
    sha256 "bf8c6067d00da8447c55c50d6212f2ec9e2bea6259ce41a4212b205ce143c397"
    url "https://github.com/andersonflima/homebrew-tesus/releases/download/desktop-v#{version}/Tesus-Desktop-#{version}-arm64.dmg",
        verified: "github.com/andersonflima/homebrew-tesus/"
  end

  on_intel do
    sha256 "580051d449b36271a303e63dac5b39a7fc5bb83e7660fa3017ebec271229d850"
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
