class AmaruTreasuryTxDev < Formula
  desc "Build unsigned Amaru treasury transactions (disburse, swap, withdraw)"
  homepage "https://github.com/lambdasistemi/amaru-treasury-tx"
  url "https://github.com/lambdasistemi/amaru-treasury-tx/releases/download/dev-homebrew/amaru-treasury-tx-0.1.1.0-c3c9fe3-aarch64-darwin.tar.gz"
  sha256 "fe9380a50f37d5f459439851d65742db7ec0895675604ddcf6e3b1ce0f6f9d99"
  version "0.1.1.0-c3c9fe3"

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
