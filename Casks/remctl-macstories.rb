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
  # checks it against a pinned checksum, and hands it to that installer.
  # The installer asks for your administrator password. Its writes (home
  # directory, /Library, launchd) cannot run inside the sandbox that the
  # declarative postflight_steps use, so this relies on the legacy block.
  postflight do
    dmg_sha256 = "7f12f11308c6ef32410d11b56c41d7343ac8d702a928c8584cf7921490428dbd"
    dmg = staged_path/"RemCTL-arm64.dmg"
    mount = staged_path/"dmg"

    system_command "/usr/bin/curl",
                   args: [
                     "--fail", "--location", "--silent", "--show-error",
                     "--proto", "=https", "--tlsv1.2",
                     "--output", dmg,
                     "https://github.com/viticci/remctl/releases/download/v#{version}/RemCTL-arm64.dmg"
                   ]
    raise "RemCTL-arm64.dmg does not match the pinned checksum" if Digest::SHA256.file(dmg).hexdigest != dmg_sha256

    system_command "/usr/bin/hdiutil",
                   args: ["attach", "-readonly", "-nobrowse", "-quiet", "-mountpoint", mount, dmg]
    begin
      system_command "#{staged_path}/remctl-#{version}/install.sh",
                     args:         ["--prebuilt", mount/"RemCTL Capability Host.app", "--doctor"],
                     print_stdout: true
    ensure
      system_command "/usr/bin/hdiutil", args: ["detach", "-quiet", mount]
    end
  end

  caveats <<~EOS
    This cask runs RemCTL's own installer, which asks for your administrator
    password. For a first install, finish setup with:
      remctl onboard

    Uninstalling this cask does not remove RemCTL, because Homebrew also runs
    uninstall steps during an upgrade. To remove RemCTL itself, run
    uninstall.sh --keep-config from the matching source release.
  EOS
end
