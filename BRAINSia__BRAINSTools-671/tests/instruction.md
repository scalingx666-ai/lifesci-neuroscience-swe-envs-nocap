# Issue

**Title:** COMP: Default the workflow token to contents: read

## Description

Declares `permissions: contents: read` for the CI workflow so the job token has the least privilege it needs.

Split from #663 (workflow hardening), one topic per PR; the seven are independent and merge cleanly in any order.

<details>
<summary>What changes</summary>

The workflow had no `permissions:` block, so it ran with the repository's default token scope. The cache-pruning job already requests `actions: write` for itself, which this does not change.

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
split_from: 663 (token permissions)
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a22414dde1f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.