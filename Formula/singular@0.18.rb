class SingularAT018 < Formula
  desc "Registry of unique keys on Cardano: singular, open-datum and a private development node"
  homepage "https://lambdasistemi.github.io/singular/"
  url "https://github.com/lambdasistemi/singular/releases/download/v0.18.0/singular-0.18.0-aarch64-darwin.tar.gz"
  sha256 "5dd300ee1f9635eb589ef93b5eba02fd6e1fcd97d7461dca52d3e89f1a2b1f71"
  version "0.18.0"

  keg_only :versioned_formula

  conflicts_with "singular", because: "both install the same commands"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/singular", libexec/"bin/open-datum", libexec/"bin/devnet"
  end

  test do
    %w[singular open-datum devnet].each do |program|
      assert_match "#{program} #{version} (commit ", shell_output("#{bin}/#{program} --version")
    end
    assert_match "cardano-node", shell_output("#{libexec}/bin/cardano-node --version")
    assert_predicate libexec/"share/plutus.json", :exist?
    assert_equal version.to_s, (libexec/"share/version.txt").read.strip
  end
end
