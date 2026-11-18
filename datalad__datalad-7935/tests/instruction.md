# Issue

**Title:** CI: install git-annex from PyPI, one selection per scenario, coverage where it is read

## Description

Part **A** (CI tune-ups) of the test-suite speedup work. Touches only `.github/workflows/test.yml` and `tools/ci/`; no test file is changed here — that is part B.

The branch also carries `docs/testing-speedup-proposal.md`, the measurements this change rests on, and `tools/testing/bench-git-annex-flavors.sh`, which reproduces the git-annex comparison in one command. Happy to split those out if they would rather land separately.

## Why

Measured on nightly run [35213632039](https://github.com/datalad/datalad/actions/runs/35213632039) (814 job-min, 85 min wall) and locally:

| finding | |
|---|---|
| `Install git-annex` | **196 of 814 job-min (24 %)**, almost all of it the stale `miniconda=py37_23.1.0-1` pin: 9–15 min/job, where the same pinned git-annex with a current miniconda takes 0.7 min |
| how git-annex is *wrapped* | **2.3–3.9× on test runtime.** Same version 10.20260901, same 263 tests, only `PATH` differing: static build 111 s, PyPI wheel 114 s exec'd directly / 145 s via its console script, NeuroDebian standalone deb 293 s |
| the 3.12/3.13/3.14 matrix pairs | byte-identical invocations — with `PYTEST_SELECTION` empty, `${VAR:+…}` drops `PYTEST_SELECTION_OP` — ≈112 job-min/run |
| coverage | **+39 %** of test runtime, measured on all jobs but uploaded only on non-`schedule` runs |
| PR job count | **20 — exactly the 20-job concurrency cap**, so the last entries queued ~31 min before starting |

Static linking turns out to buy nothing measurable over the wheel; it is the wrapper that costs. `runshell` is two shell scripts plus a bundled `ld.so`, and the bundle prepends its own `bin/` so every `git` git-annex spawns takes another hop — `test_create.py` alone spawns 561 git-annex and 2405 git processes for 33 tests.

## What changed

**`test.yml`**

- `_DL_ANNEX_INSTALL_SCENARIO` defaults to `pypi` — the git-annex wheel, ~1 s to install and unwrapped. A `pixi` scenario covers the conda-forge package in ~3 s (`micromamba` 12 s, `miniconda` 266 s on the same machine). Anything else still goes to datalad-installer verbatim.
  The console scripts are symlinked into `/usr/local/bin` because a non-interactive `sshd` session — which `DATALAD_TESTS_SSH=1` tests reach through `SSHConnection.get_annex_installdir()` — and `sudo -E` see neither `$GITHUB_PATH` nor `~/.bashrc`.
- **one selection per scenario** instead of the "not slow" / "slow only" split: a full run now costs about what the "not slow" half did, so PRs stop skipping ~101 `@slow`/`@network` tests. `PYTEST_FAIL_SLOW` becomes a stall guard at 300 s rather than a "needs `@slow` annotation" lint.
- **coverage where somebody reads it**: not on `schedule` (the upload was already skipped there, so it was pure waste) and not on draft PRs. `ready_for_review` is added to the trigger so taking a PR out of draft re-runs with coverage on; the reverse transition emits no event, so flipping back to draft costs nothing. The `coverage-bin` wrapper, the report step and the upload are gated on the same flag.
- `PYTEST_NPROC` replaces the hardcoded `-n 2`, defaulting to 2 and set to 4 on one entry as a trial — 4 workers measured 1.65× over 2 locally (574 tests) with identical outcomes. Not `-n auto`: `os.cpu_count()` reports the machine's CPUs rather than the runner's quota. A `Report runner resources` step prints `os.cpu_count()` and `nproc` so the rollout rests on evidence.
- `uv pip install` for the Python dependencies; the deprecated, unused `codecov` shim package is dropped.
- `DATALAD_TESTS_SETUP_TESTREPOS=1` is dropped — nothing has read the config option it maps to since the nose→pytest migration removed `@with_testrepos` (removing the option itself is part B). The duplicated `--doctest-modules` is gone.

**`tools/ci/test-jobs.yml`** — the Python sweep on PRs is the base supported version and the newest one, with 3.12/3.13 moved to cron. The standalone bundle and the conda package — packaging variants of the same git-annex, rarely what a PR breaks — get one cron entry each, and the minimum-announced-version entry comes from conda-forge via pixi, since that version predates the wheels. PR jobs: **20 → 14**.

**`tools/ci/test-env-linux.sh`** — the NeuroDebian repository setup is opt-in via `needs-neurodebian: true`. No entry needs it for git-annex any more, and the APT packages the tests use are all in Ubuntu proper.

## Projected effect

| step | job-min |
|---|---:|
| baseline | 814 |
| install 196 min → ~10 min | −186 |
| drop the duplicated entries | −115 |
| test time ÷1.5 (conservative against 2.0–3.5× measured) | −155 |
| no coverage on cron | −87 |
| NeuroDebian gating, `uv` | −20 |
| **remaining** | **~250** |

and 14 PR jobs instead of 20 means no queueing, so a PR's wall time goes from ~54 min to roughly 28 min.

## Validated locally with `act` before pushing

Section 8 of the proposal documents the setup. Confirmed here: the `filter` job's matrix output for both events (14 entries on push/PR, 24 on schedule); the full test job end to end for the `pypi`, `pixi` and pinned-`pixi` scenarios; and the coverage gating across `schedule` / `push` / draft PR / ready-for-review. That loop caught two bugs in this diff before CI ever saw it — `pixi` installing into `$PWD/.pixi` (untracked cruft inside the checkout the tests then run against), and the install step's own verification reporting the wrong git-annex, since `$GITHUB_PATH` only affects *later* steps.

Two things `act` cannot check, so they want a real run: `env: ${{ matrix.extra-envs }}` (a map assigned to `env:` is not implemented by act), and the Windows/macOS entries.

## Deliberately not here

- **Scoping the six "scenario smoke" entries** to a module subset (~78 job-min) — a coverage/time judgment call, left for a follow-up.
- **Part B** (test-suite changes): `CMD_MAX_ARG` monkeypatching instead of a 10 000-file tree, `git-annex testremote --fast`, removing `utils_testrepos.py` and its config option, tarball-based fixture reuse.
- Rolling `PYTEST_NPROC=4` out beyond the one trial entry, pending the `nproc` output from a real run.

### PR checklist

- [x] Overview of the changes and why — above.
- [ ] Changelog snippet — added as a follow-up commit once this PR has a number.
- [x] Not a fix for an existing issue, so no `Fixes #NNN`.
- [x] Complete as scoped; the remaining items are listed above.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01YGSwPWNihxaGvXxPGZvrWZ

---
_Generated by [Claude Code](https://claude.ai/code/session_01YGSwPWNihxaGvXxPGZvrWZ)_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2368b785f24e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.