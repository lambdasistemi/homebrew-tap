class TxSign < Formula
  desc "Encrypted signing-key vault and detached witness emitter for Cardano"
  homepage "https://github.com/lambdasistemi/cardano-tx-tools"
  url "https://github.com/lambdasistemi/cardano-tx-tools/releases/download/v0.2.1.0/tx-sign-0.2.1.0-aarch64-darwin.tar.gz"
  sha256 "dea2ab71796c646419cfe46251749b74d5099517b93bdf18dec41e75e251c528"
  version "0.2.1.0"


  def install
    bin.install "bin/tx-sign"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-sign 2>&1", 1)
assert_match "Usage:", output

  end
end
