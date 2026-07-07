class Cip113Cli < Formula
  desc "Build CIP-113 programmable token transactions"
  homepage "https://github.com/lambdasistemi/cip113-tx-builder"
  url "https://github.com/lambdasistemi/cip113-tx-builder/releases/download/v0.1.3/cip113-cli-0.1.1.0-aarch64-darwin.tar.gz"
  sha256 "fa8c99ce1513b6d01749d1278a7981948b8d29c69f4bf60567fa30b9dcb2c04f"
  version "0.1.1.0"


  def install
    bin.install "bin/cip113-cli"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
system "#{bin}/cip113-cli", "--help"

  end
end
