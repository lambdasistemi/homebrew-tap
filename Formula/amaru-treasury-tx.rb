class AmaruTreasuryTx < Formula
  desc "Build unsigned Amaru treasury transactions (disburse, swap, withdraw)"
  homepage "https://github.com/lambdasistemi/amaru-treasury-tx"
  url "https://github.com/lambdasistemi/amaru-treasury-tx/releases/download/v0.2.21.2/amaru-treasury-tx-0.2.21.2-aarch64-darwin.tar.gz"
  sha256 "987520fef57d0dada7080d63b1474d66f2f9af7a7db795d2854cc7918f1faf48"
  version "0.2.21.2"


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
