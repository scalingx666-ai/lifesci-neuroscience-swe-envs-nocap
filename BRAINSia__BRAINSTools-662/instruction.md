# Issue

**Title:** COMP: Make the prepare-commit-msg hook work under pre-commit

## Description

The `brainstools-prepare-commit-msg` pre-commit entry passes no file name to a hook that needs one, so every commit with the hook installed fails with `sed: : No such file or directory`.

<details>
<summary>Details</summary>

The script reads the commit message file from its first argument, but the entry sets `pass_filenames: false`. Set it to `true`. The script also used `return 0` at top level, which bash allows only inside a function; use `exit 0`.

Tested: with this change the hook runs without error on a commit, and `pre-commit run --all-files` passes.

</details>

<details>
<summary>AI disclosure</summary>

Claude Code wrote the change and ran the checks listed above. The author reviewed the diff.

</details>

<!--
provenance: claude-code session 2026-10-31
related: independent of the other CI and SuperBuild PRs from this session
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f686138b2762`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.