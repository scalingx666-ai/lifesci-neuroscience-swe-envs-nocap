# Issue

**Title:** neuron_segneuron: agglomeration decoders, results table vs SOTA

## Description

- `agglomerate_mean_affinity` (greedy mean-affinity agglomeration of a segmentation), `evaluate_emneuron.py --agglomerate`, `predict.sh DECODER=abiss|agglo|basins`.
- Fix: `abiss_runner` with a one-value `--ws-merge-thresholds` ran the default merge threshold and wrote no `_mt0` file.
- Tutorial README: one table, SegNeuron vs the three PyTC decoders, paper's VI, best in bold; the agglomeration columns are marked post-hoc.
- Top-level README: PyTC and SOTA columns (SOTA filled for EMNeuron only).

Verified: unit tests (12 passed); all 8 volumes rerun from this branch reproduce the earlier study numbers.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `36b84ccd5c72`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.