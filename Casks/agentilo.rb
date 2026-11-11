cask "agentilo" do
  version "0.9.0"
  sha256 "33f72ace4818502403a72ac0452eb69d649e34fc904a068c24a435274e0446fc"

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
