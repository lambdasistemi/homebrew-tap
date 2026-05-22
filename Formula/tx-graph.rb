class TxGraph < Formula
  desc "Emit Conway transactions and operator-entity overlays as RDF"
  homepage "https://github.com/lambdasistemi/cardano-tx-tools"
  url "https://github.com/lambdasistemi/cardano-tx-tools/releases/download/v0.2.2.0/tx-graph-0.2.2.0-aarch64-darwin.tar.gz"
  sha256 "c61423b422413b6ff8756f9bea14ef341cc582918518e5336ed6a069a568f5d5"
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
