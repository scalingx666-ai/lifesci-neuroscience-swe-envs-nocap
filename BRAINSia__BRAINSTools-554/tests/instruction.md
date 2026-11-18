# Issue

**Title:** STYLE: Skip CI build for documentation-only changes

## Description

## Summary

- Adds a `paths-ignore` filter to `.github/workflows/build.yml` so the build workflow is skipped when only documentation files are changed (`Documentation/**`, `*.md`, `*.txt`, `*.rst`)
- Avoids wasting CI resources on doc-only commits where no code is compiled

## AI Contribution

Commit authored with Claude Sonnet 4.6 assistance (path filter pattern).

## Test plan

- [ ] Verify CI skips on a doc-only commit
- [ ] Verify CI runs on a code commit

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9c60ee1cae29`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.