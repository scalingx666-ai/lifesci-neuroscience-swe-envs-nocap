# Issue

**Title:** ENH add types for dataset classes (BrainData, Dataview, ...)

## Description

This PR adds partial type support for the dataset classes.  A rework of the dataset class hierarchy is likely necessary for full type support, but this PR should still be useful for end users.

This makes no behavior changes besides adding some type guards (which would have triggered runtime errors anyway).

---

<sub>Stack created with <a href="https://github.com/github/gh-stack">GitHub Stacks CLI</a> • <a href="https://gh.io/stacks-feedback">Give Feedback 💬</a></sub>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d8c0cf103446`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.