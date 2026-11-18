# Issue

**Title:** CI: Suffix CDash BuildName with :PR:branch-slug for dashboard filtering

## Description

## Summary

Appends `:<PR_NUMBER>:<branch-slug>` to the CDash `BuildName` field so that dashboard submissions can be grouped and filtered by PR and branch without requiring changes to `CMakeLists.txt`.

**Example CDash build names after this change:**

| Event | Branch | BuildName |
|---|---|---|
| PR #42 | `enh/gtest-tier1-tier2` | `Linux-g++:42:enh-gtest-tier1-tier2` |
| PR #42 | `enh/gtest-tier1-tier2` | `Darwin-c++:42:enh-gtest-tier1-tier2` |
| push | `main` | `Linux-g++:0:main` |

## Implementation

Two new workflow steps:

1. **"Compute CDash build-name suffix"** — runs immediately after version extraction. Derives `:<PR_NUMBER>:<slug>` using `github.event.number` (0 for direct pushes) and a portable slugification of the branch name (`tr` + `sed`, no GNU-only flags).

2. **"Append PR + branch suffix to CDash BuildName"** — runs just before `ctest -D ExperimentalStart`. Patches the `BuildName:` line in `DartConfiguration.tcl` using `python3` instead of `sed` to avoid BSD/GNU `-i` portability issues (per `CLAUDE.md` cross-platform requirement).

## Test plan

- [ ] CI passes on Ubuntu (GCC) and macOS (Clang)
- [ ] CDash submission shows `BuildName` ending in `:<PR>:<slug>` (visible in the CDash build details page)

## AI disclosure

Change authored with Claude Sonnet 4.6 assistance.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6b6070cb4e3f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.