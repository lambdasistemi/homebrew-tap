class Moog < Formula
  desc "CLI to administer Antithesis test execution through Cardano"
  homepage "https://github.com/cardano-foundation/moog"
  url "https://github.com/cardano-foundation/moog/releases/download/v2.0.1/moog-2.0.1-aarch64-darwin.tar.gz"
  sha256 "13f1ae1af79402df3d4d368cd6a6164f3cf110718b88aaff1b2aa70789a702b3"
  version "2.0.1"


  def install
    bin.install "bin/moog"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/moog --help")
assert_match "Usage:", output

  end
end
