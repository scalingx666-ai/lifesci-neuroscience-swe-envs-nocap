# Issue

**Title:** Add Lenaig2026 SSAEP dataset (as SSVEP)

## Description

Hello,

This PR adds a completely new dataset to the SSAEP paradigm. Given the similarities between SSAEP and SSVEP, the class was kept as "SSVEP" for compatibility. The dataset has 2 experiments. For each experiment we have 24 subjects, 1 session, 2 runs and 10 trials per class.

The classification task consists on identifying the modulation frequency. The task is a OvO classification between "Silence" vs "Stimulus" (e.g. "Sinus" or "Cicada").

More details can be seen in the reference:

[1] L. Guého, L. Bougrain, C. Plapous, P. Hénaff and R. Nicol, "An enhanced experimental paradigm for auditory BCIs by addressing both acoustic and human factors," 2026 14th International Conference on Brain-Computer Interface (BCI), Gangwon Province, Korea, Republic of, 2026, pp. 1-7, doi: 10.1109/BCI69045.2026.11435072.

<img width="2996" height="3520" alt="DatasetV" src="https://github.com/user-attachments/assets/3cb18fb0-33a4-4f40-8c69-7f74b1cb901f" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c1d21d2f7db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.