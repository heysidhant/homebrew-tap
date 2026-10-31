cask "agentknocks" do
  version "1.3.0"
  sha256 "58d3bf8b959d4e87fdffadb1481eff4583265fcb60d1bd4c643b7496f21f3cbd"

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
