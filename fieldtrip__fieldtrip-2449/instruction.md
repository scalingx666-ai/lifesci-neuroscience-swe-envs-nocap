# Issue

**Title:** FIX - units conversion in ft_volumereslice

## Description

Small fix for correct physical units conversion (e.g., mm -> m) in `ft_volumereslice.`

I also checked other fieldtrip functions that use `ft_scalingfactor` and all the units conversions were fine.

Good news regarding testing: I ran the test procedure locally on Windows (without DCCN intranet access) using the steps from [FieldTrip testing webpage](https://www.fieldtriptoolbox.org/development/testing/). `dccnpath `automatically downloaded all necessary test data. All I had to do is just copy and paste the code from the testing webpage. Great for our external contributors! (oh by the way, all the tests passed :) )

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `81b8eb609ab5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.