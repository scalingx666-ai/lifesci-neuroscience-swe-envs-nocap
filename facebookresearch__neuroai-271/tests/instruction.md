# Issue

**Title:** Li2022Petit: strip TextGrid labels before matching and emitting

## Description

The empty/`#`/`sil` skip test stripped the TextGrid label, but the duplicate-merge test, the `repl` lookup and the emitted `text` all used the raw one. A padded interval therefore bypassed both lookups and shipped with its whitespace intact.

Bind the stripped label once so all four uses agree. One interval of 17612 in the LPPC annotations is affected — `" of"` in `lppEN_section1`, which previously produced a `" of"` word event.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2906ffcf2fa2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.