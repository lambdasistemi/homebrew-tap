class MoogOracle < Formula
  desc "Moog oracle service for Antithesis test validation"
  homepage "https://github.com/cardano-foundation/moog"
  url "https://github.com/cardano-foundation/moog/releases/download/v0.5.1.4/moog-oracle-0.5.1.4-aarch64-darwin.tar.gz"
  sha256 "7eb90b2a43c75885928b1988e55a3c5b72f42c8dbf08cbcb890d53cf19e2df1b"
  version "0.5.1.4"


  def install
    bin.install "bin/moog-oracle"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/moog-oracle --help")
assert_match "Usage:", output

  end
end
