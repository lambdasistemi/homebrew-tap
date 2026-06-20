class MoogAgent < Formula
  desc "Moog agent service for Antithesis result publication"
  homepage "https://github.com/cardano-foundation/moog"
  url "https://github.com/cardano-foundation/moog/releases/download/v2.0.1/moog-agent-2.0.1-aarch64-darwin.tar.gz"
  sha256 "c6cc655629a2096e4092105ab89e39306c68bd555c20c42ac96c266eeed24109"
  version "2.0.1"


  def install
    bin.install "bin/moog-agent"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/moog-agent --help")
assert_match "Usage:", output

  end
end
