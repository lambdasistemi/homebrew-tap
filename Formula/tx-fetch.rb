class TxFetch < Formula
  desc "Walk a closure of Conway transactions over Blockfrost and write one CBOR per tx"
  homepage "https://github.com/lambdasistemi/cardano-ledger-rdf"
  url "https://github.com/lambdasistemi/cardano-ledger-rdf/releases/download/v0.2.3.0/tx-fetch-0.2.3.0-aarch64-darwin.tar.gz"
  sha256 "c9dbfc4a67767d070218a9b7114455be3096f1019104647431663f9778126591"
  version "0.2.3.0"


  def install
    bin.install "bin/tx-fetch"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-fetch 2>&1", 1)
assert_match "Usage:", output

  end
end
