class AmaruTreasuryTxDev < Formula
  desc "Build unsigned Amaru treasury transactions (disburse, swap, withdraw)"
  homepage "https://github.com/lambdasistemi/amaru-treasury-tx"
  url "https://github.com/lambdasistemi/amaru-treasury-tx/releases/download/dev-homebrew/amaru-treasury-tx-0.1.1.0-5ec04d5-aarch64-darwin.tar.gz"
  sha256 "71416c64b8a37c6d36cd1598fcfed2d0afaba6f01f98dbcd45eb6fd78c9d5233"
  version "0.1.1.0-5ec04d5"

  conflicts_with "amaru-treasury-tx", because: "both install the same command-line tools"

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
