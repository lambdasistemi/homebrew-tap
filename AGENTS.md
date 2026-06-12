# Repository Agent Guide

## What this repo is

The Homebrew tap of the lambdasistemi organisation: a flat collection of
Ruby formula files under `Formula/`, one per command-line tool, serving
prebuilt binaries for macOS on Apple Silicon (aarch64-darwin) only. Each
formula pins the URL and SHA-256 of a tarball attached to an upstream
GitHub release. There is no application code, no build system, and no CI
in this repository.

## How to work here

- There is nothing to build or test locally on Linux. Formula files are
  plain Ruby; review them by reading.
- On a macOS machine with Homebrew:
  - Install: `brew install lambdasistemi/tap/<formula>`
  - Run a formula's own test block: `brew test <formula>`
  - Lint: `brew style lambdasistemi/tap` and
    `brew audit --tap lambdasistemi/tap`
- Do not hand-edit `url`/`sha256`/`version` in a formula to "bump" it:
  bumps are pushed automatically by the upstream repository's Darwin
  Release workflow (authenticated with a `TAP_TOKEN` secret), and a
  manual bump is overwritten by the next upstream release. Bumps are the
  `github-actions` commits titled `update <name> to v<version>`.
- New tools enter the tap through the upstream repository's release
  pipeline (the shared `darwin-homebrew-release` action in
  `paolino/dev-assets`), not by hand-writing a formula here.
- Dylibs install under `libexec/lib/`, never `lib/` — Homebrew's shared
  `lib/` collides with system packages such as `gmp`. Keep that
  invariant if you ever touch an `install` block.

## Skills

Activatable procedures live under `skills/`. Load the one whose
description matches your task:

- `skills/homebrew-tap-guide/` — repository map, formula anatomy, the
  automated update flow, and how to answer user questions about
  installing the tools in this tap.
