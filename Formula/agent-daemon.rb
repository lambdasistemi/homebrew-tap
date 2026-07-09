class AgentDaemon < Formula
  desc "WebSocket daemon for managing tmux workspaces"
  homepage "https://github.com/lambdasistemi/tmux-ws"
  url "https://github.com/lambdasistemi/tmux-ws/releases/download/v0.1.1/agent-daemon-0.1.1-aarch64-darwin.tar.gz"
  sha256 "5d00eaa585d2075955353cdeef948588a06708bd534646ecb8fa96d5a9e9ef3c"
  version "0.1.1"

  def install
    bin.install "bin/agent-daemon"
    (libexec/"lib").install Dir["lib/*"]
  end
end
