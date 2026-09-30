class Zerobrew < Formula
  desc "Fast package manager for Homebrew packages, written in Rust"
  homepage "https://github.com/lucasgelfond/zerobrew"
  # Explicit: Homebrew misreads the version from binary names like zb-linux-x64.
  version "0.3.3"
  license all_of: ["Apache-2.0", "MIT"]

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/lucasgelfond/zerobrew/releases/download/v0.3.3/zb-darwin-arm64"
      sha256 "8f6e358a7d75164c1e1151713754345a25d7c8e4da4b640aab87e2606a49d7dc"

      resource "zbx" do
        url "https://github.com/lucasgelfond/zerobrew/releases/download/v0.3.3/zbx-darwin-arm64"
        sha256 "2e806e0da90e8c8dac26cc3ce16daf379957a5e001283306bc0db37bb1f93cc3"
      end
    end
    on_intel do
      url "https://github.com/lucasgelfond/zerobrew/releases/download/v0.3.3/zb-darwin-x64"
      sha256 "667c23db3c0d3dfdaec657a66b764c76b0095f5352b83d980eddd65552ae856c"

      resource "zbx" do
        url "https://github.com/lucasgelfond/zerobrew/releases/download/v0.3.3/zbx-darwin-x64"
        sha256 "ce7e361964257296acf83c84b9a24ab1f4a68fd2c610825f9b2b4361289d0390"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lucasgelfond/zerobrew/releases/download/v0.3.3/zb-linux-arm64"
      sha256 "45cd80d26d6ce32f2392118da90559d0f2a1a7890a445e2d8a3cc4b9c9983069"

      resource "zbx" do
        url "https://github.com/lucasgelfond/zerobrew/releases/download/v0.3.3/zbx-linux-arm64"
        sha256 "20330e973d8bfbed8c695536234ce87631b9b0221d7aa1b6fff33b12f19ac596"
      end
    end
    on_intel do
      url "https://github.com/lucasgelfond/zerobrew/releases/download/v0.3.3/zb-linux-x64"
      sha256 "75b7663061956f5558cc779497a7ec53188733c3db5b99398c5a194b6f1dfd8d"

      resource "zbx" do
        url "https://github.com/lucasgelfond/zerobrew/releases/download/v0.3.3/zbx-linux-x64"
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
