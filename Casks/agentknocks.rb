cask "agentknocks" do
  version "1.0.0"
  sha256 "e9c5c23fa25fae01ab19000a9973ac4e982895b2a3506470e0fc9922f1d61178"

  url "https://downloads.agentknocks.com/AgentKnocks-#{version}.dmg"
  name "AgentKnocks"
  desc "Menu bar alerts when a Claude Code or Codex session needs you"
  homepage "https://agentknocks.com/"

  livecheck do
    url "https://agentknocks.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "AgentKnocks.app"

  uninstall quit: "com.agentknocks.AgentKnocks"

  zap trash: [
    "~/Library/Application Support/AgentKnocks",
    "~/Library/Caches/com.agentknocks.AgentKnocks",
    "~/Library/HTTPStorages/com.agentknocks.AgentKnocks",
    "~/Library/Preferences/com.agentknocks.AgentKnocks.plist",
  ]

  caveats <<~EOS
    Before `brew uninstall --zap agentknocks`, open AgentKnocks › Integrations and
    choose Uninstall for each agent. Zap deletes the hook helper, and hooks left in
    ~/.claude/settings.json or ~/.codex/hooks.json would then fail to run.
  EOS
end
