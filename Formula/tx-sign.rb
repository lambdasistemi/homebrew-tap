class TxSign < Formula
  desc "Encrypted signing-key vault and detached witness emitter for Cardano"
  homepage "https://github.com/lambdasistemi/cardano-tx-tools"
  url "https://github.com/lambdasistemi/cardano-tx-tools/releases/download/v0.2.2.0/tx-sign-0.2.2.0-aarch64-darwin.tar.gz"
  sha256 "c4683861b3d9475f0debe5dce4cd4266fd129b45928cadd658e47852bd179ef1"
  version "0.2.2.0"


  def install
    bin.install "bin/tx-sign"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-sign 2>&1", 1)
assert_match "Usage:", output

  end
end
