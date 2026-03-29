class HelloNix < Formula
  desc "Hello world built from nixpkgs (test)"
  homepage "https://github.com/lambdasistemi/cachix-warmup"
  url "https://github.com/lambdasistemi/cachix-warmup/releases/download/hello-test-v1/hello-aarch64-darwin.tar.gz"
  sha256 "674f6ff1b1bab5cc064426cce4ac4f1ed324dbd25e73b5aece881f2ecfb58039"

  def install
    bin.install "bin/hello"
    lib.install Dir["lib/*"]
  end
end
