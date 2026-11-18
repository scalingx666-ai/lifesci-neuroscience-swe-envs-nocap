# Issue

**Title:** COMP: Use a 180-minute timeout for the release builds

## Description

Uses a 180-minute timeout for the release-pinned builds and keeps 360 for the ITK legs.

Split from #663 (workflow hardening), one topic per PR; the seven are independent and merge cleanly in any order.

<details>
<summary>What changes</summary>

Release-pinned builds finish in 20 to 60 minutes with a warm cache, so a hung job held a runner for six hours before being cancelled. The ITK legs have no cache to restore on their first run and keep the longer limit. The expression keys off the leg's `itk_ref`.

</details>

<details>
<summary>Testing</summary>

- `actionlint` is clean (apart from a style note already in the file) and `pre-commit run --all-files` passes. The combined change passed CI on #663; this topic alone is validated by this PR's own run.

</details>

<details>
<summary>AI disclosure</summary>

Claude Code wrote the change and ran the checks listed above. The author reviewed the diff.

</details>

<!--
provenance: claude-code session 2026-10-31
split_from: 663 (timeout; the ITK legs now exist on main, so 180 is not applied to them)
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d26b71c4d197`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.