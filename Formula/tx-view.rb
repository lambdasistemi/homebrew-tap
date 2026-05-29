class TxView < Formula
  desc "Project canonical Turtle graphs through packaged SPARQL views"
  homepage "https://github.com/lambdasistemi/cardano-ledger-rdf"
  url "https://github.com/lambdasistemi/cardano-ledger-rdf/releases/download/v0.2.5.0/tx-view-0.2.5.0-aarch64-darwin.tar.gz"
  sha256 "fbf3501f4cd24746a0f7b511845a13ae1d41a8286b4a85aa0b8a5284625c262f"
  version "0.2.5.0"


  def install
    bin.install "bin/tx-view"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-view 2>&1", 1)
assert_match "canonical Turtle graph file", output

  end
end
