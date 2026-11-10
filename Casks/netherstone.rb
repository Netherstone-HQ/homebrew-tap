# The release workflow fills this in and commits it to Netherstone-HQ/homebrew-tap
# as Casks/netherstone.rb. Change it here, not in the tap.
cask "netherstone" do
  version "0.7.0-beta.1"

  on_arm do
    sha256 "f33e8ecff318a60602a6691433ca63b61784f13b3a85fa26a1d9b62579a8cc57"
    url "https://github.com/Netherstone-HQ/Netherstone/releases/download/v0.7.0-beta.1/Netherstone_0.7.0-beta.1_aarch64.dmg"
  end
  on_intel do
    sha256 "acf7b314b3aeacd95c2ee6610866dce4c594f0f43361f43676e7e54d8f7a3a3b"
    url "https://github.com/Netherstone-HQ/Netherstone/releases/download/v0.7.0-beta.1/Netherstone_0.7.0-beta.1_x64.dmg"
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
