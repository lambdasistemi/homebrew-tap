class AgentDaemon < Formula
  desc "Deprecated compatibility route; install tmux-ws instead"
  homepage "https://github.com/lambdasistemi/tmux-ws"
  url "https://github.com/lambdasistemi/tmux-ws/releases/download/v0.4.0/tmux-ws-0.4.0-aarch64-darwin.tar.gz"
  sha256 "5ca51a4ab76de3a24600ab7fdb04de2ccda23179f89fe89aecd45eb07c716e3d"
  version "0.4.0"
  depends_on "tmux-ws"

  def install
    bin.install_symlink Formula["tmux-ws"].opt_bin/"tmux-ws" => "agent-daemon"
  end

  def caveats
    <<~EOS
      agent-daemon is deprecated; use tmux-ws.
    EOS
  end
end
