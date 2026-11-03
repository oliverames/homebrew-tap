cask "tinystart" do
  version "1.5.2"
  sha256 "9253d9f580f96156cf2285a0b2f994ce24b684b1ac8dc94df6163ab1f994c4e4"

  url "https://tinystart.b-cdn.net/updates/arm64/TinyStart-#{version}-arm64.zip"
  name "TinyStart"
  desc "Tiny launcher and emoji picker"
  homepage "https://tinystart.app/"

  livecheck do
    url "https://tinystart.b-cdn.net/updates/arm64/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "TinyStart.app"

  zap trash: [
    "~/Library/Caches/com.nileane.tinystart",
    "~/Library/Caches/TinyStart",
    "~/Library/HTTPStorages/com.nileane.tinystart",
    "~/Library/HTTPStorages/com.nileane.tinystart.binarycookies",
    "~/Library/Preferences/com.nileane.tinystart.plist",
    "~/Library/WebKit/com.nileane.tinystart",
  ]
end
