# Issue

**Title:** MRG: Fix text label

## Description

Fixes this problem:

https://larsoner.github.io/mne-biomag-group-demo/_images/sphx_glr_plot_source_stats_001.png

While I was at it, I ~~hit a couple of minor snags on Py3k so I added a 3.6 CI (via `environment.yml`) and also~~ moved over to `pytest` (`nose` is no longer maintained).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6fc7d86003b2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.