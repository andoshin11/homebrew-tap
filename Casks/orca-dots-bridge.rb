cask "orca-dots-bridge" do
  arch arm: "arm64", intel: "x64"

  version "0.3.2"
  sha256 arm:   "a017f5f85c0c5b01799b99006c6e45f00166717ec92cb346d7808b86edc16b25",
         intel: "12f369b982696f2909d51d52d2befeb748602413cf0bdca470467dc90ea1131b"

  url "https://github.com/andoshin11/orca-dots-bridge/releases/download/v#{version}/Orca-Dots-Bridge-#{version}-mac-#{arch}.zip"
  name "Orca Dots Bridge"
  desc "Menu bar app connecting local Orca agents to ChatGPT dot"
  homepage "https://github.com/andoshin11/orca-dots-bridge"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Orca Dots Bridge-darwin-#{arch}/Orca Dots Bridge.app"

  # Upgrades must not stop the services: the new app re-points them itself.
  zap launchctl: [
        "dev.orca-dots-bridge.notification-tunnel",
        "dev.orca-dots-bridge.notifications",
        "dev.orca-dots-bridge.service",
        "dev.orca-dots-bridge.status-tunnel",
        "dev.orca-dots-bridge.tunnel",
      ],
      trash:     "~/.orca-dots-bridge"

  caveats <<~EOS
    The app is not notarized by Apple. On first launch macOS shows
    "Orca Dots Bridge" Not Opened: press Done, then open
    System Settings > Privacy & Security and choose Open Anyway.
  EOS
end
