# Issue

**Title:** Properly flip ICA mixing matrix time series

## Description

and reverts the changes in #748.
 (Update: I realized it was really easy to also address this issue within this PR)

The signs of PCA & ICA components are flipped so that there are more positive vs negative values in the component weight maps. The maps were saved with the flipped values, but the time series in the mixing matrices were not. On a second look, after opening the issue, I realized that we actually were correctly flipping the mixing matrix in `collect.py` but `generate_metrics` was not returning the updated mixing matrix to be used elsewhere & saved.

I am labelling this a `breaking change` because the time series in the mixing matrix files might change, but it should not meaningfully alter results.

Changes proposed in this pull request:

- `collect.py/generate_metrics` now returns the mixing matrix with columns appropriately flipped by "Optimal Sign"
- I realized that `collect.py/generate_metrics` was returning `external_regressor_config` but it was not being altered within the function and the variable was never being updated by functions that called `generate_metrics` so I removed this returned value
- Text describing "optimal sign" in the component matrix was already correct, but I tweaked the language slightly
- Updated the test for `generate_metrics` to confirm the sign of the mixing matrix is being flipped
- Updated `static_figures.py` so that it does not reflip the sign of the mixing matrix.
- In `tedana.py`, if there was a user-provided mixing matrix, it was copied to the original and new file names and not otherwise changed. Now, just the originally named file is copied and the mixing matrix with potentially flipped values is always saved.
  - I also noticed a bug in this copying that it was supposed to compare the provided mixing matrix name to the name that would be output to tedana and only copy if they were different, but the `if` clause included the full paths so they would always be different. In practice, this worked fine because the two files were always identical, but it would no longer work when time series are flipped. I fixed this & now add "user_provided_" to the file name before copying it to the directory. This was already tested in `test_integration_three_echo`
- `test_integration_five_echo` was failing because this is now outputting 3 additional components, so I added the file names for those additional components. This is a real breaking change, but I think it's happening because this is the test using robustICA with only 4 iterations, which will be noisy. Flipping some time series for the PCA mixing matrix was enough to alter the number of stable components. robustICA with only 4 iterations is good for a test of the code, but doesn't results in robustly stable results.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48916dd83c0d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.