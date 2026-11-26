# The release workflow fills this in and commits it to Netherstone-HQ/homebrew-tap
# as Casks/netherstone.rb. Change it here, not in the tap.
cask "netherstone" do
  version "0.8.0-beta.1"

  on_arm do
    sha256 "44c4c7547a7380d93c7a57737de5bd62479f357d40821d37ac3d8c700baea5a3"
    url "https://github.com/Netherstone-HQ/Netherstone/releases/download/v0.8.0-beta.1/Netherstone_0.8.0-beta.1_aarch64.dmg"
  end
  on_intel do
    sha256 "ce38565c1ef85e81c344a616bb4bc1e05e79f0a8efe21d3dd53b17c6af632acc"
    url "https://github.com/Netherstone-HQ/Netherstone/releases/download/v0.8.0-beta.1/Netherstone_0.8.0-beta.1_x64.dmg"
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
