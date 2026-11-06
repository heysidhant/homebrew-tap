cask "appvanish" do
  version "1.0.0"
  sha256 "5ca879ecd3cf597fd992d73c77faa34c246313a25142727b05bb3fa19c7161d4"

  url "https://github.com/heysidhant/appvanish/releases/download/v#{version}/AppVanish-#{version}.dmg"
  name "App Vanish"
  desc "Uninstaller that finds and removes the files apps leave behind"
  homepage "https://appvanish.pages.dev"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "App Vanish.app"

  zap trash: [
    "~/Library/Preferences/com.heysidhant.AppVanish.plist",
    "~/Library/Saved Application State/com.heysidhant.AppVanish.savedState",
  ]
end
