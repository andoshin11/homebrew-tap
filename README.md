# andoshin11/homebrew-tap

Homebrew casks for [andoshin11](https://github.com/andoshin11)'s apps.

## Orca Dots Bridge

Menu bar app that connects Orca agents on this Mac to ChatGPT dot. See [orca-dots-bridge](https://github.com/andoshin11/orca-dots-bridge).

```sh
brew install --cask andoshin11/tap/orca-dots-bridge
```

Upgrade with `brew upgrade --cask orca-dots-bridge`; the app re-points its background services to the new version when it opens.

The app is not notarized by Apple. On first launch macOS says it cannot be opened: press Done, then open System Settings > Privacy & Security and choose Open Anyway.

`brew uninstall --cask --zap orca-dots-bridge` also stops the background services and removes `~/.orca-dots-bridge`. Keys in the Keychain are not removed.

Casks are updated automatically by the orca-dots-bridge release workflow.
