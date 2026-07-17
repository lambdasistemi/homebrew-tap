class AgentDaemon < Formula
  desc "Deprecated compatibility route; install tmux-ws instead"
  homepage "https://github.com/lambdasistemi/tmux-ws"
  url "https://github.com/lambdasistemi/tmux-ws/releases/download/v0.5.1/tmux-ws-0.5.1-aarch64-darwin.tar.gz"
  sha256 "f2f9c3270fc38a0b082ae97676b79b456f543c5e61b3b1576fda5f6aee56625d"
  version "0.5.1"
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
