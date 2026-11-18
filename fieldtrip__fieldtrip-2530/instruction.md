# Issue

**Title:** ft_select_range allow for other line color etc.

## Description

Given some colormaps, the current (default + fixed) rectangle that is drawn on top of a topography is poorly visible. The default is a black dotted line with a fixed with. This PR makes this configureable. I think it can end up in the docstring as an undocumented option, and my suggestion would be to call these options: 

cfg.interactivecolor
cfg.interactivewidth
cfg.interactivestyle

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0aba1c6fa307`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.