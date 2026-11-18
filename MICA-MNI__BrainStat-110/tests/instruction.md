# Issue

**Title:** Datagen

## Description

Hi,
here is the first dummy version of a test-generator code. 

Usage:
`$ pytest test_linear_model.py 
`

It is calling [datagen_linear_model.py](https://github.com/MICA-MNI/BrainStat/tree/datagen/brainstat/tests) beforehand, so that the necessary test data is generated.

Advantages:

- having only one dataset [thickness_n10.h5](https://github.com/MICA-MNI/BrainStat/blob/datagen/extern/test-data/thickness_n10.h5), the real data relevant part is done. And it is only 2.5 MB.
- numpy random seed is now used to fix the randomly generated data the same.

To-do:
- maybe adding somewhere in config.py to skip test generator, if data was already generated.

Question:
- Which file format we want? *h5 or *.pkl? 

Review is appreciated before adjusting it to other tests.

Cheers!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d63b4b101d1a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.