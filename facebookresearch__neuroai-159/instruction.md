# Issue

**Title:** chore: hoist core stdlib imports to module level

## Description

Ref: 

---

Moves a handful of stdlib imports (`os`, `shutil`, `tempfile`, `zipfile`, `importlib`) from inside function bodies up to module level, following the review note that core dependencies belong at the top. These are stdlib modules with no import cost, side effects, or circular-import risk, so deferring them bought nothing. In `download.py`, `tempfile`/`zipfile` were already imported at the top — the inline versions were just redundant re-imports.

Deliberate lazy imports (heavy/optional deps like torch and plotly, circular-import breakers, and the debug-only `pdb` import) are left as-is.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `96244f0ef4d2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.