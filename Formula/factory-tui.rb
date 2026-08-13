class FactoryTui < Formula
  desc "Browse the agent factory as a tree of seats"
  homepage "https://github.com/lambdasistemi/factory-tui"
  url "https://github.com/lambdasistemi/factory-tui/releases/download/v0.0.1/factory-tui-0.0.1-aarch64-darwin.tar.gz"
  sha256 "99b81f34783191f2b487e157c433a09004909c32f8f184f6a10c64f0837e5095"
  version "0.0.1"


  def install
    bin.install "bin/factory-tui"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
    assert_predicate bin/"factory-tui", :executable?
  end
end
