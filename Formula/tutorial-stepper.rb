class TutorialStepper < Formula
  desc "Step a Markdown tutorial's commands into real shells"
  homepage "https://github.com/lambdasistemi/tutorial-stepper"
  url "https://github.com/lambdasistemi/tutorial-stepper/releases/download/v0.4.1/tutorial-stepper-0.4.1-aarch64-darwin.tar.gz"
  sha256 "c698f1adab6486c8545dc9a3917a9b8f95c9c1cba66dfe9af6844950ffad221c"
  version "0.4.1"
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
