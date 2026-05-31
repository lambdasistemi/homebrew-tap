class TxGraph < Formula
  desc "Emit Conway transactions and operator-entity overlays as RDF"
  homepage "https://github.com/lambdasistemi/cardano-tx-tools"
  url "https://github.com/lambdasistemi/cardano-tx-tools/releases/download/v0.2.3.0/tx-graph-0.2.3.0-aarch64-darwin.tar.gz"
  sha256 "df0c5ac02f4493df0ba3d8aee31bb26e801ce2833896e48e93b65783f33bf86a"
  version "0.2.3.0"


  def install
    bin.install "bin/tx-graph"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-graph 2>&1", 1)
assert_match "operator-entity overlay + body emitter", output

  end
end
