# Issue

**Title:** Added timing benchmarks.

## Description

This PR does the following:

1. Adds a `report_time` ops parameter (default: True) that returns a timing dictionary in ops if true.
2. Adds nested timing plane-level dictionaries to ops. `ops[0]['timing']['registration']` returns the first plane's time results for registration. 
3. Added smoke test for `do_registration`, `roidetect`, and `spikedetect` set to false. This is to make sure the pipeline doesn't fail if a user turn those stages off. Test also checks to make sure the timing dictionary only contains keys for the stages that were performed. 

Doesn't cause any issues with the GUI.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9db6740e9f37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.