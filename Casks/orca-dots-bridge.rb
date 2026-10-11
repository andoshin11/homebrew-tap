cask "orca-dots-bridge" do
  arch arm: "arm64", intel: "x64"

  version "0.3.4"
  sha256 arm:   "17cfc462a0f4869266fd8c254a56511e58f860404119d866acdbdbcc7900a89f",
         intel: "e07bc8402558af24a14e71be5288771d752924af646511c6a40519a90dc53ac9"

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
