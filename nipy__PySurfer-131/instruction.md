# Issue

**Title:** ENH:  Time-label consistency over time

## Description

Mayavi's default bahavior is to change the text size when the number of characters changes, which looks  strange in a movie (see [before](https://www.dropbox.com/s/j551izzp9o405d9/example_before.mov?dl=0)). This PR tries to fix this tentatively by using a constant font size and right-aligning the label (see [after](https://www.dropbox.com/s/9xjjwc7gj10yswp/example_after.mov?dl=0)). I don't know how much of this should be exposed in `Brain.add_data()`, maybe at least the font size?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b8b8c1017e85`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.