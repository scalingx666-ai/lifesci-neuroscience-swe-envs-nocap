# Issue

**Title:** Feature/evolution aln brain

## Description

Evolution:
- Fix: boundaries of parameter space are now respected by individuals.
- Brain network fitting works.
- Example notebook `example-2.2-evolution-brain-network-aln-resting-state-fit.ipynb` has plots from large simulation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a326d89945b6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.