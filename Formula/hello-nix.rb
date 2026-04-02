class HelloNix < Formula
  desc "Hello world built from nixpkgs (test)"
  homepage "https://github.com/lambdasistemi/cachix-warmup"
  url "https://github.com/lambdasistemi/cachix-warmup/releases/download/hello-test-v1/hello-aarch64-darwin.tar.gz"
  sha256 "a748f047b74144932a570e2936df9636c5e8fabc0c1e198dd8110fdd66230096"
  version "2.12.3"

  def install
    bin.install "bin/hello"
    lib.install Dir["lib/*"]
  end
end
