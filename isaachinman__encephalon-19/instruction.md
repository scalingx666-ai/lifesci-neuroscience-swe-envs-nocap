# Issue

**Title:** [MAR-2522] Add API request and response budgets

## Description

## Human summary

Search, list, and gather calls now have explicit size limits so large requests fail predictably instead of building oversized full-record responses.

## Summary

- Add documented budgets for query bytes, literal term count, gather searches, gather shows, compact result count, full-record result count, and aggregate full-record response bytes.
- Validate root-independent request budgets before repository discovery, cache preparation, or SQLite I/O.
- Apply full-record result and aggregate byte budgets to list, show, full search, and gather show responses.
- Keep compact search and gather search results on their own higher result-count budget while preserving accepted gather duplicate/order semantics.
- Return structured `INVALID_ARGUMENT` errors with stable `details.budget` names and no oversized input echoing.
- Add boundary tests at and one unit over each budget, no-cache assertions for root-independent rejections, and near-1-MiB record coverage proving full search stops while compact search remains usable.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `04f796caf4a8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.