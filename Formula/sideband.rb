class Sideband < Formula
  desc "Telegram side channel for unattended coding agents"
  homepage "https://github.com/lambdasistemi/sideband"
  url "https://github.com/lambdasistemi/sideband/releases/download/v0.1.2.0/sideband-0.1.2.0-aarch64-darwin.tar.gz"
  sha256 "b9c75a6cda8dd2b0e298293b689267daa8feb8f9c486c26625cdd90a43b3b4ed"
  version "0.1.2.0"


  def install
    bin.install "bin/tg"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
system "#{bin}/tg", "--help"
  end
end
