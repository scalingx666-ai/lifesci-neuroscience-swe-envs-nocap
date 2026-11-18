# Issue

**Title:** fix: IntegratorRunner dict-monitor regression + stale post-audit test updates

## Description

## Summary

Post-integration follow-up to the 16-part audit (PRs #838–#853). Fixes one
real regression surfaced by the full-suite run and re-points five stale
bug-pinning tests at the now-corrected behaviour.

### Source fix
- **`brainpy/integrators/runner.py`** — `IntegratorRunner` dict monitors
  regressed: after `_format_dict_monitors` each value is a
  `(var_name_or_Variable, index)` tuple, but resolution tested
  `isinstance(i, str)` on the whole tuple (always False), so a string
  variable-name leaked through to the base runner, which then looked it up
  as an attribute of `self.target` and raised. Integrator state variables
  live in `self.variables`; resolve string names there and pass the base
  runner an already-resolved `(Variable, index)` pair.

### Test updates (behaviour now correct, tests re-pointed)
- `nvar_coverage_test` — `order < 2` now raises `ValueError` (not `AssertionError`).
- `dnn_toolbox_fixes_test` — Adan now constructs **and** updates cleanly.
- `boost_misc_test` — offline ElasticNet / Logistic regression now fit & predict.
- `train_analysis_glue_fixes_test` — logistic regression now fits without error.

## Test plan
- 11 previously-flipped tests now pass (6 IntegratorRunner + 5 re-pointed).
- Sanity: `IntegratorRunner` dict monitors and `DSRunner` dict monitors both run green.

## Summary by Sourcery

Fix IntegratorRunner dictionary monitor handling and update tests to reflect corrected optimizer and offline regression behavior.

Bug Fixes:
- Resolve IntegratorRunner dict monitor regression by correctly mapping string variable names to integrator state variables before passing them to the base runner.
- Update NVAR error expectation to match the current ValueError raised for invalid order values.
- Treat Adan optimizer update as working behavior instead of a known bug by exercising a full construct-and-update cycle without errors.
- Treat offline ElasticNet regression predict as successful behavior instead of a broken path by asserting valid predictions.
- Treat offline LogisticRegression fit as successful behavior instead of an IndexError in both general and glue tests, asserting finite fitted parameters.

Tests:
- Refresh existing tests to assert successful Adan updates, ElasticNet prediction, and LogisticRegression fitting, ensuring outputs are finite and shapes are correct.
- Adjust NVAR error tests to expect ValueError for invalid order rather than AssertionError.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e29c8ec92f7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.