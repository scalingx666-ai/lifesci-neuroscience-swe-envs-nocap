# Issue

**Title:** Feature/evolution aln brain

## Description

Important insights:
- `multiprocessing` cannot handle un-picklable objects well. Our custom `dotdict()` class (used for the attribute-like access to outputs) was unpickleable wich is now fixed (see `neurolib/models/model.py`). This means that returning `model.output` from `pypet` runs that run on `multiprocessing` is not problematic anymore.
- pypet's naturalnaming complains about using a result `t` twice in one run, even if they are on a different leaf, like `t` and `BOLD.t`. That's why outputs are now organised as `outputs.BOLD.BOLD` and `outputs.BOLD.t_BOLD`. Uglier but safer.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cf3593eb8f91`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.