class AmaruTreasuryTx < Formula
  desc "Build unsigned Amaru treasury transactions (disburse, swap, withdraw)"
  homepage "https://github.com/lambdasistemi/amaru-treasury-tx"
  url "https://github.com/lambdasistemi/amaru-treasury-tx/releases/download/v0.1.1.0/amaru-treasury-tx-0.1.1.0-aarch64-darwin.tar.gz"
  sha256 "0179b33629725ebb5772f94b3229590c108cf988e5b5a25b6038ed4c560407f7"
  version "0.1.1.0"

  def install
    bin.install "bin/amaru-treasury-tx", "bin/swap-probe", "bin/capture-swap-context"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end
end
