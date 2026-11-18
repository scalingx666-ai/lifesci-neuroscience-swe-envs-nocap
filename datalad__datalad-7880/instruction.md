# Issue

**Title:** BF: resolve the update target's corresponding branch on adjusted branches

## Description

.

On an adjusted branch (Windows / crippled filesystem) the active branch is e.g. `adjusted/master(unlocked)`, which has no remote counterpart. `_choose_update_target` built the update target from the adjusted name (`<remote>/adjusted/master(unlocked)`, a nonexistent ref), so `datalad update --how=reset` (and `--how=merge`) aborted with "Could not determine update target".

**Fix:** resolve the corresponding branch when building the target, so it becomes `<remote>/master`. A one-liner.

**Test:**
- `test_update_reset_adjusted`: the update runs and lands both the corresponding branch and the adjusted view at the sibling.
- helper `corresponding_hexsha`: reads the hexsha NOT from the view, but from the corresponding branch below the view, so corr-aware.
- helper `maybe_unadjust_repo`: checks out the corresponding branch of the source data (while the clone, the dataset under control, stays adjusted) to enable "normal-enough" branch behaviour on a crippled FS -- the reverse of the existing `maybe_adjust_repo`.

Note, `test_update_reset_adjusted` deliberately tests beyond the observed bug and carries a generic name for `datalad update --how=reset` on adjusted branch, because no test exits in the test suite that asserts the basic behaviour of this command.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8357e625743e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.