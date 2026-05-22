class CardanoTxGenerator < Formula
  desc "Synthetic Cardano transaction load generator"
  homepage "https://github.com/lambdasistemi/cardano-tx-tools"
  url "https://github.com/lambdasistemi/cardano-tx-tools/releases/download/v0.2.2.0/cardano-tx-generator-0.2.2.0-aarch64-darwin.tar.gz"
  sha256 "529f5527d7422db515623ac0646c706fd84cae22beef2baa57aa42f29ca91fa7"
  version "0.2.2.0"


  def install
    bin.install "bin/cardano-tx-generator"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/cardano-tx-generator 2>&1", 1)
assert_match "--relay-socket PATH", output

  end
end
