class TxGraph < Formula
  desc "Deprecated compatibility symlink for cq-rdf body"
  homepage "https://github.com/lambdasistemi/cardano-ledger-rdf"
  url "https://github.com/lambdasistemi/cardano-ledger-rdf/releases/download/v0.4.0.0/tx-graph-0.4.0.0-aarch64-darwin.tar.gz"
  sha256 "e430fe593f10d25ce3752530a31d01df8d01fd623edb5584dd830e74da1b219c"
  version "0.4.0.0"


  def install
    bin.install "bin/tx-graph"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-graph 2>&1", 0)
assert_match "--rules", output

  end
end
