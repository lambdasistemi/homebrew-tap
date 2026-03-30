class HelloNix < Formula
  desc "Hello world built from nixpkgs (test)"
  homepage "https://github.com/lambdasistemi/cachix-warmup"
  url "https://github.com/lambdasistemi/cachix-warmup/releases/download/hello-test-v1/hello-aarch64-darwin.tar.gz"
  sha256 "a43a70874dc12c7b53ba18c92ab47029d92b56f53b3141d4a65d02377504dd1f"
  version "2.12.3"

  def install
    bin.install "bin/hello"
    lib.install Dir["lib/*"]
  end
end
