# Issue

**Title:** feat(lint): flag counts and amounts with no date as undated_claims

## Description

## Problem
Lint only knows staleness at the page level (`updated` older than 90 days). A line like "GitHub: 6★" or "55 customers, \$0 ARR, 175★" reads as true forever. On a real 187-page vault, one page still said 175★ when the repo was at 291★, and nothing flagged it.

## Change
- `obsidian-wiki lint` gets a new warning-level finding, `undated_claims`, with page, line, and text. It flags a number followed by a fast-changing noun (stars/★, users, customers, downloads, deals, subscribers, …) or an MRR/ARR/revenue/balance/runway amount, when the line has no year and no "as of".
- Exempt: lines under a dated heading, pages in `journal/` or named `YYYY-MM-…`, fenced code, inline code, and blockquotes.
- It only warns, so it never changes a pass/fail result on its own and `--strict` behavior is unchanged.
- `llm-wiki` writing rules: date anything that changes, or link to where the live number lives. `wiki-lint` skill and `docs/cli.md` describe the new finding.

Idea adapted from obsidian-second-brain's freshness policy ("every fact is timeless, dated, or a pointer"), without its frontmatter fields or rule codes.

## Tests
- New: `test_lint_vault_warns_on_undated_counts_and_skips_dated_ones` covers the hits, every exemption, the line numbers, and the warn status.
- Full suite: 1205 passed, 5 skipped.
- On two real vaults: 11 hits in 187 pages (nearly all real stale counts) and 9 in 176 (a few false positives on generic advice like "your first 10 customers"). Neither vault's overall lint status changed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `980488ba4352`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.