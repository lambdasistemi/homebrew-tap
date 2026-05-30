class TxGraph < Formula
  desc "Deprecated compatibility symlink for cq-rdf body"
  homepage "https://github.com/lambdasistemi/cardano-ledger-rdf"
  url "https://github.com/lambdasistemi/cardano-ledger-rdf/releases/download/v0.3.0.0/tx-graph-0.3.0.0-aarch64-darwin.tar.gz"
  sha256 "b060b2d4764e1b4f90d511c39da5d80a5af6d7782bdf2243754aa1206fde8520"
  version "0.3.0.0"


  def install
    bin.install "bin/tx-graph"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-graph 2>&1", 0)
assert_match "--rules", output

  end
end
