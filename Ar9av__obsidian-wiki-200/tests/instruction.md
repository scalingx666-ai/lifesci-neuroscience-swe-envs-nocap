# Issue

**Title:** fix: preserve reserved leading-underscore categories in write_page's slug

## Description

`write_page`'s rel-path build calls `_slug(category)` directly, and `_slug()` strips
every leading non-alphanumeric character (`re.sub(r"[^a-z0-9]+", "-", ...)`). A page
written with `category="_raw"` therefore lands at `raw/<title>.md`, not `_raw/<title>.md`.

That matters because four separate skip lists (`graph_analysis.SKIP_DIRS`,
`lint.SKIP_DIRS`, `context_pack.SKIP_DIRS`, `trust.TRUST_SKIP_DIRS`) all exclude an
unreviewed capture by an exact match against `"_raw"` (and its siblings, e.g.
`"_archived"`). None of them match `"raw"`, so a page meant to be excluded from graph
analysis, linting, context packing and trust scoring gets pulled into all four as if
it were reviewed knowledge.

Added `_category_slug()`, which slugifies the category and re-adds the leading
underscore when the caller's category started with one, and pointed both of
`write_page`'s uses of `_slug(category)` (the path build and the frontmatter
`category:` field) at it. `_slug(title)` is unchanged; only the category segment is
reserved-name-aware.

**Verified:**
- New regression test (`test_reserved_raw_category_keeps_its_underscore`) fails on
  main (`written["path"] == "raw/clipped-note.md"`) and passes on this branch.
- Full `pytest tests/` green on Python 3.12 with the `[server]` extra installed
  (690 passed, 4 skipped, one pre-existing failure in
  `test_code_understand_codegraph_via_bin_env` unrelated to this change and present
  on main before this diff, a `python3` PATH-resolution artifact of my minimal
  container image, not of the repo).
- Did not verify against Python 3.9: `mcp>=2.0` (the `[server]` extra) has no
  distribution for 3.9, so `tests/test_server.py` is skipped by `importorskip` on
  that interpreter both on main and on this branch, in CI and locally.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `37596cffeef4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.