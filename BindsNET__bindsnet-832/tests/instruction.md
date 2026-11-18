# Issue

**Title:** CI: close test-guard bypasses found by independent review

## Description

## What this changes and why

An independent review of the test guards from #828 and #830 found ways a pull request could pass every required check while breaking results. **The worst case:** one commit halved the leak of `LIFNodes`. It also added a root `pytest.ini` that skips `test/regression`, and a fake "bug test" that only checks which folder it runs from. It passed `build`, `bug-test`, `weakened-tests` and the coverage floor. This PR closes the holes. I replayed each of the reviewer's attacks against the new scripts to check.

**This branch is stacked on #831**, because both change `test/regression/op_counts.json`. Merge #831 first; this PR's diff then shrinks to the CI changes.

## Changes
- **CI ignores other config files.** `build` and the 3.11/3.12 jobs run `pytest -c pyproject.toml --cov-config=pyproject.toml`, so a `pytest.ini`, `setup.cfg`, `tox.ini` or `.coveragerc` cannot change what runs. Replayed: with the planted `pytest.ini`, CI's command still runs the goldens, and 16 of 17 fail.
- **`weakened-tests`** (`.github/scripts/weakened_tests.py`):
  - It runs `pytest --collect-only` on the base and the head, and flags every test id that disappears. That covers `del test_x`, `__test__ = False`, a shortened parameter list, and a conftest that deselects tests.
  - It uses `--no-renames`, so a renamed test file is no longer invisible.
  - New source checks:
    - tolerances passed by position (`allclose`, `isclose`, `approx`);
    - a tolerance keyword newly added;
    - annotated tolerance constants, and constants built from arithmetic;
    - widened helper defaults;
    - fewer exact comparisons;
    - checks that cannot fail (`assert ... or True`, `except AssertionError`, an early `return`);
    - skips counted per function and at module level, instead of per file.
  - It flags every change to `pyproject.toml`, `pytest.ini`, `.pytest.ini`, `tox.ini`, `setup.cfg`, `.coveragerc`, `test/regression/networks.py` and `test/regression/cpu_pins.py`, and torch version changes in `poetry.lock`.
  - Replayed: all 13 weakening techniques from the review are flagged.
- **`bug-test`** (`.github/scripts/fails_before_fix.py`):
  - Only a test that ran on the base and failed there counts. A test that cannot be imported on the base, because it imports a name the PR adds, is listed as "not counted".
  - The summary shows each counted test's failure message on the base, so a maintainer can see a fake test. This cannot be fully automated, and the docs say so.
  - `--base` and `--head` are resolved to commit ids first, so the documented local command, `--base master --head HEAD`, now gives the same answer as CI.
- **Torch upgrades.** The golden and op-count tests now fail on CI (`CI` set) instead of skipping when torch's version differs from the stored files. So a torch upgrade must regenerate them in the same PR.
- **CPU pins.** `networks.deterministic()` also checks that `MKL_CBWR` and `ATEN_CPU_CAPABILITY` hold the pinned values.
- **New golden network `conn_postpre_mean`.** It runs `PostPre` with `reduction=torch.mean` at batch 4 and dt 0.5, which exercises the general update path. A `dt` factor added there passed every test before; now `test_golden[conn_postpre_mean]` fails.
- **Operation counts** now include one `forward()` of every `Nodes` class; before, only `LIFNodes` was counted. Check: an extra copy in `IFNodes.forward` fails both IFNodes workloads.
- **`bench` fails on large slowdowns.** It now fails when a workload's median time ratio is above 2× the base, with the lower end of the 95% interval above 1.5, or when the tool errors. That catches slow pure-Python code, which the operation counts cannot see. The no-change calibration never exceeded 1.12 in any round. It also now takes its base as `HEAD^1`.
- **Coverage floors for every package**, each one point under CI run 40804291700. Before, only `network` and `learning` had floors.
- **CODEOWNERS** now covers all of `test/`, `pyproject.toml`, `poetry.lock` and the pytest and coverage config files.

## Settings to change after merge (repository settings, not code)
- Add `bench` to the required checks.
- Turn on "Dismiss stale pull request approvals" and "Require approval of the most recent reviewable push". Otherwise an approval, or a `tests-changed-ok` label, keeps applying after a contributor pushes new commits.

## Checklist
- [x] `pytest -c pyproject.toml`: 641 passed locally; coverage floors pass.
- [x] Changed recorded files: `op_counts.json` (54 workloads, with a reason) and a new golden `conn_postpre_mean`. This needs `tests-changed-ok`.
- [x] AI tool: Claude Code (Claude Opus 5.5).

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d48dc7980398`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.