cask "motty" do
  version "0.3.0"
  sha256 "163c6bd048affb27bc8bd7570a7cd23929e76e15a6feec3cf27efe52eefdf635"

  url "https://github.com/farvisun/motty/releases/download/v#{version}/Motty-#{version}-universal.dmg"
  name "Motty"
  desc "Native terminal with tabs, splits and agent awareness"
  homepage "https://farvisun.github.io/motty/"

  # Motty › Check for Updates… installs new versions in place.
  auto_updates true
  depends_on macos: :ventura

  app "Motty.app"
  binary "#{appdir}/Motty.app/Contents/Resources/bin/motty"

  # Ad-hoc signed, not notarized: without this macOS refuses the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Motty.app"]
  end

  uninstall quit: "dev.motty.Motty"

  zap trash: [
    "~/.config/motty",
    "~/Library/Application Support/Motty",
    "~/Library/Caches/dev.motty.Motty",
    "~/Library/Preferences/dev.motty.Motty.plist",
  ]
end
