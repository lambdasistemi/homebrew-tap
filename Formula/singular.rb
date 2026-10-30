class Singular < Formula
  desc "Registry of unique keys on Cardano: singular, open-datum and a private development node"
  homepage "https://lambdasistemi.github.io/singular/"
  url "https://github.com/lambdasistemi/singular/releases/download/v0.19.0/singular-0.19.0-aarch64-darwin.tar.gz"
  sha256 "2f1ceece48359923ab4813b6a427fc89a44a4d913bc970d5319e133b917f933b"
  version "0.19.0"


  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/singular", libexec/"bin/open-datum", libexec/"bin/devnet"
  end

  test do
    %w[singular open-datum devnet].each do |program|
      assert_match "#{program} 0.19.0 (commit ", shell_output("#{bin}/#{program} --version")
    end
    assert_match "cardano-node", shell_output("#{libexec}/bin/cardano-node --version")
    assert_predicate libexec/"share/plutus.json", :exist?
    assert_equal "0.19.0", (libexec/"share/version.txt").read.strip
  end
end
