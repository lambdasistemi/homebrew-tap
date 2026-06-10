class TxView < Formula
  desc "Project canonical Turtle graphs through packaged SPARQL views"
  homepage "https://github.com/lambdasistemi/cardano-ledger-rdf"
  url "https://github.com/lambdasistemi/cardano-ledger-rdf/releases/download/v0.4.0.0/tx-view-0.4.0.0-aarch64-darwin.tar.gz"
  sha256 "dc6d64e93b3a4a59442b54f8c4360c70fa92b0a6a1d4baa9f7975282373c3575"
  version "0.4.0.0"


  def install
    bin.install "bin/tx-view"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-view 2>&1", 1)
assert_match "canonical Turtle graph file", output

  end
end
