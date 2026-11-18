# Issue

**Title:** COMP: Keep the ctest exclusion list in one place

## Description

Defines the ctest exclusion regex once, as a workflow-level `CTEST_EXCLUDE_REGEX`, instead of two copies.

Split from #663 (workflow hardening), one topic per PR; the seven are independent and merge cleanly in any order.

<details>
<summary>What changes</summary>

The regex that excludes the slow and compiler-dependent tests was copied into both the normal test step and the sanitizer step, so a change to one could be forgotten in the other. Both steps now use `"${CTEST_EXCLUDE_REGEX}"`. `CMake/CTestCustom.cmake.in` also ignores the BCD tests; that file is unchanged.

</details>

<details>
<summary>Testing</summary>

- `actionlint` is clean (apart from a style note already in the file) and `pre-commit run --all-files` passes. The combined change passed CI on #663; this topic alone is validated by this PR's own run.
- The value is identical to the two copies it replaces.

</details>

<details>
<summary>AI disclosure</summary>

Claude Code wrote the change and ran the checks listed above. The author reviewed the diff.

</details>

<!--
provenance: claude-code session 2026-10-31
split_from: 663 (single exclusion regex, requested as its own PR)
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d26b71c4d197`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.