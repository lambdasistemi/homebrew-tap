class Moog < Formula
  desc "CLI to administer Antithesis test execution through Cardano"
  homepage "https://github.com/cardano-foundation/moog"
  url "https://github.com/cardano-foundation/moog/releases/download/v2.0.0/moog-2.0.0-aarch64-darwin.tar.gz"
  sha256 "cd0e087f3d951812b81f14dae77ba743ce281e496e9d7cb49e2f2233328ef586"
  version "2.0.0"


  def install
    bin.install "bin/moog"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/moog --help")
assert_match "Usage:", output

  end
end
