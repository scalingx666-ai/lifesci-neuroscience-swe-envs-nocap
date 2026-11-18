# Issue

**Title:** [MRG] Fix filename matching for tracking-system entities

## Description

PR Description
--------------

. The tracking-system fragment was placed after the filename's suffix/extension and lacked its leading underscore. Move it alongside the optional entities, before the suffix and extension, so Motion-BIDS files are found both with and without a `tracking_systems` filter.

Adds eight cases covering the private filter and public `find_matching_paths`, with no filter, one label, multiple labels, an absent label, and with/without extension filtering. Six cases fail before the fix. All 17 filter cases pass afterward.

The full path module reports 69 passed, 38 skipped (missing optional testing data), and one Windows benchmark failure. The same benchmark assertion fails on unchanged upstream code: `get_entity_vals(..., include_match="**/")` returns no sessions. Ruff checks and formatting pass. Full project tests/documentation were not run.

Includes the requested changelog and first-contributor entries. Prepared with OpenAI Codex assistance.

Merge checklist
---------------
Maintainer, please confirm before merging:
- [ ] All comments are resolved
- [ ] This is not your own PR
- [ ] All CIs are happy
- [x] PR title starts with [MRG]
- [x] whats_new.rst is updated
- [x] New contributor added to CITATION.cff
- [x] PR description includes the closing issue reference

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ac7efc51058b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.