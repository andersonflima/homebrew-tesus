cask "tesus-ide" do
  version "0.6.1"
  sha256 "6eccd281ba71d1bdb78fbb9166f25406374e35d16b5bb77f5df1d64af5ddced2"

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
