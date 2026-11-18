# Issue

**Title:** Refactor upset_plots() by extracting repeated logic into

## Description

generate_upset_plot()

Extracted common code for generating upset plots for noise, non-somatic, and MUA units into a new helper function, generate_upset_plot(). This reduces code and improves maintainability. upset_plots() now calls generate_upset_plot() separately for each unit type.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1e7f44f3779b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.