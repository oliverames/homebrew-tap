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

## Third-party apps

Casks for apps made by other developers that Homebrew's main cask repository doesn't carry. They point at each developer's own download and follow its Sparkle update feed.

| Cask | App |
|---|---|
| `element-photo` | [Element](https://elementphoto.app), photo library and RAW editor |
| `jetty-pro` | [Jetty Pro](https://hypercritical.co/jetty-pro/), floating Dock-like palettes |
| `kier` | [Kier](https://getkier.com), tracks promises found in your chats |
| `local-code` | [Local Code](https://getlocalcode.app), private AI agent for Apple Silicon |
| `mapc` | [MaPC](https://mapc.games), Windows PC games on Apple Silicon Macs |
| `supercharge` | [Supercharge](https://sindresorhus.com/supercharge), opt-in macOS fixes |

```sh
brew install --cask oliverames/tap/supercharge
```
