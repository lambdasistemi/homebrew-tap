class TxSign < Formula
  desc "Encrypted signing-key vault and detached witness emitter for Cardano"
  homepage "https://github.com/lambdasistemi/cardano-tx-tools"
  url "https://github.com/lambdasistemi/cardano-tx-tools/releases/download/v0.2.3.0/tx-sign-0.2.3.0-aarch64-darwin.tar.gz"
  sha256 "5f883b780a0ec77f13ad5cbb27917637d96388187daaf4eec4784caba3a6fc39"
  version "0.2.3.0"


  def install
    bin.install "bin/tx-sign"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-sign 2>&1", 1)
assert_match "Usage:", output

  end
end
