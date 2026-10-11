cask "orca-dots-bridge" do
  arch arm: "arm64", intel: "x64"

  version "0.3.10"
  sha256 arm:   "5fc140355941e6052ce1d587e0f5fd9a4cb01b02e49a23c4ce59ba6ae476b072",
         intel: "c4a3cd0dd6d801acb62178585d697256fee838722c3a5d7a6e6d4bd1f72d8820"

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
