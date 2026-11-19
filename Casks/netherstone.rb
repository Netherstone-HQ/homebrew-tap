# The release workflow fills this in and commits it to Netherstone-HQ/homebrew-tap
# as Casks/netherstone.rb. Change it here, not in the tap.
cask "netherstone" do
  version "0.7.0-beta.2"

  on_arm do
    sha256 "74c1f7b5d6efc1bcc8022f8745a704a3dc39775846028f0aef08426c4157b742"
    url "https://github.com/Netherstone-HQ/Netherstone/releases/download/v0.7.0-beta.2/Netherstone_0.7.0-beta.2_aarch64.dmg"
  end
  on_intel do
    sha256 "d8572c7b8434af366957477d93e9801fd50ee4a50294e801683a2f445a836642"
    url "https://github.com/Netherstone-HQ/Netherstone/releases/download/v0.7.0-beta.2/Netherstone_0.7.0-beta.2_x64.dmg"
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
