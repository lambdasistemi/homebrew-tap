class TxGraph < Formula
  desc "Emit Conway transactions and operator-entity overlays as RDF"
  homepage "https://github.com/lambdasistemi/cardano-rdf"
  url "https://github.com/lambdasistemi/cardano-rdf/releases/download/v0.2.2.0/tx-graph-0.2.2.0-aarch64-darwin.tar.gz"
  sha256 "1bd49ecf9368ea06792a5358902217e8b5171b249866e865a33348766763b5fb"
  version "0.2.2.0"


  def install
    bin.install "bin/tx-graph"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-graph 2>&1", 1)
assert_match "operator-entity overlay + body emitter", output

  end
end
