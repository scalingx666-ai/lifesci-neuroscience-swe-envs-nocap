# Issue

**Title:** [DOC] Improve `trial_shifting` parameter documentation

## Description

# Description
- Clarifies how the `dither` parameter of `trial_shifting` works and makes the code match the documented behaviour.
- Old docstring for dither fails to mention:
    - If the shift is applied to the whole trial, i.e that each spike is moved by same amount
    - If the shift can go in either direction up to `dither`
    - What distribution the shift is drawn from (uniform)

# Changes
- **Docs (`trial_shifting`, `_trial_shifting_of_concatenated_spiketrain`):** the `dither` entry now says that all spikes in a trial are shifted by the same random amount, drawn uniformly from the closed interval `[-dither, +dither]`.
- **Implementation (`_trial_shifting`):** the shift is now drawn with `random.uniform(-dither, dither)` instead of `dither * (2 * random.random() - 1)`. This also matches the intent mentioned in the documentation and also reads better in code. The behavior is unchanged, so the distribution is same.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `408eb92d3a23`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.