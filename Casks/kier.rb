cask "kier" do
  version "0.6.3"
  sha256 "f15325c92eb8f67f4bd1522de728a4ee005e7a1f0172ff88082aa889e8ab585c"

  url "https://github.com/lofi-life-labs/kier-releases/releases/download/v#{version}/Kier-#{version}.dmg"
  name "Kier"
  desc "Tracks promises and commitments found in your chats"
  homepage "https://getkier.com/"

  livecheck do
    url "https://github.com/lofi-life-labs/kier-releases/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Kier.app"

  zap trash: "~/Library/Preferences/com.getkier.kier.plist"
end
