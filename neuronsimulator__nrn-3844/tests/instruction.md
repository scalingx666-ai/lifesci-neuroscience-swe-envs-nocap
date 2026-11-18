# Issue

**Title:** Fix KSChan point-process OOB write of dparam[2]

## Description

## Summary

- Removes a latent out-of-bounds write in `KSChan::alloc` that always did `prop->dparam[2] = nullptr` for point processes.
- That slot only exists when single-channel mode (or later ion/ligand fields) makes `ppsize > 2`. Plain point KSChan instances allocate only `area` and `pnt`, so index 2 was past the allocated `Datum` vector.
- Default `ArrayPool` freelist order hid the overflow inside the next free slab row; a reversed freelist exposes it under ASAN ().
- `nrn_prop_datum_alloc` already default-constructs every `Datum` to the null handle state, and `dparam[0]`/`[1]` are filled by `point.cpp` after `nrn_alloc`. The redundant nulling is removed; `single_->alloc` still runs when `single_` is set and the singleptr slot is null.

## Test plan

- [ ] Rebuild and run `hoctests::test_kschan_py` (with and without ASAN).
- [ ] Optionally re-apply the reverse freelist seed in `arraypool.h` from #3843 and confirm ASAN no longer fails on that test.
- [ ] Exercise single-channel paths in the same test (`ks.single(1)`, etc.) to confirm singleptr allocation still works.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2a21b48b4230`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.