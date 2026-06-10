class CqRdf < Formula
  desc "Cardano RDF pipeline primitives"
  homepage "https://github.com/lambdasistemi/cardano-ledger-rdf"
  url "https://github.com/lambdasistemi/cardano-ledger-rdf/releases/download/v0.4.0.0/cq-rdf-0.4.0.0-aarch64-darwin.tar.gz"
  sha256 "0abf62fd66bafdb5b44c06afac4a76db303defbef3d2c45b67f26a6c7a20d974"
  version "0.4.0.0"


  def install
    bin.install "bin/cq-rdf"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/cq-rdf 2>&1", 0)
assert_match "Cardano RDF pipeline primitives", output

  end
end
