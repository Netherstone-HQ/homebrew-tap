# The release workflow fills this in and commits it to Netherstone-HQ/homebrew-tap
# as Casks/netherstone.rb. Change it here, not in the tap.
cask "netherstone" do
  version "0.6.0-beta.2"

  on_arm do
    sha256 "7e909afe306564a3dfaceaaa45e84a40b045014fcaaf7e3a4c2ef0c1d69e7842"
    url "https://github.com/Netherstone-HQ/Netherstone/releases/download/v0.6.0-beta.2/Netherstone_0.6.0-beta.2_aarch64.dmg",
        verified: "github.com/Netherstone-HQ/Netherstone/"
  end
  on_intel do
    sha256 "6a87bb5b535c017262e65760ffe7894cbd7769e72470a934f5eb087f028654ea"
    url "https://github.com/Netherstone-HQ/Netherstone/releases/download/v0.6.0-beta.2/Netherstone_0.6.0-beta.2_x64.dmg",
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
