class SingularDemo < Formula
  desc "Play the Singular demos with tutorial-stepper"
  homepage "https://github.com/lambdasistemi/singular-demo"
  url "https://github.com/lambdasistemi/singular-demo/archive/refs/tags/v0.18.0-1.tar.gz"
  sha256 "2ed3f16dca0011ed079a8b7b35193809bff9cb6b7fe466fc3ffee61d865d3d58"
  version "0.18.0-1"

  depends_on "lambdasistemi/tap/singular@0.18"
  depends_on "lambdasistemi/tap/tx-inspect"
  depends_on "lambdasistemi/tap/tx-diff"
  depends_on "jq"
  depends_on "tmux"
  depends_on "lambdasistemi/tap/tutorial-stepper"
  # The stepper's prompt hook needs bash 4 or newer (macOS ships 3.2).
  depends_on "bash"

  def install
    (pkgshare/"tutorials").mkpath
    pkgshare.install "demos/demo1" => "tutorials/demo1"
    # The compiled contracts the tutorials read as $blueprint: copied from the Singular they run on,
    # with the version file the commands look for beside the contracts file.
    # (A plain copy: installing across kegs with metadata preserved is refused on macOS.)
    pkgshare.mkpath
    FileUtils.cp Formula["lambdasistemi/tap/singular@0.18"].libexec/"share/plutus.json", pkgshare/"plutus.json"
    FileUtils.cp Formula["lambdasistemi/tap/singular@0.18"].libexec/"share/version.txt", pkgshare/"version.txt"
    (bin/"singular-demo").write <<~EOS
      #!/bin/bash
      # singular-demo: play the Singular demos with tutorial-stepper's terminal face.
      #   singular-demo                 Demo 1, as Alice and Bob (run kept in ~/demo1-run)
      # A leading --auto plays unattended (with --path, --run, --run-setup, --transcript);
      # further arguments go to `tutorial-stepper play`, for example --run DIR.
      set -euo pipefail
      share="#{pkgshare}"
      auto=""
      if [ "${1:-}" = --auto ]; then
        auto="--auto"
        shift
      fi
      runtime="#{Formula["lambdasistemi/tap/singular@0.18"].opt_libexec}"
      export PATH="$runtime/bin:$PATH" blueprint="$runtime/share/plutus.json"
      # $auto is --auto or empty, split on purpose
      # shellcheck disable=SC2086
      exec tutorial-stepper play $auto "$share/tutorials/demo1" "$@"
    EOS
  end

  test do
    system "tutorial-stepper", "check", pkgshare/"tutorials/demo1"
  end
end
