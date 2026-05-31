class TxDiff < Formula
  desc "Compare Conway transactions with blueprint-aware data diffs"
  homepage "https://github.com/lambdasistemi/cardano-tx-tools"
  url "https://github.com/lambdasistemi/cardano-tx-tools/releases/download/v0.2.3.0/tx-diff-0.2.3.0-aarch64-darwin.tar.gz"
  sha256 "7c3e3a558f38d1cdf409c3a8ba5e3137f6825e7e127d7a30e856c183c2aaf92f"
  version "0.2.3.0"


  def install
    bin.install "bin/tx-diff"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-diff 2>&1", 1)
assert_match "Usage:", output

  end
end
