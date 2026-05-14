class AmaruTreasuryTx < Formula
  desc "Build unsigned Amaru treasury transactions (disburse, swap, withdraw)"
  homepage "https://github.com/lambdasistemi/amaru-treasury-tx"
  url "https://github.com/lambdasistemi/amaru-treasury-tx/releases/download/v0.2.7.0/amaru-treasury-tx-0.2.7.0-aarch64-darwin.tar.gz"
  sha256 "cc620be60eb1d5a3072d0ebdb9fdf2fe774ce3b34770f2df4f9a72660d4bfa17"
  version "0.2.7.0"


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
