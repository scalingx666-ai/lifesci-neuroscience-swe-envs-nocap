# Issue

**Title:** Patch srm loo

## Description

## Fix held-out subject leakage in 3dSRM LOSO fits

The LOSO fit was starting from the full model with one subject removed, then running another five iterations. Unfortunately, removing the subject’s own parameters did not remove their influence on everyone else’s parameters. Their held-out data could still affect the reference used to score them.

This inflated mean ISC about 0.17, and segment matching was about 20% against roughly 1% chance. LOSO now fits the remaining subjects from an independent random start, using `-niter`, `-tol`, and `-nstart`. Each leave-out model is canonicalized independently before scoring, since component-wise ISC depends on the basis.

## Validation

- Both Makefile and CMake builds passed.
- Full integration checks passed, including AUTO/GRAM kernels and the SRM unit tests.
- New tests cover null leakage, excluded-subject independence, compression, multistart, and thread consistency.
- Run-CV and legacy LOSO reproduced the pre-fix baseline byte-for-byte in the compatibility checks.
- Reran the 22-subject temporal-ROI validation. Pooled matching dropped from 19.86% to 15.32%. Those runs kept the original 30-iteration budget and did not converge.

## Musings

I'm still not sure how valuable SRM is to the community, but this program slots nicely against 3dInSync and the question of anatomical variability in activation profiles. I still have more pondering on how to limit the amount of "drift" a particular region might be allowed, as right now the default SRM doesn't constrain the mappings.

## AI assistance

A human caught the initial error, flagged the function, and asked Codex (GPT-6) to help with implementation, tests, and validation. Along the way we also documented more of the 3dSRM.c and the_srm.[ch] libraries.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `17141b8a9ba8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.