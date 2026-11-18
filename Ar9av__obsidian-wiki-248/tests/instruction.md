# Issue

**Title:** fix(memory): recognize the Uncategorized heading as generated

## Description

Used your one-line fix, just with `""` instead of `None`: `PageInfo.category` is typed `str` and root-level pages actually carry `""`, never `None` (see `page_from_path`, `category=rel.parts[0] if len(rel.parts) > 1 else ""`). `_heading_for` treats both as falsy the same way, so the effect is identical, `""` just matches what the field actually holds.

Added `test_index_drops_a_stale_uncategorized_section_and_reports_the_removal`, next to the existing `..._category_empties` test for a real category. It fails on main with the stale `## Uncategorized` section still present and `removed == ()`, passes after the fix.

Ran the full suite on 3.9 and 3.12 (the two CI legs), 75 passed on both, no regressions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2f1014299134`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.