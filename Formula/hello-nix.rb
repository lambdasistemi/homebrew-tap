class HelloNix < Formula
  desc "Hello world built from nixpkgs (test)"
  homepage "https://github.com/lambdasistemi/cachix-warmup"
  url "https://github.com/lambdasistemi/cachix-warmup/releases/download/hello-test-v1/hello-aarch64-darwin.tar.gz"
  sha256 "779201ae20cc1f53479bc4064b0aaed3766f2bb326dcab086960accc37ac196b"

  def install
    bin.install "bin/hello"
    lib.install Dir["lib/*"]
  end
end
