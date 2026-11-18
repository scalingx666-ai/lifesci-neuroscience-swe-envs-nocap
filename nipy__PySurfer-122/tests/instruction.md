# Issue

**Title:** Fix errors that were crashing doc build

## Description

GH-#115 removed surfer.io.read_label but did not change the example
that was referencing it. I'm surprised that got through Travis--
does Travis not build the docs?

While fixing this I also noticed a couple of things that had gotten
out of date and fixed an oversight from the config file removal.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `634cd6d02119`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.