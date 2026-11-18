# Issue

**Title:** [FEAT] Add Wang MI Dataset

## Description

## Summary

This PR adds support for the motor-imagery EEG dataset published with Wang et al. (2026), “Sensory-guided human-machine joint learning accelerates the acquisition of motor imagery brain computer interface control.”

The Figshare release contains four archives corresponding to four experimental groups. They are exposed as separate MOABB datasets:

- `Wang2026JointLearning`
- `Wang2026TactileControl`
- `Wang2026EEGNetControl`
- `Wang2026BCI2000Control`

The archives represent different experimental protocols and feedback conditions, rather than different preprocessing levels or recording modalities.

Dataset: https://doi.org/10.1184/R1/32293995.v1
Paper: https://doi.org/10.1038/s41467-026-75435-5

## Implementation

The implementation:

- adds structured metadata for the four experimental groups;
- exposes 15 joint-learning participants and 8 participants in each control group;
- supports the two MATLAB v7.3 layouts present in the release:
  - fixed-size EEGNet-style numeric arrays;
  - variable-length BCI2000 cell arrays;
- reconstructs each released MAT run as an MNE `RawArray`;
- exposes 62 EEG channels at 1000 Hz plus a stim channel;
- preserves the authors’ released channel ordering, with channel names normalized to MNE capitalization;
- represents the initial BCI2000 calibration as session `0baseline`;
- preserves all available subsequent sessions and runs;
- supports subject and session filtering through the current `BaseDataset` API.

## Events

The dataset-level event mapping is:

```python
{
    "left_hand": 1,
    "right_hand": 2,
    "hands": 3,
    "rest": 4,
}

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `08b919ae91a0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.