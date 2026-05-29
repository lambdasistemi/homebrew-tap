class TxGraph < Formula
  desc "Emit Conway transactions and operator-entity overlays as RDF"
  homepage "https://github.com/lambdasistemi/cardano-ledger-rdf"
  url "https://github.com/lambdasistemi/cardano-ledger-rdf/releases/download/v0.2.5.0/tx-graph-0.2.5.0-aarch64-darwin.tar.gz"
  sha256 "5183b0e3957be21316fa395a9384b6564d0c1461c7d6d029b3555d9c71bd4c7f"
  version "0.2.5.0"


  def install
    bin.install "bin/tx-graph"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-graph 2>&1", 1)
assert_match "operator-entity overlay + body emitter", output

  end
end
