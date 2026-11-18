# Issue

**Title:** Added plotter argument when creating a scene

## Description

Render/Scene classes changes mentioned in #145: such changes should fix the PyQt5-brainrender integration issues though I haven't tested those changes with other module functions (e.g.: plotting data from a script). 
I should also mention that these fixes have been written and tested in a minimal PyQt5 working example and not with the whole GUI.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `57921da35433`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.