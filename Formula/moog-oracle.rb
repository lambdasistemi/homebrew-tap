class MoogOracle < Formula
  desc "Moog oracle service for Antithesis test validation"
  homepage "https://github.com/cardano-foundation/moog"
  url "https://github.com/cardano-foundation/moog/releases/download/v0.5.1.5/moog-oracle-0.5.1.5-aarch64-darwin.tar.gz"
  sha256 "30c01b3d12bd2ea804de0e330ee7ac05f87a4d909712f7a55892b8058c67a7f8"
  version "0.5.1.5"


  def install
    bin.install "bin/moog-oracle"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/moog-oracle --help")
assert_match "Usage:", output

  end
end
