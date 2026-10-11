cask "orca-dots-bridge" do
  arch arm: "arm64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "b76a6a96579e475a12da1bfc376a88e7e5cac9e442aeb9c9dd0cee57041b880e",
         intel: "c0b09891f3e6bd08b53cee38aaafdbb79cf3a8301bda2157cdded8a38ea7075b"

  url "https://github.com/andoshin11/orca-dots-bridge/releases/download/v#{version}/Orca-Dots-Bridge-#{version}-mac-#{arch}.zip"
  name "Orca Dots Bridge"
  desc "Menu bar app connecting Orca agents on this Mac to ChatGPT dot"
  homepage "https://github.com/andoshin11/orca-dots-bridge"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Orca Dots Bridge-darwin-#{arch}/Orca Dots Bridge.app"

  # Upgrades must not stop the services: the new app re-points them itself.
  zap launchctl: [
        "dev.orca-dots-bridge.notification-tunnel",
        "dev.orca-dots-bridge.notifications",
        "dev.orca-dots-bridge.status-tunnel",
      ],
      trash:     "~/.orca-dots-bridge"

  caveats <<~EOS
    The app is not notarized by Apple. On first launch macOS shows
    "Orca Dots Bridge" Not Opened: press Done, then open
    System Settings > Privacy & Security and choose Open Anyway.
  EOS
end
