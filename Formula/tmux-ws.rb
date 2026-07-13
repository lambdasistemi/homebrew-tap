class TmuxWs < Formula
  desc "WebSocket daemon for managing tmux workspaces"
  homepage "https://github.com/lambdasistemi/tmux-ws"
  url "https://github.com/lambdasistemi/tmux-ws/releases/download/v0.3.1/tmux-ws-0.3.1-aarch64-darwin.tar.gz"
  sha256 "9f1d727a61b1787585219ef4b6d51db46d2936418d56e3757a4afe7a3ea1a05a"
  version "0.3.1"

  def install
    bin.install "bin/tmux-ws"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
    system "#{bin}/tmux-ws", "--help"
  end
end
