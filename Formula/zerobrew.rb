class Zerobrew < Formula
  desc "Fast package manager for Homebrew packages, written in Rust"
  homepage "https://github.com/lucasgelfond/zerobrew"
  # Explicit: Homebrew misreads the version from binary names like zb-linux-x64.
  version "0.3.5"
  license all_of: ["Apache-2.0", "MIT"]

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/lucasgelfond/zerobrew/releases/download/v0.3.5/zb-darwin-arm64"
      sha256 "8b63820ed4f89b17edc799e8b90d046bb08e38749a5f5ea24a3ab098d395edc0"

      resource "zbx" do
        url "https://github.com/lucasgelfond/zerobrew/releases/download/v0.3.5/zbx-darwin-arm64"
        sha256 "e6c370f4671d914b61f414500296893b322ce69642226a7c6720a81d8cb3aee9"
      end
    end
    on_intel do
      url "https://github.com/lucasgelfond/zerobrew/releases/download/v0.3.5/zb-darwin-x64"
      sha256 "f53985a7c6b66d9d859fcc6aab725b71ad8ec5406cbb980a53b2f2a185c0a5cf"

      resource "zbx" do
        url "https://github.com/lucasgelfond/zerobrew/releases/download/v0.3.5/zbx-darwin-x64"
        sha256 "81763445b13196e55ee562e889d45e3eed3c78018c7d4d851b1790da7257e3a2"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lucasgelfond/zerobrew/releases/download/v0.3.5/zb-linux-arm64"
      sha256 "ce0f811fb4c25df9107f749593850df0cc34e5debffda8bef14bc61213f624e3"

      resource "zbx" do
        url "https://github.com/lucasgelfond/zerobrew/releases/download/v0.3.5/zbx-linux-arm64"
        sha256 "20330e973d8bfbed8c695536234ce87631b9b0221d7aa1b6fff33b12f19ac596"
      end
    end
    on_intel do
      url "https://github.com/lucasgelfond/zerobrew/releases/download/v0.3.5/zb-linux-x64"
      sha256 "faaaa67f60020b95838c9bddb795aad059d6b5567a9a21763314d9af15f4d8ac"

      resource "zbx" do
        url "https://github.com/lucasgelfond/zerobrew/releases/download/v0.3.5/zbx-linux-x64"
        sha256 "280f26ba6f315299b61963e3dc29ab715ff9ef5ca1c20cba1ab68ffc06bd5153"
      end
    end
  end

  def install
    bin.install Dir["zb-*"].first => "zb"
    resource("zbx").stage { bin.install Dir["zbx-*"].first => "zbx" }
  end

  def caveats
    <<~EOS
      Run `zb init` to set up zerobrew's directories and shell config.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zb --version")
    assert_match "Usage: zb run", shell_output("#{bin}/zbx --help")
  end
end
