class TmuxWs < Formula
  desc "WebSocket daemon for managing tmux workspaces"
  homepage "https://github.com/lambdasistemi/tmux-ws"
  url "https://github.com/lambdasistemi/tmux-ws/releases/download/v0.5.1/tmux-ws-0.5.1-aarch64-darwin.tar.gz"
  sha256 "f2f9c3270fc38a0b082ae97676b79b456f543c5e61b3b1576fda5f6aee56625d"
  version "0.5.1"

  def install
    bin.install "bin/tmux-ws"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
    system "#{bin}/tmux-ws", "--help"
  end
end
