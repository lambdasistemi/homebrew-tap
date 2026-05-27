class TxView < Formula
  desc "Project canonical Turtle graphs through packaged SPARQL views"
  homepage "https://github.com/lambdasistemi/cardano-ledger-rdf"
  url "https://github.com/lambdasistemi/cardano-ledger-rdf/releases/download/v0.2.3.0/tx-view-0.2.3.0-aarch64-darwin.tar.gz"
  sha256 "762cd9e035ff4605ffb66f1fb554a64f219b3e28436707054bcaa7c15ee477dd"
  version "0.2.3.0"


  def install
    bin.install "bin/tx-view"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-view 2>&1", 1)
assert_match "canonical Turtle graph file", output

  end
end
