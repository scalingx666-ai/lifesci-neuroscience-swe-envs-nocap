# Issue

**Title:** Declare nemar_id for 15 datasets whose NEMAR deposits are now public

## Description

. That PR added the NEMAR download provider; this makes it actually reach 15 more datasets.

Each of these already carried a placeholder:

```python
# nemar_id = "nm000174" pending: NEMAR deposit not yet public
```

Those deposits are public now and publish `sourcedata/`, so the placeholders are simply uncommented — 15 lines, no logic change.

## Why it matters

Without the attribute the provider cannot see them. `sourcedata_path()` raises `declares no nemar_id`, and `"auto"` silently falls back to the upstream host — which for several of these is precisely the slow or bot-gated source the mirror exists to route around.

Measured before this change: **120 enriched deposits were reachable, 15 were not.** All 15 were enriched in the last few days, after the mapping was last updated.

## Verification

**Every pair checked against the live deposit, not a local table.** For each: the deposit is published, carries `sourcedata/`, and its `sourcedata_provenance.json` records the same MOABB class. This mattered — two entries in our own mapping table were wrong in exactly this way (`Chailloux2020` pointed at a duplicate of `on003190`, `TrianaGuzman2024` at a deposit the NEMAR admins had denied), so checking the table against itself would have propagated those errors.

**End-to-end with the provider pinned to `nemar`:**

| dataset | deposit | files verified | mismatched |
|---|---|---|---|
| `Nguyen2017_V` | nm000261 | 8 | 0 |
| `Pressel2016` | nm000258 | 15 | 0 |
| `Kaneshiro2015` | nm000263 | 10 | 0 |

`Nguyen2017_V` previously failed with `declares no nemar_id`; it now downloads. Every file hashes to the sha256 recorded from the **original upstream fetch** at staging time, so the served bytes equal the upstream bytes.

Separately, a checksum cross-check over a 20-deposit sample compared **2,719 files** between each published manifest and its provenance — zero mismatches.

## Note for a follow-up (not this PR)

`nemar-py` logs `primary backend failed; falling back to next layer` on every fetch, because small git-keyed files (`README.md`, `sourcedata_provenance.json`) have no annex checksum for the S3 backend to use. It recovers correctly, but a routine fallback reading as a failure makes real failures harder to spot.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4c6505334892`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.