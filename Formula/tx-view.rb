class TxView < Formula
  desc "Project canonical Turtle graphs through packaged SPARQL views"
  homepage "https://github.com/lambdasistemi/cardano-ledger-rdf"
  url "https://github.com/lambdasistemi/cardano-ledger-rdf/releases/download/v0.3.0.0/tx-view-0.3.0.0-aarch64-darwin.tar.gz"
  sha256 "bc57389f5ad966cbfdd1a64b42f5b4f36afb159dfa72bd01d0ceb1c02977d3b2"
  version "0.3.0.0"


  def install
    bin.install "bin/tx-view"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-view 2>&1", 1)
assert_match "canonical Turtle graph file", output

  end
end
