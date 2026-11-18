# Issue

**Title:** CI/release: dry-run fixes (empty __version__, artifact-url, MPICH arm64)

## Description

## Summary

Port post–9.0.2 release hygiene to **master** so dry-runs controlled from master behave like the successful 9.0.2 ship path:

1. **Empty `neuron.__version__`** — when shallow clones make `git describe` fail, fall back to `PROJECT_VERSION` in `add_cpp_git_information` (plus wheel test assert). Cherry-picked from #3840 / `release/9.0`.
2. **merge-wheels artifact URL** — use `artifact-url` (not `artifacts-url`) so ModelDB/build-ci get this run’s wheels, not a nightly fallback. From `hines-grok/release-modeldb-artifact-url`.
3. **Ubuntu 24.04 arm64 MPICH pin** — select amd64 vs arm64 debs in `install_mpich_noble.sh` so arm wheel tests don’t install wrong packages. From `release/9.0`.

## Test plan

- [ ] CI green on this PR
- [ ] Optional: NEURON Release dry-run with workflow from this branch/`master` after merge, `rel_branch=release/9.0` (or tip), `upload=false` — confirm non-empty `__version__` and ModelDB V2 uses the run’s wheels artifact URL

## Out of scope

- #3838 (ModelDB reuse-wheels workflow)
- Local annotated tags on dry-run
- Release checklist / Azure→GHA docs refresh

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2b299678ffe7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.