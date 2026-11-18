# Issue

**Title:** fix(links): close a fenced block only at a matching fence, like CommonMark

## Description

## Problem

.

`_FENCE_RE` in `obsidian_wiki/links.py` ends a fenced block at the first later line that starts with the same three characters. That is not how CommonMark reads fences, so `strip_code` keeps some `[[links]]` that sit inside code. `lint_vault`, `graph_analysis` and `graphrag` all call it.

Reproduced on `main` (`35a91f8`):

- A ```` ````md ```` block that shows a ```` ```js ```` example: the inner ```` ``` ```` closes the outer block, and `lint_vault` reports `{'broken_links': [{'page': 'doc.md', 'target': 'example-link-in-code'}]}`.
- A ```` ```python ```` line inside a ```` ``` ```` block closes it, so the links after it leak.

## Fix

One regex. A fenced block now follows the CommonMark rules:

- It closes only at a line with the same character (backtick or tilde), at least as long as the opening fence, and nothing after it but spaces.
- The opening fence may be indented up to 3 spaces, and so may the closing one.
- A backtick fence cannot have a backtick in its info string.
- A fence that is never closed runs to the end of the page.

The last rule also keeps the regex linear. Without it, many unclosed fence lines cost quadratic time.

## Behaviour changes

All of these change which `[[links]]` lint and the graph see:

1. A fence line with an info string (```` ```python ````) no longer closes a block.
2. A line with text after the fence (```` ``` x ````) no longer closes a block.
3. A block opened with 4 or more backticks or tildes no longer closes at a shorter fence. So a ```` ````md ```` block can wrap a ```` ```js ```` example.
4. Fences indented by 1 to 3 spaces are now code. Before, only fences at column 0 were. This also covers a fence in a list item indented by 2 or 3 spaces.
5. A ```` ``` ```` line with a backtick in its info string (```` ``` a`b ````) is no longer a fence.
6. A fence that is never closed now hides the links after it, up to the end of the page. Before, those links were still counted. CommonMark renders the rest of the page as code in this case.

Not changed: fences inside a blockquote (`> `) or in a list item indented 4 or more spaces are still not treated as code. Indented code blocks (4 spaces) are not stripped. Both are the same as before.

## Tests

`test_strip_code_fences_follow_commonmark` in `tests/test_links.py` covers 8 cases: a longer fence wrapping a shorter one, an info-string line, a tilde block containing backticks, trailing text, CRLF, a 3-space indent, an empty block followed by an unclosed one, and a backtick in the info string. On `main`, 4 of the 8 fail.

I also compared the new regex with markdown-it-py 4.3.0 (CommonMark mode). I generated random pages from fence lines, info strings, indents, CRLF and link lines, and checked which `[[links]]` each side hides:

- 20000 line-based pages: the new regex agrees on 20000. The old regex agrees on 9047.
- 20000 character-level pages: the new regex agrees on 20000. The old regex agrees on 19187.
- 20000 pages with blockquote and list prefixes: the new regex agrees on 19721. The 279 differences are fences inside blockquotes or list items (see "Not changed").

Timing: a 186 KB page takes 0.002 s with both regexes. 100000 unclosed ```` ```a ```` lines (500 KB) take 0.013 s (old: 0.008 s).

Full suite on Windows 11, Python 3.14 (`python -m pytest tests -q`): 1226 passed, 5 failed, 94 skipped (on `main`: 1225 passed, 5 failed, 94 skipped). The same 5 tests fail on `main` without this change (`test_trust` x3 symlink tests, `test_update_check::test_upgrade_refreshes_only_agents_setup_installed`, `test_claude_plugin::test_old_skills_path_still_resolves`), so they are unrelated. Not run on Python 3.9 locally. The repo CI covers other Python versions.

Validated with Claude Opus 5.5.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `35a91f803951`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.