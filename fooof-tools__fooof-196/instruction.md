# Issue

**Title:** [ENH] - Add support for converting model results, including to DFs

## Description

Adds `fooof.data.conversions` that allows for converting model results into alternate forms, including DataFrames.

A key component for doing this is to is to organize how to to organize peaks. Currently, this implementation supports organizing a set number of peaks, or using band definitions.

Note that this is an alternate approach to some other ideas explored in #194 

Example usage:
```
from fooof import FOOOFGroup, Bands
from fooof.sim import gen_group_power_spectra

freqs, pows = gen_group_power_spectra(2, [3, 40], [1, 1], [[10, 1, 1], [20, 1, 1]])

fg = FOOOFGroup(verbose=False)
fg.fit(freqs, pows)
```

```
# Convert to DF, extracting 2 peaks per model
fg.to_df(2)
```
![Screen Shot 2021-02-23 at 1 57 14 PM](https://user-images.githubusercontent.com/7727566/108893421-12e3ae00-75df-11eb-9078-a2a27555f55b.png)

```
# Convert to DF, extracting peaks with a specified band definition
bands = Bands({'alpha' : [8, 12], 'beta' : [15, 30]})
fg.to_df(bands)
```
![Screen Shot 2021-02-23 at 1 57 19 PM](https://user-images.githubusercontent.com/7727566/108893451-1a0abc00-75df-11eb-8aa0-9d622471e7f8.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `117cbc0ea0db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.