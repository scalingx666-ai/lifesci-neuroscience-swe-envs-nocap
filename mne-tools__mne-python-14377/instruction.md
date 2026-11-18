# Issue

**Title:** perf(baseline): vectorize rescale array operations when picks are specified

## Description

#### Reference issue (if any)

N/A

#### What does this implement/fix?

This PR improves the performance of `mne.baseline.rescale` when `picks` is provided.

Currently, the baseline mean/std are calculated on the full array and then the picked channels are processed one by one. With larger arrays, this does more work than necessary.

This change:

- selects the picked channels first (`data[..., picks, :]`) so the baseline statistics are only calculated for the channels being used
- replaces the `for pi in picks:` loop with a vectorized operation on the selected data
- writes the result back to the picked channels without changing the unpicked channels

I also added a test in `mne/tests/test_epochs.py` to check that the picked channels are transformed correctly and the other channels stay unchanged.

#### Additional information

- **AI Policy Disclosure:** I used an AI assistant to help identify the performance bottleneck and draft the initial implementation. I then reviewed, refined, benchmarked, and tested the changes myself.
- Linting: passed with `ruff`
- Testing: `test_rescale` passed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `db21534b248b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.