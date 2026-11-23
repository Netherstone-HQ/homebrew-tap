# The release workflow fills this in and commits it to Netherstone-HQ/homebrew-tap
# as Casks/netherstone.rb. Change it here, not in the tap.
cask "netherstone" do
  version "0.7.0-beta.3"

  on_arm do
    sha256 "31c07b9e9a20ae7d7815beafc013d7d61f57d36015420b0176df9a5c8d37ab47"
    url "https://github.com/Netherstone-HQ/Netherstone/releases/download/v0.7.0-beta.3/Netherstone_0.7.0-beta.3_aarch64.dmg"
  end
  on_intel do
    sha256 "88a64ea391f89b672c4544e7907760317b616301d8cc856c054abd34e4e2bd28"
    url "https://github.com/Netherstone-HQ/Netherstone/releases/download/v0.7.0-beta.3/Netherstone_0.7.0-beta.3_x64.dmg"
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
