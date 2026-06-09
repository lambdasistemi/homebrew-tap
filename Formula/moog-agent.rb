class MoogAgent < Formula
  desc "Moog agent service for Antithesis result publication"
  homepage "https://github.com/cardano-foundation/moog"
  url "https://github.com/cardano-foundation/moog/releases/download/v0.5.1.4/moog-agent-0.5.1.4-aarch64-darwin.tar.gz"
  sha256 "60f09c2f1fa04b6a83011d416b95c7b436a9ff2d3b3e2e8ee765c2c6081ed2d8"
  version "0.5.1.4"


  def install
    bin.install "bin/moog-agent"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/moog-agent --help")
assert_match "Usage:", output

  end
end
