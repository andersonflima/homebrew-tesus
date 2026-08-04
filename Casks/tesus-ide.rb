cask "tesus-ide" do
  version "0.5.10"
  sha256 "419123f9fd8f6d98804758040aa02dd9ff816179f8edbec289da4c5520f1c90a"

  url "https://github.com/andersonflima/homebrew-tesus/releases/download/ide-v#{version}/Tesus-IDE-#{version}-arm64.dmg",
      verified: "github.com/andersonflima/homebrew-tesus/"
  name "Tesus IDE"
  desc "IDE com o Zion como par de programação e memória Tesus via MCP"
  homepage "https://tesus.com.br"

  depends_on arch: :arm64

  app "Tesus IDE.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Tesus IDE.app"],
                   sudo: false
  end

  uninstall quit: "com.andersonespindola.tesuside"

  zap trash: [
    "~/Library/Application Support/tesus-ide",
    "~/Library/Preferences/com.andersonespindola.tesuside.plist",
    "~/Library/Saved Application State/com.andersonespindola.tesuside.savedState",
    "~/Library/Logs/tesus-ide",
  ]
end
