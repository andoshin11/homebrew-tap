cask "orca-dots-bridge" do
  arch arm: "arm64", intel: "x64"

  version "0.3.8"
  sha256 arm:   "1dd432953c44137f88887002b4883e1b8fcadd913ffdafe3dad2184152542c3a",
         intel: "03c2252dd076c52f288c71c8a483e78d44acc4be74eeac5d83cf72fa1d066afc"

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
