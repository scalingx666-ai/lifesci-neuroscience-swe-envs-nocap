# Issue

**Title:** Fix summary_plot crashing when two pipeline names shorten to the same word

## Description

Benchmark the YAML pipelines in `pipelines/`, then plot the results the way `plot_statistical_analysis.py` does, and `summary_plot` stops with `ValueError: The truth value of a Series is ambiguous`. Names over ten characters get cut to their first word. So `Tangent Space LR` and `Tangent Space SVM Grid` both come out as `Tangent`, two columns end up with the same label, and looking up a cell gives back a Series rather than a number. Three more pairs in there clash the same way (the SSVEP tangent space ones, Log Variance and XdawnCovariances).

`analyze` already checks for this and keeps the full names with a warning, and #306 did the same for dataset names in the other plots, so this is that check again in `summary_plot`. That's also why `benchmark` never trips over it - you only get the crash calling `summary_plot` yourself.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bed9f0fa1b9c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.