cask "abubtranslate" do
  version "1.0.0"
  sha256 "2ba01b061aec54b321243b8ead799cd0887229e70be08eca4e77ad60e639fcc1"

  url "https://github.com/Abubiker/AbubTranslate/releases/download/v#{version}/AbubTranslate.dmg"
  name "AbubTranslate"
  desc "Menu-bar translator for the selection in any app"
  homepage "https://github.com/Abubiker/AbubTranslate"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "AbubTranslate.app"

  caveats <<~EOS
    AbubTranslate is signed with a developer certificate but not notarized,
    so macOS blocks the first launch. Allow it once in
    System Settings -> Privacy & Security -> Open Anyway.

    Translating the selection needs Accessibility permission, which the app
    asks for on first run.
  EOS

  zap trash: [
    "~/Library/Application Support/AbubTranslate",
    "~/Library/Caches/com.opensource.abubtranslate",
    "~/Library/Logs/AbubTranslate.log",
    "~/Library/Preferences/com.opensource.abubtranslate.plist",
  ]
end
