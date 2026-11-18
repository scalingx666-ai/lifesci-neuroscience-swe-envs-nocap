# Issue

**Title:** Update MEDiCINe amplitude_threshold_quantile docs and require medicine-neuro>=1.7

## Description

[medicine-neuro 1.7](https://pypi.org/project/medicine-neuro/1.7/) changes how `amplitude_threshold_quantile` works:

- The cutoff is now applied to **absolute** amplitude, so the parameter removes the peaks with amplitude closest to zero, whether amplitudes are positive, negative, or mixed.
- Values must be in `[0, 1)`. Negative values, which used to drop the largest signed amplitudes, now raise a `ValueError`.

This matters for SpikeInterface because `peaks["amplitude"]` is usually negative (`peak_sign="neg"`). With medicine-neuro < 1.7, setting `amplitude_threshold_quantile > 0` threw away the *largest* spikes rather than the near-zero ones.

Changes (docs and dependency only; no code changes):
- `sortingcomponents/motion/medicine.py`: update the `amplitude_threshold_quantile` docstring.
- `pyproject.toml`: pin `medicine-neuro>=1.7` in `test-sortingcomponents` and in the install comment.

The default (`0.0`, no thresholding) behaves the same as before.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9bb6beccfceb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.