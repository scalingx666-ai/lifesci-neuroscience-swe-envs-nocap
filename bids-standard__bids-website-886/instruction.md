# Issue

**Title:** fix: unblock bep-leads CI (typo + over-strict validator)

## Description

## Summary

The `bep-leads` validation job has been red on every run for weeks or months (e.g. [run 29972409055](https://github.com/bids-standard/bids-website/actions/runs/29972409055/job/89097034850)), blocking merges. Two independent causes (this is claude's speaking -- seems to make sense to me @yarikoptic):

1. A **typo regression** — PR #731 accidentally reverted PR #698's fix, changing BEP-036 lead `Eric A. Earl` → `Eric Earl`, which no longer matches `bids-specification/CITATION.cff`.
2. **Over-strict validator** — `NOT FOUND` was a hard failure, but BEP leads propose extensions and often haven't landed anything in the spec proper yet. Andrew Davison (BEP-032, added May 2025) and Peter J. Fried (BEP-037, added March 2026) have been silently keeping CI red since they were added.

Locally, `python tools/ci/validate_people.py` now exits 0.

## Commits

- 1e774582 `fix(beps): BEP-036 lead "Eric" -> "Eric A." to match CITATION.cff`
- d324993e `fix(validate_people): warn on NOT FOUND leads instead of failing CI`

<details><summary>Per-commit details</summary>

### 1e774582 `fix(beps): BEP-036 lead "Eric" -> "Eric A." to match CITATION.cff`

Restores the fix from #698 that #731 (an unrelated content update) inadvertently reverted. `CITATION.cff` in the spec lists the lead as `Eric A. Earl` and the validator matches on exact `given-names`.

### d324993e `fix(validate_people): warn on NOT FOUND leads instead of failing CI`

- `NOT FOUND` now emits a yellow warning with a hint to add the person upstream to `bids-specification/CITATION.cff`, rather than setting `return_code`.
- `has_email` failure is now gated on `has_real_lead`, so placeholder BEPs whose leads are all whitespace (BEP-004, BEP-026) don't spuriously fail — they emit `SKIP` and pass through.

Correctness checks that still hard-fail:
- email stored in bids-website data instead of `CITATION.cff`
- conflicting emails between the two files
- real BEP with leads present in `CITATION.cff` but none carrying an email (unreachable BEP)

</details>

## Test plan

- [x] `python tools/ci/validate_people.py` exits 0 locally with current `data/beps/beps.yml` and pinned `specification/` submodule
- [x] Pre-commit hooks pass on both commits
- [ ] CI green on this PR
- [ ] (Follow-up, out of scope) Add Andrew Davison and Peter J. Fried to `bids-standard/bids-specification`'s `CITATION.cff` so they're properly acknowledged as spec contributors — the yellow warning "surfaces" this


<!-- readthedocs-preview bids-website start -->
----
📚 Documentation preview 📚: https://bids-website--886.org.readthedocs.build/en/886/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e2de41bc955c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.