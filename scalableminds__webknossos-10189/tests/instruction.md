# Issue

**Title:** Replace bulldozer with mergecow merge queue

## Description

### Summary
Adds `.github/mergecow.yml` to opt this repo into [mergecow](https://github.com/scalableminds/mergecow), our self-hosted merge queue. PRs labelled `automerge` are squash-merged once CI is green and they are approved; if other PRs are waiting, they are queued and merged one at a time.

Removes `.bulldozer.yml`, since bulldozer also acts on the `automerge` label and would update all labelled PRs at once, defeating the serial queue. Branch deletion after merge is already handled by the repo setting.

### Steps to test:
- After merging, label a green, approved PR with `automerge` and check that mergecow merges it (or posts a queue status comment).
- Uninstall the Bulldozer GitHub App for this repo (org admin).

------
- [x] No changelog entry needed (CI/infra only)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f817047b1dfb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.