class TxValidate < Formula
  desc "Conway Phase-1 pre-flight against a local cardano-node"
  homepage "https://github.com/lambdasistemi/cardano-tx-tools"
  url "https://github.com/lambdasistemi/cardano-tx-tools/releases/download/v0.2.1.0/tx-validate-0.2.1.0-aarch64-darwin.tar.gz"
  sha256 "69bd70ce7d947540a077d7c13e7b34543e613ccd8ef3375bdd11d06f53bc60e9"
  version "0.2.1.0"


  def install
    bin.install "bin/tx-validate"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-validate 2>&1", 1)
assert_match "tx-validate", output

  end
end
