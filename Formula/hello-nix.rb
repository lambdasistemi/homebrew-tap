class HelloNix < Formula
  desc "Hello world built from nixpkgs (test)"
  homepage "https://github.com/lambdasistemi/cachix-warmup"
  url "https://github.com/lambdasistemi/cachix-warmup/releases/download/hello-test-v1/hello-aarch64-darwin.tar.gz"
  sha256 "855fd36e8ce05ac34167374028b898d1855242b77a6f1d6e4b782503ee4588a2"
  version "2.12.3"

  def install
    bin.install "bin/hello"
    lib.install Dir["lib/*"]
  end
end
