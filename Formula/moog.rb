class Moog < Formula
  desc "CLI to administer Antithesis test execution through Cardano"
  homepage "https://github.com/cardano-foundation/moog"
  url "https://github.com/cardano-foundation/moog/releases/download/v0.5.1.5/moog-0.5.1.5-aarch64-darwin.tar.gz"
  sha256 "3a062f53a57661d6fda6ab6f354b04810199e6773d84bf17a134a69076b1b6cf"
  version "0.5.1.5"


  def install
    bin.install "bin/moog"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/moog --help")
assert_match "Usage:", output

  end
end
