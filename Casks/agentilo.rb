cask "agentilo" do
  version "0.9.2"
  sha256 "4987c3c593db30d1bb0cd4837f5a788f15793b492920fb7b69e62e928febbb95"

  url "https://github.com/farvisun/agentilo/releases/download/v#{version}/Agentilo.zip"
  name "Agentilo"
  desc "Claude Code, Codex and Cursor plan limits beside the MacBook notch"
  homepage "https://farvisun.github.io/agentilo/"

  # Sparkle updates the app in place.
  auto_updates true
  depends_on macos: :sonoma

  app "Agentilo.app"
  binary "#{appdir}/Agentilo.app/Contents/MacOS/Agentilo", target: "agentilo"

  # Ad-hoc signed, not notarized: without this macOS refuses the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Agentilo.app"]
  end

  uninstall quit: "app.agentilo.notch"

  zap trash: [
    "~/Library/Application Support/Agentilo",
    "~/Library/Caches/app.agentilo.notch",
    "~/Library/HTTPStorages/app.agentilo.notch",
    "~/Library/Preferences/app.agentilo.notch.plist",
  ]
end
