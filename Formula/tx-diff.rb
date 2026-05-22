class TxDiff < Formula
  desc "Compare Conway transactions with blueprint-aware data diffs"
  homepage "https://github.com/lambdasistemi/cardano-tx-tools"
  url "https://github.com/lambdasistemi/cardano-tx-tools/releases/download/v0.2.2.0/tx-diff-0.2.2.0-aarch64-darwin.tar.gz"
  sha256 "2689f5bdf922a409d2d5a816e209007599e6cd5f8f648e8d1a10d768195843a6"
  version "0.2.2.0"


  def install
    bin.install "bin/tx-diff"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-diff 2>&1", 1)
assert_match "Usage:", output

  end
end
