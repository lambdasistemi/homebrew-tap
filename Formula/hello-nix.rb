class HelloNix < Formula
  desc "Hello world built from nixpkgs (test)"
  homepage "https://github.com/lambdasistemi/cachix-warmup"
  url "https://github.com/lambdasistemi/cachix-warmup/releases/download/hello-test-v1/hello-aarch64-darwin.tar.gz"
  sha256 "9f7e9d303ca9ec2c62a8f0bdad0593d32d94846f2d24f162a83055758d2140e8"
  version "2.12.3"

  def install
    bin.install "bin/hello"
    lib.install Dir["lib/*"]
  end
end
