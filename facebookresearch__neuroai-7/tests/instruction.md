# Issue

**Title:** README: clean rewrite and reorg + minor neuralset tests fix

## Description

## Changes

- **Doc-first structure**: opens with what neuroai is, links to full documentation prominently
- **Removed stale code examples**: quickstart code blocks were outdated / incorrect; tutorials live in the docs
- **Centered package logos** in a clean table with proper alignment
- **GIF demos moved** to a collapsed section at the bottom (not dominating the top)
- **Install section**: clear, copy-pasteable, with extras explained
- **Packages table**: concise summary with links to each package's doc page
- **Removed emoji section headers** for a cleaner professional look
- Net: -149 lines removed, +88 added — simpler is better

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a130a9fb550f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.