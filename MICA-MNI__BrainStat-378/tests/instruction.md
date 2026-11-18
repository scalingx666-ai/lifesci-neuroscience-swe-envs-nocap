# Issue

**Title:** Fix yeo7 off-by-1 indexing and MATLAB column_vector compatibility

## Description

## Summary
- `SLM._surfstat_to_brainstat_rft` was indexing the 0-based `yeo7` array with the 1-based `vertid` produced by `peak_clus`, causing an `IndexError` when a peak landed on the last mesh vertex and silently mis-labeling Yeo networks for every other peak. Subtract 1 before indexing. .
- `column_vector` (helper in `peak_clus.m`) used the `mustBeVector` validator, which is only available in MATLAB R2020b+. Replaced with an explicit `isvector` check so R2019b/R2020a still work. .

## Test plan
- [ ] Run the Python test suite (`pytest brainstat/tests`) on a build that exercises RFT correction with at least one peak.
- [ ] Smoke-test in MATLAB R2020a: call `SLM.fit` on the standard tutorial example and confirm `peak_clus` returns without error.
- [ ] Re-run the original failing case from #347 (peak on the final vertex of the mesh) and confirm `_surfstat_to_brainstat_rft` completes and assigns a sensible Yeo7 label.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ec7e96c4ef9d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.