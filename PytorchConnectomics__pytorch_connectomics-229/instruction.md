# Issue

**Title:** neuron_segneuron: compare with SegNeuron in the paper's VI convention

## Description

The SegNeuron authors clarified (yanchaoz/SegNeuron#8) that Table 3 was scored with scikit-image 0.17.2, which ignores GT 0 but normalizes by the total voxel count: VI_old = VI x count(GT != 0) / GT.size; ARE is unchanged.

- `scripts/evaluate_emneuron.py`: two new TSV columns, `vi_old` and `gt_fg_frac` (existing columns unchanged).
- `tutorials/neuron_segneuron/README.md`: the results table compares in the paper's convention and keeps the current-skimage VI beside it.

Checks: `vi_old` equals an independent computation with the 0.17.2 normalization on a random volume; with the measured foreground fractions the released SegNeuron checkpoint + FRMC reproduces Table 3 (0.8655, 0.7718, 1.0230 at beta 0.30 on Harris vs 0.8655, 0.7719, 1.0221). Table values are the existing scores times the foreground fraction; nothing was re-decoded.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e8f78abbc3e4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.