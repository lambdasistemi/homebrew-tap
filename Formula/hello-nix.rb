class HelloNix < Formula
  desc "Hello world built from nixpkgs (test)"
  homepage "https://github.com/lambdasistemi/cachix-warmup"
  url "https://github.com/lambdasistemi/cachix-warmup/releases/download/hello-test-v1/hello-aarch64-darwin.tar.gz"
  sha256 "c1ddf3766f5551b0439213d87a50b82a36544c519eea2279b3265db0d4c3aebc"

  def install
    bin.install "bin/hello"
    lib.install Dir["lib/*"]
  end
end
