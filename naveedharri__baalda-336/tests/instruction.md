# Issue

**Title:** Bump vite to 7.3.7

## Description

Fixes Dependabot alerts #63, #64, #65 (launch-editor in Vite's dev server, Windows command injection). Dev tooling only; the shipped app is unchanged.

Alert #62 (hono serveStatic) is already fixed on main by 04da2ff (hono 4.13.13) and should close on the next scan.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `951c9b179c7a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.