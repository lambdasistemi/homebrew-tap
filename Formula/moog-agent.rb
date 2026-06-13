class MoogAgent < Formula
  desc "Moog agent service for Antithesis result publication"
  homepage "https://github.com/cardano-foundation/moog"
  url "https://github.com/cardano-foundation/moog/releases/download/v2.0.0/moog-agent-2.0.0-aarch64-darwin.tar.gz"
  sha256 "4d5026faa7fa1dccf2046492e62dfcb89db6c7b897a369a84fece66b7994d15c"
  version "2.0.0"


  def install
    bin.install "bin/moog-agent"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/moog-agent --help")
assert_match "Usage:", output

  end
end
