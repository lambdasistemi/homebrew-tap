class TxView < Formula
  desc "Project canonical Turtle graphs through packaged SPARQL views"
  homepage "https://github.com/lambdasistemi/cardano-ledger-rdf"
  url "https://github.com/lambdasistemi/cardano-ledger-rdf/releases/download/v0.2.4.0/tx-view-0.2.4.0-aarch64-darwin.tar.gz"
  sha256 "040b6fbb9e6895e67b90ec1868b88b5311ec47d9187385544782dd30c9473004"
  version "0.2.4.0"


  def install
    bin.install "bin/tx-view"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-view 2>&1", 1)
assert_match "canonical Turtle graph file", output

  end
end
