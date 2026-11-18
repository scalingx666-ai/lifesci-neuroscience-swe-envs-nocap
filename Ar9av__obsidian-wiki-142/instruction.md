# Issue

**Title:** docs: advisory README translation drift check with backfill script

## Description

## What changed

- **The README sync check is advisory — it never blocks PR merges.** The `readme-translation-drift (advisory)` job surfaces drift as a `::warning` annotation only and always succeeds.
- `tools/check_readme_sync.py` is now a drift reporter: it lists the commits that changed `README.md` after the last commit that touched `README_TW.md`, plus the combined English diff still pending translation. Run it locally, translate the diff, and backfill `README_TW.md`.
- A later translation-only commit to `README_TW.md` clears the drift, so translations can land asynchronously instead of being forced into the same PR as the English change.
- Documented the advisory workflow in `AGENTS.md` and both README contributor sections.
- `tests/test_readme_sync.py` exercises the drift semantics against a temporary git repo: in sync, English-only drift reported with diff, catch-up translation commit clears drift, unrelated commits ignored, and the workflow is documented in all three docs.

## Why non-blocking

A hard "both files must change together" gate forces every docs PR to bundle a translation, which blocks contributors who can't write Traditional Chinese. The advisory model keeps the parity goal visible — a recurring CI warning on every PR/push until the translation catches up, plus an on-demand local report — while letting translation land as a follow-up.

## Impact

No PR is ever failed by this check. While `README_TW.md` is behind, every CI run (any PR, any push to `main`) re-reports the warning until a commit touches `README_TW.md`.

Known limitation (marked `ponytail:` in the script): a Chinese-only edit (e.g. a typo fix) also counts as catching up and clears earlier drift; upgrade to per-commit pairing if that ever misleads.

## Validation

- `uv run --no-project --with pytest --python 3.12 pytest -q` — 218 passed, 14 subtests passed
- `python3 -m unittest tests.test_readme_sync -v` — 5 passed
- `python3 tools/check_readme_sync.py` on this branch — in sync, exit 0

## Follow-up

None required — the check is deliberately not part of any required ruleset. Do **not** add `README sync / readme-translation-drift` as a required status check; that would defeat the advisory design.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1951480ba62b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.