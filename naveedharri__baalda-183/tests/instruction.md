# Issue

**Title:** Show individual member access directly in the file tree

## Description

Adds a View access for selector above the Access tree so owners and admins can inspect a member’s effective permissions without first selecting files. Tree badges show server-resolved access, including Mixed for differing permissions, and selected items can be edited for the viewed person.

Reads are limited to rows near the viewport with four concurrent requests. Stale responses are discarded when switching people; failed lookups show Unavailable. Permission enforcement is unchanged.

Validation: desktop TypeScript check and 88 targeted access tests passed, including initial member viewing, stale response handling, and failed lookups. Local desktop launched and backend health checked.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ade9b2d52e7e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.