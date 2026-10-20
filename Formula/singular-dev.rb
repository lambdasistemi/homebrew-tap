class SingularDev < Formula
  desc "Registry of unique keys on Cardano: singular, open-datum and a private development node"
  homepage "https://lambdasistemi.github.io/singular/"
  url "https://github.com/lambdasistemi/singular/releases/download/dev-homebrew/singular-0.13.1-9180a17-aarch64-darwin.tar.gz"
  sha256 "460fd388b373812f3a558dd3df3dd19d384f4c482a8149f7db75831d50dabce8"
  version "0.13.1-9180a17"

  conflicts_with "singular", because: "both install the same commands"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/singular", libexec/"bin/open-datum", libexec/"bin/devnet"
  end

  test do
    %w[singular open-datum devnet].each do |program|
      assert_match "#{program} 0.13.1 (commit ", shell_output("#{bin}/#{program} --version")
    end
    assert_match "cardano-node", shell_output("#{libexec}/bin/cardano-node --version")
    assert_predicate libexec/"share/plutus.json", :exist?
    assert_equal "0.13.1", (libexec/"share/version.txt").read.strip
  end
end
