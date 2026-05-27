class TxFetch < Formula
  desc "Walk a closure of Conway transactions over Blockfrost and write one CBOR per tx"
  homepage "https://github.com/lambdasistemi/cardano-rdf"
  url "https://github.com/lambdasistemi/cardano-rdf/releases/download/v0.2.2.0/tx-fetch-0.2.2.0-aarch64-darwin.tar.gz"
  sha256 "c2a1c0f9dd39513fc29b6c27465e8bf2fbf93cfb8043aabcbb5dd8ad167dae8e"
  version "0.2.2.0"


  def install
    bin.install "bin/tx-fetch"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-fetch 2>&1", 1)
assert_match "Usage:", output

  end
end
