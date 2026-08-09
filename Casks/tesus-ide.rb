cask "tesus-ide" do
  version "0.5.28"
  sha256 "7dd7f06450c1a32c8c66f02316b16997f0b5b710ff9fb5a30d732bc7cc79e395"

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
