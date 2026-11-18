# Issue

**Title:** fix(lint): stop flagging embeds and normalise .md/escaped-pipe wikilink targets

## Description

## Root cause

`broken_links` in `lint_vault` walks every page's `links` list against `by_slug`, an
index built only from `.md` files (`_iter_pages` globs `*.md`). `_parse_page`'s
link-harvest doesn't know that, so it hands the check three kinds of targets `by_slug`
was never going to contain:

- an embed with a non-`.md` extension (`![[diagram.png]]`, `[[board.canvas]]`,
  `[[dashboard.base]]`) names an attachment, not a page
- `[[alpha.md]]`, an explicit `.md` suffix, while `by_slug` keys on the bare stem
- `[[beta\|B]]`, a Markdown-table-escaped pipe: `_WIKILINK_RE`'s own trailing
  `(?:[|#][^\]]*?)?` group consumes the `|B` as an alias, leaving a trailing backslash
  in the captured target

`_normalise_node_id` already strips an explicit `.md` suffix when building a page's
own id, so the harvest side just never reused that normalisation. On a small vault with
any attachments, this makes the lint check permanently fail and buries the one real
broken link in six false positives.

## Fix

`_wikilink_page_target()` returns `None` for a target whose extension isn't `.md`
(skipped, since `by_slug` can never validate it either way), and otherwise strips a
trailing backslash and an explicit `.md` suffix before `_parse_page` slugs it.

## Verification

- New test `test_lint_vault_broken_links_ignores_embeds_and_normalises_md_and_escaped_pipe`
  fails on `main`, passes on this branch (checked both ways in the same container).
- Full suite in `python:3.12-slim` and `python:3.9-slim` (the CI matrix's two legs):
  689/690 pass on 3.12, one pre-existing failure unrelated to this change
  (`test_code_understand_codegraph_via_bin_env`, a `python3`-PATH artifact of the
  minimal image, reproduces identically on `main`); 3.9 leg passes `test_lint.py` clean.
- Did not verify beyond the character classes this fix handles; a target with an
  extension other than `.md` is always skipped rather than checked for existence, which
  matches the issue's own suggested fix and keeps this change to the harvest's
  normalisation rather than adding a new attachment-existence check.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4b71c5f83be`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.