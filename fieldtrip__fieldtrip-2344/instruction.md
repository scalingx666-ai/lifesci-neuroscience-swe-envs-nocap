# Issue

**Title:** Update ft_plot_layout

## Description

I tried to improve a bit the doc of ft_plot_layout, mainly to make clearer you can set different colors, symbols or sizes per marker (#1116). Additionally, I tried to make parameter expansion a bit more robust, so that it expands any of the three marker parameter (symbol, size and color). It would expand previously only if the number of colors specifically was more than 1.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `761cb89f8c54`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.