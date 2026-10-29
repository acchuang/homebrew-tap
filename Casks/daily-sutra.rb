cask "daily-sutra" do
  version "1.3.0"
  sha256 "36133ae95504b85a5b4b3a542404b038ea36ab06f2cd7247b755c5d7ab8972fd"

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
