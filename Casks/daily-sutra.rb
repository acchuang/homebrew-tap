cask "daily-sutra" do
  version "1.2.1"
  sha256 "da92c2f75fec5c916e5fc34fccfae41c7138db8ca25ea6e3513c9a3c31049cdc"

  url "https://github.com/acchuang/daily-sutra/releases/download/v#{version}/DailySutra.zip"
  name "Daily Sutra"
  desc "Contemplative macOS menu bar app for Diamond Sutra and Heart Sutra"
  homepage "https://daily-sutra.pages.dev"

  depends_on macos: ">= :sonoma"

  app "DailySutra.app"

  # app is self-signed, not notarized; strip quarantine so Gatekeeper doesn't block first launch
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/DailySutra.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.acchuang.daily-sutra.plist",
    "~/Library/Saved Application State/com.acchuang.daily-sutra.savedState",
  ]
end
