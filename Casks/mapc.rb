cask "mapc" do
  version "1.1.22"
  sha256 "dd4fc0c107eb291196ae9678148a42af498a4750021e05228c344672523f67cf"

  url "https://github.com/abduzeedo/mapc-site/releases/download/v#{version}/MaPC.dmg"
  name "MaPC"
  desc "Install and play Windows PC games on Apple Silicon Macs"
  homepage "https://mapc.games/"

  livecheck do
    url "https://mapc.games/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "MaPC.app"

  zap trash: "~/Library/Preferences/games.mapc.app.plist"
end
