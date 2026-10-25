# Oliver Ames' Homebrew tap

Homebrew casks by Oliver Ames.

## Ping Warden

[Ping Warden](https://pingwarden.app) is a menu bar app for macOS that measures Wi-Fi latency and pauses AWDL to reduce lag spikes in cloud gaming.

```sh
brew install --cask oliverames/tap/ping-warden
```

Ping Warden updates itself through Sparkle, so you don't need `brew upgrade` to stay current. The cask's `livecheck` follows the same update feed, and the cask is bumped to each new release.

To remove it:

```sh
brew uninstall --cask oliverames/tap/ping-warden
# also delete preferences and caches
brew uninstall --zap --cask oliverames/tap/ping-warden
```

Learn more at [pingwarden.app](https://pingwarden.app).

## Image Relay

[Image Relay](https://github.com/oliverames/imagerelay-client) is a native macOS client that mounts an Image Relay library in Finder.

```sh
brew install --cask oliverames/tap/image-relay
```

Image Relay updates itself through Sparkle, so you don't need `brew upgrade` to stay current. The cask is bumped to each new stable release.

To remove it:

```sh
brew uninstall --cask oliverames/tap/image-relay
# also delete preferences and caches
brew uninstall --zap --cask oliverames/tap/image-relay
```
