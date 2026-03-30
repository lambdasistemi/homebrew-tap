class AgentDaemon < Formula
  desc "WebSocket daemon for managing Claude Code agent sessions"
  homepage "https://github.com/lambdasistemi/agent-daemon"
  url "https://github.com/lambdasistemi/agent-daemon/releases/download/v0.1.0/agent-daemon-0.1.0-aarch64-darwin.tar.gz"
  sha256 "4d2132dadaeebb7f8dbb493e8d186713937fc9ade7b9c263b3abb4009e0bad94"
  version "0.1.0"

  def install
    bin.install "bin/agent-daemon"
    (libexec/"lib").install Dir["lib/*"]
  end
end
