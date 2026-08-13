cask "tesus-ide" do
  version "0.5.30"
  sha256 "5fde9ef1fcb2c37db3a50b3a5c79363560196ead8e956f5747dcc4689af8e0f6"

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
