class MoogOracle < Formula
  desc "Moog oracle service for Antithesis test validation"
  homepage "https://github.com/cardano-foundation/moog"
  url "https://github.com/cardano-foundation/moog/releases/download/v2.0.0/moog-oracle-2.0.0-aarch64-darwin.tar.gz"
  sha256 "73c4c4bb8cd6043f763837f351066872c5e1f96b34461bff510c73f60c75c60c"
  version "2.0.0"


  def install
    bin.install "bin/moog-oracle"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/moog-oracle --help")
assert_match "Usage:", output

  end
end
