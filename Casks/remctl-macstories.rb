cask "remctl-macstories" do
  version "2.5.0"
  sha256 "dadb53e8f0839ccf738c68633a62e491e592fbf8c24ec7b17e25d005e54bf88c"

  url "https://github.com/viticci/remctl/archive/refs/tags/v#{version}.tar.gz"
  name "RemCTL"
  desc "Apple Reminders command-line tool and MCP server"
  homepage "https://github.com/viticci/remctl"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  # RemCTL ships its own transactional installer: it puts the signed Capability
  # Host in ~/Applications, installs a root-owned Python under /Library/RemCTL,
  # and manages a LaunchAgent. This cask downloads the matching signed release,
  # checks it against a pinned checksum, and hands it to that installer, which
  # asks for your administrator password. Installer scripts run outside the cask
  # sandbox, which the installer's writes to /Library and launchd require.
  installer script: {
    executable: "/bin/bash",
    args:       [
      "-c",
      <<~'BASH',
        set -euo pipefail
        staged="$1"
        version="$2"
        dmg_sha256="7f12f11308c6ef32410d11b56c41d7343ac8d702a928c8584cf7921490428dbd"
        dmg="$staged/RemCTL-arm64.dmg"
        mount="$staged/dmg"
        /usr/bin/curl --fail --location --silent --show-error --proto '=https' --tlsv1.2 \
          --output "$dmg" "https://github.com/viticci/remctl/releases/download/v${version}/RemCTL-arm64.dmg"
        echo "${dmg_sha256}  ${dmg}" | /usr/bin/shasum -a 256 -c -
        /usr/bin/hdiutil attach -readonly -nobrowse -quiet -mountpoint "$mount" "$dmg"
        trap '/usr/bin/hdiutil detach -quiet "$mount" || true' EXIT
        "$staged/remctl-${version}/install.sh" --prebuilt "$mount/RemCTL Capability Host.app" --doctor
      BASH
      "remctl-installer",
      staged_path.to_s,
      version.to_s,
    ],
  }

  # Required beside an installer stanza. Quitting the host is harmless: its
  # LaunchAgent restarts it, and RemCTL's files stay in place.
  uninstall quit: "net.macstories.remctl.capability-host"

  caveats <<~EOS
    This cask runs RemCTL's own installer, which asks for your administrator
    password. For a first install, finish setup with:
      remctl onboard

    Uninstalling this cask does not remove RemCTL itself, because Homebrew also
    runs uninstall steps during an upgrade. To remove RemCTL, run
    uninstall.sh --keep-config from the matching source release.
  EOS
end
