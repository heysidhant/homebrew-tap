cask "pixtamer" do
  version "0.1.0"
  sha256 "6b435a942a3f3a1b7892ebb3f8510ef21bc2074c8ad57bcee0ff11fb8af0d8aa"

  url "https://github.com/heysidhant/pixtamer/releases/download/v#{version}/Pixtamer-#{version}.dmg"
  name "Pixtamer"
  desc "Batch image optimiser that makes web-ready JPEG, PNG, WebP and AVIF"
  homepage "https://sidhantsinha.com/apps/pixtamer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Pixtamer.app"

  zap trash: "~/Library/Containers/com.heysidhant.Pixtamer"
end
