cask "element-photo" do
  version "2.2"
  sha256 "473c4cfe9799327886cb2293a5972cf6ac616222a81e70313a825075c436c327"

  url "https://dl.elementphoto.app/Element-#{version}.dmg"
  name "Element"
  desc "Photo library and RAW editor"
  homepage "https://elementphoto.app/"

  livecheck do
    url "https://dl.elementphoto.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Element.app"

  zap trash: "~/Library/Preferences/app.elementphoto.mac.plist"
end
