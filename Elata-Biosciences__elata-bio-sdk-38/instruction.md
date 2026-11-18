# Issue

**Title:** ci: cut Actions spend (concurrency, timeouts, matrix collapse, caching)

## Description

## Why

The org burned its 2,000 included Actions minutes this month and is at $40.76 billable. This repo's `ci.yml` accounted for 509 Linux + 235 macOS minutes across 29 runs, driven by a 16-job matrix (8 crates × ubuntu + macos) rebuilding shared deps every run, `wasm-bindgen-cli` compiled from source in 3 separate jobs, clippy running twice, and no concurrency cancellation.

## What changed

Only `.github/workflows/ci.yml` exists in this repo, so all changes are there, plus committing `Cargo.lock` (see note below).

### Before → after (jobs per run, runner types)

| | Before | After |
|---|---|---|
| Push/PR jobs | 7 named jobs, but `test-matrix` fans out to **16** (8 crates × 2 OS) → **21 total runner instances** | **6** jobs, all single-instance → **6 total runner instances** |
| Runner types on every push/PR | `ubuntu-latest` **and** `macos-latest` (8 macOS instances every run) | `ubuntu-latest` only. `macos-latest` runs **once/week** (cron) or on `workflow_dispatch` |
| Rust test job(s) | 16× `cargo test -p <crate>` (one per crate × OS) | 1× `cargo test --workspace --all-targets` (+1 weekly macOS equivalent) |
| Lint jobs | `fmt-check` + `clippy` (2 jobs) + clippy again inside `web-tests`'s `pnpm lint` (3rd clippy run) | 1 `rust-lint` job running fmt + clippy once; `web-tests` runs `audit:repo`/`format:check`/`lint:web` only |
| `wasm-bindgen-cli` install | `cargo install wasm-bindgen-cli --locked` compiled from source, in **3** separate jobs (`build-wasm`, `package-pack-check`, `consumer-smoke`) | `taiki-e/install-action@v2`, prebuilt, pinned to `0.2.128`, in **2** jobs (the two now-merged jobs) |
| `package-pack-check` + `consumer-smoke` | 2 separate jobs, each redoing pnpm+node+rust+wasm-bindgen setup | merged into 1 `npm-package-checks` job |
| Concurrency | none — every push kept old runs going | `concurrency: { group: ci-<pr-or-ref>, cancel-in-progress: true }` |
| Timeouts | none on any job | 15 min (lint/unit), 30 min (build/e2e) |
| Triggers | `push` on `main`, `webcam`, `npm-packages`; no `paths-ignore` | `push`/`pull_request` on `main` only, with `paths-ignore` for `**.md`, `docs/**`, `LICENSE`, `.github/ISSUE_TEMPLATE/**` |
| Rust caching | hand-rolled `actions/cache` for `~/.cargo/registry` + `target`, keyed on `Cargo.lock` hash (which didn't exist — see below) | `Swatinem/rust-cache@v2` in every Rust job |
| Playwright | `playwright install --with-deps` (all browsers, no cache) | `playwright install --with-deps chromium` only, cached and keyed on `pnpm-lock.yaml` |
| Artifact retention | already `retention-days: 1` | unchanged |
| Permissions | default (broad) | `permissions: contents: read` at workflow level |

### Cargo.lock

`Cargo.lock` was gitignored and not tracked, so the old cache key (`hashFiles('**/Cargo.lock')`) was constant garbage and cargo-cache never actually invalidated on dependency changes. I removed it from `.gitignore`, ran `cargo generate-lockfile`, and committed it in its own commit (`build: commit Cargo.lock for reproducible CI builds`) separate from the CI change. `wasm-bindgen` resolves to **0.2.128** in the generated lockfile — that's the version now pinned via `taiki-e/install-action@v2` (`tool: wasm-bindgen-cli@0.2.128`) everywhere the CLI is installed.

### wasm-bindgen pin verified locally

Ran, in this environment, before pushing:

```
rustup target add wasm32-unknown-unknown
cargo build -p elata-eeg-wasm --target wasm32-unknown-unknown --release   # succeeds
cargo install wasm-bindgen-cli --version 0.2.128 --locked                # matches Cargo.lock
wasm-bindgen --version                                                   # -> wasm-bindgen 0.2.128
wasm-bindgen target/wasm32-unknown-unknown/release/eeg_wasm.wasm \
  --out-dir /tmp/wb-test-out --target web                                # succeeds, emits .js/.d.ts/.wasm
```

No "class X referenced by an impl block does not match any exported struct" or similar codegen errors — the pin is correct for this crate's `wasm-bindgen = "0.2"` dependency.

Also ran `cargo test --workspace --all-targets` locally to confirm the matrix collapse (16 per-crate jobs → 1 workspace job) doesn't lose coverage: all crates pass.

### Judgment calls

- **macOS cadence**: none of the crates in this workspace produce a macOS/iOS binary artifact that needs verifying on every push (the wasm crates target `wasm32-unknown-unknown`; the FFI crates are consumed via the mobile demo apps, not built as release binaries in this workflow). So macOS moved to a weekly schedule + `workflow_dispatch`, gated with `if: github.event_name == 'schedule' || github.event_name == 'workflow_dispatch'` on a job kept in the same workflow (job-level `on:` doesn't exist in Actions).
- **`rust-lint` and `web-tests` clippy dedupe**: rather than touching `package.json`'s `lint` script (which still runs `lint:rust` for local/dev use), I changed only the CI step in `web-tests` to call `audit:repo`, `format:check`, and `lint:web` individually instead of the full `pnpm lint` umbrella, so clippy runs exactly once (in the new `rust-lint` job) without changing local developer tooling.
- **Merging `package-pack-check` + `consumer-smoke`**: both jobs did near-identical setup (pnpm, node, rust, wasm-bindgen-cli, `pnpm install`) before diverging into different checks — merged per the "run different checks after shared install+build" guidance.
- **Pre-existing, unrelated to this PR**: `cargo fmt --all -- --check` and `cargo clippy --workspace --all-targets -- -D warnings` both currently fail against the `stable` toolchain resolved in this environment (rustc/clippy 1.94.0) — unformatted code in `elata-dev-eeg-synthetic`/`elata-dev-synthetic-ble-bridge` and two clippy lints in `elata-eeg-signal`. This predates this PR (same commands, same lint level as the jobs they replace) and fixing it is out of scope for a cost-cutting change — flagging it here rather than silently leaving it.

## Test plan

- [x] YAML parses (`python3 -c "import yaml; yaml.safe_load(open('.github/workflows/ci.yml'))"`)
- [x] All `needs:` references resolve
- [x] `cargo generate-lockfile` run, `Cargo.lock` committed separately
- [x] wasm-bindgen 0.2.128 pin verified locally end-to-end (build → install → codegen)
- [x] `cargo test --workspace --all-targets` passes locally (validates the matrix collapse)
- [ ] CI itself runs green on this PR (first real signal once pushed)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_014EuCStV7HKgRuiwnJogwru

---
_Generated by [Claude Code](https://claude.ai/code/session_014EuCStV7HKgRuiwnJogwru)_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `669a6fa10c40`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.