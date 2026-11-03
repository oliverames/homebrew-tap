cask "jetty-pro" do
  version "1.0,881"
  sha256 "bcabda812eff48d4808e6eeb93177bef5956574450df129a95bf9adc005ec03f"

  url "https://hypercritical.co/jetty-pro/downloads/Jetty%20Pro%20#{version.csv.first}-#{version.csv.second}.zip"
  name "Jetty Pro"
  desc "Customizable Dock-like floating palettes for files, folders and apps"
  homepage "https://hypercritical.co/jetty-pro/"

  livecheck do
    url "https://hypercritical.co/jetty-pro/updates/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Jetty Pro.app"

  zap trash: "~/Library/Preferences/co.hypercritical.JettyPro.plist"
end
