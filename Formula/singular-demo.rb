class SingularDemo < Formula
  desc "Play the Singular demos with tutorial-stepper"
  homepage "https://github.com/lambdasistemi/singular-demo"
  url "https://github.com/lambdasistemi/singular-demo/archive/refs/tags/v0.16.0-2.tar.gz"
  sha256 "0e4baeec06cd1535423d4b0d42ab4e6455c8b4c0d6ddbbe9405bdb6a8244d8cb"
  version "0.16.0-2"

  depends_on "lambdasistemi/tap/singular@0.16"
  depends_on "lambdasistemi/tap/tx-inspect"
  depends_on "lambdasistemi/tap/tx-diff"
  depends_on "jq"
  depends_on "tmux"
  depends_on "lambdasistemi/tap/tutorial-stepper"
  # The stepper's prompt hook needs bash 4 or newer (macOS ships 3.2); the pay-by-name tools run on node.
  depends_on "bash"
  depends_on "node"

  resource "pay-by-name-tools" do
    url "https://github.com/lambdasistemi/singular-demo/releases/download/v0.16.0-2/pay-by-name-tools-v0.16.0-2.tar.gz"
    sha256 "955263e215241ebe9ff700ecfbc6a240de9cdeb9e202480c869ee8a1074d7154"
  end

  def install
    (pkgshare/"tutorials").mkpath
    pkgshare.install "demos/demo1" => "tutorials/demo1", "demos/pay-by-name" => "tutorials/pay-by-name"
    # The compiled contracts the tutorials read as $blueprint: copied from the Singular they run on,
    # with the version file the commands look for beside the contracts file.
    # (A plain copy: installing across kegs with metadata preserved is refused on macOS.)
    pkgshare.mkpath
    FileUtils.cp Formula["lambdasistemi/tap/singular@0.16"].libexec/"share/plutus.json", pkgshare/"plutus.json"
    FileUtils.cp Formula["lambdasistemi/tap/singular@0.16"].libexec/"share/version.txt", pkgshare/"version.txt"
    resource("pay-by-name-tools").stage do
      (pkgshare/"sink-tools").install "sink-tools.cjs", "plutus.json"
    end
    (bin/"sink-tools").write <<~EOS
      #!/bin/bash
      exec node "#{pkgshare}/sink-tools/sink-tools.cjs" "$@"
    EOS
    (bin/"singular-demo").write <<~EOS
      #!/bin/bash
      # singular-demo: play the Singular demos with tutorial-stepper's terminal face.
      #   singular-demo                 Demo 1, as Alice and Bob (run kept in ~/demo1-run)
      #   singular-demo pay-by-name     the pay-by-name story, as Carol, Alice, Dave, Bob
      #                                 and the chain (run kept in ~/pay-by-name-run)
      # A leading --auto plays unattended (with --path, --run, --run-setup, --transcript);
      # further arguments go to `tutorial-stepper play`, for example --run DIR.
      set -euo pipefail
      share="#{pkgshare}"
      auto=""
      if [ "${1:-}" = --auto ]; then
        auto="--auto"
        shift
      fi
      name=demo1
      if [ "${1:-}" = pay-by-name ]; then
        name=pay-by-name
        shift
      fi
      # $auto is --auto or empty, split on purpose
      # shellcheck disable=SC2086
      exec tutorial-stepper play $auto "$share/tutorials/$name" "$@"
    EOS
  end

  test do
    system "tutorial-stepper", "check", pkgshare/"tutorials/demo1"
    system "tutorial-stepper", "check", pkgshare/"tutorials/pay-by-name"
    # The sink of the name alice under a fixed active policy: its script hash pins the
    # compiled validator the tools carry, as the kit's own checks assert.
    output = shell_output("#{bin}/sink-tools sink-address --active-policy 1ea53ee2878802fce8f05958db13186e49a3c179f7c2f1f446834577 --name alice")
    assert_match "9946eda863be029e31bdfc7ce24ef111c270eda863c7faa84be25f08", output
  end
end
