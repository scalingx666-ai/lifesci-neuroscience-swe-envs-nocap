# Issue

**Title:** error analysis: dump intermediates + text report alongside npz

## Description

## Summary
- Rename `scripts/analyze_seg.py` → `scripts/error_analysis_seg_dense.py` (dense-seg ARand analysis).
- Import `dev/nisb/err_analysis.py` as `scripts/error_analysis_seg_nerl.py` (NERL/skeleton-based error analysis).
- Dense: writes `<pred>.analysis.npz` with full overlap matrix, gt→best-pred IoU, oracle results, dust sweep — so follow-up tools can answer ad-hoc questions ("is pred 40 a false merge?") without recomputing.
- Tee stdout into `<pred>.analysis.txt` so the printed report (segment size stats, IoU distribution, split/merge tables, oracle, dust sweep) is persisted next to the prediction and `.npz` dump. Adds `--report` / `--no-report` flags.

## Test plan
- [ ] Run dense analysis on a small pred/gt pair and confirm both `.npz` and `.txt` are written.
- [ ] Verify `--no-report` suppresses the `.txt` dump.
- [ ] Sanity-check NERL script still runs against an existing skeleton.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a68b05ad62a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.