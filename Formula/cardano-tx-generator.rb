class CardanoTxGenerator < Formula
  desc "Synthetic Cardano transaction load generator"
  homepage "https://github.com/lambdasistemi/cardano-tx-tools"
  url "https://github.com/lambdasistemi/cardano-tx-tools/releases/download/v0.2.1.0/cardano-tx-generator-0.2.1.0-aarch64-darwin.tar.gz"
  sha256 "c56e9fb852e00358fc8431af10efcbff4296f0ecbe8cc3805a5c299df0123a0f"
  version "0.2.1.0"


  def install
    bin.install "bin/cardano-tx-generator"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/cardano-tx-generator 2>&1", 1)
assert_match "--relay-socket PATH", output

  end
end
