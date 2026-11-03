# The release workflow fills this in and commits it to Netherstone-HQ/homebrew-tap
# as Casks/netherstone.rb. Change it here, not in the tap.
cask "netherstone" do
  version "0.6.0-beta.4"

  on_arm do
    sha256 "c0192adadc2b98f816fb51a02df8fa01b546104b9300b33f8861696a07502475"
    url "https://github.com/Netherstone-HQ/Netherstone/releases/download/v0.6.0-beta.4/Netherstone_0.6.0-beta.4_aarch64.dmg"
  end
  on_intel do
    sha256 "a7b042be33be81f6d13bf44c4c7e6942a80517ce8e45296eb903fabffeef0e13"
    url "https://github.com/Netherstone-HQ/Netherstone/releases/download/v0.6.0-beta.4/Netherstone_0.6.0-beta.4_x64.dmg"
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
