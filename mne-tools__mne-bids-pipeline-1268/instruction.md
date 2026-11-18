# Issue

**Title:** Test and fix on_error behavior

## Description

1. Ensure all steps run with `failsafe_run_wrapper`
2. Improve completion logic in FreeSurfer (gating on a late-`recon-all` stage MRI file)
3. Add tests for `--continue` behavior (#1022)
4. DRY code for creating fake datasets as part of adding new tests

Initial draft made with an assist from Claude Sonnet 5, but I modified and vouch for all code.

This one is a pretty straightforward test + fix, so I'll mark for merge-when-green, but happy to make any changes if anyone wants to look.

### Before merging …

- [x] Changelog has been updated (`docs/source/dev.md.inc`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8f39ade96f59`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.