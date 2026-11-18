# Issue

**Title:** Update apt requirements

## Description

- Remove 14.04 (EOL since 2019-04)
- Remove duplicate `virtualenvwrapper` from 16.04, 18.04
- Copy 18.04 to 20.04 (seems to be all that's necessary)

Maybe it happened during the excision of imagemagick, but it seems that the files are now identical for 14.04 though 20.04. Is it worth keeping them as separate files, for the sake of being explicit, or collapsing them into one glorious `packagelist-ubuntu-apt.txt`?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5e8b1ee738fb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.