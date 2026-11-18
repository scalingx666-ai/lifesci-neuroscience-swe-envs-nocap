# Issue

**Title:** Remove Error descriptions

## Description

The method [`Error.description`](https://doc.rust-lang.org/stable/std/error/trait.Error.html#method.description) has been deprecated, so it's safe for `nifti` to follow suit by ensuring that a proper display message is presented without it.

These minor changes replace some of these `description` clauses from the `quick_error` macro into `display()`, and remove the rest. It is a backwards compatible change as long as users did not rely on this description in some way.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aa1c39363890`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.