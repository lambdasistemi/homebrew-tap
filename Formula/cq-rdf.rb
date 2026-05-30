class CqRdf < Formula
  desc "Cardano RDF pipeline primitives"
  homepage "https://github.com/lambdasistemi/cardano-ledger-rdf"
  url "https://github.com/lambdasistemi/cardano-ledger-rdf/releases/download/v0.3.0.0/cq-rdf-0.3.0.0-aarch64-darwin.tar.gz"
  sha256 "f46f39ff2f02ce49eabb05ad4e744365f8a5bab58f347abc6abf35123585f9b7"
  version "0.3.0.0"


  def install
    bin.install "bin/cq-rdf"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/cq-rdf 2>&1", 0)
assert_match "Cardano RDF pipeline primitives", output

  end
end
