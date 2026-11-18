# Issue

**Title:** fix(lint): ignore external URLs containing .md in markdown links

## Description

`_MD_LINK_RE` matched any link target containing `.md` anywhere, so `[Study](https://www.mdpi.com/2304-8158/13/11/1691)` was linted as a broken link to `1691`, and GitHub `.../README.md` URLs had the same problem.

The regex now skips targets that start with a URL scheme (`https:`, `mailto:`, …) and requires `.md` to end the path, before an optional `#anchor` or `"title"`. Local links and `_raw/_archived/` links still match.

The same regex was copied into `graph_analysis.py` and `graphrag.py`, where it created bogus graph edges, so it's fixed there too.

Adds the regression test `test_external_urls_containing_md_are_not_broken_links`. It fails before this change and passes after.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7f291a28ebd3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.