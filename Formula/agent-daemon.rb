class AgentDaemon < Formula
  desc "WebSocket daemon for managing tmux workspaces"
  homepage "https://github.com/lambdasistemi/tmux-ws"
  url "https://github.com/lambdasistemi/tmux-ws/releases/download/v0.2.0/agent-daemon-0.2.0-aarch64-darwin.tar.gz"
  sha256 "c2fd9c4acbffe877f26be69ab41916b99360b16ed2ce62a24a95efc336208c64"
  version "0.2.0"

  def install
    bin.install "bin/agent-daemon"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
    system "#{bin}/agent-daemon", "--help"
  end
end
