cask "ping-warden" do
  version "4.3.3"
  sha256 "8abb5be236b966be3a89ec80c474ffe73b6e9a9741b396c0732f1da55bb5aefb"

  url "https://github.com/oliverames/ping-warden/releases/download/v#{version}/PingWarden-#{version}.dmg"
  name "Ping Warden"
  desc "Menu bar app that keeps AWDL down to stop Wi-Fi lag spikes during cloud gaming"
  homepage "https://pingwarden.app/"

  livecheck do
    url "https://oliverames.github.io/ping-warden/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :ventura

  app "Ping Warden.app"

  uninstall launchctl:  "com.amesvt.pingwarden.helper",
            quit:       "com.amesvt.pingwarden",
            login_item: "Ping Warden"

  zap trash: [
    "~/Library/Application Scripts/com.amesvt.pingwarden.widget",
    "~/Library/Application Scripts/PV3W52NDZ3.com.amesvt.pingwarden",
    "~/Library/Application Support/Ping Warden",
    "~/Library/Caches/com.amesvt.pingwarden",
    "~/Library/Containers/com.amesvt.pingwarden.widget",
    "~/Library/Group Containers/group.com.amesvt.pingwarden",
    "~/Library/Group Containers/PV3W52NDZ3.com.amesvt.pingwarden",
    "~/Library/HTTPStorages/com.amesvt.pingwarden",
    "~/Library/Preferences/com.amesvt.pingwarden.plist",
    "~/Library/Preferences/PV3W52NDZ3.com.amesvt.pingwarden.plist",
    "~/Library/WebKit/com.amesvt.pingwarden",
  ]
end
