class TutorialStepper < Formula
  desc "Step a Markdown tutorial's commands into real shells"
  homepage "https://github.com/lambdasistemi/tutorial-stepper"
  url "https://github.com/lambdasistemi/tutorial-stepper/releases/download/v0.4.0/tutorial-stepper-0.4.0-aarch64-darwin.tar.gz"
  sha256 "c43c2a7e0362145157319ce3f272eb632ddc6d36f4e5fa31fabb3603915f12ae"
  version "0.4.0"
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
