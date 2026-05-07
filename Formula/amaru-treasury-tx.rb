class AmaruTreasuryTx < Formula
  desc "Build unsigned Amaru treasury transactions (disburse, swap, withdraw)"
  homepage "https://github.com/lambdasistemi/amaru-treasury-tx"
  url "https://github.com/lambdasistemi/amaru-treasury-tx/releases/download/v0.2.1.1/amaru-treasury-tx-0.2.1.1-aarch64-darwin.tar.gz"
  sha256 "2dc7a771eecfec5d6594e10cdb0f7dcc60c295d806e8627e2d4608ba38f55a6c"
  version "0.2.1.1"


  def install
    bin.install "bin/amaru-treasury-tx", "bin/swap-probe", "bin/capture-swap-context"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
assert_predicate bin/"swap-probe", :executable?
system "#{bin}/amaru-treasury-tx", "--help"
system "#{bin}/capture-swap-context", "--help"
system "#{bin}/amaru-treasury-tx", "swap-wizard", "--help"

  end
end
