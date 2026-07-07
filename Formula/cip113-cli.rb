class Cip113Cli < Formula
  desc "Build CIP-113 programmable token transactions"
  homepage "https://github.com/lambdasistemi/cip113-tx-builder"
  url "https://github.com/lambdasistemi/cip113-tx-builder/releases/download/v0.1.2/cip113-cli-0.1.1.0-aarch64-darwin.tar.gz"
  sha256 "d0db9484c00ebd9f312536d0b18411a578444c74eb3cb8ae41ee21a4fc29e6bd"
  version "0.1.1.0"


  def install
    bin.install "bin/cip113-cli"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
system "#{bin}/cip113-cli", "--help"

  end
end
