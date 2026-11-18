# Issue

**Title:** Update libs

## Description

I had to remove the `default-features = false` for nalgebra because there was sudenly a lot of missing stuff. I tried adding the right features instead, to no avail.

As for `quick_error`, I replaced `cause` with `source` and everything's still ok, but I don't actually know what I'm doing ;)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f44d947cea87`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.