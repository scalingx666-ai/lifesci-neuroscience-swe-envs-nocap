# Issue

**Title:** Cross Validation Fixes, Integration Test updates and CHAGELOG updates

## Description

# Overview

Update code changed with @celikbasak to run varied offline analyses (varied # of trials, trial_length, etc). 

## Ticket

- https://www.pivotaltracker.com/story/show/183977180
- https://www.pivotaltracker.com/story/show/184252716

## Contributions

- `cross_validation`: update to the loop creating k-folds to avoid an extra empty fold
- `offline_analysis`: update the train/test split. Updated the integration tests. 

## Test

- `make test-all`
- `pytest --mpl -k "slow"`
- Run offline analysis on known data with no changes

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Verify the updates you did here. N/a

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? Yes, and I added some we had forgotten about!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f6a02652b306`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.