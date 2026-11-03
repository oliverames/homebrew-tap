cask "local-code" do
  version "26.1101.1,77a117ed"
  sha256 "77a117edc56df8f702ab6faf17e995c923fd4c4c7a1b8984c63a34b181029d97"

  url "https://releases.getlocalcode.app/LocalCode-#{version.csv.first}-#{version.csv.second}.zip"
  name "Local Code"
  desc "Private AI agent that runs on your own device"
  homepage "https://getlocalcode.app/"

  livecheck do
    url "https://releases.getlocalcode.app/appcast.xml"
    strategy :sparkle do |item|
      match = item.url&.match(/LocalCode-(\d+(?:\.\d+)+)-(\h+)\.zip/i)
      next if match.blank?

      "#{match[1]},#{match[2]}"
    end
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Local Code.app"

  zap trash: [
    "~/Library/Application Scripts/com.liuliu.local-code",
    "~/Library/Containers/com.liuliu.local-code",
    "~/Library/Preferences/com.liuliu.local-code.plist",
  ]
end
