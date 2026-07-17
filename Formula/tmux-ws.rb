class TmuxWs < Formula
  desc "WebSocket daemon for managing tmux workspaces"
  homepage "https://github.com/lambdasistemi/tmux-ws"
  url "https://github.com/lambdasistemi/tmux-ws/releases/download/v0.5.2/tmux-ws-0.5.2-aarch64-darwin.tar.gz"
  sha256 "dd468cd7272318e59cb753b480e2e1c99e23f57e425b8bdc45ece4c6ebb640fc"
  version "0.5.2"

  def install
    bin.install "bin/tmux-ws"
    (libexec/"lib").install Dir["libexec/lib/*"]
    (share/"tmux-ws").install Dir["share/tmux-ws/*"]
  end

  test do
    system "#{bin}/tmux-ws", "--help"
  end
end
