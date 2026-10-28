class HelloNix < Formula
  desc "Hello world built from nixpkgs (test)"
  homepage "https://github.com/lambdasistemi/cachix-warmup"
  url "https://github.com/lambdasistemi/cachix-warmup/releases/download/hello-test-v1/hello-aarch64-darwin.tar.gz"
  sha256 "e04fb3c100b9f746d7c61e94e519a5c775ca4e6926bdda832f3a69604b737f50"
  version "2.12.3"

  def install
    bin.install "bin/hello"
    lib.install Dir["lib/*"]
  end
end
