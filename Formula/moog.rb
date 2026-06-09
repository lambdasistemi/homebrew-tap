class Moog < Formula
  desc "CLI to administer Antithesis test execution through Cardano"
  homepage "https://github.com/cardano-foundation/moog"
  url "https://github.com/cardano-foundation/moog/releases/download/v0.5.1.4/moog-0.5.1.4-aarch64-darwin.tar.gz"
  sha256 "ad24bc2bfa7f5c8af2482b7a7faeef0689d3f48be1d1ed7614152e1bf4ed4f30"
  version "0.5.1.4"


  def install
    bin.install "bin/moog"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/moog --help")
assert_match "Usage:", output

  end
end
