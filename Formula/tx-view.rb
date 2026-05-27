class TxView < Formula
  desc "Project canonical Turtle graphs through packaged SPARQL views"
  homepage "https://github.com/lambdasistemi/cardano-rdf"
  url "https://github.com/lambdasistemi/cardano-rdf/releases/download/v0.2.2.0/tx-view-0.2.2.0-aarch64-darwin.tar.gz"
  sha256 "673a61f9d73fb5059ac6888c1c1b67ec6523ac37ebcb871f9c947edf5eaf7329"
  version "0.2.2.0"


  def install
    bin.install "bin/tx-view"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-view 2>&1", 1)
assert_match "canonical Turtle graph file", output

  end
end
