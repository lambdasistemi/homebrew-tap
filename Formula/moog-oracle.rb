class MoogOracle < Formula
  desc "Moog oracle service for Antithesis test validation"
  homepage "https://github.com/cardano-foundation/moog"
  url "https://github.com/cardano-foundation/moog/releases/download/v2.0.1/moog-oracle-2.0.1-aarch64-darwin.tar.gz"
  sha256 "647bc6f735e9139e8816774554dbd75f69f7b1d26c377563f84d26b6b5c09dea"
  version "2.0.1"


  def install
    bin.install "bin/moog-oracle"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/moog-oracle --help")
assert_match "Usage:", output

  end
end
