# Issue

**Title:** Reorganise project menu structure

## Description

I found that it can be quite cumbersome to open stacks using the "Projects/Current" submenu, partly because it's prone to losing focus when mouse movement is not accurate.

Basically, three changes are introduced:
- The "Projects/Current" submenu is moved to a new top level menu called "Stacks"
- The "Projects/New" item is removed, since it's not being used (or is it?)
- The "Projects/Open" submenu is moved up one level to "Projects"

So if you think this is interesting for everyone, please feel free to try out and merge.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `816cd69cd1a9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.