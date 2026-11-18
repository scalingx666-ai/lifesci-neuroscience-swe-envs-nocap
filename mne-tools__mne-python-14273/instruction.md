# Issue

**Title:** Fix doc deploy on dev

## Description

This should fix the deploy issue on dev. Makes use of a new package I'm developing called [docstacks](https://github.com/larsoner/docstacks) (which is basically mike for Sphinx) to do the deploy step to simplify things for us and other packages hopefully. I'm planning to pilot it with MNE-Python and assuming it works move it to the mne-tools org or scientific python.

I'll mark for squash+merge-when-green with a `[circle deploy]` so we can hopefully get up-to-date dev docs 🤞

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `166e95903eee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.