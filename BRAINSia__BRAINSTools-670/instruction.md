# Issue

**Title:** COMP: Pass github.head_ref to the CDash name step through env

## Description

Passes `github.head_ref` to the CDash build-name step through `env` instead of interpolating it into the shell script, closing a script injection from fork branch names.

Split from #663 (workflow hardening), one topic per PR; the seven are independent and merge cleanly in any order.

<details>
<summary>What changes</summary>

The step built its suffix with `BRANCH="${{ github.head_ref || github.ref_name }}"`. A pull request from a fork whose branch name contains `$(...)` or a backtick would run that code on the runner. The branch name and the PR number now arrive as environment variables and are only ever expanded as quoted shell variables.

</details>

<details>
<summary>Testing</summary>

- `actionlint` is clean (apart from a style note already in the file) and `pre-commit run --all-files` passes. The combined change passed CI on #663; this topic alone is validated by this PR's own run.
- Not exercised before merge: a hostile branch name needs a real fork PR.

</details>

<details>
<summary>AI disclosure</summary>

Claude Code wrote the change and ran the checks listed above. The author reviewed the diff.

</details>

<!--
provenance: claude-code session 2026-10-31
split_from: 663 (head_ref injection fix)
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a22414dde1f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.