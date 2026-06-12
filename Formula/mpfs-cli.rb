class MpfsCli < Formula
  desc "Command-line front-end for the Cardano MPFS server"
  homepage "https://github.com/lambdasistemi/cardano-mpfs-offchain"
  url "https://github.com/lambdasistemi/cardano-mpfs-offchain/releases/download/v0.2.1/mpfs-cli-0.2.1-aarch64-darwin.tar.gz"
  sha256 "ba509d5ead350bbf40c6e08d516095505390cc0d650d3266e84050345c6fa78a"
  version "0.2.1"

  def install
    bin.install "bin/mpfs-cli"
    lib.install Dir["lib/*"]
  end

  test do
    system "#{bin}/mpfs-cli", "--help"
  end
end
