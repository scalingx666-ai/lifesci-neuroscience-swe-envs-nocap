# Issue

**Title:** COMP: Pin GitHub Actions to commit SHAs and update them with Dependabot

## Description

Pins every GitHub Action to a commit SHA (tag kept in a comment) and adds a Dependabot config that keeps the pins current, with a 7-day cooldown.

Split from #663 (workflow hardening), one topic per PR; the seven are independent and merge cleanly in any order.

<details>
<summary>What changes</summary>

Floating tags let an action's maintainer, or an attacker who takes over a tag, change what runs with the job's token. The six actions in `build.yml` (`checkout`, `cache/restore`, `cache/save`, `setup-python`, `upload-artifact`, `BRAINSia/free-disk-space`) are pinned. `.github/dependabot.yml` updates `github-actions` weekly with a 7-day cooldown so a freshly published, possibly compromised release is not proposed the day it appears.

</details>

<details>
<summary>Testing</summary>

- `actionlint` is clean (apart from a style note already in the file) and `pre-commit run --all-files` passes. The combined change passed CI on #663; this topic alone is validated by this PR's own run.
- Dependabot will open its first update PRs after merge, against the new pins.

</details>

<details>
<summary>AI disclosure</summary>

Claude Code wrote the change and ran the checks listed above. The author reviewed the diff.

</details>

<!--
provenance: claude-code session 2026-10-31
split_from: 663 (action pinning and Dependabot)
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a22414dde1f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.