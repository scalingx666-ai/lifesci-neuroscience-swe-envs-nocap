# Issue

**Title:** neuron_segneuron: 200k BANIS+ results vs SegNeuron on EMNeuron valid

## Description

Results of the 200k-step BANIS+ reference run (`tutorials/neuron_segneuron/banis+.yaml`, trained on cajal, inferred and scored on BC) on SegNeuron's 8 evaluation volumes, under a protocol fixed before the run: final-step EMA model, TTA and ABISS settings selected on the 10 held-out `tune/` chunks only, evaluation volumes scored once against `label.tif`.

| mean VI / ARE | this tutorial | SegNeuron reproduced (FRMC) | SegNeuron released + same ABISS | SegNeuron paper |
|---|---|---|---|---|
| all 8 | 0.8694 / 0.1033 | 0.8678 / 0.1157 | 0.8862 / 0.1183 | – |
| in-distribution (5) | 0.7714 / 0.0886 | 0.7531 / 0.1099 | 0.7395 / 0.1081 | – |
| out-of-distribution (3) | 1.0326 / 0.1279 | 1.0590 / 0.1253 | 1.1305 / 0.1354 | 0.8865 / 0.1241 |

Mean VI ties the reproduced SegNeuron, ARE is lower, and VI is above the paper on each out-of-distribution volume. One run, scored once.

Changes:
- README: results table (per volume and means) and selected setting.
- README: predict instructions use `step=00200000.ckpt` (`last.ckpt` is best-val, step 180000) and `test_step=00200000/`.
- README: TTA16 command (whole-volume, 4-GPU view sharding; patch-first refuses quarter-turns on non-square chunks).
- README: note that volumes thinner than 32 sections (Ionsem) come back padded and must be cropped.
- `banis+.yaml`: decoding `cli_args` set to the tune-selected ABISS thresholds.

Source: `results/eval_200k/report.{md,json}` on BC; record in pytc-jam PytorchConnectomics/pytc-jam#25 (card `projects/segneuron-2611/cards/2026-11-09_bc-infer-eval.md`).

Not changed: PyTC does not crop thin-volume test padding back to the input grid; that is documented here, not fixed.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `23875e94f3f2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.