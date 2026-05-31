class TxInspect < Formula
  desc "Render Conway transactions as structured, human-readable reports"
  homepage "https://github.com/lambdasistemi/cardano-tx-tools"
  url "https://github.com/lambdasistemi/cardano-tx-tools/releases/download/v0.2.3.0/tx-inspect-0.2.3.0-aarch64-darwin.tar.gz"
  sha256 "436a78602f1eb5a75eb02f86339006e0f909e47b05717af0340d76283d018ece"
  version "0.2.3.0"


  def install
    bin.install "bin/tx-inspect"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-inspect 2>&1", 1)
assert_match "Usage:", output

  end
end
