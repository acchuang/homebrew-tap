cask "daily-sutra" do
  version "1.2.0"
  sha256 "69481952d408f7ee7392c088372c5fbe8967b3c94ce905f809e4d38343705f7c"

  url "https://github.com/acchuang/daily-sutra/releases/download/v#{version}/DailySutra.zip"
  name "Daily Sutra"
  desc "Contemplative macOS menu bar app for Diamond Sutra and Heart Sutra"
  homepage "https://daily-sutra.pages.dev"

  depends_on macos: ">= :sonoma"

  app "DailySutra.app"

  # app is ad-hoc signed, not notarized; strip quarantine so Gatekeeper doesn't block first launch
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/DailySutra.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.acchuang.daily-sutra.plist",
    "~/Library/Saved Application State/com.acchuang.daily-sutra.savedState",
  ]
end
