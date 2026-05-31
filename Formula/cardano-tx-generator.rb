class CardanoTxGenerator < Formula
  desc "Synthetic Cardano transaction load generator"
  homepage "https://github.com/lambdasistemi/cardano-tx-tools"
  url "https://github.com/lambdasistemi/cardano-tx-tools/releases/download/v0.2.3.0/cardano-tx-generator-0.2.3.0-aarch64-darwin.tar.gz"
  sha256 "4fec4099f8fa17125d624f656072731c69c4c2df2ee7d7562b77dd02033cc4b8"
  version "0.2.3.0"


  def install
    bin.install "bin/cardano-tx-generator"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/cardano-tx-generator 2>&1", 1)
assert_match "--relay-socket PATH", output

  end
end
