class TxDiff < Formula
  desc "Compare Conway transactions with blueprint-aware data diffs"
  homepage "https://github.com/lambdasistemi/cardano-tx-tools"
  url "https://github.com/lambdasistemi/cardano-tx-tools/releases/download/v0.2.1.0/tx-diff-0.2.1.0-aarch64-darwin.tar.gz"
  sha256 "36ec72bd0a61f77cf885ce72f46aba04797baf3d1981503365aa77151d3e0556"
  version "0.2.1.0"


  def install
    bin.install "bin/tx-diff"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-diff 2>&1", 1)
assert_match "Usage:", output

  end
end
