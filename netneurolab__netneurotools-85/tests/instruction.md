# Issue

**Title:** [ENH] Adds lab-useful colormaps

## Description

Adds `nntools.colors` module! Loading the module will instantly register all the colormaps with `matplotlib` so they can be called just like any other colormap (or passed directly).

I'm only including a few to start: `parula` for those matlab lovers and `turbo` for the one person in the lab who insists on using `jet` (\*cough @VinceBaz cough\*).

Need to get RGB values from @estefanysuarez for the `estefany`, still!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4ff61eb5452f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.