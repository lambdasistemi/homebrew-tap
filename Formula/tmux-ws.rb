class TmuxWs < Formula
  desc "WebSocket daemon for managing tmux workspaces"
  homepage "https://github.com/lambdasistemi/tmux-ws"
  url "https://github.com/lambdasistemi/tmux-ws/releases/download/v0.4.0/tmux-ws-0.4.0-aarch64-darwin.tar.gz"
  sha256 "5ca51a4ab76de3a24600ab7fdb04de2ccda23179f89fe89aecd45eb07c716e3d"
  version "0.4.0"

  def install
    bin.install "bin/tmux-ws"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
    system "#{bin}/tmux-ws", "--help"
  end
end
