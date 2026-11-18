# Issue

**Title:** Fix OKF folder-note link roundtrip

## Description

## Summary

Fixes the OKF export/import round-trip rule for folder-note layouts where a page id exists both as a file and as a directory prefix, such as `projects/social-twitter.md` plus `projects/social-twitter/...`.

This change makes the spec explicit in both directions:
- `wiki-export` must compute relative links from the target file path (`<id>.md`), not the bare page id.
- `wiki-import` must resolve the markdown target as a file path first, then strip `.md` to recover the page id.

## Root cause

Using `relpath(target_id, source_dir) + ".md"` collapses `projects/social-twitter` to `..` when the target id is also a directory name, which produced malformed links like `...md` and restored garbage ids on import.

## Validation

- `python3 -m unittest discover -s tests -v`
- Verified the same regression test in a clean clone on `st3ve` (Ubuntu 24.04, Python 3.12.3)

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c5fdeb08351c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.