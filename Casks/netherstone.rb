# The release workflow fills this in and commits it to Netherstone-HQ/homebrew-tap
# as Casks/netherstone.rb. Change it here, not in the tap.
cask "netherstone" do
  version "0.6.0-beta.3"

  on_arm do
    sha256 "356780da331150d9b724493331b0c7de173e7f1e2384f6885133675c5564c4ee"
    url "https://github.com/Netherstone-HQ/Netherstone/releases/download/v0.6.0-beta.3/Netherstone_0.6.0-beta.3_aarch64.dmg",
        verified: "github.com/Netherstone-HQ/Netherstone/"
  end
  on_intel do
    sha256 "462c6af0d756b89fbb5304985736413d017aadfaebefbf1a480a9678b6910eca"
    url "https://github.com/Netherstone-HQ/Netherstone/releases/download/v0.6.0-beta.3/Netherstone_0.6.0-beta.3_x64.dmg",
        verified: "github.com/Netherstone-HQ/Netherstone/"
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
