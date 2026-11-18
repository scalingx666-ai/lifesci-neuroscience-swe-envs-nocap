# Issue

**Title:** fix: two silent delta-detection bugs in ingest helpers (manifest.py, extract-jsonl.py)

## Description

Two silent delta-detection bugs in the ingest helper scripts. Both break incremental "process only what's new" detection and both fail silently — no error, just a wrong result.

## Bug 1 — `manifest.py delta` treats relative manifest keys as absolute

`cmd_delta` builds `known = {canonical(k): v for k, v in sources}`, canonicalizing every manifest key through `os.path.abspath`. When a vault stores source keys **relative** to an ingest root (e.g. `-Users-name-project/<uuid>.jsonl` under `~/.claude/projects/`), `os.path.abspath` resolves them against the current working directory, producing a path that never matches the scanned file.

**Effect:** every already-ingested source is reported as NEW — incremental detection is fully defeated and a re-run re-ingests the entire history.

**Fix (`fix(manifest): match relative source keys in delta scan`):** basename-indexed suffix fallback — when a scanned absolute path has no exact canonical match, look it up by basename and confirm the relative key is a path suffix (O(1) avg). Absolute keys keep their exact prior behavior.

**Follow-up (`fix(manifest): stop normalize from corrupting relative source keys`):** `cmd_normalize` didn't just mis-compare relative keys — it rewrote them (`os.path.abspath` → CWD-based path) and wrote the corrupted key back to the manifest. Now relative keys are preserved untouched (normalize only dedups/canonicalizes absolute keys) and a warning is emitted.

## Bug 2 — `extract-jsonl.py` keys staleness on a manifest wallclock, not the output file

`needs_extraction` decides re-extraction from `.extract-manifest.json`'s `extracted_at` timestamp rather than the actual output file. A session whose output is missing — or that landed on disk after the first extract pass — is treated as already-done and never (re)extracted, so downstream ingest silently sees it as missing. `--since` additionally acted as a hard gate that hid never-extracted older sessions.

**Fix (`fix(extract): key incremental staleness on output file, not manifest wallclock`):** make the check idempotent on the output file — (re)extract when the output is missing or the source is newer than it; remove the `.extract-manifest.json` mechanism (nothing else read it). `--since` demoted to merely narrowing the scan range.

**Follow-up (`fix(extract): check missing output before the --since gate`):** the first fix still ran the `--since` gate before the missing-output check, so "old source + missing output + `--since`" was still skipped, contradicting the fix's own docstring. Reordered so a missing output always (re)extracts regardless of `--since`.

## Tests

Adds `tests/test_manifest_delta.py` and `tests/test_extract_staleness.py` (stdlib `unittest`, 11 tests) covering: relative-key → not-new, absolute-key unchanged behavior, normalize preserving relative keys, missing-output re-extraction (incl. the `--since` interaction), and source-newer re-extraction. All 11 pass on this branch.

> Note: the repo's other test modules (`test_ast_extractor`, `test_batch`, `test_cache`, `test_graph_analysis`, `test_graphrag`) require `pytest`, which was not installed in the environment used here, so a full `unittest discover` reports those as import errors — unrelated to this change. The two added modules use only the stdlib.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8c29591dee6f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.