class AgentDaemon < Formula
  desc "WebSocket daemon for managing Claude Code agent sessions"
  homepage "https://github.com/lambdasistemi/agent-daemon"
  url "https://github.com/lambdasistemi/agent-daemon/releases/download/v0.1.0/agent-daemon-0.1.0-aarch64-darwin.tar.gz"
  sha256 "f4a803d77f883eeff92ec8b7429f6b13d7dc82eafa8f481d01926dd6d55c1391"
  version "0.1.0"

  def install
    bin.install "bin/agent-daemon"
    lib.install Dir["lib/*"]
  end
end
