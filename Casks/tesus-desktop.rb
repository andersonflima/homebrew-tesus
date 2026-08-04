# frozen_string_literal: true

cask "tesus-desktop" do
  version "0.1.9"

  on_arm do
    sha256 "d344421e4242ed3910092c36fd183fd2394ceee430e27ebf7b3745456374b8d2"
    url "https://github.com/andersonflima/homebrew-tesus/releases/download/desktop-v#{version}/Tesus-Desktop-#{version}-arm64.dmg",
        verified: "github.com/andersonflima/homebrew-tesus/"
  end

  on_intel do
    sha256 "fbc6b2e467e0040eed6fbbb06e8f4190f59f9117652200ffd0a2878363fdeb2e"
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
