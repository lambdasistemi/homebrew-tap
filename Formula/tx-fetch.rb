class TxFetch < Formula
  desc "Walk a closure of Conway transactions over Blockfrost and write one CBOR per tx"
  homepage "https://github.com/lambdasistemi/cardano-tx-tools"
  url "https://github.com/lambdasistemi/cardano-tx-tools/releases/download/v0.2.3.0/tx-fetch-0.2.3.0-aarch64-darwin.tar.gz"
  sha256 "e2ee5a6ccae594338337f144cf5d5a9afa8109a4b8aa577e43ac1155e5f4a562"
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
