# frozen_string_literal: true

cask "tesus-desktop" do
  version "0.1.2"

  on_arm do
    sha256 "cc7ac6d56c5455d4fbec31bc3788a7f669861e25926cb86e92034a9876bf4591"
    url "https://github.com/andersonflima/homebrew-tesus/releases/download/desktop-v#{version}/Tesus-Desktop-#{version}-arm64.dmg",
        verified: "github.com/andersonflima/homebrew-tesus/"
  end

  on_intel do
    sha256 "8bda3b7a580f8fae41393441c4fafda18ffdcb179aa2d55ae4355ae425227336"
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
