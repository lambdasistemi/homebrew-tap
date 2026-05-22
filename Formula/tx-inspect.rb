class TxInspect < Formula
  desc "Render Conway transactions as structured, human-readable reports"
  homepage "https://github.com/lambdasistemi/cardano-tx-tools"
  url "https://github.com/lambdasistemi/cardano-tx-tools/releases/download/v0.2.1.0/tx-inspect-0.2.1.0-aarch64-darwin.tar.gz"
  sha256 "9e105307269805ae939c79da24206b4e4bca1bbe7de897a656f655e4b2e37542"
  version "0.2.1.0"


  def install
    bin.install "bin/tx-inspect"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-inspect 2>&1", 1)
assert_match "Usage:", output

  end
end
