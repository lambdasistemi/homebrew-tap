class TxGraph < Formula
  desc "Emit Conway transactions and operator-entity overlays as RDF"
  homepage "https://github.com/lambdasistemi/cardano-tx-tools"
  url "https://github.com/lambdasistemi/cardano-tx-tools/releases/download/v0.2.1.0/tx-graph-0.2.1.0-aarch64-darwin.tar.gz"
  sha256 "74f06c76a0c6f4da8639df17a2dc3c63859b609ed1dc2fd46de78385d11fcbf7"
  version "0.2.1.0"


  def install
    bin.install "bin/tx-graph"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-graph 2>&1", 1)
assert_match "operator-entity overlay + body emitter", output

  end
end
