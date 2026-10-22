class Singular < Formula
  desc "Registry of unique keys on Cardano: singular, open-datum and a private development node"
  homepage "https://lambdasistemi.github.io/singular/"
  url "https://github.com/lambdasistemi/singular/releases/download/v0.16.0/singular-0.16.0-aarch64-darwin.tar.gz"
  sha256 "920fe4b606077446baba294e84e84294733c87cab9682576d10b7df3e63735b7"
  version "0.16.0"


  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/singular", libexec/"bin/open-datum", libexec/"bin/devnet"
  end

  test do
    %w[singular open-datum devnet].each do |program|
      assert_match "#{program} 0.16.0 (commit ", shell_output("#{bin}/#{program} --version")
    end
    assert_match "cardano-node", shell_output("#{libexec}/bin/cardano-node --version")
    assert_predicate libexec/"share/plutus.json", :exist?
    assert_equal "0.16.0", (libexec/"share/version.txt").read.strip
  end
end
