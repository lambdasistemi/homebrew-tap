class TxGraph < Formula
  desc "Emit Conway transactions and operator-entity overlays as RDF"
  homepage "https://github.com/lambdasistemi/cardano-ledger-rdf"
  url "https://github.com/lambdasistemi/cardano-ledger-rdf/releases/download/v0.2.4.0/tx-graph-0.2.4.0-aarch64-darwin.tar.gz"
  sha256 "0316654f587ae57ffecf1384ea32db5553064a983a3d63bea0606922cdf8b9bd"
  version "0.2.4.0"


  def install
    bin.install "bin/tx-graph"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-graph 2>&1", 1)
assert_match "operator-entity overlay + body emitter", output

  end
end
