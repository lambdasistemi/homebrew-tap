class TutorialStepper < Formula
  desc "Step a Markdown tutorial's commands into real shells"
  homepage "https://github.com/lambdasistemi/tutorial-stepper"
  url "https://github.com/lambdasistemi/tutorial-stepper/releases/download/v0.3.1/tutorial-stepper-0.3.1-aarch64-darwin.tar.gz"
  sha256 "dbce6c6baff15f2acaf2054708e6d0ef750e8880e1480ec833c3dbb9accd7d63"
  version "0.3.1"
  license "Apache-2.0"

  depends_on "tmux"

  def install
    bin.install "bin/tutorial-stepper"
    return unless Dir.exist?("libexec/lib")

    (libexec/"lib").install Dir["libexec/lib/*"]
  end

  test do
    assert_match "tutorial-stepper #{version}",
                 shell_output("#{bin}/tutorial-stepper --version")
  end
end
