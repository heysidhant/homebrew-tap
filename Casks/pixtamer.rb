cask "pixtamer" do
  version "1.0.0"
  sha256 "de1866eed86dea6f9b3a428798f166abd5d3324ecd4a4f6023cef77944a18299"

  url "https://github.com/heysidhant/pixtamer/releases/download/v#{version}/Pixtamer-#{version}.dmg"
  name "Pixtamer"
  desc "Batch image optimiser that makes web-ready JPEG, PNG, WebP and AVIF"
  homepage "https://pixtamer.pages.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Pixtamer.app"

  zap trash: "~/Library/Containers/com.heysidhant.Pixtamer"
end
