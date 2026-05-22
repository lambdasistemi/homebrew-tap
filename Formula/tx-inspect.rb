class TxInspect < Formula
  desc "Render Conway transactions as structured, human-readable reports"
  homepage "https://github.com/lambdasistemi/cardano-tx-tools"
  url "https://github.com/lambdasistemi/cardano-tx-tools/releases/download/v0.2.2.0/tx-inspect-0.2.2.0-aarch64-darwin.tar.gz"
  sha256 "9c6c623de1d27026599456d222579e1c4d0a1508d9df50ccc4c35989da6987bb"
  version "0.2.2.0"


  def install
    bin.install "bin/tx-inspect"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
output = shell_output("#{bin}/tx-inspect 2>&1", 1)
assert_match "Usage:", output

  end
end
