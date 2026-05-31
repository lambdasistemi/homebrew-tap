class TxValidate < Formula
  desc "Conway Phase-1 pre-flight against a local cardano-node"
  homepage "https://github.com/lambdasistemi/cardano-tx-tools"
  url "https://github.com/lambdasistemi/cardano-tx-tools/releases/download/v0.2.3.0/tx-validate-0.2.3.0-aarch64-darwin.tar.gz"
  sha256 "93bfeed690a1d72fc242a35cf2d4d8ba65a176e577516437d6c60ab5f6de83a7"
  version "0.2.3.0"


  def install
    bin.install "bin/tx-validate"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-validate 2>&1", 1)
assert_match "tx-validate", output

  end
end
