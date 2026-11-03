cask "supercharge" do
  version "1.30.1"
  sha256 "ad56765508175044189a8dc29d07085d6caf59afecfe81ada0f2d37026942184"

  url "https://github.com/sindresorhus/supercharge-meta/releases/download/v#{version}/Supercharge.zip"
  name "Supercharge"
  desc "Opt-in system fixes and extra features for your menu bar"
  homepage "https://sindresorhus.com/supercharge"

  livecheck do
    url "https://sindresorhus.com/supercharge-meta/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Supercharge.app"

  zap trash: [
    "~/Library/Application Scripts/com.sindresorhus.Supercharge.Finder-Extension",
    "~/Library/Application Scripts/group.com.sindresorhus.Supercharge",
    "~/Library/Application Scripts/YG56YK5RN5.com.sindresorhus.Supercharge",
    "~/Library/Application Support/com.sindresorhus.Supercharge",
    "~/Library/Containers/com.sindresorhus.Supercharge.Finder-Extension",
    "~/Library/Group Containers/group.com.sindresorhus.Supercharge",
    "~/Library/Group Containers/YG56YK5RN5.com.sindresorhus.Supercharge",
    "~/Library/Preferences/com.sindresorhus.Supercharge.plist",
    "~/Library/WebKit/com.sindresorhus.Supercharge",
  ]
end
