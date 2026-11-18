# Issue

**Title:** BF: Update entry points search to work in Python 3.12

## Description

In importlib.metadata 5.0 (which comes with Python 3.12) they changed the output of `importlib.metadata.entry_points()` from returning a dict with entry points sorted by group to an EntryPoints (subclass of tuple) object where each point has a `.group` attribute and where the list has a `.groups` attribute.

Handling it by first getting all groups using different methods according to the class of the points object, then calling `importlib.metadata.entry_points(group=...)` with each of the relevant groups. This works because the ouput of `entry_points(group=...)` hasn't changed.

As this is a bigger change than we'd usually pull into release I could change the branch to dev and hold off until 2027.1 as the old method still works in 3.11.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fcd4503192d0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.