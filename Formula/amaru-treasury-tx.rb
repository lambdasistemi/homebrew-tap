class AmaruTreasuryTx < Formula
  desc "Build unsigned Amaru treasury transactions (disburse, swap, withdraw)"
  homepage "https://github.com/lambdasistemi/amaru-treasury-tx"
  url "https://github.com/lambdasistemi/amaru-treasury-tx/releases/download/v0.2.7.1/amaru-treasury-tx-0.2.7.1-aarch64-darwin.tar.gz"
  sha256 "b2858b9f9ec3d62128e6ef54fba81ce0b1b149aa2f5ba46d23833905b12b08c0"
  version "0.2.7.1"


  def install
    bin.install "bin/amaru-treasury-tx", "bin/swap-probe", "bin/capture-swap-context"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
assert_predicate bin/"swap-probe", :executable?
system "#{bin}/amaru-treasury-tx", "--help"
system "#{bin}/capture-swap-context", "--help"
system "#{bin}/amaru-treasury-tx", "swap-wizard", "--help"
system "#{bin}/amaru-treasury-tx", "withdraw-wizard", "--help"

  end
end
