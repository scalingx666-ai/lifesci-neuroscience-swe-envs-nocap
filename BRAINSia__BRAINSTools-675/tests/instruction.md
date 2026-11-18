# Issue

**Title:** COMP: Submit to CDash only when a token exists

## Description

Submits to CDash only when `CDASH_TOKEN` exists, so pull requests from forks, which have no secrets, no longer fail the submit step.

Split from #663 (workflow hardening), one topic per PR; the seven are independent and merge cleanly in any order.

<details>
<summary>What changes</summary>

A new step checks whether the token is set and records the result; the submit step runs only when it is, and the other case prints a notice. The token is read through `env` and never echoed.

</details>

<details>
<summary>Testing</summary>

- `actionlint` is clean (apart from a style note already in the file) and `pre-commit run --all-files` passes. The combined change passed CI on #663; this topic alone is validated by this PR's own run.
- Not exercised before merge: the fork case needs a real fork PR; the normal case is exercised by this PR's own run.

</details>

<details>
<summary>AI disclosure</summary>

Claude Code wrote the change and ran the checks listed above. The author reviewed the diff.

</details>

<!--
provenance: claude-code session 2026-10-31
split_from: 663 (CDash token guard)
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d26b71c4d197`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.