class MoogAgent < Formula
  desc "Moog agent service for Antithesis result publication"
  homepage "https://github.com/cardano-foundation/moog"
  url "https://github.com/cardano-foundation/moog/releases/download/v0.5.1.5/moog-agent-0.5.1.5-aarch64-darwin.tar.gz"
  sha256 "c32e28c5bf0ae748026ee13d2c190de660e7a00c08d29f76bc47be7873bed817"
  version "0.5.1.5"


  def install
    bin.install "bin/moog-agent"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/moog-agent --help")
assert_match "Usage:", output

  end
end
