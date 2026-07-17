class AgentDaemon < Formula
  desc "Deprecated compatibility route; install tmux-ws instead"
  homepage "https://github.com/lambdasistemi/tmux-ws"
  url "https://github.com/lambdasistemi/tmux-ws/releases/download/v0.5.2/tmux-ws-0.5.2-aarch64-darwin.tar.gz"
  sha256 "dd468cd7272318e59cb753b480e2e1c99e23f57e425b8bdc45ece4c6ebb640fc"
  version "0.5.2"
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
