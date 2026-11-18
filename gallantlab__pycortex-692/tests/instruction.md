# Issue

**Title:** docs(quickflat): add missing Returns, fix stale kwargs docs in view.py

## Description

make_figure had Parameters but no Returns section despite returning fig. make_png's docstring had drifted from make_figure's (duplicate `sampler` entry, and several params like `thick`/`depth`/`with_rois` group listed as if they were make_png's own args rather than kwargs forwarded to make_figure) -- reorganized under a documented **kwargs entry with each forwarded argument still individually described.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0a6bba575611`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.