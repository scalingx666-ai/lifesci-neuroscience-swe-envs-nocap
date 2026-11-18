# Issue

**Title:** feat(wiki-status): ranked 'What to Do Next' section replacing vague recommendation

## Description

## Summary

- Replaces the old single-line `Recommendation` in `wiki-status` (Step 4) with a ranked **What to Do Next** section
- Gathers signals across 6 dimensions: `_raw/` files, stale core pages, orphan pages, synthesis opportunities, source delta, and lint issues
- Renders a prioritised, emoji-prefixed action list capped at 6 items, each with the exact skill invocation command
- Handles the empty state gracefully ("Wiki is healthy — nothing urgent")
- Adds an overflow footer for a future `--full` flag

## Test plan

- [ ] Run `/wiki-status` on a vault with files in `_raw/` — confirm item 1 shows the file list
- [ ] Run `/wiki-status` on a vault with orphan pages — confirm `/cross-linker` appears in the list
- [ ] Run `/wiki-status` on a clean vault — confirm the "Wiki is healthy" empty state renders
- [ ] Confirm list is capped at 6 items when all 6 categories have findings
- [ ] Confirm each item includes a `run:` command pointing to the correct skill

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5304b759798e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.