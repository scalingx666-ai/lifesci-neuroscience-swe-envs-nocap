# Issue

**Title:** Bump versions to 0.3.1

## Description

Releases the challenge starter-kit fixes from #249, the first of which changes results rather than just wording: adaptation wrappers reached only the published foundation models, so `-w linear_probe_mean` on a locally pretrained `mae` encoder silently ran a full fine-tune. Participants of the EEG/EMG Foundation Challenge 2026 need that on PyPI, not just in the docs.

- All four packages go to `0.3.1`.
- The sibling pins move from `~=0.3.0` to `~=0.3.1`. `~=0.3.0` would already have admitted 0.3.1, but the fix spans `neuralbench`, `neuralfetch` and `neuralset`, so pinning to the line keeps the "siblings release in lockstep" comment above them true — a 0.3.1 `neuralbench` on a 0.3.0 `neuralset` would have the adaptation fix without the extractor one.
- `CHANGELOG.md` closes the `0.3.1` section; `docs/conf.py` reads the release from package metadata and needs no edit.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `479639c27f24`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.