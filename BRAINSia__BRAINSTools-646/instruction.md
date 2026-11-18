# Issue

**Title:** COMP: Remove unused local type aliases, lambda capture, and parameters

## Description

Remove the unused local type aliases, an unneeded lambda capture, and two unused lambda parameters that AppleClang warns about in the inner build.

<details>
<summary>What changed and how it was verified</summary>

Eight `-Wunused-local-typedef` sites in BRAINSABC and BRAINSSnapShotWriter, one `-Wunused-lambda-capture` in ImgmathGTest, two `-Wunused-parameter` in itkIOGTest. Deletions only.

Verified locally on macOS (AppleClang, Release inner build): full `ninja` build and full `ctest` with no new failures against `main`. `pre-commit run --all-files` passes.

</details>

<details>
<summary>AI disclosure</summary>

The warning list was collected by recompiling the affected files; the edits are mechanical deletions made with assistance from Claude Code. The author reviewed every hunk and is accountable for the code.

</details>

<!--
provenance: claude-code session 2026-10-28
post_merge_action: none; independent of the other style/fix PRs opened the same day
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `60b069efa672`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.