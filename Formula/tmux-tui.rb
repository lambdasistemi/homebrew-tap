class TmuxTui < Formula
  desc "Mouse-driven drag-and-drop layout manager for tmux"
  homepage "https://github.com/lambdasistemi/tmux-tui"
  url "https://github.com/lambdasistemi/tmux-tui/releases/download/v0.1.0/tmux-tui-0.1.0-aarch64-darwin.tar.gz"
  sha256 "84b39535cfe5859ae6ad9703cf0a9b9a7e53c49fc88823ce3e2f98fb84c36bed"
  version "0.1.0"


  def install
    bin.install "bin/tmux-tui"
    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
    assert_predicate bin/"tmux-tui", :executable?
  end
end
