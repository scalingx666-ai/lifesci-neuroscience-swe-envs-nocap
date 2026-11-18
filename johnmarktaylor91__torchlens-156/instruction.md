# Issue

**Title:** fix(ci): unblock smoke + dep-audit (pre-existing on main)

## Description

## Summary
Two pre-existing CI failures on main, fixed in one PR.

### 1. Smoke (`Tests` workflow)
`tests/test_real_world_models.py` had `import torchvision` at the top
level. The smoke job installs only `[dev]` extras (no torchvision), so
collection fails with `ModuleNotFoundError: No module named 'torchvision'`
before any smoke test can run.

Fix: switch to `torchvision = pytest.importorskip("torchvision")` so the
module SKIPs gracefully on slim envs. Three downstream imports get
`# noqa: E402` because they now sit below the importorskip guard. No
behavior change when torchvision is present.

### 2. Dependency audit (`Quality` workflow)
`pip-audit` flagged `CVE-2026-3219` against pip itself (the package
installed on the GitHub runner image). It is outside this project's
dependency surface and not actionable from `pyproject.toml`.

Fix: pass `--ignore-vuln CVE-2026-3219` with a TODO comment to remove
once a pip release containing the fix is generally available.

## Test plan
- [x] `ruff check .` clean
- [x] `mypy torchlens/` clean
- [x] `pytest tests/ -m smoke -x --tb=short` passes locally with
      torchvision present (37 passed)
- [x] `pytest tests/test_real_world_models.py --collect-only` reports
      "no tests collected" (gracefully skipped) when torchvision is
      blocked
- [x] CI on this PR will be the real verification

## Notes
- Did NOT add torchvision to `[dev]` extras -- that would slow CI by
  pulling timm / transformers / etc. The skip is the cheaper fix.
- Did NOT alter test selection or skip any individual tests.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4e997f07c52`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.