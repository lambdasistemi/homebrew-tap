class AgentDaemon < Formula
  desc "WebSocket daemon for managing tmux workspaces"
  homepage "https://github.com/lambdasistemi/tmux-ws"
  url "https://github.com/lambdasistemi/tmux-ws/releases/download/v0.3.0/agent-daemon-0.3.0-aarch64-darwin.tar.gz"
  sha256 "72726e294b91e3e4095311db8a5a66d42ed6b4053c41b4f20897de31bc8f4b9c"
  version "0.3.0"

  def install
    bin.install "bin/agent-daemon"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
    system "#{bin}/agent-daemon", "--help"
  end
end
