---
name: homebrew-tap-guide
description: Guide to lambdasistemi/homebrew-tap, the Homebrew tap serving prebuilt aarch64-darwin (Apple Silicon macOS) binaries for lambdasistemi and cardano-foundation tools. Load when a task involves brew tap lambdasistemi/tap, brew install of moog, moog-agent, moog-oracle, tx-inspect, tx-diff, tx-validate, tx-sign, tx-fetch, tx-view, tx-graph, cq-rdf, cardano-tx-generator, amaru-treasury-tx, amaru-treasury-tx-dev, agent-daemon, or hello-nix; editing or reviewing Formula/*.rb files; sha256 mismatch or download failures on brew install; the update <name> to v<version> bump commits; TAP_TOKEN pushes from upstream Darwin Release workflows; the dev-homebrew channel and its conflicts_with stable; or adding/removing a formula from the tap.
---

# homebrew-tap guide

## Repository map

- `Formula/` — the entire repository: one Ruby formula per tool,
  16 in total.
  - From `lambdasistemi/cardano-tx-tools`: `tx-inspect.rb`,
    `tx-diff.rb`, `tx-validate.rb`, `tx-sign.rb`, `tx-fetch.rb`,
    `cardano-tx-generator.rb`.
  - From `lambdasistemi/cardano-ledger-rdf`: `cq-rdf.rb`, `tx-view.rb`,
    `tx-graph.rb` (deprecated compatibility shim for `cq-rdf`).
  - From `cardano-foundation/moog`: `moog.rb`, `moog-agent.rb`,
    `moog-oracle.rb`.
  - From `lambdasistemi/amaru-treasury-tx`: `amaru-treasury-tx.rb`
    (also installs `swap-probe` and `capture-swap-context`) and
    `amaru-treasury-tx-dev.rb` (dev channel, `conflicts_with` the
    stable formula).
  - From `lambdasistemi/agent-daemon`: `agent-daemon.rb`.
  - From `lambdasistemi/cachix-warmup`: `hello-nix.rb` — a pipeline
    smoke test, not a user tool.
- `README.md` — human-facing overview, formula tables, install steps.
- `AGENTS.md` — agent entry point.

There is no source code, no `.github/`, no flake, no docs site.

## Build, test, run

Nothing builds here. Verification commands (macOS with Homebrew only):

```bash
brew tap lambdasistemi/tap
brew install lambdasistemi/tap/<formula>
brew test <formula>                  # runs the formula's test block
brew style lambdasistemi/tap        # Ruby/formula lint
brew audit --tap lambdasistemi/tap
```

On Linux there is no runnable check; review formulas by reading them.

## Navigating the code

Every formula has the same anatomy — read any `Formula/*.rb` top to
bottom:

- `desc`, `homepage` — what the tool is and which upstream repo ships
  it. The `homepage` identifies the upstream.
- `url`, `sha256`, `version` — exact pin of one
  `<name>-<version>-aarch64-darwin.tar.gz` asset on the upstream's
  GitHub release. These three lines are what the automated bump
  commits rewrite.
- `def install` — `bin.install` for the executables, then
  `(libexec/"lib").install` for bundled dylibs. The `libexec/lib/`
  location is deliberate: Homebrew's shared `lib/` collides with
  system packages such as `gmp`.
- `test do` — smoke assertions (usually `--help` output or a usage
  string on exit code 1).

To find which formula ships a given binary, grep `bin.install` across
`Formula/`. To find everything from one upstream, grep its `homepage`
URL.

## Using the tap

```bash
brew tap lambdasistemi/tap
brew install moog          # or any formula name
moog --help
```

- One-step form: `brew install lambdasistemi/tap/<formula>`.
- Apple Silicon macOS only — there are no Intel or Linux bottles. For
  Linux, point users to the upstream repo's release page
  (AppImage/DEB/RPM).
- `amaru-treasury-tx-dev` and `amaru-treasury-tx` cannot be installed
  together (`conflicts_with`); the dev formula tracks the mutable
  `dev-homebrew` release tag of the upstream.
- A `sha256 mismatch` on install usually means the upstream re-uploaded
  an asset under the same tag (only the mutable `dev-homebrew` channel
  legitimately does this); re-running after a new bump commit lands in
  the tap resolves it.

## Answering questions

- "How do I install X on my Mac?" — README **Install** and
  **Quickstart** sections; the formula tables in **Formulae** say which
  formula ships which tool.
- "Does this work on Intel Macs / Linux?" — No; aarch64-darwin only.
  README **What is this** states this; Linux artifacts live on the
  upstream release pages.
- "What version do I get?" — whatever the formula currently pins:
  `brew info <formula>` or the `version` line in `Formula/<name>.rb`.
- "How do formulas get updated / can I bump one?" — automated by the
  upstream Darwin Release workflow pushing with `TAP_TOKEN`; manual
  bumps get overwritten. README **Development** section.
- "How do I add my tool to the tap?" — wire the upstream repo's Darwin
  release pipeline (shared `darwin-homebrew-release` action in
  `paolino/dev-assets`); the pipeline generates and pushes the formula.
- "What is hello-nix?" — a distribution-pipeline smoke test from
  `lambdasistemi/cachix-warmup`, not a user-facing tool.
