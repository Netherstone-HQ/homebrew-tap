# The release workflow fills this in and commits it to Netherstone-HQ/homebrew-tap
# as Casks/netherstone.rb. Change it here, not in the tap.
cask "netherstone" do
  version "0.6.0-beta.5"

  on_arm do
    sha256 "db0c09eb1c89fb5f0e710c99347b637c6d2feddd8cd59c715737c0e97585064e"
    url "https://github.com/Netherstone-HQ/Netherstone/releases/download/v0.6.0-beta.5/Netherstone_0.6.0-beta.5_aarch64.dmg"
  end
  on_intel do
    sha256 "148739a8ae9fcc4315e3a214c15247cb90f59971bd369f1b2f8563b6645dd5a1"
    url "https://github.com/Netherstone-HQ/Netherstone/releases/download/v0.6.0-beta.5/Netherstone_0.6.0-beta.5_x64.dmg"
  end

  name "Netherstone"
  desc "Local-first app for notes, documents and drawings, kept as Markdown"
  homepage "https://netherstone.app/"

  # The app updates itself.
  auto_updates true

  app "Netherstone.app"

  zap trash: [
    "~/Library/Application Support/tech.blueblood.netherstone",
    "~/Library/Caches/tech.blueblood.netherstone",
    "~/Library/Saved Application State/tech.blueblood.netherstone.savedState",
    "~/Library/WebKit/tech.blueblood.netherstone",
  ]

  caveats <<~EOS
    Netherstone isn't notarized by Apple yet, so macOS may refuse to open it.
    Open it once from System Settings > Privacy & Security > Open Anyway, or run:
      xattr -dr com.apple.quarantine /Applications/Netherstone.app
  EOS
end
