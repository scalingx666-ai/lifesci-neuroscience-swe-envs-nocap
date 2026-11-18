# Issue

**Title:** CI: make Pyodide smoke tests advisory + repo cleanup

## Description

## Summary
- **ci:** mark the Pyodide smoke-test job `continue-on-error: true`. The in-browser Pyodide leg fails on a known external issue (marimo/Pyodide, #455) unrelated to the library, so its red no longer fails the overall run or masks an otherwise-green build.
- **chore:** remove `AUDIT-0.6.0.md`, a 265KB internal pre-release audit working doc that shouldn't ship in the public repo.
- **docs:** add a Skills section to `CLAUDE.md` reminding contributors/agents to use the vendored `.claude/skills/nilearn` (and marimo tutorial) skills rather than working from memory.

## Notes
Core CI (lint + test 3.11/3.12/3.13) is already green on these commits; only the advisory Pyodide job is red.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fec9d75f46d3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.