# Issue

**Title:** MAINT: Modernize CI infrastructure and caching with uv

## Description

Going to see if `setup-uv` can be smarter about caching. If not, I'll just get rid of the caching altogether. Also:

- Simplified some `Makefile` targets and moved some config from there to `pyproject.toml` while I was in there.
- No need for `make pep` anymore since pre-commit takes care of this stuff nowadays, so it's gone
- Bumping max Python version to 3.14 since it should be doable nowadays.
- Simplifying test data cache, should not depend on MNE version (just testing data version)
- Removing `build_docs` job from GHA to reduce usage, CircleCI already does this better
- Made GHA jobs depend on `style` job to save some CI cycles
- Reduced matrix from 3.11 + 3.14 on all jobs to just 3.14, plus one run with 3.11
- Speed up macOS Intel and Windows CIs by skipping some slow tests there (it was taking > 6m whereas others were ~3m)
- Deletes some unneeded files from `mne-testing-data` to speed up caching step

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8de579b0f52c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.